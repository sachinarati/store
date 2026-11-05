@echo off
rem Open the v3 (Web auto-fetch) app in the default browser.
rem NOTE: For reliable live data fetch + PDF fallback, serving over http is best.
rem If opened via double-click (file://) and fetch/import is blocked, use:
rem   npx serve .      (Node)   or   python -m http.server
rem Best of all: host on GitHub Pages (see DEPLOY_github_pages.md).
start "" "%~dp0index.html"
