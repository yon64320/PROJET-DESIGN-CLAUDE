/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  darkMode: ['selector', '[data-theme="dark"]'],
  theme: {
    extend: {
      colors: {
        surface: {
          primary: 'var(--color-surface-primary)',
          secondary: 'var(--color-surface-secondary)',
          elevated: 'var(--color-surface-elevated)',
          brand: 'var(--color-surface-brand)',
        },
        text: {
          primary: 'var(--color-text-primary)',
          secondary: 'var(--color-text-secondary)',
          'on-brand': 'var(--color-text-on-brand)',
          'on-accent': 'var(--color-text-on-accent)',
        },
        accent: {
          action: 'var(--color-accent-action)',
          'action-hover': 'var(--color-accent-action-hover)',
          'action-pressed': 'var(--color-accent-action-pressed)',
          subtle: 'var(--color-accent-subtle)',
        },
        brand: {
          primary: 'var(--color-brand-primary)',
          'primary-hover': 'var(--color-brand-primary-hover)',
        },
        feedback: {
          success: 'var(--color-feedback-success)',
          error: 'var(--color-feedback-error)',
          warning: 'var(--color-feedback-warning)',
        },
        border: {
          DEFAULT: 'var(--color-border-default)',
          focus: 'var(--color-border-focus)',
        },
      },
      fontFamily: {
        display: ['Plus Jakarta Sans', 'system-ui', 'sans-serif'],
        body: ['DM Sans', 'system-ui', 'sans-serif'],
        mono: ['JetBrains Mono', 'monospace'],
      },
      fontSize: {
        'display-xl': ['clamp(2.25rem, 5vw, 3.5rem)', { lineHeight: '1.1', fontWeight: '700', letterSpacing: '-0.02em' }],
        'display-lg': ['clamp(1.875rem, 4vw, 2.75rem)', { lineHeight: '1.15', fontWeight: '700', letterSpacing: '-0.01em' }],
        'heading-xl': ['clamp(1.625rem, 3.5vw, 2.25rem)', { lineHeight: '1.2', fontWeight: '700', letterSpacing: '-0.01em' }],
        'heading-lg': ['clamp(1.375rem, 3vw, 1.75rem)', { lineHeight: '1.25', fontWeight: '600' }],
        'heading-md': ['1.375rem', { lineHeight: '1.3', fontWeight: '600' }],
        'heading-sm': ['1.125rem', { lineHeight: '1.4', fontWeight: '600', letterSpacing: '0.01em' }],
        'body-lg': ['1.125rem', { lineHeight: '1.6', fontWeight: '400' }],
        'body-md': ['1rem', { lineHeight: '1.6', fontWeight: '400' }],
        'body-sm': ['0.875rem', { lineHeight: '1.5', fontWeight: '400', letterSpacing: '0.01em' }],
        'caption': ['0.75rem', { lineHeight: '1.4', fontWeight: '400', letterSpacing: '0.02em' }],
        'data-xl': ['clamp(2rem, 4.5vw, 3rem)', { lineHeight: '1.1', fontWeight: '700', letterSpacing: '-0.02em' }],
        'data-lg': ['clamp(1.625rem, 3.5vw, 2.25rem)', { lineHeight: '1.15', fontWeight: '700', letterSpacing: '-0.01em' }],
        'button': ['1rem', { lineHeight: '1', fontWeight: '600', letterSpacing: '0.02em' }],
      },
      spacing: {
        'section': 'var(--space-section)',
        'section-sm': 'var(--space-section-sm)',
        'component': 'var(--space-component)',
        'component-sm': 'var(--space-component-sm)',
        'element': 'var(--space-element)',
        'element-sm': 'var(--space-element-sm)',
        'element-xs': 'var(--space-element-xs)',
        'element-2xs': 'var(--space-element-2xs)',
      },
      borderRadius: {
        'none': '0',
        'sm': 'var(--radius-sm)',
        'md': 'var(--radius-md)',
        'lg': 'var(--radius-lg)',
        'xl': 'var(--radius-xl)',
        'full': '9999px',
      },
      boxShadow: {
        'sm': 'var(--shadow-sm)',
        'md': 'var(--shadow-md)',
        'lg': 'var(--shadow-lg)',
        'xl': 'var(--shadow-xl)',
        'accent-glow': 'var(--shadow-accent-glow)',
      },
      maxWidth: {
        'container': '80rem',
      },
      gridTemplateColumns: {
        '12': 'repeat(12, minmax(0, 1fr))',
      },
    },
  },
  plugins: [],
};
