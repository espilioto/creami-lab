---
name: optimize
description: Recipe optimization and Scoopulator validation workflow. Use when proposing, modifying, or validating any ice cream recipe — handles the iterative Scoopulator loop, ingredient science lookup, and metric evaluation.
allowed-tools: Read, Grep, Glob, Bash, WebFetch, Edit, Write
---

# Recipe Optimization Workflow

## MANDATORY: Read Before Proposing

Do NOT guess or rely on memory for ingredient science, PAC/POD values, thickener ratios, stabilizer blends, or nutrition data. Before proposing any recipe, modification, or ingredient advice:

1. Read `ice-creamery-main/docs/info/ingredients.md` (PAC/POD/glycemic-index, hardening factors, sweetener/thickener/emulsifier science)
2. Read `ice-creamery-main/docs/info/nutrition.md` (exact nutritional values per 100g)
3. Read `ice-creamery-main/docs/info/principles.md` (PAC targets, MSNF targets)
4. Read `ice-creamery-main/docs/info/glossary.md` (PAC, POD, MSNF, HLB, DE definitions — don't assume you know these)
5. Read the relevant sections of `rest/polar_theory.md` per the Polar Theory Lookup Guide below. **Every recipe touches at least sweeteners and stabilizers — read those sections.** If the recipe involves chocolate, zero-fat, high-protein, or dairy techniques, read those sections too. Do not skip this step — the embedded quick rules below cover the key numbers but the full sections have mechanisms, warnings, and edge cases you will miss otherwise.
6. Read the matching category in `rest/polar_archetypes.md` — find the flavor category (Chocolate, Fruit, Nut, Coffee, Caramel, Cookies, Vanilla, Boozy, Keto, Sorbet, Cheesecake) and read its Traditional Baseline, Key Ratios, Technique, and Translation sections. Also read the Technique Library section for any relevant processes (cocoa blooming, fruit prep, swirl making, etc.). These give you the proven ratios and quality benchmarks that our sugar-free/low-fat version should aim to match.
7. **Check ingredients against CLAUDE.md §2 PANTRY.** Every ingredient you use MUST exist in the pantry table OR be clearly present in the source recipe you're adapting. Do NOT invent new ingredients to chase better Scoopulator metrics. If a metric is red because of pantry constraints (e.g. low Sugars% in sugar-free recipes), accept it — that's the nature of the ingredient set.
8. THEN design the recipe, THEN validate with Scoopulator, THEN present to user.

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

## Cost Per Pint

After Scoopulator validation, compute the pint cost from the `€/kg` column in CLAUDE.md §2 PANTRY.

**Formula:** `Cost = Σ (ingredient_grams × €_per_kg / 1000)`

**Rules:**
1. Use the `€/kg` value from the pantry table for each ingredient.
2. For ingredients with `TBD` or `—` pricing, exclude from the total and list them separately.
3. Compute `€/kg = pint_cost / (total_grams / 1000)` alongside the pint cost.
4. Show the cost after the Scoopulator summary line. Format:
   - All priced: `**Cost:** ~€X.XX/kg — ~€X.XX/pint`
   - Some unpriced: `**Cost:** ~€X.XX/kg — ~€X.XX/pint (excludes: vanilla extract 5g, peanut butter 30g — prices TBD)`
5. Round to 2 decimal places.

---

## Ingredient Reference (Key Numbers)

**Target PAC:** 20-30 for scoopable ice cream, 30-36 for sorbets

### Flavor Drops
- Chocolate, Strawberry, Milk Cream flavor drops: **MAX 2 drops per pint** (3 is too intense). Always state this limit explicitly in recipe ingredients.

### Hardening Factors (negative PAC)
- Cocoa powder 21%: -160 (chocolate bases need extra FPD compensation)
- Cocoa powder 11%: -130
- Vegetable fat: -90

### 🚨 GI SAFETY — top priority, NEVER exceed (CHECK EVERY RECIPE)
> GI safety limits protect your gut — they always trump functional limits, which only affect ice cream texture/quality.

Both inulin and xylitol ferment in the gut. Combined high doses cause gas, bloating, cramps. **Check per-pint doses in EVERY recipe:**
- **Inulin ≤ 30g per pint.** Count ALL sources: standalone + inside mixes (15g SS = 11g inulin, 10g ICSv2 = 4.6g inulin). If over, reduce inulin first (swap body to whey protein or MCC).
- **Xylitol ≤ 30g per pint.** Both ferment in the gut — stacks with inulin.
- **Combined fermentable load (inulin + xylitol) ≤ 45g per pint.** Even if each is under its own limit, high combined doses cause GI distress. When one is high, keep the other low. Use MCC or whey protein for body instead of maxing inulin.

### ⚙️ FUNCTIONAL — ice cream quality (strongly avoid exceeding)

**Total gums (CMC + guar + xanthan) ≤ 2g per pint:**
- **This is a hard ceiling, not a target.** Above 2g → stringy, cheese-pull, gummy texture.
- **Always count gums inside stabilizer mixes toward the total.** 15g Salty Stability = 1.7g gums. 10g ICSv2 = ~0.7g gums. Do NOT blindly add extra gums on top of a mix.
- Preferred ratio when combining: CMC : Guar : Xanthan ≈ 4:3:1 (cold-acting)
- Yogurt, whey protein, and inulin provide body. Gums are ONLY for ice crystal prevention — not for thickening or body. More gums ≠ better texture.
- No GMS — use soy lecithin (1:1 by weight) as emulsifier alongside thickeners

**Erythritol ≤ 8% of total mix weight** (~54g in 680g pint) to avoid crystallization. Not a GI concern (absorbed in small intestine). Xylitol or glycerin help prevent it.

### Sweetener Science (from Polar Theory — always apply)
- **Dextrose:** PAC=190 (2x sucrose), POD=70. Use for Creami scoopability — won't re-harden after spinning (sucrose-only goes rock hard at -13C). Starting ratio: 75% sucrose / 25% dextrose, up to 50% dextrose. Great for chocolate bases (counteracts hardening)
- **Erythritol:** PAC=290-320 (3x sucrose), POD=65-75. **Recrystallizes after ~30 min frozen** → sandy/gritty. Max 1/3 of what sugar weight would be. 1:1 substitution = won't freeze at all. Creates ultra-cold mouthfeel. Must combine with other sweeteners
- **Sucrose baseline:** PAC=100, POD=100. American ice cream 13-20% sugar, gelato 15-23%. More sugar = duller flavor

### Stabilizer Science (from Polar Theory — always apply)
- **Cold-process preferred for Creami** (no cooking): xanthan (start 0.1%), guar (0.1-0.3%). Both hydrate cold
- **Hot-process** (need 80-85C): LBG (0.1-0.3%), carrageenan (start 0.1%), CMC (0.2-0.5%, needs 20+ min), tara gum (0.1%+, 75-85C)
- **Commercial blend: LBG:Guar:Lambda Carrageenan = 4:2:1.** With emulsifier: Lecithin:LBG:Guar:Lambda = 4:4:2:1
- **Synergy pairs:** Guar+LBG (crystal reduction), LBG+Xanthan (gel), LBG+Kappa carrageenan (gel), CMC+Guar (gel), Gelatin+Xanthan (freeze vs melt states)
- **Low-fat → needs gel** (kappa/iota carrageenan mimics fat mouthfeel). **High-fat → NO gel** (over-thickens, won't churn)
- **Precision is critical:** 0.5g over = gummy/slimy disaster. Use micro scales, never teaspoons
- **Dispersion:** ALWAYS mix stabilizer into dry solids first, then add to liquid. Clumps in liquid never dissolve
- **Xanthan warning:** add at cool stage, NOT while hot on hob → over-thickens → slimy

### Chocolate Formulation (from Polar Theory — apply for chocolate/cocoa recipes)
- Cocoa powder and physical chocolate produce **very different results** even at matched fat/sugar/solids
- Cocoa powder hardening factor requires extra FPD compensation — use dextrose
- Fat% does NOT determine milk vs dark flavor — roasting process and alkalization matter more
- Black cocoa (12-13% fat) tastes bad unless heavily cooked — avoid in cold-process
- Drinking chocolate ≠ cocoa powder (mostly sugar, impossible to balance)
- Luxury brands most likely use cocoa powder or cocoa+chocolate combos, not just physical chocolate

### Creami Recipe Balancing Ranges (from Polar Theory)
- Fat: 5-22% all work. Fat doesn't dramatically change freezing point
- Sugar: 12% is very low (lacks solids, FPD too low). Gelato up to 22%
- MSNF: down to 5%. Essential for smooth mouthfeel. Without milk proteins → inulin or MCC
- Total solids: late 30s to early-mid 40s%
- Water: late 40s to early 60s%
- **Freezing point is THE most important metric** — more important than sugar%. Different sweeteners affect FPD at different rates per gram

---

## Polar Theory Lookup Guide

> `rest/polar_theory.md` contains the full science reference (~600 lines). Read the sections that apply to the recipe — do NOT skip this to save time.

**ALWAYS read for every recipe:**

| Section | Lines | Why |
|---------|-------|-----|
| Sugars & Sweeteners | 9-92 | Every recipe uses sweeteners. PAC/POD values, erythritol recrystallization mechanism, dextrose advantages, usage limits |
| Stabilizers | 94-280 | Every recipe uses stabilizers. Dosages, hydration temps, synergy pairs, cold vs hot process, dispersion rules, what happens when you overshoot |
| Recipe Balancing | 282-342 | Creami-specific ranges, why freezing point > sugar%, solids targets, MSNF floor |

**Read when the recipe involves:**

| Scenario | Lines | Section |
|----------|-------|---------|
| Chocolate or cocoa powder | 393-438 | Chocolate & Cocoa — hardening, cocoa selection, powder vs physical chocolate |
| Zero-fat or high-protein | 345-390 | Zero-Fat & High-Protein — lost solids problem, maltodextrin, overrun ranges |
| Cream manipulation or dairy questions | 441-501 | Dairy Techniques — evaporation formula, custom milk/cream, cream additives |
| Quick number lookup (mid-optimization) | 560-605 | Quick Reference Tables — all key numbers in one place |

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
