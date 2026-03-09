# NINJA CREAMI DELUXE — MASTER CONTEXT
> Everything needed to make ice cream in Greece with the available ingredients, tools, and recipes.

> **Units:** ALWAYS metric. Prefer grams (g) over milliliters (ml) — we only have a scale out, no measuring cups/spoons.

> **NO SUGAR.** Never use table sugar (sucrose) in recipes. Sweeten only with pantry sugar-free sweeteners: erythritol, xylitol, glycerin, sucralose.

> **LOW-FAT, NO-SUGAR style.** Our recipes intentionally use 1.5% milk, no cream, no sugar. Scoopulator metrics (Fat%, Sugars%, Solids%, MSNF%) will be outside traditional ranges — that's by design. Don't "fix" those numbers. Judge recipes by real-world outcome: scoopability, texture, sweetness balance, and stability.

> **⚠️ HARD LIMITS — NEVER EXCEED. CHECK EVERY RECIPE.**
> SS (Salty Stability) and ICSv2 (Ice Cream Stabilizer v2) are custom stabilizer blends — see compositions in `CREAMing.md`.
> - **Total gums (CMC + guar + xanthan) ≤ 2g per pint.** Above this → stringy, cheese-pull texture. This includes gums inside stabilizer mixes (Salty Stability, ICSv2) — always count them toward the total. Yogurt, whey protein, and inulin provide body — gums are ONLY for ice crystal prevention.
> - **Inulin ≤ 30g per pint (≤15g per half-pint).** GI distress (gas, bloating, cramps) above this. Counts all sources: standalone inulin + inulin inside mixes (15g SS = 11g inulin, 10g ICSv2 = 4.6g inulin).
> - **Xylitol ≤ 30g per pint (≤15g per half-pint).** GI issues at higher doses. Stacks with inulin — both ferment in the gut. When both are present, keep EACH under its half-pint limit.
> - **Erythritol ≤ 8% of total mix weight** (~54g in a 680g pint). Above this → crystallization risk. Xylitol or glycerin help prevent it.

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
| Xanthan Gum (E415) | Manis | Thickener/stabilizer. ⚠️ **All gums combined ≤ 2g/pint** (incl. inside mixes) |
| CMC (E466, Tylose) | Manis | Stabilizer, prevents ice crystals. ⚠️ Count toward 2g gum limit |
| Guar Gum (E412) | Manis | Body/mouthfeel. ⚠️ Count toward 2g gum limit |
| Chocolate Flavor | Manis | Flavor drops — **MAX 2 drops/pint** (3 is too intense) |
| Strawberry Flavor | Manis | Flavor drops — **MAX 2 drops/pint** (3 is too intense) |
| Milk Cream Flavor | Manis | Flavor drops, caramel sub — **MAX 2 drops/pint** (3 is too intense) |
| Soy Lecithin Powder (E322) | Manis | Emulsifier, replaces GMS 1:1 by weight |
| Erythritol (E968) | HSN | PAC=2.8, sweetness=75%, non-caloric. Safe ≤50g/sitting |
| Xylitol (E967) | HSN | PAC=2.2, sweetness=100%. GI issues at ~20-30g |
| Inulin | HSN | Fiber/bulking, PAC=0.22, sweetness=8%. Adds body, replaces fat |
| Sucralose | HSN | 600x sweeter than sugar, zero GI, zero cal. Tiny amounts |
| Whey Protein (unflavored) | HSN | **Default — use in all recipes unless stated otherwise.** WPC80. Per 100g: 408kcal, P82 F6.4 C5.8 S0.57. Contains sunflower lecithin (~0.8-1g/100g est.). Binds water, prevents ice crystals |
| Whey Protein (unflavored) | Manis | EuriNutri 75 PL (WPC75). Lecithin-free alternative. Est. per 100g: ~390kcal, P≥75 F~6 C~9 S~0.15. From casein whey, not instantized |
| Salt | Supermarket | Kitchen salt |
| Cocoa powder | Supermarket | For chocolate bases |
| Vanilla extract | Supermarket | Replaces vanilla bean powder in all repo recipes |
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
