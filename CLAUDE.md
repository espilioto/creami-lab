# NINJA CREAMI DELUXE — MASTER CONTEXT
> Everything needed to make ice cream in Greece with the available ingredients, tools, and recipes.

> **Units:** ALWAYS metric. Prefer grams (g) over milliliters (ml) — we only have a scale out, no measuring cups/spoons.

> **Acronyms:** Always explain ice cream science acronyms in parentheses on first use in each response. E.g. "PAC (anti-freezing power — how much an ingredient keeps ice cream soft/scoopable)", "POD (sweetening power — how sweet an ingredient is relative to sugar)", "MSNF (milk solids-non-fat — proteins, lactose, minerals in milk minus the fat and water)", "FPDF (freezing point depression factor — same concept as PAC)", "GI (glycemic index — how fast it spikes blood sugar)", "DE (dextrose equivalent — how broken-down a starch syrup is, higher = sweeter and more anti-freeze)", "HLB (hydrophilic-lipophilic balance — whether an emulsifier prefers water or fat, scale 0-20)".

> **Recipe optimization workflow:**
> 1. **Always validate against Scoopulator before presenting.** When proposing recipe changes, build a Scoopulator calc URL using slugs from `rest/scoopulator_ingredients_index.txt`, fetch the page, and extract metrics (PAC, POD, solids, MSNF, fat, serving temp, etc.).
> 2. **Adjust recipe and validate again:** Ask scoopulator about the recipe, and loop until metrics are realistically acceptable for the ingredients (no need to fixate on getting all green, just as many as possible for given ingredients). No more than 10 requests, then give me the best one and show the url in your response.
> 5. **No buying extras to fix metrics.** Work with pantry + supermarket only. Accept the best achievable result — don't suggest buying specialty ingredients (SMP, etc.) unless they're in the Section 4.8 buy list and the recipe depends on them.
> 3. **Scoopulator URL format:** `https://scoopulator.app/calc?ingredients=slug1:weight1,slug2:weight2,...&target=TARGET` where TARGET is one of the **slugs** from section 8. Choose the correct TARGET profile for what the recipe actually is — don't game the metrics by picking whichever target happens to score more greens. When a recipe fits multiple profiles, present both Scoopulator URLs (one per candidate target) and let the user choose. If a recipe doesn't clearly fit any profile, inform the user and let them decide which target to validate against (or whether to use `freeform`).
> 4. **Ingredient slugs:** Look up in `rest/scoopulator_ingredients_index.txt` (format: `name:slug`). PRIORITIZE the user's custom ingredients.
> **MANDATORY: Do NOT guess or rely on memory for ingredient science, PAC/POD values, thickener ratios, or nutrition data.** Before proposing any recipe, modification, or ingredient advice:
> 1. Read `ice-creamery-main/docs/info/ingredients.md` (PAC/POD/GI, hardening factors, sweetener/thickener/emulsifier science)
> 2. Read `ice-creamery-main/docs/info/nutrition.md` (exact nutritional values per 100g)
> 3. Read `ice-creamery-main/docs/info/principles.md` (PAC targets, MSNF targets)
> 4. Consult `ice-creamery-main/docs/info/glossary.md` if any term is unclear
> 5. THEN design the recipe, THEN validate with Scoopulator, THEN present to user.
> **Recipe adaptation rules (for `CREAMing.md`):**
> 1. **Self-contained:** Every recipe must be complete and ready to follow. Never reference another file — "see e4cm_recipes.md" is not acceptable.
> 2. **Swap format:** `original (weight) [tier emoji]` then sub-bullets for each replacement ingredient. For simple 1:1 swaps use inline `→`. No shorthand — expand blends to components. Break multi-ingredient swaps into sub-bullets for readability.
> 3. **Only swap what's unavailable.** If it's at the supermarket (almond milk, cocoa, Oreos, cream cheese, fruit, etc.), don't list a swap.
> 4. **Steps as numbered lists.** Never compress steps into a single line.
> 5. **No hot water rinse.** Process straight from freezer → scrape down sides with butter knife → push top down with spoon → Re-Spin or Mix-In. Follow ice-creamery repo guidance over YouTubers when in doubt.
> 6. **All units in grams and °C.** Convert cups/tbsp/tsp/oz/ml/°F. For tiny amounts use `0.05g/pinch` format.
> 7. **Include every recipe** — even ones needing zero swaps get full write-ups.
> 8. **No source tags.** Don't mark where ingredients come from ([HSN], [Manis], etc.) — just list them.
> 9. **🟡 drawback comments** describe impact on the *ice cream*, not the ingredient (e.g. "slightly richer pint" not "higher fat milk").

