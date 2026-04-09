/**
 * Lenis smooth scroll initialization.
 * Disabled when prefers-reduced-motion: reduce.
 * Synced with GSAP ScrollTrigger.
 */

export async function initLenis() {
  if (typeof window === 'undefined') return null;

  // Do not init if reduced motion
  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    return null;
  }

  const Lenis = (await import('lenis')).default;

  const lenis = new Lenis({
    duration: 1.2,
    easing: (t: number) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
    smoothWheel: true,
  });

  // Sync with GSAP ScrollTrigger if available
  try {
    const { ScrollTrigger } = await import('gsap/ScrollTrigger');
    lenis.on('scroll', ScrollTrigger.update);
  } catch {
    // ScrollTrigger not available, continue without sync
  }

  function raf(time: number) {
    lenis.raf(time);
    requestAnimationFrame(raf);
  }

  requestAnimationFrame(raf);

  return lenis;
}
