<template>
  <NuxtLink
    :to="`/activity/${(activity.title || activity.name).toLowerCase().replace(/\s+/g, '-')}`"
    class="block w-full rounded-xl shadow-md dark:shadow-gray-900/70 overflow-hidden bg-white dark:bg-gray-600 transition animate-fade-in relative group activity-card"
  >
    <div class="h-64 relative">
      <img
        :src="activity.image ? activity.image : `/images/activities/${activity.id}.jpg`"
        alt=""
        class="w-full h-full object-cover rounded-t-xl"
        loading="lazy"
        @error="(e) => { e.target.style.display = 'none' }"
      />
      <div class="absolute inset-0 bg-black bg-opacity-40 group-hover:bg-opacity-30 transition-all duration-300"></div>
      <div class="absolute inset-x-0 bottom-0 p-4">
        <h3 class="text-2xl font-bold text-white group-hover:translate-y-[-2px] transition-all duration-300">{{ activity.title || activity.name }}</h3>
        <div class="flex flex-wrap gap-2 mt-2">
          <span v-if="activity.level" class="bg-primary bg-opacity-80 text-white px-3 py-1 rounded-full text-sm group-hover:translate-y-[-2px] transition-all duration-300">{{ activity.level }}</span>
          <span v-if="activity.schedule" class="bg-[#48A6A7] text-white px-3 py-1 rounded-full text-sm group-hover:translate-y-[-2px] transition-all duration-300">{{ activity.schedule }}</span>
          <span v-if="activity.short_description" class="text-white text-sm group-hover:translate-y-[-2px] transition-all duration-300 shadow-md">{{ activity.short_description }}</span>
        </div>
      </div>
    </div>
  </NuxtLink>
</template>

<script setup>
defineProps({
  activity: {
    type: Object,
    required: true
  }
})
</script>

<style scoped>
.text-primary {
  color: #006A71;
}

.bg-primary {
  background-color: #006A71;
}

.activity-card {
    transition: all 0.4s cubic-bezier(0.25, 0.1, 0.25, 1) !important; 
    will-change: transform;
    backface-visibility: hidden;
  }

  .activity-card:hover {
    transform: scale(1.025) !important;
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1) !important;
    z-index: 10;
  }

  .dark .activity-card:hover {
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3) !important;
  }

  .activity-card .group-hover\:translate-y-\[-2px\] {
    transition: all 0.5s cubic-bezier(0.25, 0.1, 0.25, 1) !important;
  }

  .activity-card:hover .group-hover\:translate-y-\[-2px\] {
    transform: translateY(-2px) !important;
  }

  .activity-card .group-hover\:bg-opacity-100 {
    transition: all 0.5s cubic-bezier(0.25, 0.1, 0.25, 1) !important;
  }

/* Animations */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-fade-in {
  animation: fadeIn 0.8s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}
</style> 