---
name: reddit
description: Extract recipes from Reddit posts (post body + comments). Use when given a Reddit URL or asked to process a Reddit recipe link.
argument-hint: "[reddit-url]"
allowed-tools: WebFetch, Bash, Read, Grep, Glob, Write, Edit
---

# Reddit Recipe Extraction Workflow

## Step 1 — Normalize the URL

Take the Reddit URL from `$ARGUMENTS` or the conversation.

1. Strip query parameters and tracking (`?utm_source=...`, `?share_id=...`, etc.).
2. Ensure the URL path ends with `/`.
3. Build two URLs:
   - **Old Reddit:** replace `www.reddit.com` or `reddit.com` with `old.reddit.com` (simpler HTML, better for scraping).
   - **JSON API:** append `.json` to the old.reddit.com URL (structured data with all comments).

## Step 2 — Fetch post + comments

### Primary: JSON API via curl

```bash
curl -s -H "User-Agent: creami-lab/1.0" "OLD_REDDIT_URL.json" -o rest/reddit_temp.json
```

Then read `rest/reddit_temp.json`. The JSON structure is:
- `[0].data.children[0].data` — the post (`selftext` = body, `title`, `author`, `subreddit`)
- `[1].data.children[]` — top-level comments (`.data.body`, `.data.author`, `.data.replies` for nested)

Extract:
- Post title, author, subreddit, body text
- ALL comments (walk the reply tree), noting author and whether they are OP

### Fallback: WebFetch on old.reddit.com

If curl fails or JSON is malformed, use WebFetch on the old.reddit.com URL:

```
WebFetch(url: "OLD_REDDIT_URL", prompt: "Extract the complete recipe from this post including ALL ingredients with quantities, ALL steps, and ALL comments. Pay special attention to: comments by the original poster (OP), comments with ingredient corrections or swaps, comments with texture/processing feedback. Return EVERYTHING — do not summarize or skip comments.")
```

If the post has many comments (100+), make a second fetch:
```
WebFetch(url: "OLD_REDDIT_URL?sort=top", prompt: "Focus on extracting useful recipe feedback from top comments: ingredient adjustments, texture reports, processing tips, and swap suggestions. Ignore off-topic comments.")
```

## Step 3 — Identify recipe content

From all fetched content, locate:

1. **The recipe itself** — could be in:
   - Post body (most common)
   - A comment by OP (often marked `[S]` or highlighted)
   - A comment by another user that OP endorsed
2. **Ingredient list** with exact quantities
3. **Steps/instructions**
4. **Community feedback** worth preserving:
   - Ingredient swaps or substitutions tried by others
   - Texture reports (too icy, too soft, perfect)
   - Processing notes (which spin mode, how many re-spins)
   - Corrections from OP in comments

## Step 4 — Convert and analyze

### Unit conversion
Convert ALL measurements to metric (grams, °C). Common conversions:
- 1 cup milk ≈ 245g | 1 cup cream ≈ 232g | 1 cup yogurt ≈ 245g
- 1 tbsp ≈ 15g (liquid) or 12-14g (powder) | 1 tsp ≈ 5g (liquid) or 3-4g (powder)
- 1 oz ≈ 28g | 1 fl oz ≈ 30ml
- °F to °C: (°F − 32) × 5/9

### Pantry cross-reference
Check every ingredient against CLAUDE.md Section 2 (Pantry). Classify each as:
- **✅ Have it** — in pantry as-is
- **🔄 Swappable** — not in pantry but has a known swap (reference the adapt skill's swap logic in `.claude/skills/adapt/SKILL.md`)
- **🛒 Buy** — need to get from supermarket (common items: fruit, cream cheese, PB, etc.)
- **🔴 Unavailable** — no swap known, may need to skip or find alternative

### Pint capacity check
Flag if total weight exceeds ~680g (24oz Ninja Creami pint max). Suggest scaling if needed.

## Step 5 — Present the recipe

Output format:

```
### [Recipe Name](original-reddit-url)
Source: r/subreddit — u/author

Tags: [type], [flavor], [dietary notes]

**Original Ingredients:**
- ingredient — Xg ← ✅ / 🔄 / 🛒 / 🔴
- ingredient — Xg ← 🔄 swap: [what to use instead]
  ...

**Steps:**
1. Step one.
2. Step two.
   ...

**Community Notes:**
- u/commenter: "useful feedback or tip"
- u/OP (in comments): "correction or clarification"
  ...

**Pantry Summary:**
- ✅ Available: [list]
- 🔄 Swappable: [list with brief swap note]
- 🛒 Buy: [list]
- 🔴 Unavailable: [list, if any]

**Total weight:** Xg (within/over pint capacity)
```

## Step 6 — Archive raw content

Save the extracted recipe to `raw_recipes/reddit/` as a `.md` file. Use the format `NNN_Post Title.md` where NNN is the next sequential number in the subfolder. Include the original URL, subreddit, author, post body, and any useful comments.

## Step 7 — Suggest next steps

After presenting, suggest:
- **`/adapt`** — to generate the full CREAMing.md entry with proper swap tiers and formatting
- **`/optimize`** — to validate metrics via Scoopulator and tune the recipe
- **`/spin`** — if the user wants processing advice for this specific recipe

## Step 8 — Cleanup

```bash
rm -f rest/reddit_temp.json
```

## Notes

- **Common subreddits:** r/ninjacreami, r/icecreamery, r/icecream, r/HealthyIceCream
- Reddit recipes are often informal — quantities may be approximate or in US volume. Convert carefully.
- If a post is a photo with no recipe in the body, check OP's comments — the recipe is almost always there.
- Cross-posts: if the post links to another Reddit post, follow that link too.
- Deleted posts: if `[deleted]` or `[removed]`, note this and extract whatever is available from comments.
