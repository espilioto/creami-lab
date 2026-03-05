---
name: optimize
description: Recipe optimization and Scoopulator validation workflow. Use when proposing, modifying, or validating any ice cream recipe — handles the iterative Scoopulator loop, ingredient science lookup, and metric evaluation.
allowed-tools: Read, Grep, Glob, Bash, WebFetch, Edit, Write
---

# Recipe Optimization Workflow

## MANDATORY: Read Before Proposing

Do NOT guess or rely on memory for ingredient science, PAC/POD values, thickener ratios, or nutrition data. Before proposing any recipe, modification, or ingredient advice:

1. Read `ice-creamery-main/docs/info/ingredients.md` (PAC/POD/GI, hardening factors, sweetener/thickener/emulsifier science)
2. Read `ice-creamery-main/docs/info/nutrition.md` (exact nutritional values per 100g)
3. Read `ice-creamery-main/docs/info/principles.md` (PAC targets, MSNF targets)
4. Consult `ice-creamery-main/docs/info/glossary.md` if any term is unclear
5. **Check ingredients against CLAUDE.md §2 PANTRY.** Every ingredient you use MUST exist in the pantry table OR be clearly present in the source recipe you're adapting. Do NOT invent new ingredients to chase better Scoopulator metrics. If a metric is red because of pantry constraints (e.g. low Sugars% in sugar-free recipes), accept it — that's the nature of the ingredient set.
6. THEN design the recipe, THEN validate with Scoopulator, THEN present to user.

### Recipe types and ingredient rules
- **Adapted recipes** (going into CREAMing.md): ONLY pantry ingredients. No exceptions.
- **Original/reference recipes** (reproducing a source recipe as-is): Use the source recipe's exact ingredients — do not add or substitute ingredients. If the user asks to "create" an original recipe, use ONLY pantry ingredients unless they specify otherwise.
- **When in doubt:** ask the user which ingredients are in scope.

### No-cook only
**All recipes are cold-process (no-cook).** NEVER use corn starch — it requires cooking to 90°C+ to gelatinize. Use cold-acting stabilizers instead: xanthan, guar, CMC, inulin, whey protein. These provide body and thickening without heat.

## Our Recipe Style: Low-Fat, No-Sugar

We primarily make **low-fat, no-sugar** recipes (1.5% milk base, sugar-free sweeteners). This means many Scoopulator metrics will inherently read outside "normal" ranges — that's expected and fine. **Do not chase green numbers by adding fat or sugar we don't use.** Instead, evaluate recipes by what actually matters for the finished product:

- **Scoopability / serving temperature** — will it be scoopable at -18°C?
- **Texture & body** — smooth, creamy mouthfeel vs icy/crumbly?
- **Sweetness balance** — pleasant sweetness without cooling/off-flavors?
- **Stability** — does it resist ice crystal growth over storage?

Metrics like Sugars%, Milk Fat%, Total Solids%, and MSNF% will often be red/yellow — those are just numbers reflecting our intentional ingredient choices, not problems to solve. Focus on PAC (scoopability), stabilizer/emulsifier balance (texture), and relative sweetness (taste) as the metrics that actually predict quality for our style.

## Scoopulator Validation Loop

1. **Always validate against Scoopulator before presenting.** Build a Scoopulator calc URL using slugs from `rest/scoopulator_ingredients_index.txt`. **Parse results with the script** — NEVER use WebFetch (it loses CSS class colors):
   ```bash
   PYTHONIOENCODING=utf-8 bash rest/scoopulator_parse.sh "<SCOOPULATOR_URL>"
   ```
   This reads the actual `card-success`/`card-warn`/`card-critical` CSS classes from the HTML. Use the emoji output directly (🟢/🟡/🔴/⚪) — do not guess colors from values vs ranges.
