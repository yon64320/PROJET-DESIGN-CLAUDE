---
name: ci-cd-pipeline
description: Provides GitHub Actions templates for build, test, Lighthouse CI, and deployment pipelines with branch-based deployment strategies.
version: 1.0.0
triggers:
  - ci-cd-pipeline
  - github actions
  - CI/CD
  - deployment pipeline
  - lighthouse CI
  - automated deployment
  - build pipeline
when_not_to_use: Do not use for platform-specific configuration (use deployment-platforms) or pre-launch verification checklists (use launch-readiness).
---

# CI/CD Pipeline Templates

GitHub Actions workflows for showcase website deployment. Adapt to the project's framework and hosting platform as specified by Agent 5.

## Standard Deploy Workflow

```yaml
# .github/workflows/deploy.yml
name: Deploy

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

# Cancel in-progress runs for the same branch
concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Build
        run: npm run build
        env:
          # Add env vars from .env.example
          NODE_ENV: production

      - name: Upload build artifact
        uses: actions/upload-artifact@v4
        with:
          name: build
          path: dist/  # Adapt to outputDirectory

  # Deploy preview on PR
  deploy-preview:
    if: github.event_name == 'pull_request'
    needs: build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/download-artifact@v4
        with:
          name: build
          path: dist/
      # Platform-specific deploy step here

  # Deploy production on push to main
  deploy-production:
    if: github.ref == 'refs/heads/main' && github.event_name == 'push'
    needs: build
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v4
      - uses: actions/download-artifact@v4
        with:
          name: build
          path: dist/
      # Platform-specific deploy step here
```

## Platform-Specific Deploy Steps

### Vercel

```yaml
# For projects connected via Vercel Git Integration:
# No deploy step needed — Vercel auto-deploys on push.
# For manual deployment:
  deploy-production:
    needs: build
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v4
      - name: Install Vercel CLI
        run: npm install -g vercel
      - name: Deploy to Vercel
        run: vercel --prod --token ${{ secrets.VERCEL_TOKEN }}
        env:
          VERCEL_ORG_ID: ${{ secrets.VERCEL_ORG_ID }}
          VERCEL_PROJECT_ID: ${{ secrets.VERCEL_PROJECT_ID }}
```

### Netlify

```yaml
  deploy-production:
    needs: build
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: build
          path: dist/
      - name: Deploy to Netlify
        uses: nwtgck/actions-netlify@v3
        with:
          publish-dir: './dist'
          production-deploy: true
        env:
          NETLIFY_AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }}
          NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
```

### Cloudflare Pages

```yaml
  deploy-production:
    needs: build
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: build
          path: dist/
      - name: Deploy to Cloudflare Pages
        uses: cloudflare/wrangler-action@v3
        with:
          apiToken: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          accountId: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}
          command: pages deploy dist/ --project-name=PROJECT_NAME
```

## Lighthouse CI Workflow

```yaml
# .github/workflows/lighthouse.yml
name: Lighthouse CI

on:
  pull_request:
    branches: [main]
  workflow_dispatch:

jobs:
  lighthouse:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Build
        run: npm run build

      - name: Run Lighthouse CI
        uses: treosh/lighthouse-ci-action@v12
        with:
          configPath: './lighthouserc.json'
          uploadArtifacts: true
```

### Lighthouse CI Config

```json
// lighthouserc.json
{
  "ci": {
    "collect": {
      "staticDistDir": "./dist",
      "numberOfRuns": 3
    },
    "assert": {
      "assertions": {
        "categories:performance": ["error", { "minScore": 0.9 }],
        "categories:accessibility": ["error", { "minScore": 0.95 }],
        "categories:best-practices": ["error", { "minScore": 0.9 }],
        "categories:seo": ["error", { "minScore": 0.9 }],
        "first-contentful-paint": ["warn", { "maxNumericValue": 1800 }],
        "largest-contentful-paint": ["error", { "maxNumericValue": 2500 }],
        "cumulative-layout-shift": ["error", { "maxNumericValue": 0.1 }],
        "total-blocking-time": ["warn", { "maxNumericValue": 200 }]
      }
    }
  }
}
```

Adapt thresholds to match Agent 5's perf budgets.

## Branch Strategy

| Branch | Action | Environment |
|--------|--------|-------------|
| `main` | Auto-deploy to production | Production |
| `staging` | Auto-deploy to staging URL | Staging |
| PR branches | Deploy preview | Preview |

If Agent 5 specifies a different branch strategy, follow their decision.

## Required Secrets

Document in .env.example and configure in GitHub Settings > Secrets:

| Secret | Platform | How to obtain |
|--------|----------|---------------|
| `VERCEL_TOKEN` | Vercel | Settings > Tokens |
| `VERCEL_ORG_ID` | Vercel | `.vercel/project.json` after `vercel link` |
| `VERCEL_PROJECT_ID` | Vercel | `.vercel/project.json` after `vercel link` |
| `NETLIFY_AUTH_TOKEN` | Netlify | User settings > Applications > New access token |
| `NETLIFY_SITE_ID` | Netlify | Site settings > General > Site ID |
| `CLOUDFLARE_API_TOKEN` | Cloudflare | Profile > API Tokens |
| `CLOUDFLARE_ACCOUNT_ID` | Cloudflare | Dashboard URL or API |

## Caching

```yaml
      - uses: actions/cache@v4
        with:
          path: |
            ~/.npm
            node_modules/.astro
          key: ${{ runner.os }}-build-${{ hashFiles('**/package-lock.json') }}
          restore-keys: |
            ${{ runner.os }}-build-
```

Adapt cache paths to the framework (Astro: `node_modules/.astro`, Next.js: `.next/cache`).
