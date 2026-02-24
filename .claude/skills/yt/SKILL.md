---
name: yt
description: Extract recipes and content from YouTube videos using yt-dlp. Use when given a YouTube URL or asked to process a YouTube video.
argument-hint: "[youtube-url]"
allowed-tools: Bash, Read, Glob, Grep, Write, Edit
---

# YouTube Extraction Workflow

> **IMPORTANT:** NEVER use WebFetch on youtube.com — it's blocked. ALWAYS use yt-dlp.

**Tool:** `rest/yt-dlp_win/yt-dlp.exe`

## Step 1 — Download metadata

Run this command (replace `VIDEO_URL` with `$ARGUMENTS` or the URL from the conversation):

```bash
./rest/yt-dlp_win/yt-dlp.exe --skip-download --write-description --write-subs --write-auto-subs --sub-lang en --write-comments --output "rest/yt_temp/%(title)s" "VIDEO_URL"
```

This produces:
- `.description` — video description (usually has the recipe/ingredients)
- `.en.vtt` — auto-generated English subtitles (full spoken content)
- `.info.json` — metadata including all comments

## Step 2 — Extract content

1. Read the `.description` file first — recipes are usually here.
2. Read the `.en.vtt` subtitle file for the full spoken content.
3. Check `.info.json` for useful comments (corrections, tips from creator/viewers) only if needed.

## Step 3 — Present findings

Summarize what you found: recipe ingredients, steps, tips, and any useful viewer corrections from comments.

## Step 4 — Cleanup

Delete `rest/yt_temp/` when done unless the user wants to keep it:

```bash
rm -rf rest/yt_temp/
```
