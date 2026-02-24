# NINJA CREAMI DELUXE — MASTER CONTEXT
> Everything needed to make ice cream in Greece with the available ingredients, tools, and recipes.

> **Units:** ALWAYS metric. Prefer grams (g) over milliliters (ml) — we only have a scale out, no measuring cups/spoons.

> **Acronyms:** Always explain ice cream science acronyms in parentheses on first use in each response. E.g. "PAC (anti-freezing power — how much an ingredient keeps ice cream soft/scoopable)", "POD (sweetening power — how sweet an ingredient is relative to sugar)", "MSNF (milk solids-non-fat — proteins, lactose, minerals in milk minus the fat and water)", "FPDF (freezing point depression factor — same concept as PAC)", "GI (glycemic index — how fast it spikes blood sugar)", "DE (dextrose equivalent — how broken-down a starch syrup is, higher = sweeter and more anti-freeze)", "HLB (hydrophilic-lipophilic balance — whether an emulsifier prefers water or fat, scale 0-20)".

> **Recipe optimization workflow:**
> 1. **Always validate against Scoopulator before presenting.** When proposing recipe changes, build a Scoopulator calc URL using slugs from `rest/scoopulator_ingredients_index.txt`, fetch the page, and extract metrics (PAC, POD, solids, MSNF, fat, serving temp, etc.).
> 2. **Adjust recipe and validate again:** Ask scoopulator about the recipe, and loop until metrics are realistically acceptable for the ingredients (no need to fixate on getting all green, just as many as possible for given ingredients). No more than 10 requests, then give me the best one and show the url in your response.
> 3. **No buying extras to fix metrics.** Work with pantry + supermarket only. Accept the best achievable result — don't suggest buying specialty ingredients (SMP, etc.) unless they're in the `/adapt` buy list and the recipe depends on them.
> 4. **Scoopulator URL format:** `https://scoopulator.app/calc?ingredients=slug1:weight1,slug2:weight2,...&target=TARGET` where TARGET is one of the **slugs** from section 4. Choose the correct TARGET profile for what the recipe actually is — don't game the metrics by picking whichever target happens to score more greens. When a recipe fits multiple profiles, present both Scoopulator URLs (one per candidate target) and let the user choose. If a recipe doesn't clearly fit any profile, inform the user and let them decide which target to validate against (or whether to use `freeform`).
> 5. **Ingredient slugs:** Look up in `rest/scoopulator_ingredients_index.txt` (format: `name:slug`). PRIORITIZE the user's custom ingredients.
> 6. **Show every Scoopulator fetch** as a one-line color-coded summary — every iteration, not just the final one. Never silently skip a fetch. Format: `PAC 23.8 | Serv. -9.4°C 🔴 | Sugars 14.1% 🟡 | Fat 2.6% 🔴 | MSNF 2.4% 🔴 | Solids 27% 🔴 | Sweet 9.5% 🔴 | Stab 0.42% 🔴 | Emul 0% 🔴`
> **MANDATORY: Do NOT guess or rely on memory for ingredient science, PAC/POD values, thickener ratios, or nutrition data.** Before proposing any recipe, modification, or ingredient advice:
> a. Read `ice-creamery-main/docs/info/ingredients.md` (PAC/POD/GI, hardening factors, sweetener/thickener/emulsifier science)
> b. Read `ice-creamery-main/docs/info/nutrition.md` (exact nutritional values per 100g)
> c. Read `ice-creamery-main/docs/info/principles.md` (PAC targets, MSNF targets)
> d. Consult `ice-creamery-main/docs/info/glossary.md` if any term is unclear
> e. THEN design the recipe, THEN validate with Scoopulator, THEN present to user.
> For recipe adaptation rules, ingredient swaps, blend compositions, and CREAMing.md formatting → use `/adapt`

---

## 1. EQUIPMENT