2. **Sweeteners DO count in Scoopulator.** Sugar alcohols (erythritol, xylitol, glycerin) are tracked as sugars/sweetness by Scoopulator. Do NOT assume they are invisible to the calculator — they contribute to Sugars%, Relative Sweetness%, and all other metrics just like regular sugar. **Sucralose also affects Relative Sweetness** — even tiny amounts register because it's 600x sweeter than sugar. Account for this when designing recipes.
3. **NEVER calculate any number yourself.** All metrics, percentages, PAC/FPDF, serving temperature, freezing point, total weight, calories, and macros (fat, sat fat, trans fat, carbs, sugars, fiber, protein) come from the parse script output. The only numbers you compute are ingredient **weights** when designing a recipe. Everything else — get from Scoopulator.
4. **Adjust recipe and validate again:** Loop until metrics are realistically acceptable for the ingredients (no need to fixate on getting all green, just as many as possible for given ingredients). No more than 10 requests, then give the best one and show the URL.
5. **No buying extras to fix metrics.** Work with pantry + supermarket only. Accept the best achievable result — don't suggest buying specialty ingredients (SMP, etc.) unless they're in the `/adapt` buy list and the recipe depends on them.
6. **Scoopulator URL format:** `https://scoopulator.app/calc?ingredients=slug1:weight1,slug2:weight2,...&target=TARGET` where TARGET is one of the **slugs** from the Target Profiles section below. **Type parameter:** For non-ice-cream profiles, append `&type=TYPE` using the Type column from the "Other Profiles" table (e.g. `&type=sorbet`, `&type=gelato`). Ice cream profiles omit `&type=` entirely. For `freeform`, use whichever type matches the actual recipe. Choose the correct TARGET profile for what the recipe actually is — don't game the metrics by picking whichever target happens to score more greens. When a recipe fits multiple profiles, present both Scoopulator URLs (one per candidate target) and let the user choose. If a recipe doesn't clearly fit any profile, inform the user and let them decide which target to validate against (or whether to use `freeform`).
7. **Ingredient slugs:** Look up in `rest/scoopulator_ingredients_index.txt` (format: `name:slug`). PRIORITIZE the user's custom ingredients.
8. **Show every Scoopulator fetch** as a one-line color-coded summary — every iteration, not just the final one. Never silently skip a fetch. Format: `PAC 23.8 | Serv. -9.4°C 🔴 | Sugars 14.1% 🟡 | Fat 2.6% 🔴 | MSNF 2.4% 🔴 | Solids 27% 🔴 | Sweet 9.5% 🔴 | Stab 0.42% 🔴 | Emul 0% 🔴`

---

## Ingredient Reference (Key Numbers)

**Target PAC:** 20-30 for scoopable ice cream, 30-36 for sorbets

### Hardening Factors (negative PAC)
- Cocoa powder 21%: -160 (chocolate bases need extra FPD compensation)
- Cocoa powder 11%: -130
- Vegetable fat: -90

### Thickener synergy ratios
- CMC : Guar : Xanthan = 4:3:1 (cold-acting, 0.3-0.5% of total mix)
- Guar : Xanthan = 3:1 (cold gel)
- No GMS — use soy lecithin (1:1 by weight) as emulsifier alongside thickeners

### GI safety — inulin + xylitol stacking
Both inulin and xylitol ferment in the gut. Combined high doses cause gas/bloating. When designing recipes, check half-pint (340g) doses stay tolerable: **inulin ≤15g and xylitol ≤15g per half-pint.** If over, reduce inulin first (swap body to whey protein). Erythritol is mostly absorbed in the small intestine — minimal GI impact.

---

## Scoopify Target Profiles

> Each profile defines acceptable ranges for a recipe type.
> Source: `rest/scoopulator_profiles_index.json` (scraped from Scoopify). All values are percentages.
> All profiles with Rel. Sweetness share the same range: 11-20%.

### Ice Cream Profiles (type: `ice_cream` — omit `&type=` from URL)

