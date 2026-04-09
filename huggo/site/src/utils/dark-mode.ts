/**
 * Dark mode toggle — persisted in localStorage.
 * Runs as inline script in <head> to avoid FOUC.
 */

export const DARK_MODE_SCRIPT = `
(function() {
  var theme = localStorage.getItem('theme');
  if (theme === 'dark' || (!theme && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
    document.documentElement.setAttribute('data-theme', 'dark');
  } else {
    document.documentElement.setAttribute('data-theme', 'light');
  }
})();
`;

export function initDarkModeToggle() {
  const toggle = document.getElementById('dark-mode-toggle');
  if (!toggle) return;

  toggle.addEventListener('click', () => {
    const current = document.documentElement.getAttribute('data-theme');
    const next = current === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', next);
    localStorage.setItem('theme', next);

    // Update aria-label
    const locale = document.documentElement.lang || 'fr';
    if (locale === 'fr') {
      toggle.setAttribute('aria-label', next === 'dark' ? 'Activer le mode clair' : 'Activer le mode sombre');
    } else {
      toggle.setAttribute('aria-label', next === 'dark' ? 'Enable light mode' : 'Enable dark mode');
    }
  });
}
