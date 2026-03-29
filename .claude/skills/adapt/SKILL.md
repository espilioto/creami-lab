---
name: adapt
description: Adapt recipes for CREAMing.md using Greek ingredient swaps. Use when converting a recipe to local ingredients, writing to CREAMing.md, or when ingredient swap logic is needed.
allowed-tools: Read, Grep, Glob, Write, Edit, WebFetch
---

# Recipe Adaptation for CREAMing.md

## Formatting Rules

1. **Self-contained:** Every recipe must be complete and ready to follow. Never reference another file — "see e4cm_recipes.md" is not acceptable.
2. **Swap format:** Two styles depending on complexity:
   - **1:1 swap:** `weight original → emoji weight swap (drawback comments)`
   - **Multi-ingredient swap:** `weight original emoji (drawback comments)` then sub-bullets with each replacement ingredient.
   - If a drawback doesn't exist then skip the drawback comments section.
   No shorthand — expand blends to components.
3. **Only swap what's unavailable.** If it's at the supermarket (almond milk, cocoa, Oreos, cream cheese, fruit, etc.), don't list a swap.
4. **Steps as numbered lists.** Never compress steps into a single line.
5. **No hot water rinse.** Process straight from freezer → scrape down sides with butter knife → push top down with spoon → Re-Spin or Mix-In. When in doubt on ingredient science, read `rest/polar_theory.md` (see `/optimize` skill's Polar Theory Lookup Guide for line ranges) and `ice-creamery-main/docs/info/ingredients.md` — don't guess.
6. **All units in grams and °C.** Convert cups/tbsp/tsp/oz/ml/°F. For tiny amounts use `0.05g/pinch` format.
7. **Include every recipe** — even ones needing zero swaps get full write-ups.
8. **No source tags.** Don't mark where ingredients come from ([HSN], [Manis], etc.) — just list them.
9. **🟡 drawback comments** describe impact on the *ice cream*, not the ingredient (e.g. "slightly richer pint" not "higher fat milk").
10. **Cost line.** After all ingredients and before Steps, add: `**Cost:** ~€X.XX/kg — ~€X.XX/pint` — computed from CLAUDE.md §2 PANTRY `€/kg` column. €/kg = pint_cost ÷ (total_grams ÷ 1000). If some ingredients have TBD pricing, append `(excludes: ingredient Xg — price TBD)`.

---

## Swap Tiers

- 🟢 = functionally equivalent — no noticeable difference expected
- 🟡 = works but noticeably different — degraded texture, flavor, or body
- 🔴 = no viable swap — buy the ingredient or skip the recipe

---

## Blend Compositions

### Salty Stability (150g total)
Inulin 110g, Soy Lecithin 18g (replaces GMS), CMC 9g, Guar 6g, Salt 5g, Xanthan 2g

| Ingredient | Ratio | Per 15g dose | Per 10g dose | Per 5g dose |
|-----------|-------|-------------|-------------|------------|
| Inulin | 73.3% | 11.0g | 7.3g | 3.7g |
| Soy Lecithin | 12.0% | 1.8g | 1.2g | 0.6g |
| CMC | 6.0% | 0.9g | 0.6g | 0.3g |
| Guar Gum | 4.0% | 0.6g | 0.4g | 0.2g |
| Salt | 3.3% | 0.5g | 0.3g | 0.2g |
| Xanthan Gum | 1.3% | 0.2g | 0.1g | 0.07g |

**3-ingredient fallback** (per 15g dose): 1.5g guar + 0.5g xanthan + 0.5g salt

### ICSv2 (218g total)

| Ingredient | Ratio | Per 30g dose | Per 20g dose |
|-----------|-------|-------------|-------------|
| Erythritol | 45.9% | 13.8g | 9.2g |
| Inulin | 45.9% | 13.8g | 9.2g |
| CMC | 4.6% | 1.4g | 0.9g |
| Guar Gum | 1.6% | 0.5g | 0.3g |
| Salt | 1.6% | 0.5g | 0.3g |
| Xanthan Gum | 0.46% | 0.14g | 0.09g |

### SweEX (Erythritol + Xylitol 3:2)
- 60% Erythritol + 40% Xylitol
- PAC = 2.56, POD ~85%, glycemic index < 7
- Swap to allulose/dextrose: use 133% of SweEX amount
- Swap to sugar: roughly same weight but different PAC/texture

---

## Common Base Patterns

> Start here — these cover 90% of recipes. See Detailed Swap Logic for edge cases.

**E4CM Standard Base → Greek:**
```
ORIGINAL                              GREEK SWAP
440g 1% milk                       →  440g Marata 1.5% (close enough)
45-50g Swerve                      →  45-50g SweEX (+ pinch sucralose if needed)
1g xanthan                         →  1g xanthan
1g salt                            →  1g salt
```

**E4CM Fairlife Base → Greek:**
```
ORIGINAL                              GREEK SWAP
410-440g Fairlife fat-free milk    →  395g Marata 1.5% + 12g whey + 15g glycerin
40-50g Swerve                      →  40-50g SweEX
1g xanthan                         →  1g xanthan
0.5-1g salt                        →  0.5-1g salt
+ flavored protein 16-32g         →  unflavored whey same weight + flavor (see Protein below)
```

**FPF Standard Base → Greek:**
```
ORIGINAL                              GREEK SWAP
400g Fairlife fat-free milk        →  385g Marata 1.5% + 12g whey + 15g glycerin
40-45g Monk Fruit sweetener        →  27g erythritol + 18g xylitol + pinch sucralose
5g vanilla bean paste              →  5g vanilla extract
1g xanthan                         →  1g xanthan
pinch salt                         →  pinch salt
```

---

## Polar Theory Quick Rules (apply during swaps)

> Full reference: `rest/polar_theory.md`. Read specific sections when deeper context needed (see `/optimize` skill's Polar Theory Lookup Guide for line ranges).

**Sweetener swaps:**
- Dextrose PAC=190 (2x sucrose), POD=70. Won't re-harden after Creami spin. Start 75/25 sucrose/dextrose
- Erythritol PAC=290-320. Recrystallizes after ~30min frozen. Max 1/3 of sugar weight. Never 1:1 substitute
- More sugar = duller flavor. Different sweeteners affect FPD at different rates per gram

**Stabilizer swaps:**
- Cold-process (Creami): xanthan (0.1%), guar (0.1-0.3%). Hot-process: LBG (80-85C), carrageenan, CMC (75C+, 20min)
- Commercial blend: LBG:Guar:Lambda Carrageenan = 4:2:1. With emulsifier: Lecithin:LBG:Guar:Lambda = 4:4:2:1
- Low-fat → needs gel (kappa/iota carrageenan). High-fat → NO gel
- 0.5g over = gummy disaster. Mix into dry solids first, never directly into liquid

**Chocolate:**
- Cocoa hardening needs extra FPD (dextrose). Black cocoa needs cooking — avoid in cold-process
- Drinking chocolate ≠ cocoa powder

---

## Archetype Reference

> When adapting a recipe, read its flavor category in `rest/polar_archetypes.md` for traditional baselines, key ratios, techniques, and translation rules. Also check the Technique Library section for ingredient-agnostic processes (cocoa blooming, fruit prep, swirl making, nut paste method, stracciatella, etc.).

---

## Detailed Swap Logic

> Only consult when a recipe uses an ingredient not covered by the base patterns above.

### Fairlife Milk
Ultra-filtered, lactase-treated. Per 100g: **fat-free** → 33 kcal, 0g fat, 2.5g carbs (lactose), 5.4g protein; **2%** → 50 kcal, 1.9g fat, 2.5g carbs, 5.4g protein. Compare Marata 1.5%: 47 kcal, 1.5g fat, 4.8g carbs, 3.5g protein. Key deltas per 400g dose: Fairlife has +7.6g protein, −9.2g lactose, −6g fat vs Marata.

- **400-440g fat-free** → 385-425g Marata 1.5% + 12g whey + 15g glycerin 🟡 — old swap over-compensated protein (20g whey gave ~29g total vs Fairlife's ~22g). 12g whey now matches (~23g total). Marata adds +6g fat (unavoidable) and +8g lactose per 400g dose → reduce sweetener by **~8g** vs original recipe.
- **380-430g 2%/high-protein** → 375-420g Marata 1.5% + 8-10g whey + 10g glycerin 🟡 — fat nearly matches (1.5 vs 1.9/100g). Protein gap smaller. Reduce sweetener by **~8g** (same lactose delta).
- **Gap closer (recipe-dependent):** If recipe has no inulin/Salty Stability, add 5-10g inulin for body. ⚠️ **Total gums (CMC + guar + xanthan) must stay ≤ 2g/pint** — including gums inside mixes (15g SS = 1.7g gums, 10g ICSv2 = ~0.7g gums). Do NOT add extra gums on top of a mix unless the total stays under 2g. Above 2g → stringy, cheese-pull texture.

### 🚨 GI SAFETY — top priority, NEVER exceed (CHECK EVERY RECIPE)
> GI safety limits protect your gut — they always trump functional limits, which only affect ice cream texture/quality.

Both inulin and xylitol ferment in the gut. **Check per-pint doses in EVERY recipe:**
- **Inulin ≤ 30g per pint.** Count ALL sources: standalone + inside mixes (15g SS = 11g inulin, 10g ICSv2 = 4.6g inulin). If over, reduce inulin first (swap body to whey protein or MCC).
- **Xylitol ≤ 30g per pint.** Both ferment in the gut — stacks with inulin.
- **Combined fermentable load (inulin + xylitol) ≤ 45g per pint.** Even if each is under its own limit, high combined doses cause GI distress. When one is high, keep the other low. Use MCC or whey protein for body instead of maxing inulin.

### ⚙️ FUNCTIONAL — ice cream quality (strongly avoid exceeding)
- **Erythritol ≤ 8% of total mix weight** (~54g in 680g pint) to avoid crystallization. Not a GI concern.

### Sweeteners
- **Swerve** → SweEX same weight 🟢 — xylitol prevents erythritol crystallization (same role as Swerve's oligos). PAC ~2.56 vs ~2.70. Pinch sucralose if needed.
- **Swerve** → pure erythritol same weight 🟡 — crystallization risk at 50g+. Add xylitol or 0.05% xanthan.
- **Brown sugar erythritol** → erythritol same weight 🟡 — loses caramel note. Add 3-5g honey or Milk Cream flavor drop.

### Protein
- **Vanilla whey** → unflavored whey + 2g vanilla extract 🟢
- **Chocolate whey** → unflavored whey + 5g cocoa + chocolate flavor drops 🟢 — bump sweetener slightly (cocoa bitter)
- **Cookies & cream whey** → unflavored whey + 2g vanilla + 1 Oreo blended in 🟡
- **Snickerdoodle whey** → unflavored whey + 1.5g cinnamon + 2g vanilla 🟢
- **Whey/casein blend** → whey same weight 🟢 — slightly softer result, still excellent
- **SMP 8g** (minor) → 5g whey + 5g inulin 🟡
- **SMP 20g+** (structural) → 🔴 buy it or skip

### Cocoa & Flavorings
- **Flavor drops (chocolate, strawberry, milk cream):** MAX 2 drops per pint. 3 drops is too intense. Always state this limit explicitly in recipe ingredients.
- **Black cocoa** → regular cocoa same weight + pinch baking soda 🟡 — lighter color, more bitter. Taste OK.
- **Coffee extract** (6 drops) → 1g instant coffee in 2ml warm water 🟢
- **Vanilla bean** (half bean, ~2g) → 6g vanilla extract (3x the weight) 🟡 — loses specks + depth. Buy beans for vanilla-forward recipes.

### Thickeners — ⚙️ Total gums (CMC + guar + xanthan) ≤ 2g/pint (functional limit)
- **Corn starch** → NEVER use corn starch (requires cooking to 90°C+). All recipes are no-cook. Swap to cold-acting alternatives: inulin for body, small amount of gums for ice crystal prevention 🟢
- **Ultratex / Waxy Maize Starch (E1442)** → cold-acting modified starch. We don't stock it. **10-15g Ultratex** → 8-12g inulin + 0.3g xanthan 🟡 — less thickening power but functional. Always check gum total after adding xanthan.
- **Always count gums inside mixes toward the 2g limit.** 15g Salty Stability = 1.7g gums. 10g ICSv2 = ~0.7g gums. Above 2g total → stringy, cheese-pull, gummy texture.
- Yogurt, whey protein, and inulin provide body. Gums are ONLY for ice crystal prevention.

### Buttermilk
- **500g buttermilk 1%** → 450g Marata 1.5% + 50g Marata 2% strained yogurt 🟡 — approximates tang + acidity. Or add 2g citric acid to plain milk.
- Buttermilk adds ~4.7g carbs/100g (similar to Marata) so no sweetener adjustment needed.

### Gum Arabic (E414)
- **3g gum arabic** → skip or use 0.3g xanthan 🟡 — gum arabic is primarily for mouthfeel in sorbets. Count toward 2g gum total.

### Sweetener Tablets
- **10 tablets (~40g sugar equivalent)** → 8g erythritol + 0.05g sucralose 🟢 — matches sweetness. Adjust to taste.

### Emulsifiers
- **GMS (E471)** → Soy Lecithin Powder same weight 🟢

### Pudding Mix (Jell-O / instant pudding)
Composite ingredient: modified starch (cold-acting) + sugar + emulsifier (mono- & diglycerides) + buffer salts + flavor + color. **No sugar-free version in Greek supermarkets** (Γιώτης κρέμα = 50-66g sugar/100g). DIY no-cook swaps from pantry only.

| Recipe calls for… | No-cook swap | Tier |
|-------------------|-------------|------|
| 7-10g (1 tbsp), body only | 1g xanthan | 🟢 |
| 7-10g (1 tbsp), any flavor | 1g xanthan + 0.5g CMC + 1g soy lecithin + flavor to taste | 🟢 |
| 28-34g (1 packet) chocolate | 1g xanthan + 1g CMC + 1g soy lecithin + 12g cocoa + 25g erythritol + pinch sucralose + pinch salt | 🟢 |
| 28-34g (1 packet) vanilla | 1g xanthan + 1g CMC + 1g soy lecithin + 3g vanilla extract + 25g erythritol + pinch sucralose + pinch salt | 🟢 |
| 28-34g (1 packet) cheesecake | 15g cream cheese + 1g xanthan + 0.5g CMC + 1g soy lecithin + sweetener to taste | 🟡 less custardy body |

**Notes:**
- Per FPF blind tests: xanthan alone gives firmer, more ice-cream-like texture than pudding mix (which makes it "soft and pasty, more like pudding")
- Pudding mix contains ~18g sugar per 28g packet — the erythritol in the swap accounts for this; reduce recipe's other sweetener accordingly if the original already sweetened on top
- If recipe already has ≥1g xanthan + stabilizer blend, just add flavor/cocoa — skip extra thickeners

### Mix-ins (US-specific)
- **PBfit** (8g) → 4g peanut butter 🟡 — higher fat, blend thoroughly
- **Zero sugar brownie mix** → DIY: 100g flour + 40g cocoa + 80g erythritol + pinch salt + pinch baking powder 🟡
- **Oatmeal Creme Pie** → any sandwich cookie/filled biscuit 🟡
- **US cereals** → any local equivalent of same flavor profile 🟢
- **Bing cherries** → dark sweet cherries (jarred), NOT sour/vyssino 🟡

---

## Buy List (No Viable Swap)

| Ingredient | Why | Used In |
|-----------|-----|---------|
| Peppermint extract | Defines mint recipes | Mint Choc Chip, Minter Wonderland |
| SMP (skim milk powder) | Structural at 20g+ doses | Cream Pie, and useful generally |
| Vanilla beans | Star ingredient in vanilla-forward recipes | Vanilla Bean #3, VB Choc Chip |
| Coconut milk (canned, full-fat) | No equivalent fat% | Vegan/coconut bases |
| Fruity Pebbles syrup | Defines the recipe | Fruity Pebbles Ice Cream |
