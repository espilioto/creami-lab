# NINJA CREAMI DELUXE — MASTER CONTEXT
> Everything needed to make ice cream in Greece with the available ingredients, tools, and recipes.

> **Units:** ALWAYS metric. Prefer grams (g) over milliliters (ml) — we only have a scale out, no measuring cups/spoons.

> **NO SUGAR.** Never use table sugar (sucrose) in recipes. Sweeten only with pantry sugar-free sweeteners: erythritol, xylitol, glycerin, sucralose.

> **LOW-FAT, NO-SUGAR style.** Our recipes intentionally use 1.5% milk, no cream, no sugar. Scoopulator metrics (Fat%, Sugars%, Solids%, MSNF%) will be outside traditional ranges — that's by design. Don't "fix" those numbers. Judge recipes by real-world outcome: scoopability, texture, sweetness balance, and stability.

> **⚠️ HARD LIMITS — CHECK EVERY RECIPE.**
> SS (Salty Stability) and ICSv2 (Ice Cream Stabilizer v2) are custom stabilizer blends — see compositions in `CREAMing.md`.
>
> **🚨 GI SAFETY (gastrointestinal — gut health — top priority, NEVER exceed):**
> - **Inulin ≤ 30g per pint.** GI distress (gas, bloating, cramps) above this. Counts all sources: standalone inulin + inulin inside mixes (15g SS = 11g inulin, 10g ICSv2 = 4.6g inulin).
> - **Xylitol ≤ 30g per pint.** GI issues at higher doses. Both ferment in the gut — stacks with inulin.
> - **Combined fermentable load (inulin + xylitol) ≤ 45g per pint.** Even if each is under its own limit, high combined doses cause GI distress. When one is high, keep the other low. Use MCC or whey protein for body instead of maxing inulin.
>
> **⚙️ FUNCTIONAL (ice cream quality — strongly avoid exceeding):**
> - **Total gums (CMC + guar + xanthan) ≤ 2g per pint.** Above this → stringy, cheese-pull texture. This includes gums inside stabilizer mixes (Salty Stability, ICSv2) — always count them toward the total. Yogurt, whey protein, and inulin provide body — gums are ONLY for ice crystal prevention.
> - **Erythritol ≤ 8% of total mix weight** (~54g in a 680g pint). Above this → crystallization risk (not a GI concern — erythritol is absorbed in the small intestine). Xylitol or glycerin help prevent it.

> **Acronyms:** Always explain ice cream science acronyms in parentheses on first use in each response. E.g. "PAC (anti-freezing power — how much an ingredient keeps ice cream soft/scoopable)", "POD (sweetening power — how sweet an ingredient is relative to sugar)", "MSNF (milk solids-non-fat — proteins, lactose, minerals in milk minus the fat and water)", "FPDF (freezing point depression factor — same concept as PAC)", "GI (gastrointestinal — gut-related, used for safety limits)", "DE (dextrose equivalent — how broken-down a starch syrup is, higher = sweeter and more anti-freeze)", "HLB (hydrophilic-lipophilic balance — whether an emulsifier prefers water or fat, scale 0-20)". Note: "glycemic index" is always spelled out — never abbreviated to GI.

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

