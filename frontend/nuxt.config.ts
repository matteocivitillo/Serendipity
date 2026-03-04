// https://nuxt.com/docs/api/configuration/nuxt-config
// @ts-ignore: Nuxt-specific globals
export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true },
  modules: ['@nuxtjs/tailwindcss'],
  tailwindcss: {
    cssPath: '~/assets/css/tailwind.css',
    configPath: 'tailwind.config.js',
  },
  css: ['~/assets/css/main.css'],
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    }
  },
  // SEO global settings
  app: {
    head: {
      title: 'Serendipity Yoga',
      htmlAttrs: {
        lang: 'en'
      },
      meta: [
        { charset: 'utf-8' },
        { name: 'description', content: 'Transforming lives through the practise of yoga and meditation' },
        { name: 'keywords', content: 'yoga, meditation, wellbeing, health, fitness, training, yoga classes, yoga training, yoga retreats, hatha yoga, kundalini yoga, ashtanga yoga, gentle water yoga, mindfulness' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'author', content: 'Bada Bastu' },
        { name: 'robots', content: 'index, follow' },
        { name: 'format-detection', content: 'telephone=no' },
        { name: 'theme-color', content: '#006A71' },
        { name: 'color-scheme', content: 'light dark' },
        { property: 'og:title', content: 'Serendipity Yoga' },
        { property: 'og:description', content: 'Transforming lives through the practise of yoga and meditation' },
        { property: 'og:image', content: '/images/logo.svg' },
        { property: 'og:url', content: 'https://hypermedia-applications-rho.vercel.app' },
        { property: 'og:type', content: 'website' },
        { property: 'og:site_name', content: 'Serendipity Yoga' },
        { property: 'og:locale', content: 'en_US' },
        { name: 'twitter:card', content: 'summary_large_image' },
        { name: 'twitter:title', content: 'Serendipity Yoga' },
        { name: 'twitter:description', content: 'Transforming lives through the practise of yoga and meditation' },
        { name: 'twitter:image', content: '/images/logo.svg' }
      ],
      link: [
        { rel: 'icon', type: 'image/svg+xml', href: '/favicon.svg' },
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
        { rel: 'shortcut icon', type: 'image/x-icon', href: '/favicon.ico' },
        { rel: 'apple-touch-icon', href: '/images/logo.svg' },
        { rel: 'manifest', href: '/manifest.json' }
      ]
    }
  },
  runtimeConfig: {
    public: {
      apiBase: 'https://fastapi-backend.onrender.com'
    }
  }
})
