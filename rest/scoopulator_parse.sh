#!/bin/bash
# Parse Scoopulator calc URL → extract metrics, nutrition, and status colors.
# Usage: bash rest/scoopulator_parse.sh <SCOOPULATOR_CALC_URL>
# Requires: python3, beautifulsoup4

URL="$1"
if [ -z "$URL" ]; then
  echo "Usage: bash rest/scoopulator_parse.sh <SCOOPULATOR_CALC_URL>"
  exit 1
fi

curl -s "$URL" | python -c "
import sys, re
from urllib.parse import urlparse, parse_qs
from bs4 import BeautifulSoup

URL = '''$URL'''
html = sys.stdin.read()
soup = BeautifulSoup(html, 'html.parser')

# ── INGREDIENT COUNT VALIDATION ──
# Count input ingredients from URL
qs = parse_qs(urlparse(URL).query)
input_ingredients = [p.split(':')[0] for p in qs.get('ingredients', [''])[0].split(',') if ':' in p]
input_count = len(input_ingredients)

# Count output ingredients on page (span.truncate inside li elements)
output_names = []
for li in soup.select('li'):
    span = li.select_one('span.truncate')
    if span:
        name = span.get_text(strip=True)
        if name not in output_names:
            output_names.append(name)
output_count = len(output_names)

# ── EVAPORATION ──
evp = qs.get('evp', [None])[0]
if evp:
    try:
        evp_pct = float(evp) * 100
        print(f'\U0001f525 Evaporation: {evp_pct:.0f}%')
    except ValueError:
        pass

if input_count != output_count:
    print(f'\u26a0\ufe0f  SLUG MISMATCH: sent {input_count} ingredients, page shows {output_count}')
    page_lower = [n.lower() for n in output_names]
    # Show which slugs likely failed — strip user- prefix and hash suffix for matching
    for slug in input_ingredients:
        s = re.sub(r'^(user|usdafndds|usdaff|usdabranded)-', '', slug)
        s = re.sub(r'-[a-zA-Z0-9]{6}$', '', s)  # strip hash suffix
        slug_words = set(s.replace('-', ' ').lower().split())
        matched = any(slug_words & set(re.split(r'[\s,%.]+', n)) for n in page_lower)
        if not matched:
            print(f'   \u274c  bad slug: {slug}')
    print()

STATUS = {
    'card-critical': '\U0001f534',
    'card-warn':     '\U0001f7e1',
    'card-success':  '\U0001f7e2',
}

# ── METRIC CARDS ──
seen = set()
for card in soup.select('div.card'):
    classes = card.get('class', [])
    status = '\u26AA'
    for cls, emoji in STATUS.items():
        if cls in classes:
            status = emoji
            break

    # Metric name
    name_el = card.select_one('.font-semibold')
    if not name_el:
        continue
    name = name_el.get_text(strip=True)
    if not name or name in seen:
        continue
    seen.add(name)

    # Value: in span.text-md or in p.text-2xl
    val_el = card.select_one('span.text-md') or card.select_one('p.text-2xl')
    value = val_el.get_text(strip=True) if val_el else ''
    if not value:
        continue

    # Target range
    target = ''
    for p in card.select('p'):
        txt = p.get_text(strip=True)
        if txt.startswith('Target:'):
            target = txt
            break

    line = f'{status} {name}: {value}'
    if target:
        line += f' ({target})'
    print(line)

# ── TOTAL WEIGHT ──
for div in soup.select('div.font-medium'):
    if 'Total weight' in div.get_text():
        # Weight value is in a sibling div with text-right
        parent = div.parent
        if parent:
            weight_div = parent.select_one('.text-right')
            if weight_div:
                print(f'\nTotal weight: {weight_div.get_text(strip=True)}')
        break

# ── NUTRITION TABLE ──
nutrition_h2 = None
for h2 in soup.select('h2'):
    if 'Nutrition' in h2.get_text():
        nutrition_h2 = h2
        break

if nutrition_h2:
    table = nutrition_h2.find_next('table')
    if table:
        # Get scoop size from header
        headers = [th.get_text(strip=True) for th in table.select('th')]
        scoop_size = '66'
        for h in headers:
            import re
            m = re.search(r'(\d+)\s*g', h)
            if m and 'Scoop' in h:
                scoop_size = m.group(1)
                break

        print(f'\nNutrition (per {scoop_size}g scoop / per 100g):')
        for row in table.select('tbody tr'):
            cells = row.select('td')
            if len(cells) >= 3:
                label = cells[0].get_text(strip=True)
                scoop_val = cells[1].get_text(strip=True)
                per100_val = cells[2].get_text(strip=True)
                # Indent sub-rows
                is_sub = 'pl-8' in ' '.join(cells[0].get('class', []))
                indent = '  ' if is_sub else ''
                print(f'{indent}{label}: {scoop_val} / {per100_val}')
"
