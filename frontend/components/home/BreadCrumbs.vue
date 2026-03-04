<template>
  <div class="bg-gray-100 dark:bg-gray-700 border-b border-gray-200 dark:border-gray-600">
    <div class="container mx-auto py-3 px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32">
      <p class="text-sm font-bold text-gray-600 dark:text-gray-300">
        <template v-for="(crumb, index) in breadcrumbs">
          <span v-if="index > 0" :key="`separator-${index}`" class="mx-2 text-gray-400 dark:text-gray-500">&gt;</span>
          <NuxtLink 
            v-if="crumb.url && index < breadcrumbs.length - 1" 
            :key="`link-${index}`"
            :to="crumb.url" 
            class="hover:text-primary dark:hover:text-[#9ACBD0] transition-colors duration-200"
          >
            {{ crumb.text }}
          </NuxtLink>
          <span v-else :key="`text-${index}`" class="text-primary dark:text-[#9ACBD0]">{{ crumb.text }}</span>
        </template>
      </p>
    </div>
  </div>
</template>

<script setup>
defineProps({
  breadcrumbs: {
    type: Array,
    default: () => [
      { text: 'Home', url: '/' }
    ]
  }
})
</script>

<style scoped>
.text-primary {
  color: #006A71;
}
.hover\:text-primary:hover {
  color: #006A71;
}

.dark .text-primary {
  color: #9ACBD0;
}
.dark .hover\:text-primary:hover {
  color: #9ACBD0;
}
</style> 