---

## 1. EQUIPMENT

**Machine:** Ninja Creami Deluxe (NC500 series) — 24oz / 680ml pints
**Home freezer temperature:** -18°C
- **Programs:** Ice Cream, Lite Ice Cream, Sorbet, Gelato, Frozen Yogurt, Milkshake, Smoothie Bowl, Mix-In, Re-Spin
- **Processing modes:** TOP / FULL / BOTTOM (partial pint processing)
- **Freezer temp range:** -13C to -22C (9F to -7F)
- **Freeze time:** Minimum 24 hours (36h for cooked/warm bases)

**Key manual points:**
- Do NOT run pint under hot water before 1st spin — block can spin loose, catastrophic failure. Leave on counter a few minutes if too hard, or raise freezer temp.
- After 1st spin: run COLD water (20-25C) over container 15-30 sec to loosen icy sides, then Re-Spin or Mix-In
- Mix-ins: create 1.5-inch hole, max 1/4 cup. Hard (Oreos, chips) stay chunky; soft (fruit, marshmallows) get broken down
- Do NOT Re-Spin right before Mix-In — base becomes too soft, mix-ins sink/pulverize. If you need Re-Spin AND Mix-In: Re-Spin, refreeze 1 hour, then Mix-In
- Flatten top before refreezing leftovers. Re-process on original program (not Re-Spin) when eating again
- Scrape test before every spin to decide if counter time is needed

**Processing mode details:**

| Mode | Down [s] | Down [rpm] | Up [s] | Up [rpm] | Use for |
|------|----------|------------|--------|----------|---------|
| Ice Cream | 60 | 1200 | 35 | 450 | Rich dairy/dairy-alt bases |
| Lite Ice Cream | 105 | 1790 | 40 | 1790 | Low sugar/fat, keto, paleo |
| Sorbet | 105 | 1790 | 35 | 450 | Fruit-based, high water+sugar |
| Gelato | 60 | 1200 | 35 | 450 | Custard/Italian-style bases |
| Milkshake | 60 | 1790 | 5 | 450 | Ice cream + milk + mix-ins |
| Mix-in | 30 | 450 | 35 | 450 | Fold in cookies/nuts/fruit |
| Re-Spin | 30 | 1200 | 35 | 1200 | Smooth crumbly/powdery results |
| Frozen Yogurt (Deluxe) | 150 | 1790 | 150 | 1790 | Yogurt into frozen treat, safest mode |

---

## 2. PANTRY — WHAT I HAVE

| Ingredient | Source | Notes |
|-----------|--------|-------|
| Glycerin (VG, E422) | Manis | FPD, PAC=3.7, sweetness=60% sugar. Dose: 5-20g/pint |
| Xanthan Gum (E415) | Manis | Thickener/stabilizer. Dose: 0.5-1.5g/pint |
| CMC (E466, Tylose) | Manis | Stabilizer, prevents ice crystals. Dose: 0.6-2g/pint |
| Guar Gum (E412) | Manis | Body/mouthfeel. Dose: 0.4-1.5g/pint |
| Chocolate Flavor | Manis | Flavor drops |
| Strawberry Flavor | Manis | Flavor drops |
| Milk Cream Flavor | Manis | Flavor drops, caramel sub |
| Soy Lecithin Powder (E322) | Manis | Emulsifier, replaces GMS 1:1 by weight |
| Erythritol (E968) | HSN | PAC=2.8, sweetness=75%, non-caloric. Safe ≤50g/sitting |
| Xylitol (E967) | HSN | PAC=2.2, sweetness=100%. GI issues at ~20-30g |
| Inulin | HSN | Fiber/bulking, PAC=0.22, sweetness=8%. Adds body, replaces fat |
| Sucralose | HSN | 600x sweeter than sugar, zero GI, zero cal. Tiny amounts |
| Whey Protein (unflavored) | HSN | Binds water, prevents ice crystals, adds protein |
| Sugar | Supermarket | Regular table sugar |
| Salt | Supermarket | Kitchen salt |
| Cocoa powder | Supermarket | For chocolate bases |
| Vanilla extract | Supermarket | Replaces vanilla bean powder in all repo recipes |
| Corn starch | Supermarket | Replaces Ultratex in all repo recipes |
| Marata 1.5% milk | Supermarket | 47 kcal/100ml. Fat 1.5, carbs 4.8, protein 3.5, water ~90%. Standard base |
| Marata 2% strained yogurt | Supermarket | 66 kcal/100g. Fat 2, carbs 3.9, protein 8 |
| Alpro unsweetened soy milk | Supermarket | ~33 kcal/100ml. Alternative base liquid |
| Citric acid | Supermarket | — |
| Oreos | Supermarket | Mix-in |
| Chocolate bars | Supermarket | Mix-in |

