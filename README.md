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
- **Google Scholar.** Linked to the profile `rNIC_VkAAAAJ`; update both pages if the ID ever changes.
- **DOI links.** Four papers link to DOIs. Add links for the others if you have them.
- **Cureus paper.** Marked “Forthcoming”; update when the final version appears.
- **“Last updated”** in both pages and the footer.

### Photo

The sidebar portrait is `assets/photo.jpg` — 480 × 480, cropped square, EXIF stripped,
and displayed as a circle. To change it, overwrite that file with another square JPEG;
no HTML changes are needed.

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

No phone number, unpublished data, or personal documents are included. The portrait in
`assets/photo.jpg` is published at the owner's request and has no EXIF metadata. The site is
static; there are no cookies, analytics, or any third-party requests (Google Scholar is an
ordinary outbound link, not an embedded tracker).

## Copyright

Text and CV content © Botao Qin. The HTML/CSS may be reused under the MIT License if desired.
