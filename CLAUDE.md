# NINJA CREAMI DELUXE — MASTER CONTEXT
> Everything needed to make ice cream in Greece with the available ingredients, tools, and recipes.

> **Units:** ALWAYS metric. Prefer grams (g) over milliliters (ml) — we only have a scale out, no measuring cups/spoons.

> **NO SUGAR.** Never use table sugar (sucrose) in recipes. Sweeten only with pantry sugar-free sweeteners: erythritol, xylitol, glycerin, sucralose.

> **Acronyms:** Always explain ice cream science acronyms in parentheses on first use in each response. E.g. "PAC (anti-freezing power — how much an ingredient keeps ice cream soft/scoopable)", "POD (sweetening power — how sweet an ingredient is relative to sugar)", "MSNF (milk solids-non-fat — proteins, lactose, minerals in milk minus the fat and water)", "FPDF (freezing point depression factor — same concept as PAC)", "GI (glycemic index — how fast it spikes blood sugar)", "DE (dextrose equivalent — how broken-down a starch syrup is, higher = sweeter and more anti-freeze)", "HLB (hydrophilic-lipophilic balance — whether an emulsifier prefers water or fat, scale 0-20)".

> For recipe optimization, Scoopulator validation, ingredient science, and target profiles → use `/optimize`
> **Scoopulator parsing:** ALWAYS use `PYTHONIOENCODING=utf-8 bash rest/scoopulator_parse.sh "<URL>"` — never WebFetch (it can't read CSS status classes)
> For recipe adaptation rules, ingredient swaps, blend compositions, and CREAMing.md formatting → use `/adapt`
> For extracting recipes from Reddit posts (body + comments, pantry check, unit conversion) → use `/reddit`

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

## 3. FILE INVENTORY

| File | Source | Contents |
|------|--------|---------|
| `CLAUDE.md` | — | THIS FILE — master context and reference |
| `CREAMing.md` | — | Adapted recipes with Greek ingredient swaps. Main (recipe) file. The reason we are doing this |
| `icecreamery_recipes.md` | ice-creamery repo (jhermann) | 121 recipes, 7 categories (original ingredients) |
| `fpf_recipes.md` | FitnessProductFinder (Eli) | 39 B&J dupes + 18 DQ Blizzards + 11 tips (original ingredients) |
| `e4cm_recipes.md` | Exercise4CheatMeals (E4CM) | 24 recipes + 47 tips (original ingredients) |
| `ice-creamery-main/` | jhermann | GitHub repo clone — raw source (unmodified) |
| `raw_recipes/fpf/` | Eli | 109 VTT + 113 description files from YouTube |
| `raw_recipes/e4cm/` | E4CM | 12 VTT + 13 description files from YouTube |
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
