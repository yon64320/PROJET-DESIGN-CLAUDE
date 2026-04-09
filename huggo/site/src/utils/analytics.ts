/**
 * Plausible Analytics — custom event helpers
 * 12 events from tracking plan v0
 */

declare global {
  interface Window {
    plausible?: (event: string, options?: { props?: Record<string, string> }) => void;
  }
}

function track(event: string, props?: Record<string, string>) {
  if (typeof window !== 'undefined' && window.plausible) {
    window.plausible(event, props ? { props } : undefined);
  }
}

export function trackDemoFormSubmit(type: string, page: string) {
  track('demo_form_submit', { type, page });
}

export function trackContactFormSubmit(page: string) {
  track('contact_form_submit', { page });
}

export function trackCtaDemoClick(page: string, position: string) {
  track('cta_demo_click', { page, position });
}

export function trackCtaContactClick(page: string, position: string) {
  track('cta_contact_click', { page, position });
}

export function trackWhatsAppClick(page: string) {
  track('whatsapp_click', { page });
}

export function trackVerticalClick(vertical: string, source: string) {
  track('vertical_click', { vertical, source });
}

export function trackLanguageSwitch(from: string, to: string) {
  track('language_switch', { from, to });
}

export function trackPricingTierView(tier: string) {
  track('pricing_tier_view', { tier });
}

export function trackScrollDepth(page: string, depth: string) {
  track('scroll_depth', { page, depth });
}

/**
 * Initialize scroll depth tracking with IntersectionObserver
 */
export function initScrollDepthTracking() {
  if (typeof window === 'undefined') return;

  const page = window.location.pathname;
  const depths = [25, 50, 75, 100];
  const tracked = new Set<number>();

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const depth = parseInt(entry.target.getAttribute('data-depth') || '0');
        if (!tracked.has(depth)) {
          tracked.add(depth);
          trackScrollDepth(page, depth.toString());
        }
      }
    });
  });

  depths.forEach((depth) => {
    const el = document.querySelector(`[data-depth="${depth}"]`);
    if (el) observer.observe(el);
  });
}
