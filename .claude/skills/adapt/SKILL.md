---
name: adapt
description: Adapt recipes for CREAMing.md using Greek ingredient swaps. Use when converting a recipe to local ingredients, writing to CREAMing.md, or when ingredient swap logic is needed.
allowed-tools: Read, Grep, Glob, Write, Edit, WebFetch
---

# Recipe Adaptation for CREAMing.md

## Formatting Rules

1. **Self-contained:** Every recipe must be complete and ready to follow. Never reference another file — "see e4cm_recipes.md" is not acceptable.
2. **Swap format:** `original (weight) [tier emoji]` then sub-bullets for each replacement ingredient. For simple 1:1 swaps use inline `→`. No shorthand — expand blends to components. Break multi-ingredient swaps into sub-bullets for readability.
3. **Only swap what's unavailable.** If it's at the supermarket (almond milk, cocoa, Oreos, cream cheese, fruit, etc.), don't list a swap.
4. **Steps as numbered lists.** Never compress steps into a single line.
5. **No hot water rinse.** Process straight from freezer → scrape down sides with butter knife → push top down with spoon → Re-Spin or Mix-In. Follow ice-creamery repo guidance over YouTubers when in doubt.
6. **All units in grams and °C.** Convert cups/tbsp/tsp/oz/ml/°F. For tiny amounts use `0.05g/pinch` format.
7. **Include every recipe** — even ones needing zero swaps get full write-ups.
8. **No source tags.** Don't mark where ingredients come from ([HSN], [Manis], etc.) — just list them.
9. **🟡 drawback comments** describe impact on the *ice cream*, not the ingredient (e.g. "slightly richer pint" not "higher fat milk").

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
- PAC = 2.56, POD ~85%, GI < 7
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
410-440g Fairlife fat-free milk    →  375g Marata 1.5% + 20g whey + 15g glycerin
40-50g Swerve                      →  40-50g SweEX
1g xanthan                         →  1g xanthan
0.5-1g salt                        →  0.5-1g salt
+ flavored protein 16-32g         →  unflavored whey same weight + flavor (see Protein below)
```

**FPF Standard Base → Greek:**
```
ORIGINAL                              GREEK SWAP
400g Fairlife fat-free milk        →  375g Marata 1.5% + 20g whey + 15g glycerin
40-45g Monk Fruit sweetener        →  27g erythritol + 18g xylitol + pinch sucralose
5g vanilla bean paste              →  5g vanilla extract
1g xanthan                         →  1g xanthan
pinch salt                         →  pinch salt
```

---

## Detailed Swap Logic

> Only consult when a recipe uses an ingredient not covered by the base patterns above.

### Fairlife Milk
Ultra-filtered: ~13g protein/240ml, ~6g lactose, near-zero fat. Extra casein + reduced water = fewer ice crystals.

- **400-440g fat-free** → 375g Marata 1.5% + 20g whey + 15g glycerin 🟡 — whey compensates protein but not casein. Glycerin adds body + FPD. Reduce sweetener by ~5g vs original recipe (higher lactose in Marata).
- **380-430g 2%/high-protein** → 400g Marata 1.5% + 15g whey + 10g glycerin 🟡 — closer fat match, less glycerin needed.
- **Gap closer (recipe-dependent):** If recipe has ≤1g xanthan, bump to 1.5g. If recipe has no inulin/Salty Stability, add 5-10g inulin. Skip if recipe already has >3g total gums (>0.5% of mix = overdosed per repo).

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
- **Black cocoa** → regular cocoa same weight + pinch baking soda 🟡 — lighter color, more bitter. Taste OK.
- **Coffee extract** (6 drops) → 1g instant coffee in 2ml warm water 🟢
- **Vanilla bean** (half bean, ~2g) → 6g vanilla extract (3x the weight) 🟡 — loses specks + depth. Buy beans for vanilla-forward recipes.

### Emulsifiers
- **GMS (E471)** → Soy Lecithin Powder same weight 🟢

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
