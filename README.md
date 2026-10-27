# Botao Qin — personal website

A bilingual academic homepage (English + Chinese), built with plain HTML and CSS.
No JavaScript, no external fonts, no trackers.

## Files

| File | Purpose |
|---|---|
| `index.html` | English homepage |
| `zh.html` | Chinese homepage |
| `styles.css` | Shared styles (colors, layout, dark mode, print) |
| `favicon.svg` | Site icon |
| `.nojekyll` | Tells GitHub Pages not to run Jekyll |
| `deploy.sh` | Optional one-command GitHub Pages deployment |

## Preview locally

```bash
cd /Users/botaoqin/Documents/claude/website
open index.html          # English
open zh.html             # Chinese
```

Or run a local server:

```bash
python3 -m http.server 8000
# then open http://localhost:8000
```

## Deploy to GitHub Pages

### Option A — GitHub web interface (no command line)

1. Create a new **public** repository.
   - For the shortest URL, name it `<your-github-username>.github.io`.
   - For a project site, any name works (e.g., `academic-site`); the URL will be
     `https://<username>.github.io/academic-site/`.
2. Upload all files in this folder to the repository root
   (`index.html`, `zh.html`, `styles.css`, `favicon.svg`, `.nojekyll`).
3. Go to **Settings → Pages → Build and deployment**.
4. Source: **Deploy from a branch**; Branch: **main**; Folder: **/ (root)**; Save.
5. Wait 1–2 minutes, then visit the URL.

### Option B — command line

```bash
brew install gh
gh auth login

cd /Users/botaoqin/Documents/claude/website
./deploy.sh                  # creates <username>.github.io
# or
./deploy.sh academic-site    # creates a project site
```

The script creates a **public** repository, pushes the files, and enables Pages.
It asks for confirmation before creating anything.

## Before publishing — check these

- **Affiliation and title.** The site currently says *Associate Professor of Economics,
  Xi'an Eurasia University; formerly Jinhe Center for Economic Research, Xi'an Jiaotong
  University*. Change it if needed.
- **Email.** `botaoqin@gmail.com` and `botaoqin@163.com` (from the July 2026 CV). If you
  prefer the XJTU address, replace both pages.
- **Google Scholar.** The link is currently a name search. Replace it with your profile:
  `https://scholar.google.com/citations?user=YOUR_ID`.
- **DOI links.** Four papers link to DOIs. Add links for the others if you have them.
- **Cureus paper.** Marked “Forthcoming”; update when the final version appears.
- **“Last updated”** in both pages and the footer.

### Add a photo

1. Put a square photo at `assets/photo.jpg` (about 400 × 400 px).
2. In `index.html` and `zh.html`, replace:

```html
<div class="monogram" aria-hidden="true">BQ</div>
```

with:

```html
<img class="monogram" src="assets/photo.jpg" alt="Botao Qin" width="64" height="64">
```

Add this to `styles.css` if the photo needs cropping:

```css
img.monogram { object-fit: cover; }
```

### Add a CV PDF

1. Put the PDF at `assets/cv.pdf`.
2. In both sidebars, replace `Full CV available on request.` with:

```html
<a href="assets/cv.pdf">Download CV (PDF)</a>
```

## Editing the design

- Colors are CSS variables at the top of `styles.css` (`--accent`, `--bg`, `--ink`, …).
- Dark mode follows the operating system preference.
- The print stylesheet is included: **File → Print → Save as PDF** gives a clean CV.
- The layout is responsive; the sidebar becomes a header below 900 px.

## Note on the old site

The old Google Site (`sites.google.com/site/botaoqin/home`) could not be fetched from this
environment (outbound network was blocked). The content here is based on the July 2026 CV
in `项目申请/中文简历带照片 - 2026.07.pdf` plus the 2027 application materials. If the old
site has sections that are missing here — a photo, a Google Scholar ID, a downloadable CV,
a teaching portfolio — send them and they can be added.

## Privacy

No phone number, photo, unpublished data, or personal documents are included. The site is
static; there are no cookies, analytics, or third-party requests.

## Copyright

Text and CV content © Botao Qin. The HTML/CSS may be reused under the MIT License if desired.
