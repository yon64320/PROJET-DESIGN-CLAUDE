---
name: launch-readiness
description: Provides pre-launch and post-launch checklists covering SSL, DNS, redirects, 404 handling, OG tags, favicon, security headers, and monitoring setup.
version: 1.0.0
triggers:
  - launch-readiness
  - pre-launch checklist
  - post-launch checklist
  - go live checklist
  - launch verification
  - SSL check
  - DNS verification
  - security headers check
  - monitoring setup
  - uptime monitoring
when_not_to_use: Do not use for platform configuration (use deployment-platforms), CI/CD setup (use ci-cd-pipeline), or performance auditing (use performance).
---

# Launch Readiness

Complete pre-launch and post-launch verification checklists. Every item must be verified and documented with pass/fail status in the launch report.

## SSL & DNS Verification

### SSL Certificate

```bash
# Verify SSL certificate is valid
curl -sI https://yourdomain.com | grep -i "HTTP/"

# Check certificate details
openssl s_client -connect yourdomain.com:443 -servername yourdomain.com < /dev/null 2>/dev/null | openssl x509 -noout -dates -subject

# Verify HTTPS redirect
curl -sI http://yourdomain.com | grep -i "location"
```

Expected:
- Certificate is valid and not expired
- Subject matches the domain
- HTTP redirects to HTTPS with 301

### DNS Propagation

```bash
# Check DNS resolution
dig yourdomain.com +short
dig www.yourdomain.com +short

# Check from multiple nameservers
dig @8.8.8.8 yourdomain.com +short
dig @1.1.1.1 yourdomain.com +short

# Verify CNAME or A record
dig yourdomain.com CNAME +short
dig yourdomain.com A +short
```

### www/non-www Redirect

```bash
# Test both directions
curl -sI http://www.yourdomain.com | grep -i "location"
curl -sI https://www.yourdomain.com | grep -i "location"
curl -sI http://yourdomain.com | grep -i "location"
```

