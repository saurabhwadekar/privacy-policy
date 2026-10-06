# Privacy Policies

Privacy policies and terms for my apps, hosted on GitHub Pages.

## Structure

```
privacy-policy/
├── index.html            # Home page (list is auto-generated)
├── style.css             # Shared styles
├── hc-games/
│   ├── index.html        # HC Games landing page
│   ├── privacy/index.html
│   └── terms/index.html
├── scripts/
│   └── build-index.sh    # Builds the list on the home page
└── .github/workflows/
    └── deploy.yml        # Deploys to GitHub Pages on every push to main
```

## Add a new policy

1. Copy the `hc-games` folder and rename it, e.g. `abc`.
2. Edit the `<title>` and content in `abc/index.html`, `abc/privacy/index.html`
   and `abc/terms/index.html`.
3. Commit and push to `main`.

Pages will be live at `https://<username>.github.io/privacy-policy/abc/`
(plus `/abc/privacy/` and `/abc/terms/`). The home page list updates
automatically (link text = the `<title>` of `abc/index.html`).

## Preview locally

```sh
bash scripts/build-index.sh
python -m http.server 8000
```

Then open http://localhost:8000.

## First-time setup

On GitHub: **Settings → Pages → Build and deployment → Source: GitHub Actions**.