**Machine:** Ninja Creami Deluxe (NC500 series) — 24oz / 680ml pints
**Home freezer temperature:** -18°C
- **Programs:** Ice Cream, Lite Ice Cream, Sorbet, Gelato, Frozen Yogurt, Milkshake, Mix-In, Re-Spin
- **Processing modes:** TOP / FULL / BOTTOM (partial pint processing)
- **Freezer temp range:** -13C to -22C (9F to -7F)
- **Freeze time:** Minimum 24 hours (36h for cooked/warm bases)

> For spin mode selection, scrape test, processing details, mix-in techniques, and prep tips → use `/spin`

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
| Corn starch | Supermarket | Replaces Ultratex: same weight (~10g/pint, ~1.5%), BUT must cook (slurry in cold liquid → heat to 90°C+). Ultratex is cold-acting; corn starch is not |
| Marata 1.5% milk | Supermarket | 47 kcal/100ml. Fat 1.5, carbs 4.8, protein 3.5, water ~90%. Standard base |
| Marata 2% strained yogurt | Supermarket | 66 kcal/100g. Fat 2, carbs 3.9, protein 8 |
| Alpro unsweetened soy milk | Supermarket | ~33 kcal/100ml. Alternative base liquid |
| Citric acid | Supermarket | — |
| Cream of tartar | Supermarket | Meringue stabilizer |
| Oreos | Supermarket | Mix-in |
| Chocolate bars | Supermarket | Mix-in |

---

## 3. INGREDIENT REFERENCE (KEY NUMBERS)

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

## 4. SCOOPIFY TARGET PROFILES

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

## 5. FILE INVENTORY

| File | Source | Contents |
|------|--------|---------|
| `CLAUDE.md` | — | THIS FILE — master context and reference |
| `CREAMing.md` | — | Adapted recipes with Greek ingredient swaps |
| `icecreamery_recipes.md` | ice-creamery repo (jhermann) | 121 recipes, 7 categories (original ingredients) |
| `fpf_recipes.md` | FitnessProductFinder (Eli) | 39 B&J dupes + 18 DQ Blizzards + 11 tips (original ingredients) |
| `e4cm_recipes.md` | Exercise4CheatMeals (E4CM) | 24 recipes + 47 tips (original ingredients) |
| `ice-creamery-main/` | jhermann | GitHub repo clone — raw source (unmodified) |
| `raw_transcripts/fpf/` | Eli | 109 VTT + 113 description files from YouTube |
| `raw_transcripts/e4cm/` | E4CM | 12 VTT + 13 description files from YouTube |
| `rest/NC500Series_IB_MP.txt` | Ninja | NC500 owner's manual (full text) |
| `rest/scoopulator_ingredients_index.txt` | Scoopify | Ingredient slug lookup for Scoopulator API |
| `rest/spin_settings.srt` | wh_ben | Spin settings reference (subtitle) |
| `rest/manis_products.html` | Manis | Store product page (reference) |
| `rest/yt-dlp_win/yt-dlp.exe` | — | YouTube downloader tool (see `/yt` skill) |
| `rest/scoopulator_profiles_index.json` | Scoopify | Target profiles (scraped) — acceptable metric ranges per recipe type |

**Reference docs** in `ice-creamery-main/docs/info/`:
- `ingredients.md` — PAC/POD/GI tables, hardening factors, sweeteners/thickeners/emulsifiers/dairy-alts, blend ratios, cocoa, alcohol
- `nutrition.md` — kcal/fat/carbs/protein/PAC/MSNF per 100g for 100+ ingredients
- `tips+tricks.md` — scrape test, icy sides handling, workflow, essential tools
- `polar-ice-creamery.md` — sugar science (sucrose vs dextrose vs erythritol), stabilizer principles
- `principles.md` — PAC targets (20-30 ice cream, 30-36 sorbet), MSNF targets
- `glossary.md` — PAC, POD, GI, HLB, DE, MSNF, ABV definitions
- `faq.md`, `web-resources.md`, `plating.md`

