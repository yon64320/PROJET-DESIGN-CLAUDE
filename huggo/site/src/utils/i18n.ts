/**
 * i18n utility — static bilingual FR/EN content loader
 * Content files: src/content/{fr,en}/*.json
 */

export type Locale = 'fr' | 'en';

export function getLocaleFromUrl(url: URL): Locale {
  const [, locale] = url.pathname.split('/');
  if (locale === 'en') return 'en';
  return 'fr';
}

export function getAlternateUrl(url: URL, targetLocale: Locale): string {
  const currentPath = url.pathname;
  const segments = currentPath.split('/').filter(Boolean);

  if (segments[0] === 'fr' || segments[0] === 'en') {
    segments[0] = targetLocale;
  } else {
    segments.unshift(targetLocale);
  }

  return '/' + segments.join('/') + (currentPath.endsWith('/') ? '/' : '');
}

export function getLocalePath(locale: Locale, path: string = ''): string {
  const cleanPath = path.startsWith('/') ? path.slice(1) : path;
  return `/${locale}/${cleanPath}`.replace(/\/+$/, '/');
}

/**
 * Load content JSON for a specific page and locale.
 * In a real build, these would be imported statically.
 * For now, we use a simple map approach.
 */
export async function getContent(page: string, locale: Locale) {
  try {
    const modules = import.meta.glob('../content/**/*.json', { eager: true });
    const key = `../content/${locale}/${page}.json`;
    return (modules[key] as any)?.default || modules[key] || {};
  } catch {
    return {};
  }
}
