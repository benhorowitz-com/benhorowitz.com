# The Horowitz Curve — XKCD-Style Comic for benhorowitz.com

## Overview

Replace benhorowitz.com's index.html with an XKCD-style comic parody depicting "The Horowitz Curve" — a visualization of human vs. agent task performance over 24 hours. The comic argues that neither humans nor agents are perfect, but agents are more consistently capable across a full day, while humans have a narrow window of superiority that we overvalue.

No Hyperspell branding. Pure comedy for shareability. Traffic flows to benhorowitz.com organically.

## Panel 1: The Main Graph (Fig. 1)

### Graph Structure
- **X-axis:** "Hours Since Waking" (0-24)
- **Y-axis:** "Task Performance"
- **Agent line:** Solid, flat, constant — one unwavering line across all 24 hours
- **Human line:** A chaotic journey through a real human day

### Human Curve Shape (hour by hour)
- **Hour 0-1:** Flat at zero. Morning routine + breakfast. Not working.
- **Hour 1-3:** Coffee kicks in. Rapid ramp up. Crosses above agent line ~hour 2. Peak at hour 3.
- **Hour 3-5.5:** Blood sugar dropping. Steady decline back toward agent line.
- **Hour 5.5-6.5:** Lunch. Drops to zero. Not working.
- **Hour 6.5-8:** Food coma. Slow recovery. Barely reaches agent level.
- **Hour 8-9:** Coffee wearing off. Sliding back toward agent line.
- **Hour 9-10.5:** Afternoon coffee bump. Briefly rises above agent line again (smaller than morning peak).
- **Hour 10.5+:** The Horowitz Threshold — final crossover below agent line. No coming back.
- **Hour 10.5-13.5:** The slow slide. Steady decline to zero.
- **Hour 13.5-14.5:** Dinner. Zero.
- **Hour 14.5-16:** Post-dinner. Barely alive.
- **Hour 16-24:** Asleep. Zero.

### Annotations
All annotations positioned above the human curve in three staggered rows, with dashed leader lines down to dots sitting on the human line:

**Row 1:** breakfast, food coma, afternoon coffee
**Row 2:** coffee kicks in, coffee wearing off, dinner, asleep
**Row 3:** blood sugar dropping, lunch, the slow slide

Special annotations:
- **"peak human"** — bold, directly above the peak
- **"The Horowitz Threshold"** — red, bold, white-backed, above the agent line with a red dot at the crossover point and dashed red leader line

### Line Labels
- "Agent" — right margin, blue, bold
- "Human" — right margin, orange, bold

### Captions
- *"Fig. 1: Task quality in humans vs. agents over 24 hours (n=everyone, p<you'd think so)"*
- *"Humans achieve 47% of agent output on a 24-hour basis. They describe this as 'crushing it.'"*

### Alt-text
Easter egg on hover (TBD — should be an additional joke not visible on screen).

## Panel 2: The Domain Grid (Fig. 2)

Parody of the NASA spider web drug study image. A 2x3 grid of mini Horowitz Curves, each applied to a different domain with escalating stakes and absurdity.

### Grid Layout (2 columns x 3 rows)

1. **Code Review** — the relatable entry point
2. **Driving** — stakes go up
3. **Surgery** — oh no
4. **Air Traffic Control** — peak tension
5. **Nuclear Launch Oversight** — absurd extreme
6. **Parenting** — unexpected, relatable twist to close

Each mini-graph shows:
- Simplified version of the same human curve shape
- Flat agent line
- Domain name as title
- Minimal annotations (just the crossover point)

### Title
*"Fig. 2: The Horowitz Curve has been observed across all fields."*

## Visual Design

- **Font:** Inter (Google Fonts) — clean, highly legible
- **Style:** Polished infographic, not hand-drawn. Clean lines, subtle grid, muted colors.
- **Colors:**
  - Human line: `#d4842a` (muted orange)
  - Agent line: `#4682d4` (steel blue)
  - Threshold: `#d44` (red)
  - Annotations: `#8a6d3b` (warm brown)
  - Leader lines: `#d4c5a0` (light tan, dashed)
  - Background: `#fcfcfc`
- **Shaded areas:** Very subtle fills under each line to visualize AUC difference
- **Layout:** Responsive SVG, no fixed pixel sizes

## Technical Implementation

- Pure HTML + inline SVG
- Google Fonts (Inter) loaded via CSS @import inside SVG `<style>`
- No JavaScript required (except optional alt-text hover behavior)
- No build process — single index.html file
- Replaces current index.html on benhorowitz.com
- Hosted via GitHub Pages, deployed on push
- Old index.html content (resume) should be preserved somewhere (git history is sufficient)

## Page Structure

```
index.html
├── <head> — meta tags, OG tags for social sharing, Inter font
├── <body>
│   ├── Title area — "The Horowitz Curve"
│   ├── Panel 1 — Main graph SVG (Fig. 1)
│   ├── Panel 2 — Domain grid SVG (Fig. 2)
│   └── Footer — attribution, link to benhorowitz.com context
```

## Social Sharing Considerations

- OG meta tags with title, description, and image
- The SVG should be rendered to a static PNG for og:image
- Title: "The Horowitz Curve"
- Description: "Humans achieve 47% of agent output on a 24-hour basis. They describe this as 'crushing it.'"