| Slug | Name | Milk Fat | Total Fat | Sugars | MSNF | Stab. | Emuls. | Total Solids | Rel. Sweet. | Serving °C | Alcohol |
|------|------|----------|-----------|--------|------|-------|--------|--------------|-------------|-----------|---------|
| `general-ice-cream` | General | 5-18% | 10-30% | 11-17% | 7-15% | 0-0.3% | 0.1-0.8% | 35-45% | 11-20% | -16 to -12 | 0-2% |
| `light-ice-cream` | Light | 5-7% | — | 18-20% | 11-12% | 0.4-0.6% | 0.1-0.8% | 30-35% | 11-20% | -16 to -12 | — |
| `low-fat-ice-cream` | Low Fat | 2-5% | — | 18-21% | 12-14% | 0.7-0.9% | 0.1-0.8% | 28-32% | 11-20% | -16 to -12 | — |
| `nonfat-ice-cream` | Nonfat | 0-0.5% | — | 18-22% | 12-14% | 0.9-1.1% | 0.1-0.8% | 28-32% | 11-20% | -16 to -12 | — |
| `premium-ice-cream` | Premium | 12-14% | — | 13-16% | 8-10% | 0.2-0.4% | 0.1-0.8% | 38-40% | 11-20% | -16 to -12 | — |
| `reduced-fat-ice-cream` | Reduced Fat | 7-9% | — | 18-19% | 10-12% | 0.3-0.5% | 0.1-0.8% | 32-36% | 11-20% | -16 to -12 | — |
| `soft-serve` | Soft Serve | 4-7% | — | 13-15% | 11-14% | 0-0.3% | 0.1-0.2% | 34-38% | 11-20% | -16 to -12 | — |
| `standard-ice-cream` | Standard | 10-12% | — | 14-17% | 9-10% | 0.2-0.4% | 0.1-0.8% | 36-38% | 11-20% | -16 to -12 | — |
| `superpremium-ice-cream` | Superpremium | 14-18% | — | 14-17% | 5-8% | 0-0.2% | 0.1-0.8% | 40-42% | 11-20% | -16 to -12 | — |

### Other Profiles (append `&type=` to URL)

| Slug | Name | Type | Milk Fat | Total Fat | Sugars | MSNF | Stab. | Emuls. | Total Solids | Rel. Sweet. | Serving °C |
|------|------|------|----------|-----------|--------|------|-------|--------|--------------|-------------|-----------|
| `gelato` | Gelato | `gelato` | 4-8% | — | 16-22% | 11-12% | 0.4-0.6% | 0.1-0.8% | 36-43% | 11-20% | -14 to -10 |
| `frozen-yogurt-regular` | Froyo Regular | `frozen_yogurt` | 3-6% | — | 15-17% | 9-13% | 0.4-0.6% | 0.1-0.8% | 30-36% | 11-20% | -16 to -12 |
| `frozen-yogurt-nonfat` | Froyo Nonfat | `frozen_yogurt` | 0-0.5% | — | 15-17% | 9-14% | 0.5-0.7% | 0.1-0.8% | 28-32% | 11-20% | -16 to -12 |
| `sherbet` | Sherbet | `sherbet` | 1-2% | — | 22-28% | 1-3% | 0.4-0.5% | 0.1-0.8% | 28-34% | 11-20% | -16 to -12 |
| `sorbet` | Sorbet | `sorbet` | 0-2% | — | 22-28% | 0-3% | 0.3-0.5% | 0.1-0.8% | 28-34% | 11-20% | -16 to -12 |
| `ganache` | General Ganache | `ganache` | 15-25% | 20-30% | 25-45% | — | 0.3-0.5% | — | 60-75% | — | — |
| `freeform` | Freeform | *(match recipe)* | — | — | — | — | — | — | — | — | — |

**Key patterns:**
- As fat decreases, sugars + MSNF + stabilizers must increase to compensate for lost body/texture.
- Gelato has warmest serving temp (-14 to -10°C).
- `general-ice-cream` is the only profile with Total Fat (10-30%, includes non-dairy fat) and Alcohol (0-2%) metrics.
- `ganache` is the only other profile with a Total Fat metric (20-30%), and has no MSNF/emulsifiers/serving temp targets.
- Relative Sweetness (11-20%) applies to all profiles except ganache and freeform.