---

## 3. BLEND COMPOSITIONS (REFERENCE)

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
| Erythritol | 100/218 = 45.9% | 13.8g | 9.2g |
| Inulin | 100/218 = 45.9% | 13.8g | 9.2g |
| CMC | 10/218 = 4.6% | 1.4g | 0.9g |
| Guar Gum | 3.5/218 = 1.6% | 0.5g | 0.3g |
| Salt | 3.5/218 = 1.6% | 0.5g | 0.3g |
| Xanthan Gum | 1/218 = 0.46% | 0.14g | 0.09g |

### SweEX (Erythritol + Xylitol 3:2)
- 60% Erythritol + 40% Xylitol
- PAC = 256, POD ~85%, GI < 7
- Swap to allulose/dextrose: use 133% of SweEX amount
- Swap to sugar: roughly same weight but different PAC/texture

---

## 4. INGREDIENT SWAP INDEX

> Only ingredients that need a swap. If it's available at the supermarket (almond milk, cocoa, Oreos, vanilla extract, eggs, butter, cream cheese, peanut butter, cinnamon, fruit, chocolate bars, etc.), it's not listed here.
> Science and ratios sourced from ice-creamery repo (`ingredients.md`, `nutrition.md`).

### Swap Tiers
- 🟢 = functionally equivalent — no noticeable difference expected
- 🟡 = works but noticeably different — degraded texture, flavor, or body
- 🔴 = no viable swap — buy the ingredient or skip the recipe

---

### 4.1 Fairlife Milk
Ultra-filtered: ~13g protein/240ml, ~6g lactose, near-zero fat. Extra casein + reduced water = fewer ice crystals.

- **400-440g fat-free** → 375g Marata 1.5% + 20g whey + 15g glycerin 🟡 — whey compensates protein but not casein. Glycerin adds body + FPD. Reduce sweetener ~5g (higher lactose).
- **380-430g 2%/high-protein** → 400g Marata 1.5% + 15g whey + 10g glycerin 🟡 — closer fat match, less glycerin needed.
- **Gap closer (recipe-dependent):** If recipe has ≤1g xanthan, bump to 1.5g. If recipe has no inulin/Salty Stability, add 5-10g inulin. Skip if recipe already has high stabilizer doses.

