---
name: resume-pdf
description: Export the resume to PDF and keep it to a single page. Use whenever editing, regenerating, or reviewing the resume — the HTML source at priv/static/resume/resume.html, its PDF output, or any request to "export the resume", "regenerate the resume PDF", or "make the resume one page".
---

# Resume PDF

The resume is a standalone HTML file rendered to PDF with a headless Chromium engine
(Skia/PDF). There is no build step — edit the HTML, then re-render.

## Files

- **Source:** `priv/static/resume/resume.html` — edit this. All CSS is inline in a `<style>` block.
- **Output:** `priv/static/resume/mikael-weiss-resume.pdf` — the generated PDF.

The "Download Resume" button links to `/resume/mikael-weiss-resume.pdf` (see `home.html.heex`), which serves exactly this file.

## Export to PDF

The renderer is `chrome-headless-shell` (a headless-only Chromium, no GUI app), installed
in `~/.cache/puppeteer`. Render with:

```bash
SHELL_BIN=$(ls "$HOME/.cache/puppeteer/chrome-headless-shell/"*/chrome-headless-shell-*/chrome-headless-shell | head -1)
"$SHELL_BIN" --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="priv/static/resume/mikael-weiss-resume.pdf" \
  "file://$PWD/priv/static/resume/resume.html"
```

`--no-pdf-header-footer` drops the browser's date/URL headers. The `@page` rule in the
HTML controls margins and Letter size, so don't pass margin flags.

If `chrome-headless-shell` isn't installed yet (uses the project's existing Node/npx):

```bash
npx -y puppeteer browsers install chrome-headless-shell
```

**Alternative (no install):** open `resume.html` in any Chromium browser (Arc, Chrome) and
Cmd+P → Save as PDF. This produces identical Skia/PDF output — it's how the file was
originally made. (Arc cannot be driven headless from the CLI; only manual print works.)

## Verify it's one page

After every render, check the page count:

```bash
strings priv/static/resume/mikael-weiss-resume.pdf | grep -m1 -E "/Count [0-9]"
```

`/Count 1` = one page. Anything higher means it spilled. To see *where* it broke, read the
PDF pages directly (the Read tool renders PDFs) and look at what landed on page 2.

## Keeping it to one page

The layout is tuned to sit right at the one-page boundary. Current values (don't loosen
these without re-checking the page count):

- `body`: `font-size: 10.5pt; line-height: 1.2`
- `@page` (print): `margin: 0.4in; size: letter`
- `section { margin-bottom: 6px }`, `.entry { margin-bottom: 5px }`
- `.entry` and `.project` use `page-break-inside: avoid`, so a block that doesn't fit jumps
  *whole* to the next page (leaving a gap). That's why a tiny overflow can bump an entire entry.

When it overflows, **fix the content first, not the font.** Order of preference:

1. **Tighten bullets.** Best practice: 3–5 bullets per recent job, 1–2 lines each, never 3,
   ~15–30 words, one cohesive thought per bullet. Two ideas joined with `;` on two lines? Split
   or cut the weaker half. Older roles can drop to 1–2 bullets.
2. **Condense the Skills block.** It's prose-style category lines; merge categories before adding lines.
3. **Cut a low-value section/entry.** The Projects section was removed for space because both
   projects were already described in Experience — prefer cutting redundancy over real history.
4. **Only then** nudge spacing (`line-height`, `section`/`.entry` margins, `@page` margin).

**Do not** drop the body font below ~10pt to force a fit — it reads as cramped. If 10pt still
overflows, there's too much content; cut instead. Re-render and re-check `/Count` after each change.

## Style constraints (carry into any edit)

- **No em dashes or en dashes** anywhere (`—` / `–`). Use commas, "to", or parentheses.
- **No AI-tell words** (delve, leverage, spearhead, robust, passionate, proven track record,
  seasoned, comprehensive, etc.). Open bullets with concrete action verbs and real numbers.
- Keep the email link and display text identical (`mikael.weiss@weisssolutions.org`).
