<template>
  <NuxtLink
    :to="`/teacher/${teacher.name.toLowerCase()}-${teacher.surname.toLowerCase()}`.replace(/\s+/g, '-')"
    class="teacher-card relative rounded-xl overflow-hidden shadow-lg dark:shadow-gray-900/70 h-80 w-full sm:w-[calc(50%-1rem)] lg:w-[calc(33.333%-1.334rem)] group cursor-pointer transition-all duration-300 hover:shadow-2xl animate-fade-in"
    :style="`animation-delay: ${index * 150}ms`"
  >
    <div class="h-96 relative">
      <img
        :src="teacher.image || `https://dcrgvkmnavjahkprnkem.supabase.co/storage/v1/object/public/yoga/teachers/${teacher.name.toLowerCase()}-${teacher.surname.toLowerCase()}.jpg`"
        :alt="`${teacher.name} ${teacher.surname}`"
        class="w-full h-full object-cover rounded-t-xl animate-fade-in"
        :class="{ 'opacity-0': !imageLoaded && !imageError, 'hidden': imageError }"
        @load="handleImageLoad"
        @error="handleImageError"
      />
      <div v-if="!imageLoaded && !imageError" class="absolute inset-0 flex items-center justify-center bg-gray-200 dark:bg-gray-600">
        <p class="text-gray-600 dark:text-gray-300">{{ t('loadingImage') }}</p>
      </div>
      <div v-if="imageError" class="absolute inset-0 flex items-center justify-center bg-gray-200 dark:bg-gray-600">
        <div class="flex flex-col items-center space-y-2">
          <svg class="w-12 h-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
          </svg>
          <p class="text-sm text-gray-500 dark:text-gray-400">{{ t('imageError') }}</p>
        </div>
      </div>
    </div>
    <div class="absolute inset-0 bg-black bg-opacity-30 group-hover:bg-opacity-20 transition-all duration-300"></div>
    <div class="absolute bottom-0 left-0 right-0 p-6">
      <div class="flex flex-wrap gap-2 items-center mb-2">
        <span class="bg-primary bg-opacity-80 text-white px-3 py-1 rounded-full text-sm group-hover:bg-opacity-100 transition-all duration-300 group-hover:translate-y-[-2px]">
          {{ teacher.role }}
        </span>
      </div>
      <h1 class="text-2xl font-bold text-white group-hover:translate-y-[-2px] transition-all duration-300">{{ teacher.name }} {{ teacher.surname }}</h1>
      <div class="flex flex-wrap gap-2 mt-2">
        <span v-if="teacher.main_expertise && teacher.main_expertise.includes('&')"
              class="bg-white bg-opacity-80 text-gray-600 px-3 py-1 rounded-full text-sm group-hover:bg-opacity-100 transition-all duration-300 group-hover:translate-y-[-2px]">
          {{ teacher.main_expertise.split('&')[0].trim() }}
        </span>
        <span v-else class="bg-white bg-opacity-80 text-gray-600 px-3 py-1 rounded-full text-sm group-hover:bg-opacity-100 transition-all duration-300 group-hover:translate-y-[-2px]">
          {{ teacher.main_expertise }}
        </span>
        <span v-if="teacher.main_expertise && teacher.main_expertise.includes('&')"
              class="bg-white bg-opacity-80 text-gray-600 px-3 py-1 rounded-full text-sm group-hover:bg-opacity-100 transition-all duration-300 group-hover:translate-y-[-2px]">
          {{ teacher.main_expertise.split('&')[1].trim() }}
        </span>
      </div>
    </div>
  </NuxtLink>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const props = defineProps({
  teacher: { type: Object, required: true },
  index: { type: Number, required: true },
  t: { type: Function, required: true }
})

const imageLoaded = ref(false)
const imageError = ref(false)

const handleImageLoad = () => {
  imageLoaded.value = true
  imageError.value = false
}

const handleImageError = () => {
  imageError.value = true
  imageLoaded.value = false
}
</script>

<style scoped>
.teacher-card {
  animation: fadeInUp 0.8s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
  opacity: 0;
  transition: all 0.4s cubic-bezier(0.25, 0.1, 0.25, 1) !important;
  will-change: transform;
  backface-visibility: hidden;
}
.teacher-card:hover {
  transform: scale(1.025) !important;
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1) !important;
  z-index: 10;
}
.dark .teacher-card:hover {
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3) !important;
}
.teacher-card .group-hover\:translate-y-\[-2px\] {
  transition: all 0.5s cubic-bezier(0.25, 0.1, 0.25, 1) !important;
}
.teacher-card:hover .group-hover\:translate-y-\[-2px\] {
  transform: translateY(-2px) !important;
}
.teacher-card .group-hover\:bg-opacity-100 {
  transition: all 0.5s cubic-bezier(0.25, 0.1, 0.25, 1) !important;
}
</style> 