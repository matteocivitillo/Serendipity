<template>
  <div class="flex flex-col min-h-screen">
    <NavBar />
    <main class="flex-grow">
      <HeroSection />
      <HighlightedActivities />
      <YogaClasses />
      <ContactSection />
      <SocialWall />
    </main>
    <SiteFooter />
  </div>
</template>

<script setup>
import NavBar from '~/components/home/NavBar.vue'
import HeroSection from '~/components/home/HeroSection.vue'
import ContactSection from '~/components/home/ContactSection.vue'
import HighlightedActivities from '~/components/home/HighlightedActivities.vue'
import YogaClasses from '~/components/home/YogaClasses.vue'
import SocialWall from '~/components/home/SocialWall.vue'
import SiteFooter from '~/components/home/SiteFooter.vue'
</script> 