| Ingredient | Source | €/kg | Notes |
|-----------|--------|------|-------|
| Glycerin (VG, E422) | Manis | 4.00 | FPD, PAC=3.7, sweetness=60% sugar. Typical: 5-20g/pint. No GI concern — absorbed in small intestine, well-tolerated up to 35g |
| Xanthan Gum (E415) | Manis | 12.00 | Thickener/stabilizer. ⚠️ **All gums combined ≤ 2g/pint** (incl. inside mixes) |
| CMC (E466, Tylose) | Manis | 18.00 | Stabilizer, prevents ice crystals. ⚠️ Count toward 2g gum limit |
| Guar Gum (E412) | Manis | 12.00 | Body/mouthfeel. ⚠️ Count toward 2g gum limit |
| Chocolate Flavor | Manis | 83.33 | Flavor drops — **MAX 2 drops/pint** (3 is too intense). €5/60ml |
| Strawberry Flavor | Manis | 83.33 | Flavor drops — **MAX 2 drops/pint** (3 is too intense). €5/60ml |
| Milk Cream Flavor | Manis | 83.33 | Flavor drops, caramel sub — **MAX 2 drops/pint** (3 is too intense). €5/60ml |
| Erythritol (E968) | HSN | 13.02 | PAC=2.8, sweetness=75%, non-caloric. ⚠️ ≤8% of mix weight (~54g/pint) or crystallization risk |
| Xylitol (E967) | HSN | 14.32 | PAC=2.2, sweetness=100%. ⚠️ ≤30g/pint GI limit (stacks with inulin) |
| Inulin | HSN | 19.05 | Fiber/bulking, PAC=0.22, sweetness=8%. Adds body, replaces fat. ⚠️ ≤30g/pint GI limit (stacks with xylitol) |
| Sucralose | HSN | 153.00 | 600x sweeter than sugar, zero glycemic index, zero cal. Tiny amounts (€22.95/150g) |
| Whey Protein — HSN WPC80 | HSN | 21.28 | Unflavored. Per 100g: 408kcal, P82 F6.4 C5.8 S0.57. Contains sunflower lecithin (~0.8-1g/100g est.). Binds water, prevents ice crystals. When a recipe calls for flavored protein (chocolate, vanilla, etc.), use this + cocoa powder / vanilla extract / flavor drops to match the flavor. |
| ⚠️ IGNORE WHEN CRAFTING RECIPES ⚠️ Whey Protein — Manis WPC75 | Manis | — | EuriNutri 75 PL (WPC75). Lecithin-free. Est. per 100g: ~390kcal, P≥75 F~6 C~9 S~0.15. From casein whey, not instantized. |
| ⚠️ IGNORE WHEN CRAFTING RECIPES ⚠️ Soy Lecithin Powder (E322) | Manis | 18.00 | Emulsifier, replaces GMS 1:1 by weight |
| Salt | Supermarket | — | Kitchen salt (negligible cost) |
| Cocoa powder | Supermarket | 17.20 | For chocolate bases. Bonora brand, €2.15/125g |
| Vanilla extract | Supermarket | TBD | Replaces vanilla bean powder in all repo recipes |
| Marata 1.5% milk | Supermarket | 1.05 | 47 kcal/100ml. Fat 1.5, carbs 4.8, protein 3.5, water ~90%. Standard base. €1.05/L |
| Marata 3.5% whole milk | Supermarket | 1.10 | Per 100ml: 65kcal, F3.6 (sat 2.1), C4.8 (sugar 4.8), P3.4, S0.13. High-pasteurized, homogenized, 35-day shelf. Scoopulator: `user-milk-fresh-marata-35-L1Bll6` |
| Marata 2% strained yogurt | Supermarket | 2.70 | 66 kcal/100g. Fat 2, carbs 3.9, protein 8 |
| Citric acid | Supermarket | — | — |
| Cream of tartar | Supermarket | — | Meringue stabilizer |
| Peanut butter (smooth) | Supermarket | TBD | Peanut 94%, pea protein 3%, rice protein 3%. Per 100g: 620kcal, F48.3 (sat 7.7), C18.3 (sugar 4.7), fiber 8.0, P32.0, S0.02. |
| Royal Light cream cheese | Supermarket | 7.45 | Per 100g: ~134kcal, similar macros to ADORO Light. €1.49/200g. |
| Coconut milk (Oriental Express) | Supermarket | 5.13 | Per 100ml: 174kcal, F18 (sat 15), C2.9 (sugar 1.0), P0, S0.04. Contains guar gum + E435 (polysorbate 60). Vegan, gluten-free. €2.05/400ml. Scoopulator: `user-coconut-milk-oriental-express-x3zpyE` |
| Frozen strawberries | Supermarket | 4.00 | Avg price. For sorbets, sauces, swirls |
| Gullon Zero Digestive | Supermarket | 4.50 | Vegan, sugar-free. €1.80/400g. Mix-in biscuit |
| MCC — Microcrystalline Cellulose (E460i) | Manis | 12.00 | Zero-cal insoluble fiber **stabilizer**. Fat mimetic, ice crystal inhibitor, bulking agent. PAC=0, POD=0. **Not fermented in gut** (~5-7% vs inulin's ~100%) — no GI concern. 3-10g/pint. Needs shear to disperse (immersion blender). **Synergistic with xanthan gum** — MCC+XG together >> either alone (research-backed). MCC alone softens texture (lower firmness — good for scoopability); XG prevents MCC from settling. Works best combined with CMC or XG. **Scoopulator:** custom ingredient `Microcrystalline cellulose (MCC)`, Stabilizer=100%, FPDF=0, Sweetness=0, Cal=0. See `rest/mcc_reference.md` for full research. |

---

## 3. FILE INVENTORY

| File | Source | Contents |
|------|--------|---------|
| `CLAUDE.md` | — | THIS FILE — master context and reference |
| `CREAMing.md` | — | Adapted recipes with Greek ingredient swaps. Main (recipe) file. The reason we are doing this |
| `icecreamery_recipes.md` | ice-creamery repo (jhermann) | 121 recipes, 7 categories (original ingredients) |
| `fpf_recipes.md` | FitnessProductFinder (Eli) | 39 B&J dupes + 18 DQ Blizzards + 11 tips (original ingredients) |
| `e4cm_recipes.md` | Exercise4CheatMeals (E4CM) | 24 recipes + 47 tips (original ingredients) |
| `polar_recipes.md` | Polar Ice Creamery (Nick) | 171 compiled recipes (original ingredients) |
| `ice-creamery-main/` | jhermann | GitHub repo clone — raw source (unmodified) |
| `raw_recipes/fpf/` | Eli | 109 VTT + 113 description files from YouTube |
| `raw_recipes/e4cm/` | E4CM | 12 VTT + 13 description files from YouTube |
| `raw_recipes/polar/` | Polar Ice Creamery (Nick) | 171 recipe videos — description + VTT + comments JSON |
| `raw_recipes/polar_theory/` | Polar Ice Creamery (Nick) | 38 theory/education videos — description + VTT + comments JSON |
| `rest/NC500Series_IB_MP.txt` | Ninja | NC500 owner's manual (full text) |
| `rest/scoopulator_ingredients_index.txt` | Scoopify | Ingredient slug lookup for Scoopulator API |
| `rest/deluxe_spin_modes_fixed.jpg` | espilioto | NC501 Deluxe spin modes — verified Hz, timing, and Top/Bottom/Full minutes |
| `rest/manis_products.html` | Manis | Store product page (reference) |
| `rest/yt-dlp_win/yt-dlp.exe` | — | YouTube downloader tool (see `/yt` skill) |
| `rest/scoopulator_profiles_index.json` | Scoopify | Target profiles (scraped) — acceptable metric ranges per recipe type |
| `rest/mcc_reference.md` | Research (2026-03) | MCC (E460i) safety, dosage, ice cream use, regulatory status — sourced research |
| `rest/polar_theory.md` | Polar Ice Creamery (Nick) | Compiled theory reference — stabilizer blends/ratios, sugar science, Creami balancing, cocoa/chocolate, cream hacks, equipment. Supersedes `ice-creamery-main/docs/info/polar-ice-creamery.md` (same source, more comprehensive) |
| `rest/polar_archetypes.md` | Polar Ice Creamery (Nick) | Recipe archetypes by flavor category — traditional baselines, key ratios, techniques, proven combos, and translation rules to our sugar-free/low-fat style. Categories: Chocolate, Fruit, Nut, Coffee, Caramel, Cookies, Vanilla, Boozy, Keto, Sorbet, Cheesecake. Plus ingredient-agnostic Technique Library |

**Reference docs** in `ice-creamery-main/docs/info/`:
- `ingredients.md` — PAC/POD/glycemic-index tables, hardening factors, sweeteners/thickeners/emulsifiers/dairy-alts, blend ratios, cocoa, alcohol, tagatose, sucrose esters (E473)
- `nutrition.md` — kcal/fat/carbs/protein/PAC/MSNF per 100g for 100+ ingredients
- `tips+tricks.md` — scrape test, icy sides handling, workflow, essential tools
- `polar-ice-creamery.md` — sugar science, stabilizer principles (superseded by `rest/polar_theory.md` — use that instead)
- `principles.md` — PAC targets (20-30 ice cream, 30-36 sorbet), MSNF targets
- `glossary.md` — PAC, POD, glycemic index, HLB, DE, MSNF, ABV definitions
- `recipe-guide.md` — low-cal recipes by protein content, grouped by major ingredient (vanilla, chocolate, fruit, boozy)
- `faq.md`, `web-resources.md`, `plating.md`