Expected: consistent redirect to canonical URL (www or non-www per Agent 5's decision).

## HTTP Status Verification

```bash
# Check all pages return 200
curl -sI https://yourdomain.com/ | head -1
curl -sI https://yourdomain.com/a-propos | head -1
curl -sI https://yourdomain.com/contact | head -1
# ... add all pages from Agent 7's implementation plan

# Verify 404 page returns proper 404 status
curl -sI https://yourdomain.com/this-page-does-not-exist | head -1
```

Expected: all known pages return `HTTP/2 200`, unknown paths return `HTTP/2 404`.

## SEO & Social Meta Verification

```bash
# Check meta tags per page
curl -s https://yourdomain.com/ | grep -i '<title>'
curl -s https://yourdomain.com/ | grep -i 'meta.*description'
curl -s https://yourdomain.com/ | grep -i 'meta.*og:'
curl -s https://yourdomain.com/ | grep -i 'meta.*twitter:'
curl -s https://yourdomain.com/ | grep -i 'link.*canonical'
```

Cross-reference with Agent 3's copy v1 meta section. Every page must have:
- `<title>` — unique, under 60 chars
- `<meta name="description">` — unique, under 160 chars, matches copy v1
- `<meta property="og:title">` — matches title or variant
- `<meta property="og:description">` — matches description
- `<meta property="og:image">` — valid URL, image exists
- `<meta property="og:url">` — canonical URL
- `<link rel="canonical">` — correct canonical URL

### Structured Data

```bash
# Check for JSON-LD structured data
curl -s https://yourdomain.com/ | grep -i 'application/ld+json'
```

Validate using Google's Rich Results Test (manual step — document in checklist).

## Asset Verification

```bash
# Favicon
curl -sI https://yourdomain.com/favicon.ico | head -1
curl -sI https://yourdomain.com/favicon.svg | head -1

# Robots.txt
curl -s https://yourdomain.com/robots.txt

# Sitemap
curl -sI https://yourdomain.com/sitemap-index.xml | head -1
curl -sI https://yourdomain.com/sitemap-0.xml | head -1
```

Expected:
- Favicon returns 200
- robots.txt exists, allows Googlebot, references sitemap
- Sitemap is valid XML, lists all public pages

## Security Headers Verification

```bash
# Check all security headers
curl -sI https://yourdomain.com/ | grep -iE "x-content-type|x-frame|x-xss|referrer-policy|permissions-policy|content-security|strict-transport"
```

Minimum required headers (from Agent 5's tech stack):
| Header | Expected value |
|--------|---------------|
| `X-Content-Type-Options` | `nosniff` |
| `X-Frame-Options` | `DENY` or `SAMEORIGIN` |
| `X-XSS-Protection` | `1; mode=block` |
| `Referrer-Policy` | `strict-origin-when-cross-origin` |
| `Permissions-Policy` | Restrictive (no unused APIs) |
| `Content-Security-Policy` | Per Agent 5's spec |
| `Strict-Transport-Security` | `max-age=31536000; includeSubDomains` |

## Performance Verification

```bash
# Quick Lighthouse audit (requires lighthouse CLI)
lighthouse https://yourdomain.com --output json --output html --output-path ./lighthouse-report --chrome-flags="--headless --no-sandbox"
```

Compare scores against Agent 5's perf budgets:
| Metric | Target | How to check |
|--------|--------|-------------|
| Performance score | >= 90 | Lighthouse |
| LCP | < 2.5s | Lighthouse / CrUX |
| FCP | < 1.8s | Lighthouse |
| CLS | < 0.1 | Lighthouse |
| INP | < 200ms | CrUX (after traffic) |
| Total page weight | Per Agent 5 | DevTools Network |

## Forms & Functionality

Manual verification checklist:
- [ ] Contact form submits successfully
- [ ] Form validation messages display correctly
- [ ] Email notification received after form submission
- [ ] Thank you / success state displays
- [ ] Form works with keyboard-only navigation
- [ ] Form accessible with screen reader

## Analytics Verification

```bash
# Check analytics script is present
curl -s https://yourdomain.com/ | grep -i "googletagmanager\|gtag\|analytics"
```

Manual verification:
- [ ] GA4/GTM script loads (Network tab)
- [ ] Page view events fire on navigation
- [ ] Conversion events fire on CTA clicks
- [ ] Form submission events fire
- [ ] No PII in event data
- [ ] Consent banner appears (if required by locale)

## Monitoring Setup

### Uptime Monitoring Options

| Service | Free tier | Setup |
|---------|-----------|-------|
| UptimeRobot | 50 monitors, 5-min interval | Add URL, set alert contacts |
| Better Uptime | 10 monitors, 3-min interval | Add URL, set alert contacts |
| Vercel Analytics | Included with Vercel | Enable in project settings |
| Cloudflare Analytics | Included with CF | Automatic |

### What to monitor
- Production URL — uptime + response time
- Key pages (homepage, contact) — HTTP status
- SSL certificate expiry — alert 30 days before
- Domain expiry — alert 60 days before

## Post-Launch Checklist

After production deployment, verify:
- [ ] Production URL accessible
- [ ] SSL valid on production
- [ ] All pages return correct status codes
- [ ] Forms work in production
- [ ] Analytics collecting data in production (check real-time view)
- [ ] Uptime monitoring active
- [ ] Rollback tested (deploy previous version, verify, redeploy current)
- [ ] Search Console submitted (manual — document for client)
- [ ] Social share preview correct (test on social debug tools)

## Pre-Launch Summary Template

```markdown
## Pre-Launch Verification — [Project Name]

| # | Category | Item | Status | Notes |
|---|----------|------|--------|-------|
| 1 | SSL/DNS | Certificate valid | | |
| 2 | SSL/DNS | Domain resolves | | |
| 3 | SSL/DNS | HTTPS redirect works | | |
| 4 | SSL/DNS | www redirect works | | |
| 5 | HTTP | All pages return 200 | | |
| 6 | HTTP | 404 page returns 404 | | |
| 7 | SEO | Meta titles present | | |
| 8 | SEO | Meta descriptions present | | |
| 9 | SEO | OG tags present | | |
| 10 | SEO | Canonical URLs correct | | |
| 11 | SEO | Structured data valid | | |
| 12 | Assets | Favicon present | | |
| 13 | Assets | robots.txt accessible | | |
| 14 | Assets | Sitemap accessible | | |
| 15 | Functionality | Forms submit | | |
| 16 | Functionality | Email notifications | | |
| 17 | Functionality | Dark mode works | | |
| 18 | Functionality | Reduced motion | | |
| 19 | Functionality | No broken links | | |
| 20 | Functionality | No broken images | | |
| 21 | Performance | Lighthouse >= targets | | |
| 22 | Performance | Core Web Vitals | | |
| 23 | Security | Headers present | | |
| 24 | Security | No secrets exposed | | |
| 25 | Security | CSP correct | | |
| 26 | Analytics | Script loads | | |
| 27 | Analytics | Events fire | | |
| 28 | A11y | Keyboard navigation | | |
| 29 | A11y | Skip link works | | |
| 30 | A11y | Focus visible | | |
```
