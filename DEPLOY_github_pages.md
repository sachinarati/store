# Publish v4 to GitHub Pages — quick start

v4 is static files, so GitHub Pages hosts it for free. Publish the **contents of
this `app-v4` folder** so the URL is clean:
`https://<your-username>.github.io/<repo-name>/`

Files the site needs:
```
index.html
app.js
pdf-extract.js
recipes.js
icons.js
vendor/pdf.min.js
vendor/pdf.worker.min.js
```
(`README_使い方.md`, `説明スライド.html`, `起動する.bat` optional.)

---

## Option 1 — Website upload (no command line)
1. github.com -> New repository (e.g. `flyer-v4`), Public, create.
2. "uploading an existing file" -> drag the **contents** of `app-v4`,
   including the **`vendor` folder** -> Commit.
3. Settings -> Pages -> Source: Deploy from a branch -> Branch: main -> /(root) -> Save.
4. Open `https://<you>.github.io/flyer-v4/` after ~1 minute.

## Option 2 — git (run inside app-v4)
```bash
git init
git add index.html app.js pdf-extract.js recipes.js icons.js vendor .gitignore README_使い方.md 説明スライド.html
git commit -m "Flyer search app v4 (admin PDF upload + roles + recipe time/youtube)"
git branch -M main
git remote add origin https://github.com/<your-username>/flyer-v4.git
git push -u origin main
```
Then enable Pages (Settings -> Pages -> main -> /(root)).

---

## How it works (v4)
- The **admin** switches to 🔑 管理者 mode and imports a flyer PDF
  ("チラシ全店版 テキスト版.pdf"). It is parsed in the browser (PDF.js) and the
  product data is saved in the browser (localStorage).
- **Customers** (👥 お客様 mode, the default) see the search/detail/recipe
  features but no import button.
- There is no server and no live web fetch — data comes only from the PDF the
  admin imports.

### Note on data sharing
Because data is stored per-browser (localStorage), importing on one device does
not automatically appear on another visitor's device. For a shared dataset,
export JSON (admin: 💾 JSON保存) and commit `products.json` to the repo, then
load it; or ask and a `fetch('products.json')`-on-startup option can be added.

### Note on hosting vs double-click
For reliable PDF import, serving over https is best. On `file://` (double-click)
some browsers block the PDF worker. Use `npx serve .` / `python -m http.server`
locally, or host on GitHub Pages.

---

## Alternatives (also free)
- **Netlify Drop**: app.netlify.com/drop -> drag the `app-v4` folder.
- **Vercel / Cloudflare Pages**: connect the repo.
