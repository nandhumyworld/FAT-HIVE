# The FAT Hive

Cinematic prompt arsenal for the **Freedom Architects Tribe (FAT)**.
A static site: the entrance (the Hive) opens into three Combs —

- **The Claude Comb** — 9 interactive learning modules
- **The Code Comb** — 102 programming prompts
- **The Growth Comb** — 343 business / marketing prompts

Every prompt is a "weapon": one-line *what it does*, the full prompt, one-click copy, a field-use tip, and favourites (saved per browser). No build step, no backend — plain HTML/CSS/JS.

## Structure
```
index.html        The whole hub (entrance + Code Comb + Growth Comb), data embedded
modules/          module-1.html … module-9.html (the Claude Comb lessons)
assets/           FAT-logo.svg
Dockerfile        nginx image for Coolify
nginx.conf        server config (gzip, caching, SPA fallback)
```

## Run locally
Just open `index.html` in a browser — or serve the folder:
```bash
python -m http.server 8080      # then visit http://localhost:8080
```

## Deploy on Coolify (hive.freedomarchitectstribe.com)
This repo ships a **Dockerfile**, so Coolify builds and serves it with nginx.

1. **DNS** — at your DNS provider, point the subdomain at your Coolify server:
   `hive.freedomarchitectstribe.com` → `A` record to the server's public IP
   (or a `CNAME` to the server's hostname).
2. **Coolify → New Resource → Public/Private Git Repository** — select this repo and branch `main`.
3. **Build Pack: Dockerfile** (Coolify auto-detects the `Dockerfile`).
4. **Ports:** exposed port **80**.
5. **Domain (FQDN):** set `https://hive.freedomarchitectstribe.com`.
   Enable **Generate SSL (Let's Encrypt)**.
6. **Deploy.** Coolify builds the image, runs it, and issues the certificate.

Every push to `main` triggers a redeploy (enable auto-deploy / webhook in Coolify).

> Alternative (no Dockerfile): Coolify's **Static** build pack also works — set the base/publish directory to `/`. The Dockerfile path is recommended for predictable results.

## Updating content
The site is generated from source prompt libraries. To refresh prompts or styling,
regenerate `index.html` / `modules/` and commit the changes here, then push — Coolify redeploys.
