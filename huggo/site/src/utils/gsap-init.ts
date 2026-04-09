/**
 * GSAP + ScrollTrigger initialization.
 * - Checks prefers-reduced-motion before initializing.
 * - Provides factory functions for common scroll-triggered animations.
 * - Cleanup support for component unmount.
 */

export async function initGSAP() {
  // Skip if reduced motion is preferred
  if (typeof window === 'undefined') return null;
  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    // Make all animate elements visible immediately
    document.querySelectorAll('.animate').forEach((el) => {
      (el as HTMLElement).style.opacity = '1';
      (el as HTMLElement).style.transform = 'none';
    });
    return null;
  }

  const { gsap } = await import('gsap');
  const { ScrollTrigger } = await import('gsap/ScrollTrigger');

  gsap.registerPlugin(ScrollTrigger);

  return { gsap, ScrollTrigger };
}

/**
 * Create a fade-up animation triggered by scroll
 */
export function createFadeUp(
  gsap: any,
  ScrollTrigger: any,
  selector: string | Element,
  options: {
    delay?: number;
    duration?: number;
    y?: number;
    stagger?: number;
    triggerStart?: string;
  } = {}
) {
  const {
    delay = 0,
    duration = 0.4,
    y = 20,
    stagger = 0,
    triggerStart = 'top 80%',
  } = options;

  const elements = typeof selector === 'string'
    ? document.querySelectorAll(selector)
    : [selector];

  if (elements.length === 0) return null;

  return gsap.from(elements, {
    y,
    opacity: 0,
    duration,
    delay,
    stagger,
    ease: 'power3.out', // Approximates spring easing
    scrollTrigger: {
      trigger: typeof selector === 'string'
        ? document.querySelector(selector)
        : selector,
      start: triggerStart,
      once: true,
    },
  });
}

/**
 * Create a counter animation (0 -> target value)
 */
export function createCounter(
  gsap: any,
  ScrollTrigger: any,
  elements: NodeListOf<Element> | Element[],
  options: {
    duration?: number;
    stagger?: number;
  } = {}
) {
  const { duration = 1.2, stagger = 0.15 } = options;

  const counters: any[] = [];

  Array.from(elements).forEach((el, i) => {
    const target = el.getAttribute('data-value') || '0';
    const suffix = el.getAttribute('data-suffix') || '';
    const prefix = el.getAttribute('data-prefix') || '';
    const isPercent = target.includes('%');
    const isPlus = target.startsWith('+');
    const numericValue = parseFloat(target.replace(/[^0-9.-]/g, ''));

    if (isNaN(numericValue)) return;

    const obj = { value: 0 };

    const anim = gsap.to(obj, {
      value: numericValue,
      duration,
      delay: i * stagger,
      ease: 'power2.out',
      scrollTrigger: {
        trigger: el,
        start: 'top 80%',
        once: true,
      },
      onUpdate() {
        let display = '';
        if (numericValue >= 1000000) {
          display = Math.round(obj.value / 1000000) + 'M';
        } else if (numericValue >= 1000) {
          display = Math.round(obj.value).toLocaleString();
        } else if (Number.isInteger(numericValue)) {
          display = Math.round(obj.value).toString();
        } else {
          display = obj.value.toFixed(0);
        }
        el.textContent = prefix + display + suffix;
      },
    });

    counters.push(anim);
  });

  return counters;
}

/**
 * Create staggered fade-up for a group of elements
 */
export function createStaggeredFadeUp(
  gsap: any,
  ScrollTrigger: any,
  containerSelector: string,
  childSelector: string,
  options: {
    stagger?: number;
    duration?: number;
    triggerStart?: string;
  } = {}
) {
  const { stagger = 0.1, duration = 0.4, triggerStart = 'top 75%' } = options;

  const container = document.querySelector(containerSelector);
  if (!container) return null;

  const children = container.querySelectorAll(childSelector);
  if (children.length === 0) return null;

  return gsap.from(children, {
    y: 20,
    opacity: 0,
    duration,
    stagger,
    ease: 'power3.out',
    scrollTrigger: {
      trigger: container,
      start: triggerStart,
      once: true,
    },
  });
}
