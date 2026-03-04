<template>
  <NuxtLink
    :to="`/activity/${(activity.title || activity.name).toLowerCase().replace(/\s+/g, '-')}`"
    class="activity-card relative rounded-xl overflow-hidden shadow-lg dark:shadow-gray-900/70 h-80 group cursor-pointer transition-all duration-300 hover:shadow-2xl animate-fade-in"
    :style="`animation-delay: ${index * 150}ms`"
  >
    <div class="h-96 relative">
      <img
        :src="activity.image || '/images/activities/default-activity.jpg'"
        alt=""
        class="w-full h-full object-cover rounded-t-xl animate-fade-in"
        :class="{ 'opacity-0': !imageLoaded }"
        @load="imageLoaded = true"
        @error="imageError = true"
      />
      <div v-if="!imageLoaded" class="absolute inset-0 flex items-center justify-center bg-gray-200 dark:bg-gray-600">
        <p class="text-gray-600 dark:text-gray-300">{{ t('loadingImage') }}</p>
      </div>
    </div>
    <div class="absolute inset-0 bg-black bg-opacity-40 group-hover:bg-opacity-30 transition-all duration-300"></div>
    <div class="absolute bottom-0 left-0 right-0 p-6">
      <div class="flex flex-wrap gap-2 items-center mb-2">
        <span class="bg-primary bg-opacity-80 text-white px-3 py-1 rounded-full text-sm group-hover:bg-opacity-100 transition-all duration-300 group-hover:translate-y-[-2px]">
          {{ activity.level }}
        </span>
      </div>
      <h3 class="text-2xl font-bold text-white group-hover:translate-y-[-2px] transition-all duration-300">{{ activity.title || activity.name }}</h3>
      <div class="flex flex-wrap gap-2 mt-2">
        <span class="text-white py-1 text-sm transition-all duration-300 group-hover:translate-y-[-2px]">
          {{ activity.short_description }}
        </span>
      </div>
    </div>
  </NuxtLink>
</template>

<script setup>
import { ref } from 'vue'
const props = defineProps({
  activity: { type: Object, required: true },
  index: { type: Number, required: true },
  t: { type: Function, required: true }
})
const imageLoaded = ref(false)
const imageError = ref(false)
</script>

<style scoped>
/* Copy the relevant styles from activities.vue or rely on global styles */
</style> 