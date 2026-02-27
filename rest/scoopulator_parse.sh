#!/bin/bash
# Parse Scoopulator calc URL → extract metric names, values, and status colors.
# Usage: bash rest/scoopulator_parse.sh <SCOOPULATOR_CALC_URL>
#
# Color mapping: card-success=🟢  card-warn=🟡  card-critical=🔴  (no status)=⚪

URL="$1"
if [ -z "$URL" ]; then
  echo "Usage: bash rest/scoopulator_parse.sh <SCOOPULATOR_CALC_URL>"
  exit 1
fi

curl -s "$URL" | python -c "
import sys, re

html = sys.stdin.read()

# Split on > to get fragments
frags = html.split('>')

status_map = {
    'card-critical': '\U0001f534',
    'card-warn': '\U0001f7e1',
    'card-success': '\U0001f7e2',
}

i = 0
results = []
while i < len(frags):
    frag = frags[i]

    # Detect card start
    if 'class=\"card rounded-xl' in frag:
        status = '\u26AA'  # default white
        for cls, emoji in status_map.items():
            if cls in frag:
                status = emoji
                break

        name = ''
        value = ''
        target = ''

        # Scan ahead within the card (max 50 fragments)
        j = i + 1
        while j < min(i + 50, len(frags)):
            f = frags[j]

            # Metric name: status cards have 'Name<button', plain cards have 'Name</div' after font-semibold
            if not name:
                if 'items-center gap-1' in f:
                    # Next fragment has 'Name<button...'
                    if j + 1 < len(frags):
                        txt = re.sub(r'<.*', '', frags[j+1]).strip()
                        if txt:
                            name = txt
                            j += 1
                elif 'font-semibold' in f:
                    # Next fragment might be 'Name</div'
                    if j + 1 < len(frags):
                        txt = re.sub(r'<.*', '', frags[j+1]).strip()
                        if txt and not txt.startswith('<'):
                            name = txt
                            j += 1

            # Value: in <span class='text-md'> or after 'text-2xl font-bold'
            elif not value:
                if 'text-md' in f or 'text-2xl font-bold' in f:
                    if j + 1 < len(frags):
                        txt = re.sub(r'<.*', '', frags[j+1]).strip()
                        if txt:
                            value = txt
                            j += 1

            # Target
            if 'Target:' in f:
                txt = re.sub(r'<.*', '', f).strip()
                if txt:
                    target = txt

            # Stop if we hit the next card
            if j > i + 1 and 'class=\"card rounded-xl' in f:
                break
            j += 1

        if name and value:
            if target:
                results.append(f'{status} {name}: {value} ({target})')
            else:
                results.append(f'{status} {name}: {value}')

        i = j  # skip to where we left off
    else:
        i += 1

seen = set()
for r in results:
    # Deduplicate by metric name (plain cards repeat status cards)
    name = r.split(':')[0].split(' ', 1)[1] if ' ' in r.split(':')[0] else ''
    if name not in seen:
        seen.add(name)
        print(r)
"
