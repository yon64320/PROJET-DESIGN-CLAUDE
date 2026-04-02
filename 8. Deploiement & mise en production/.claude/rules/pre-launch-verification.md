---
description: Pre-launch checklist must be complete with all items verified before production deployment. A launch without verification is invalid.
---

# Pre-Launch Verification

## Principle

The pre-launch checklist is not optional. Every item must be verified and documented with pass/fail status. A launch report without a completed checklist is invalid.

## Checklist categories (minimum)

| Category | Items to verify | How to verify |
|----------|----------------|---------------|
| SSL/DNS | Certificate valid, domain resolves, redirects work | curl -I, dig, platform dashboard |
| HTTP status | All pages return 200, 404 page returns proper 404 | curl per page |
| SEO meta | Title, description, OG tags on every page | curl + parse, match against Agent 3's copy v1 |
| Assets | Favicon, OG image, robots.txt, sitemap.xml | HTTP requests to each asset URL |
| Forms | Test submission works, email received | Manual test on staging |
| Analytics | Script loads, events fire | Browser dev tools / curl verification |
| Performance | Lighthouse scores vs perf budgets | Lighthouse CLI or PageSpeed API |
| Security | Headers present, no secrets exposed | curl -I + source inspection |
| Accessibility | Keyboard nav, skip link, focus visible | Manual verification on staging |

## Severity classification

| Severity | Definition | Impact on launch |
|----------|-----------|------------------|
| P0 | Site broken, security flaw, legal risk | BLOCKS launch — must fix |
| P1 | Major feature broken, significant perf regression | Launch delayed — should fix |
| P2 | Minor issue, cosmetic, optimization | Launch proceeds — post-launch backlog |

## Rule

If more than 2 items fail at P1 severity, recommend delaying launch. If ANY item fails at P0, BLOCK launch.
