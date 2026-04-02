---
name: deployment-platforms
description: Provides deployment patterns for Vercel, Netlify, and Cloudflare Pages including config files, environment variables, preview deployments, custom domains, and rollback procedures.
version: 1.0.0
triggers:
  - deployment-platforms
  - deploy to vercel
  - deploy to netlify
  - deploy to cloudflare
  - platform config
  - vercel.json
  - netlify.toml
  - wrangler.toml
  - preview deployment
  - custom domain setup
when_not_to_use: Do not use for application code changes, CI/CD pipeline configuration (use ci-cd-pipeline), or pre-launch verification (use launch-readiness).
---

# Deployment Platforms

Platform-specific deployment patterns for showcase websites. Read Agent 5's tech stack to determine which platform applies, then use the relevant section.

## Vercel

### Configuration (`vercel.json`)

```json
{
  "$schema": "https://openapi.vercel.sh/vercel.json",
  "framework": null,
  "buildCommand": "",
  "outputDirectory": "",
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        { "key": "X-Content-Type-Options", "value": "nosniff" },
        { "key": "X-Frame-Options", "value": "DENY" },
        { "key": "X-XSS-Protection", "value": "1; mode=block" },
        { "key": "Referrer-Policy", "value": "strict-origin-when-cross-origin" },
        { "key": "Permissions-Policy", "value": "camera=(), microphone=(), geolocation=()" }
      ]
    },
    {
      "source": "/_astro/(.*)",
      "headers": [
        { "key": "Cache-Control", "value": "public, max-age=31536000, immutable" }
      ]
    }
  ],
  "redirects": [
    { "source": "/:path+/", "destination": "/:path+", "permanent": true }
  ]
}
```

Adapt: set `framework` (astro, next, null), `buildCommand` (from Agent 5), `outputDirectory` (dist, .next, out). Add CSP header from Agent 5's security headers spec.

### Environment Variables

Set via Vercel Dashboard > Project > Settings > Environment Variables, or via CLI:
```bash
vercel env add VARIABLE_NAME production
```

Scopes: Production, Preview, Development. Always set for Production + Preview.

### Preview Deployments

Every push to a non-production branch creates a preview URL: `https://<project>-<hash>-<team>.vercel.app`. Use for staging verification.

### Custom Domain

```bash
vercel domains add yourdomain.com
```
DNS: Add CNAME record pointing to `cname.vercel-dns.com` (or A record to `76.76.21.21`).

### Rollback

```bash
vercel rollback            # rollback to previous deployment
vercel rollback <url>      # rollback to specific deployment
```
Also available via Dashboard > Deployments > ... > Promote to Production.

### CLI Commands

```bash
vercel                     # deploy to preview
vercel --prod              # deploy to production
vercel env ls              # list env vars
vercel domains ls          # list domains
vercel inspect <url>       # inspect deployment
```

## Netlify

### Configuration (`netlify.toml`)

```toml
[build]
  command = ""
  publish = ""

[[headers]]
  for = "/*"
  [headers.values]
    X-Content-Type-Options = "nosniff"
    X-Frame-Options = "DENY"
    X-XSS-Protection = "1; mode=block"
    Referrer-Policy = "strict-origin-when-cross-origin"
    Permissions-Policy = "camera=(), microphone=(), geolocation=()"

[[headers]]
  for = "/_astro/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[redirects]]
  from = "/*"
  to = "/404"
  status = 404
```

Adapt: set `command` and `publish` from Agent 5. Add CSP header.

### Environment Variables

Set via Netlify Dashboard > Site > Site configuration > Environment variables, or via CLI:
```bash
netlify env:set VARIABLE_NAME "value" --context production
```

Contexts: production, deploy-preview, branch-deploy, dev.

### Preview Deployments

Every PR gets a deploy preview: `https://deploy-preview-<number>--<site>.netlify.app`.

### Custom Domain

```bash
netlify domains:add yourdomain.com
```
DNS: CNAME to `<site>.netlify.app` or use Netlify DNS.

### Rollback

Via Dashboard > Deploys > click previous deploy > "Publish deploy". Or lock to a specific deploy.

### CLI Commands

```bash
netlify deploy             # deploy to draft URL
netlify deploy --prod      # deploy to production
netlify env:list           # list env vars
netlify status             # site status
```

## Cloudflare Pages

### Configuration (`wrangler.toml`)

```toml
name = ""
compatibility_date = "2024-01-01"
pages_build_output_dir = ""

[build]
command = ""
```

### Headers (`_headers` file in output directory)

```
/*
  X-Content-Type-Options: nosniff
  X-Frame-Options: DENY
  X-XSS-Protection: 1; mode=block
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: camera=(), microphone=(), geolocation=()

/_astro/*
  Cache-Control: public, max-age=31536000, immutable
```

### Redirects (`_redirects` file in output directory)

```
/old-path /new-path 301
```

### Environment Variables

Set via Cloudflare Dashboard > Pages > Project > Settings > Environment variables, or via wrangler:
```bash
wrangler pages secret put VARIABLE_NAME
```

### Preview Deployments

Every non-production branch push: `https://<branch>.<project>.pages.dev`.

### Custom Domain

Via Dashboard > Pages > Custom domains > Add. DNS: CNAME to `<project>.pages.dev`.

### Rollback

Via Dashboard > Deployments > click previous > "Retry deployment" or create a rollback deployment.

### CLI Commands

```bash
wrangler pages deploy ./dist       # deploy
wrangler pages deployment list     # list deployments
wrangler pages secret list         # list secrets
```

## Platform Selection Logic

Do NOT choose a platform. Read Agent 5's tech stack and use the corresponding section:
- If tech stack says "Vercel" → use Vercel section
- If tech stack says "Netlify" → use Netlify section
- If tech stack says "Cloudflare Pages" → use Cloudflare section
- If tech stack says something else → adapt patterns above or document the gap