### 4.2 Sweeteners
- **Swerve** → SweEX same weight 🟢 — xylitol prevents erythritol crystallization (same role as Swerve's oligos). PAC ~256 vs ~270. Pinch sucralose if needed.
- **Swerve** → pure erythritol same weight 🟡 — crystallization risk at 50g+. Add xylitol or 0.05% xanthan.
- **Brown sugar erythritol** → erythritol same weight 🟡 — loses caramel note. Add 3-5g honey or Milk Cream flavor drop.

### 4.3 Protein
- **Vanilla whey** → unflavored whey + 2g vanilla extract 🟢
- **Chocolate whey** → unflavored whey + 5g cocoa + chocolate flavor drops 🟢 — bump sweetener slightly (cocoa bitter)
- **Cookies & cream whey** → unflavored whey + 2g vanilla + 1 Oreo blended in 🟡
- **Snickerdoodle whey** → unflavored whey + 1.5g cinnamon + 2g vanilla 🟢
- **Whey/casein blend** → whey same weight 🟢 — slightly softer result, still excellent
- **SMP 8g** (minor) → 5g whey + 5g inulin 🟡
- **SMP 20g+** (structural) → 🔴 buy it or skip

### 4.4 Cocoa & Flavorings
- **Black cocoa** → regular cocoa same weight + pinch baking soda 🟡 — lighter color, more bitter. Taste OK.
- **Coffee extract** (6 drops) → 1g instant coffee in 2ml warm water 🟢
- **Vanilla bean** (half bean) → 3x vanilla extract 🟡 — loses specks + depth. Buy beans for vanilla-forward recipes.

### 4.5 Emulsifiers
- **GMS (E471)** → Soy Lecithin Powder same weight 🟢

### 4.6 Mix-ins (US-specific)
- **PBfit** (8g) → 4g peanut butter 🟡 — higher fat, blend thoroughly
- **Zero sugar brownie mix** → DIY: 100g flour + 40g cocoa + 80g erythritol + pinch salt + pinch baking powder 🟡
- **Oatmeal Creme Pie** → any sandwich cookie/filled biscuit 🟡
- **US cereals** → any local equivalent of same flavor profile 🟢
- **Bing cherries** → dark sweet cherries (jarred), NOT sour/vyssino 🟡

### 4.7 QUICK-REFERENCE: COMMON BASE PATTERNS

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
+ flavored protein 16-32g         →  unflavored whey same weight + flavor (see 4.3)
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

### 4.8 BUY LIST (NO VIABLE SWAP)

| Ingredient | Why | Used In |
|-----------|-----|---------|
| Peppermint extract | Defines mint recipes | Mint Choc Chip, Minter Wonderland |
| SMP (skim milk powder) | Structural at 20g+ doses | Cream Pie, and useful generally |
| Vanilla beans | Star ingredient in vanilla-forward recipes | Vanilla Bean #3, VB Choc Chip |
| Coconut milk (canned, full-fat) | No equivalent fat% | Vegan/coconut bases |
| Fruity Pebbles syrup | Defines the recipe | Fruity Pebbles Ice Cream |

---

## 5. RECIPE SOURCES

| Source | File | Notes |
|--------|------|-------|
| ice-creamery repo (jhermann) | `icecreamery_recipes.md` | 121 recipes, 7 categories. Raw: `ice-creamery-main/` |
| FitnessProductFinder (Eli) | `fpf_recipes.md` | 39 B&J dupes + 18 DQ Blizzards. Raw: `raw_transcripts/fpf/` |
| Exercise4CheatMeals (E4CM) | `e4cm_recipes.md` | 24 recipes + 47 tips. Raw: `raw_transcripts/e4cm/` |

**Reference docs** in `ice-creamery-main/docs/info/`:
- `ingredients.md` — PAC/POD/GI tables, hardening factors, all sweeteners/thickeners/emulsifiers/dairy-alts, blend ratios, cocoa, alcohol
- `nutrition.md` — kcal/fat/carbs/protein/PAC/MSNF per 100g for 100+ ingredients
- `tips+tricks.md` — scrape test, icy sides handling, workflow, essential tools
- `polar-ice-creamery.md` — sugar science (sucrose vs dextrose vs erythritol), stabilizer principles
- `principles.md` — PAC targets (20-30 ice cream, 30-36 sorbet), MSNF targets
- `glossary.md` — PAC, POD, GI, HLB, DE, MSNF, ABV definitions
- `faq.md`, `web-resources.md`, `plating.md`

---

## 6. TIPS & TRICKS

### Preparation
- Use immersion blender (NOT milk frother) to hydrate gums and suspend cocoa
- Mix dry ingredients first, drizzle into vortex of running blender
- Bloom cocoa in hot water before adding — full flavor, no lumps
- Let base age in fridge 2-4 hours before freezing — helps gum hydration and flavor development
- Pre-chill base in fridge before freezer to avoid the frozen lump in the middle

### Spin Mode Selection

**Scrape test → setting choice:**
- **Hard** (spoon barely digs in) → Sorbet, straight from freezer
- **Perfect** (moderate resistance) → Sorbet + Mix-In (2 spins) = ideal hard ice cream
- **Soft** (spoon sinks easily) → Ice Cream + Mix-In, NO thawing, NO higher setting
- **Questionably soft** → Ice Cream + Mix-In (accept soft serve), or refreeze longer

**Default 1st spin = Sorbet.** More aggressive downstroke but gentler upstroke than Lite Ice Cream. Lite's upstroke can over-process into soft serve. Frozen Yogurt mode induces the most heat (5 min total) — safest of all but makes softest result. Use the setting regardless of what the mix actually is. Lower settings can actually draw MORE power on hard pints = burnout risk.

**Spin combos by desired texture:**
- Hard ice cream (ideal): Sorbet → Mix-In (2 spins)
- Soft serve: Mix-In twice after initial spin (2-3 spins)
- No mix-ins, firm: 1 spin on right setting. No mix-ins, softer: Sorbet → Re-Spin
- Too soft? Refreeze and try again

**Key techniques:**
- **Push down** after 1st spin if half pebbles/half powder — compact with spoon before 2nd spin. Saves 2+ extra spins.
- **Mix-In as processing tool** — can run empty (no actual mix-ins) to refine texture as 2nd spin
- Avoid thawing or adding liquid between spins — changes which settings are safe

### Mix-in Tips
- Chocolate chip hack: 15g chocolate + 2g coconut oil, melt, pour into hole → Mix-In creates chip swirls
- Chunky cookies: soak in milk + freeze before adding
- Freeze soft fruit pieces to prevent total incorporation
- Do NOT add raw pineapple to dairy bases (bromelain causes bitterness)
- PAC > 25 recipes stay scoopable directly from freezer for days

---

## 7. INGREDIENT REFERENCE (KEY NUMBERS)

**Target PAC:** 20-30 for scoopable ice cream, 30-36 for sorbets

### Hardening Factors (negative PAC)
- Cocoa powder 21%: -160 (chocolate bases need extra FPD compensation)
- Cocoa powder 11%: -130
- Vegetable fat: -90

### Thickener synergy ratios
- CMC : Guar : Xanthan = 4:3:1 (cold-acting, 0.3-0.5% of total mix)
- Guar : Xanthan = 3:1 (cold gel)
- No GMS — use soy lecithin (1:1 by weight) as emulsifier alongside thickeners

---

## 8. SCOOPIFY TARGET PROFILES

> Reference for Scoopulator validation. Each profile defines acceptable ranges for a recipe type.
> Source: `rest/scoopulator_profiles_index.json` (scraped from Scoopify). All values are percentages.
> All profiles with Rel. Sweetness share the same range: 11-20%.

### Ice Cream Profiles

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

### Other Profiles

| Slug | Name | Milk Fat | Total Fat | Sugars | MSNF | Stab. | Emuls. | Total Solids | Rel. Sweet. | Serving °C |
|------|------|----------|-----------|--------|------|-------|--------|--------------|-------------|-----------|
| `gelato` | Gelato | 4-8% | — | 16-22% | 11-12% | 0.4-0.6% | 0.1-0.8% | 36-43% | 11-20% | -14 to -10 |
| `frozen-yogurt-regular` | Froyo Regular | 3-6% | — | 15-17% | 9-13% | 0.4-0.6% | 0.1-0.8% | 30-36% | 11-20% | -16 to -12 |
| `frozen-yogurt-nonfat` | Froyo Nonfat | 0-0.5% | — | 15-17% | 9-14% | 0.5-0.7% | 0.1-0.8% | 28-32% | 11-20% | -16 to -12 |
| `sherbet` | Sherbet | 1-2% | — | 22-28% | 1-3% | 0.4-0.5% | 0.1-0.8% | 28-34% | 11-20% | -16 to -12 |
| `sorbet` | Sorbet | 0-2% | — | 22-28% | 0-3% | 0.3-0.5% | 0.1-0.8% | 28-34% | 11-20% | -16 to -12 |
| `ganache` | General Ganache | 15-25% | 20-30% | 25-45% | — | 0.3-0.5% | — | 60-75% | — | — |
| `freeform` | Freeform | — | — | — | — | — | — | — | — | — |

**Key patterns:**
- As fat decreases, sugars + MSNF + stabilizers must increase to compensate for lost body/texture.
- Gelato has warmest serving temp (-14 to -10°C).
- `general-ice-cream` is the only profile with Total Fat (10-30%, includes non-dairy fat) and Alcohol (0-2%) metrics.
- `ganache` is the only other profile with a Total Fat metric (20-30%), and has no MSNF/emulsifiers/serving temp targets.
- Relative Sweetness (11-20%) applies to all profiles except ganache and freeform.

---

## 9. FILE INVENTORY

| File | Contents |
|------|---------|
| `CLAUDE.md` | THIS FILE — master context and reference |
| `CREAMing.md` | Adapted recipes with Greek ingredient swaps |
| `icecreamery_recipes.md` | ice-creamery repo: 121 recipes across 7 categories (original ingredients) |
| `fpf_recipes.md` | FPF: 39 B&J dupes + 18 DQ Blizzard dupes + 11 tips (original ingredients) |
| `e4cm_recipes.md` | E4CM: 24 recipes + 47 tips (original ingredients) |
| `ice-creamery-main/` | GitHub repo clone — raw source (unmodified) |
| `raw_transcripts/fpf/` | 109 VTT + 113 description files from YouTube |
| `raw_transcripts/e4cm/` | 12 VTT + 13 description files from YouTube |
| `rest/NC500Series_IB_MP.txt` | Ninja Creami Deluxe NC500 owner's manual (full text) |
| `rest/scoopulator_ingredients_index.txt` | Ingredient slug lookup for Scoopulator API |
| `rest/spin_settings.srt` | Spin settings reference (wh_ben subtitle) |
| `rest/manis_products.html` | Manis store product page (reference) |
| `rest/yt-dlp.exe` | YouTube downloader tool |
| `rest/scoopulator_profiles_index.json` | Scoopify target profiles (scraped) — acceptable metric ranges per recipe type |
