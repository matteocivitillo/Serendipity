module.exports = {
  content: [
    './components/**/*.{js,vue,ts}',
    './layouts/**/*.vue',
    './pages/**/*.vue',
    './plugins/**/*.{js,ts}',
    './app.vue',
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        primary: '#006A71',
        secondary: '#F2EFE7',
        gray: {
          100: '#F9FAFB',
          200: '#E5E7EB',
          300: '#D4D4D4',
          400: '#9CA3AF',
          500: '#6B7280',
          600: '#4B5563',
          700: '#374151',
          800: '#1F2937',
          900: '#111827',
        },
        yellow: {
          400: '#F1C644',
        },
      },
      fontFamily: {
        sans: ['Raleway', 'sans-serif'],
      },
      boxShadow: {
        'custom': '0px 4px 6px rgba(0, 0, 0, 0.1), 0px 10px 15px rgba(0, 0, 0, 0.1)',
      },
    },
  },
  plugins: [],
}; 