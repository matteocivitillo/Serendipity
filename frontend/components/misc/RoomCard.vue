<template>
  <div class="bg-white dark:bg-gray-700 p-6 md:p-8 rounded-xl shadow-lg dark:shadow-gray-900/70 flex flex-wrap md:flex-nowrap gap-16 room-card">
    <div class="w-full md:w-1/2 flex items-center justify-center">
      <div class="h-96 w-full rounded-lg overflow-hidden">
        <img 
          :src="room.image" 
          alt="" 
          class="w-full h-full object-cover" 
          loading="lazy"
        />  <!-- Alt text is empty because it's decorative only -->
      </div>
    </div>
    <div class="w-full md:w-1/2 flex flex-col justify-center">
      <h1 class="text-2xl font-bold text-primary dark:text-[#9ACBD0] mb-4">{{ room.name || room.title }}</h1>
      
      <!-- Description Paragraph -->
      <div class="prose prose-lg dark:prose-invert mb-6">
        <p class="text-gray-700 dark:text-gray-300">{{ room.description }}</p>
      </div>
      
      <!-- Features Paragraph -->
      <div v-if="room.features && room.features.length > 0" class="mb-6">
        <h1 class="text-lg font-semibold text-primary dark:text-[#9ACBD0] mb-2">{{ t('features') }}:</h1>
        <ul class="list-disc pl-5 space-y-1">
          <li v-for="feature in room.features" :key="feature" class="text-gray-700 dark:text-gray-300">
            {{ feature }}
          </li>
        </ul>
      </div>
      
      <!-- Activities Paragraph -->
      <div v-if="room.activities && room.activities.length > 0" class="mb-6">
        <h1 class="text-lg font-semibold text-primary dark:text-[#9ACBD0] mb-2">{{ t('activities') }}:</h1>
        <div class="flex flex-wrap gap-2">
          <nuxt-link 
            v-for="activity in room.activities" 
            :key="activity.id"
            :to="`/activity/${activity.title.toLowerCase().replace(/\s+/g, '-')}`"
            class="inline-flex items-center px-3 py-1 rounded-full bg-primary-light dark:bg-primary/30 text-primary dark:text-[#9ACBD0] hover:bg-primary hover:text-white dark:hover:bg-primary/70 transition-colors"
          >
            {{ activity.title }}
          </nuxt-link>
        </div>
      </div>
      
      <!-- Legacy Activities (if no DB activities were found) -->
      <div v-else-if="room.legacy_activities && room.legacy_activities.length > 0" class="mb-6">
        <h1 class="text-lg font-semibold text-primary dark:text-[#9ACBD0] mb-2">{{ t('activities') }}:</h1>
        <div class="flex flex-wrap gap-2">
          <nuxt-link 
            v-for="activity in room.legacy_activities" 
            :key="activity"
            :to="`/activity/${activity.toLowerCase().replace(/\s+/g, '-')}`"
            class="inline-flex items-center px-3 py-1 rounded-full bg-primary-light dark:bg-primary/30 text-primary dark:text-[#9ACBD0] hover:bg-primary hover:text-white dark:hover:bg-primary/70 transition-colors"
          >
            {{ activity }}
          </nuxt-link>
        </div>
      </div>
      
      <!-- Quote -->
      <div v-if="room.quote" class="italic text-gray-600 dark:text-gray-400 mt-4">
        "{{ room.quote }}"
      </div>
    </div>
  </div>
</template>

<script setup>
import { selectedLang } from '~/components/home/NavBar.vue';

// Translations
const translations = {
  en: {
    features: 'Features',
    activities: 'Activities'
  },
  it: {
    features: 'Caratteristiche',
    activities: 'Attività'
  },
  fr: {
    features: 'Caractéristiques',
    activities: 'Activités'
  },
  de: {
    features: 'Eigenschaften',
    activities: 'Aktivitäten'
  },
  zh: {
    features: '特点',
    activities: '活动'
  }
};

// Function to get translations
const t = (key) => {
  const lang = selectedLang.value;
  return translations[lang]?.[key] || translations.en[key];
};

defineProps({
  room: {
    type: Object,
    required: true
  },
  activityIdsMap: {
    type: Object,
    default: () => ({})
  }
})
</script>

<style scoped>
.text-primary {
  color: #006A71;
}

.dark .text-primary {
  color: #9ACBD0;
}

.bg-primary {
  background-color: #006A71;
}

.bg-primary-light {
  background-color: #e0f2f3;
}

/* Custom dark mode styling for prose content */
.dark .prose {
  color: #e2e8f0;
}

.dark .prose strong {
  color: #f8fafc;
}
</style> 