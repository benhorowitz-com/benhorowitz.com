# Horowitz Curve Comic Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace benhorowitz.com with a shareable XKCD-style comic depicting "The Horowitz Curve" — human vs. agent performance over 24 hours.

**Architecture:** Single index.html file with three inline SVGs (main graph, domain grid, frontier model timeline). No build process, no JS frameworks — pure HTML served by GitHub Pages.

**Tech Stack:** HTML5, inline SVG, Google Fonts (Inter), Google Analytics (existing UA-59998314-1)

**Spec:** `docs/superpowers/specs/2026-04-02-horowitz-curve-comic-design.md`

**Approved mockup (Fig. 1 SVG):** `.superpowers/brainstorm/24438-1775161976/horowitz-curve-main-v15.html`

---

### Task 1: Create page shell (index.html)

**Files:**
- Modify: `index.html` (full rewrite)
- Delete: `stylesheet.css` (no longer needed)

- [ ] **Step 1: Create the new index.html with head, body shell, and page layout**

Replace index.html entirely. The page needs:
- `<head>` with charset, viewport, title "The Horowitz Curve", Inter font via Google Fonts link, OG meta tags, and the existing GA tracking script
- `<body>` with a centered container, page title, placeholders for 3 SVGs, and a footer
- Minimal inline CSS for page layout (centered, max-width ~960px, background #fcfcfc)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>The Horowitz Curve</title>
    <meta property="og:title" content="The Horowitz Curve">
    <meta property="og:description" content='Humans achieve 47% of agent output on a 24-hour basis. They describe this as "crushing it."'>
    <meta property="og:image" content="https://benhorowitz.com/og-image.png">
    <meta property="og:type" content="website">
    <meta name="twitter:card" content="summary_large_image">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', -apple-system, sans-serif;
            background: #fcfcfc;
            color: #2a2a2a;
            padding: 40px 20px;
        }
        .container {
            max-width: 960px;
            margin: 0 auto;
        }
        .panel {
            margin-bottom: 60px;
        }
        .panel svg {
            width: 100%;
            height: auto;
        }
        footer {
            text-align: center;
            padding: 40px 0;
            color: #aaa;
            font-size: 13px;
        }
        footer a { color: #888; }
    </style>
</head>
<body>
    <div class="container">
        <div class="panel" id="fig1">
            <!-- Fig 1: Main Horowitz Curve goes here -->
        </div>
        <div class="panel" id="fig2">
            <!-- Fig 2: Domain grid goes here -->
        </div>
        <div class="panel" id="fig3">
            <!-- Fig 3: Frontier model timeline goes here -->
        </div>
    </div>
    <footer>
        by <a href="https://github.com/benhorowitz-com">Ben Horowitz</a>
    </footer>
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      ga('create', 'UA-59998314-1', 'auto');
      ga('send', 'pageview');
    </script>
</body>
</html>
```

- [ ] **Step 2: Delete stylesheet.css**

```bash
git rm stylesheet.css
```

- [ ] **Step 3: Verify page loads locally**

Open `index.html` in a browser. Should see a blank white page with the footer visible. No console errors.

- [ ] **Step 4: Commit**

```bash
git add index.html
git commit -m "Replace resume with Horowitz Curve page shell"
```

---

### Task 2: Add Fig. 1 — The Main Horowitz Curve

**Files:**
- Modify: `index.html` (insert SVG into `#fig1`)

**Reference:** Copy the approved SVG from `.superpowers/brainstorm/24438-1775161976/horowitz-curve-main-v15.html` — use the `<svg>` element only (not the surrounding mockup wrapper HTML).

- [ ] **Step 1: Extract the SVG from the mockup file**

Read `.superpowers/brainstorm/24438-1775161976/horowitz-curve-main-v15.html` and copy everything between `<svg ...>` and `</svg>` inclusive. This is the approved v15 graph.

- [ ] **Step 2: Insert the SVG into index.html**

Replace the `<!-- Fig 1: Main Horowitz Curve goes here -->` comment in `#fig1` with the extracted SVG.

- [ ] **Step 3: Add the `<title>` element inside the SVG for alt-text hover**

Add as the first child of the `<svg>` element:

```html
<title>The model does not account for "I'll just check Slack real quick." Agent has no Slack.</title>
```

- [ ] **Step 4: Remove the Google Fonts @import from inside the SVG `<style>`**

The page `<head>` already loads Inter via `<link>`. The SVG `<style>` block should only contain:

```html
<style>
  text { font-family: 'Inter', -apple-system, sans-serif; }
</style>
```

Remove the `@import url(...)` line from the SVG — it causes a redundant font load.

- [ ] **Step 5: Verify Fig. 1 renders correctly**

Open index.html in browser. The main Horowitz Curve should render identically to the approved mockup. Check:
- Title "The Horowitz Curve" at top
- Human line (orange) with all the chaotic ups and downs
- Agent line (blue, solid, flat)
- All annotations visible, no overlaps
- "The Horowitz Threshold" label with red dot
- Captions at bottom
- Hover over SVG shows alt-text tooltip

- [ ] **Step 6: Commit**

```bash
git add index.html
git commit -m "Add Fig. 1: The main Horowitz Curve graph"
```

---

### Task 3: Add Fig. 2 — The Domain Grid

**Files:**
- Modify: `index.html` (insert SVG into `#fig2`)

- [ ] **Step 1: Build the domain grid SVG**

Create a new SVG (viewBox `0 0 960 520`) containing:

**Title:** `"Fig. 2: The Horowitz Curve has been observed across all fields."` centered at top, Inter font, italic, size 14, fill #888.

**Grid:** 2 columns x 3 rows of mini-graphs. Each mini-graph is roughly 420x140. Use a `<g transform="translate(x,y)">` for each cell.

The 6 domains in order (left-to-right, top-to-bottom):
1. Code Review
2. Driving
3. Surgery
4. Air Traffic Control
5. Nuclear Launch Oversight
6. Parenting

**Each mini-graph contains:**
- A small rectangle border (stroke #ddd, fill white)
- Domain name as title text (bold, 13px, centered at top of cell)
- Simplified axes (just the L-shape, no labels or ticks)
- Agent line: solid flat blue line (#4682d4, 2px)
- Human line: simplified version of the main curve — same general shape (zero, ramp, peak, decline, lunch zero, recovery, afternoon bump, decline, dinner zero, sleep zero) but rendered with fewer control points. Use the same orange (#d4842a, 2px).
- A small red dot at the crossover point

Scale each mini-graph so the curve fits within roughly 380x90 pixel area inside each cell.

- [ ] **Step 2: Insert the SVG into index.html**

Replace the `<!-- Fig 2: Domain grid goes here -->` comment in `#fig2` with the new SVG.

- [ ] **Step 3: Verify the grid renders**

Open in browser. Should see 6 mini-graphs in a 2x3 grid, each showing a recognizable simplified Horowitz Curve with different domain labels. The repetition of the same shape across wildly different domains IS the joke — no extra humor needed per cell.

- [ ] **Step 4: Commit**

```bash
git add index.html
git commit -m "Add Fig. 2: Domain grid showing Horowitz Curve across fields"
```

---

### Task 4: Add Fig. 3 — Frontier Model Performance Over Time

**Files:**
- Modify: `index.html` (insert SVG into `#fig3`)

- [ ] **Step 1: Build the frontier model timeline SVG**

Create a new SVG (viewBox `0 0 960 400`) containing:

**Graph structure:**
- X-axis: "Time" with labels: 2022, 2023, 2024, 2025, 2026, 2027
- Y-axis: "Peak Task Performance"
- Subtle grid lines matching Fig. 1 style (#f0f0f0)
- Axes with the same #555 styling and arrow tips as Fig. 1

**Lines:**
- **Human line:** Flat horizontal line across the full width. Same orange (#d4842a), solid, 3px. Humans aren't getting smarter.
- **Agent line:** Rising curve from bottom-left toward upper-right, crossing the human line around 2025-2026. Same blue (#4682d4), solid, 3px. Use a smooth upward curve (cubic bezier).

**Annotations:**
- A red dot at the crossover point where agent crosses human
- Label above the crossover: something like "Agents exceed peak human" — red, bold, white-backed
- The agent line should continue rising past the human line, showing the gap widening

**Caption:**
- `"Fig. 3: Frontier model performance vs. human performance over time."` — italic, #888, 11px
- Second line: a deadpan punchline connecting back to Fig. 1 — something like `"Once the agent line crosses, the Horowitz Curve from Fig. 1 has no window of human superiority. The entire 24 hours belongs to the agent."` — italic, #aaa, 10px

- [ ] **Step 2: Insert the SVG into index.html**

Replace the `<!-- Fig 3: Frontier model timeline goes here -->` comment in `#fig3` with the new SVG.

- [ ] **Step 3: Verify Fig. 3 renders**

Open in browser. Should see a clean graph with a flat human line and a rising agent curve crossing it. The crossover point should be clearly labeled.

- [ ] **Step 4: Commit**

```bash
git add index.html
git commit -m "Add Fig. 3: Frontier model performance over time"
```

---

### Task 5: Generate og:image and final polish

**Files:**
- Create: `og-image.png` (screenshot of Fig. 1)
- Modify: `index.html` (any final spacing/polish)

- [ ] **Step 1: Generate the og:image PNG**

Use headless Chrome to screenshot the page, focused on Fig. 1:

```bash
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --headless --screenshot=og-image.png \
  --window-size=1200,630 --disable-gpu \
  index.html
```

If the screenshot includes too much of the page, create a temporary HTML file that contains only the Fig. 1 SVG with a white background, screenshot that, then delete the temp file.

The og:image should be 1200x630 (standard OG image size).

- [ ] **Step 2: Verify og:image looks correct**

Open og-image.png. Should show the main Horowitz Curve graph, readable at social media thumbnail size. The title "The Horowitz Curve" and the general shape of the graph should be recognizable even at small sizes.

- [ ] **Step 3: Final page review**

Open index.html and scroll through the full page. Check:
- Fig. 1, Fig. 2, Fig. 3 all render
- Spacing between panels looks good (60px margin-bottom on .panel)
- Footer is visible
- Page is responsive (resize browser to mobile width — SVGs should scale)
- No console errors
- Hovering over Fig. 1 SVG shows the alt-text easter egg

- [ ] **Step 4: Commit**

```bash
git add og-image.png index.html
git commit -m "Add og:image and final polish"
```

---

### Task 6: Cleanup and final commit

**Files:**
- Verify: `CNAME` (unchanged)
- Verify: `.nojekyll` (unchanged)
- Verify: `stylesheet.css` (deleted in Task 1)

- [ ] **Step 1: Verify repo state is clean**

```bash
git status
git diff HEAD~5 --stat
```

Expected: index.html modified, stylesheet.css deleted, og-image.png added, docs/ added. CNAME and .nojekyll unchanged.

- [ ] **Step 2: Review the full diff**

```bash
git log --oneline -6
```

Should show commits from each task. The page is ready to push.
