<template>
  <div :lang="selectedLang">
    <NuxtPage />
  </div>
</template>

<script setup>
import { selectedLang } from '~/components/home/NavBar.vue'

// Add meta tags for the PWA
useHead({
  link: [
    { rel: 'manifest', href: '/manifest.json' }
  ],
  meta: [
    { name: 'theme-color', content: '#006A71' }
  ]
})
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap');

html, body {
  font-family: 'Raleway', sans-serif;
  margin: 0;
  padding: 0;
}
</style>
