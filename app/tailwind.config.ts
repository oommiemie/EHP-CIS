import type { Config } from 'tailwindcss'

export default {
  content: ['./index.html', './src/**/*.{ts,tsx}'],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          '"Inter Variable"',
          'Inter',
          '"SF Pro Display"',
          '-apple-system',
          'BlinkMacSystemFont',
          '"Sarabun"',
          '"Noto Sans Thai"',
          'system-ui',
          'sans-serif',
        ],
      },
      colors: {
        // Brand palette — Apple-style blue/cyan/purple
        brand: {
          50: '#eef4ff',
          100: '#dbe6ff',
          200: '#bdd0ff',
          300: '#8fb0ff',
          400: '#5d87ff',
          500: '#3a64ff', // primary
          600: '#264af0',
          700: '#1f3acc',
          800: '#1f33a3',
          900: '#1f3082',
        },
        sky: {
          400: '#38bdf8',
          500: '#0ea5e9',
        },
        violet: {
          400: '#a78bfa',
          500: '#8b5cf6',
          600: '#7c3aed',
        },
        // Glass surfaces
        surface: {
          DEFAULT: 'rgba(255,255,255,0.62)',
          strong: 'rgba(255,255,255,0.82)',
          subtle: 'rgba(255,255,255,0.38)',
          dim: 'rgba(255,255,255,0.18)',
        },
        ink: {
          900: '#0b1020',
          800: '#13182b',
          700: '#1e2440',
          600: '#3a4366',
          500: '#5a6388',
          400: '#7c84a8',
          300: '#a0a6c2',
          200: '#c9cee0',
          100: '#e6e9f3',
        },
      },
      borderRadius: {
        xl: '18px',
        '2xl': '22px',
        '3xl': '28px',
        '4xl': '36px',
        pill: '999px',
      },
      boxShadow: {
        glass:
          '0 1px 0 rgba(255,255,255,0.6) inset, 0 -1px 0 rgba(255,255,255,0.2) inset, 0 24px 60px -20px rgba(28, 38, 92, 0.35), 0 8px 24px -12px rgba(28, 38, 92, 0.25)',
        'glass-sm':
          '0 1px 0 rgba(255,255,255,0.6) inset, 0 8px 24px -12px rgba(28, 38, 92, 0.25)',
        glow: '0 0 0 1px rgba(58, 100, 255, 0.18), 0 12px 40px -10px rgba(58, 100, 255, 0.45)',
        soft: '0 8px 24px -12px rgba(28, 38, 92, 0.2)',
      },
      backdropBlur: {
        xs: '4px',
      },
      keyframes: {
        'blob-drift': {
          '0%, 100%': { transform: 'translate3d(0,0,0) scale(1)' },
          '33%': { transform: 'translate3d(40px,-30px,0) scale(1.08)' },
          '66%': { transform: 'translate3d(-30px,20px,0) scale(0.95)' },
        },
        'fade-up': {
          from: { opacity: '0', transform: 'translateY(8px)' },
          to: { opacity: '1', transform: 'translateY(0)' },
        },
        'pop-in': {
          '0%': { opacity: '0', transform: 'scale(0.96) translateY(8px)' },
          '100%': { opacity: '1', transform: 'scale(1) translateY(0)' },
        },
        'page-in': {
          '0%': { opacity: '0', transform: 'translateY(6px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        shimmer: {
          '0%': { backgroundPosition: '-200% 0' },
          '100%': { backgroundPosition: '200% 0' },
        },
      },
      animation: {
        'blob-drift': 'blob-drift 18s ease-in-out infinite',
        'fade-up': 'fade-up 0.35s ease-out',
        'pop-in': 'pop-in 0.24s cubic-bezier(0.22, 1, 0.36, 1)',
        'page-in': 'page-in 0.34s cubic-bezier(0.22, 1, 0.36, 1)',
        shimmer: 'shimmer 2.5s linear infinite',
      },
    },
  },
  plugins: [],
} satisfies Config
