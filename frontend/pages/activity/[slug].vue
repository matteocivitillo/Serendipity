<template>
  <div class="flex flex-col min-h-screen bg-gray-100 dark:bg-gray-800">
    <NavBar />
    <BreadCrumbs v-if="activity" :breadcrumbs="[
      { text: t('home'), url: '/' }, 
      { text: t('activities'), url: '/activities' }, 
      { text: activity.title || activity.name, url: `/activity/${slug}` }
    ]" />
    <main class="flex-grow" :key="activityId">
      <!-- Loading State -->
      <div v-if="isLoading" class="flex justify-center items-center h-96 bg-white dark:bg-gray-700">
        <div class="loading-spinner animate-fade-in">
          <div class="spinner"></div>
          <p class="mt-4 text-xl text-gray-600 dark:text-gray-300 animate-fade-in">{{ t('loadingActivity') }}</p>
        </div>
      </div>
            
      <!-- Error State -->
      <div v-else-if="error" class="flex justify-center items-center h-96 bg-white dark:bg-gray-700">
        <p class="text-xl text-red-600">{{ error }}</p>
      </div>
            
      <!-- Activity Data Display -->
      <template v-else-if="activity">
        <!-- Activity Details with Cards Section -->
        <section class="py-14 bg-gray-100 dark:bg-gray-800">
          <div class="container mx-auto px-6 md:px-10 lg:px-20">
            <!-- Contenitore flessibile: colonna su mobile, riga su desktop -->
            <div class="flex flex-col md:flex-row gap-8 justify-center">
              <!-- Activity Image Card -->
              <div class="w-full md:w-2/5 lg:w-1/3 activity-card-static">
                <div class="rounded-xl shadow-md overflow-hidden bg-white dark:bg-gray-700">
                  <div class="h-96 relative">
                    <img 
                      :src="activity.image ? activity.image : `/images/activities/default-activity.jpg`" 
                      alt="" 
                      class="w-full h-full object-cover rounded-t-xl animate-fade-in" 
                      :class="{ 'opacity-0': !imageLoaded }" 
                      @load="imageLoaded = true" 
                      @error="handleImageError"
                    />
                    <div v-if="!imageLoaded && !imageError" class="absolute inset-0 flex items-center justify-center bg-gray-200 dark:bg-gray-600">
                      <p class="text-gray-600 dark:text-gray-300">{{ t('loadingImage') }}</p>
                    </div>
                    <div class="absolute inset-x-0 bottom-0 p-6">
                      <div class="flex flex-wrap gap-2 items-center mb-2">
                        <span class="bg-primary bg-opacity-80 text-white px-3 py-1 rounded-full text-sm animate-fade-in">
                          {{ activity.level || activity.difficulty || t('allLevels') }}
                        </span>
                      </div>
                      <h3 class="text-2xl font-bold text-white animate-fade-in">{{ activity.title || activity.name }}</h3>
                    </div>
                  </div>
                </div>
              </div>
              
              <!-- Activity Information Card -->
              <div class="w-full md:w-3/5 lg:w-1/2 activity-card-static">
                <div class="bg-white dark:bg-gray-700 rounded-xl shadow-md p-8 h-full">
                  <!-- Activity Title -->
                  <div class="mb-6 border-b border-gray-300 dark:border-gray-600 pb-4">
                    <h1 class="text-4xl font-bold text-primary dark:text-[#9ACBD0] animate-fade-in">{{ activity.title || activity.name }}</h1>
                  </div>
                  
                  <!-- Two column layout for information -->
                  <div class="flex flex-col sm:flex-row gap-8">
                    <!-- Left Column: Level and Teacher -->
                    <div class="w-full sm:w-1/2 space-y-6">
                      <!-- Level -->
                      <div class="space-y-2">
                        <span class="bg-primary bg-opacity-80 text-white px-4 py-1.5 rounded-full text-base inline-block mb-2 animate-fade-in">
                          {{ t('level') }}
                        </span>
                        <p class="text-xl text-gray-600 dark:text-gray-300 animate-fade-in">{{ activity.level || activity.difficulty || t('allLevels') }}</p>
                      </div>
                      
                      <!-- Teacher Info -->
                      <div v-if="teacher && Array.isArray(teacher) && teacher.length > 0" class="space-y-2">
                        <span class="bg-[#48A6A7] text-white px-4 py-1.5 rounded-full text-base inline-block mb-2 animate-fade-in">
                          {{ t('teachers') }}
                        </span>
                        <div v-for="(t, index) in teacher" :key="index" class="flex items-center gap-3 mt-2">
                          <div class="w-12 h-12 bg-gray-300 dark:bg-gray-500 rounded-full overflow-hidden border-2 border-primary dark:border-[#9ACBD0]">
                            <img 
                              :src="t.image ? (t.image.startsWith('http') ? t.image : `/images/teacher-placeholder.jpg`) : '/images/teacher-placeholder.jpg'" 
                              alt="" 
                              class="w-full h-full object-cover object-center" 
                              onerror="this.src='/images/teacher-placeholder.jpg'"
                            />
                          </div>
                          <div>
                            <NuxtLink 
                              v-if="t.id" 
                              :to="`/teacher/${t.name.toLowerCase()}-${t.surname.toLowerCase()}`.replace(/\s+/g, '-')" 
                              class="text-gray-800 dark:text-gray-200 font-medium hover:text-primary dark:hover:text-[#9ACBD0] transition-colors"
                            >
                              {{ t.name || '' }} {{ t.surname || '' }}
                            </NuxtLink>
                            <p v-else class="text-gray-800 dark:text-gray-200 font-medium">{{ t.name || '' }} {{ t.surname || '' }}</p>
                          </div>
                        </div>
                      </div>
                      
                      <!-- Teacher Info (Single) -->
                      <div v-else-if="teacher" class="space-y-2">
                        <span class="bg-[#48A6A7] text-white px-4 py-1.5 rounded-full text-base inline-block mb-2 animate-fade-in">
                          {{ t('teacher') }}
                        </span>
                        <div class="flex items-center gap-3">
                          <div class="w-12 h-12 bg-gray-300 dark:bg-gray-500 rounded-full overflow-hidden border-2 border-primary dark:border-[#9ACBD0]">
                            <img 
                              :src="teacher.image ? (teacher.image.startsWith('http') ? teacher.image : `/images/teacher-placeholder.jpg`) : '/images/teacher-placeholder.jpg'" 
                              alt="" 
                              class="w-full h-full object-cover object-center" 
                              onerror="this.src='/images/teacher-placeholder.jpg'"
                            />
                          </div>
                          <div>
                            <NuxtLink 
                              v-if="teacher.id" 
                              :to="`/teacher/${teacher.name.toLowerCase()}-${teacher.surname.toLowerCase()}`.replace(/\s+/g, '-')" 
                              class="text-gray-800 dark:text-gray-200 font-medium hover:text-primary dark:hover:text-[#9ACBD0] transition-colors"
                            >
                              {{ teacher.name || '' }} {{ teacher.surname || '' }}
                            </NuxtLink>
                            <p v-else class="text-gray-800 dark:text-gray-200 font-medium">{{ teacher.name || '' }} {{ teacher.surname || '' }}</p>
                            <p class="text-gray-500 dark:text-gray-400 text-sm">{{ teacher.experience || t('expertTeacher') }}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <!-- Right Column: About -->
                    <div class="w-full sm:w-1/2 space-y-2">
                      <span class="bg-white dark:bg-gray-700 bg-opacity-80 border border-primary dark:border-[#9ACBD0] text-primary dark:text-[#9ACBD0] px-4 py-1.5 rounded-full text-base inline-block mb-2 animate-fade-in">
                        {{ t('about') }}
                      </span>
                      <p class="text-lg text-gray-600 dark:text-gray-300 animate-fade-in">{{ activity.short_description || activity.description }}</p>
                      
                      <!-- Schedule (if available) -->
                      <div v-if="activity.schedule" class="pt-4">
                        <span class="bg-[#48A6A7] text-white px-4 py-1.5 rounded-full text-base inline-block mb-2 animate-fade-in">
                          {{ t('schedule') }}
                        </span>
                        <p class="text-base text-gray-600 dark:text-gray-300 animate-fade-in">{{ activity.schedule }}</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- Description Card -->
            <div v-if="activity.about || activity.description" class="mt-8 w-full activity-card-static">
              <div class="bg-white dark:bg-gray-700 rounded-xl shadow-md p-8">
                <span class="bg-primary bg-opacity-80 text-white px-4 py-1.5 rounded-full text-base inline-block mb-4 animate-fade-in">
                  {{ t('description') }}
                </span>
                <p v-if="activity.about" class="text-lg text-gray-600 dark:text-gray-300 animate-fade-in" v-html="activity.about"></p>
                <p v-else class="text-lg text-gray-600 dark:text-gray-300 animate-fade-in">{{ activity.description }}</p>
              </div>
            </div>
            
            <!-- Additional Details Card -->
            <div v-if="activity.ideal_for || activity.main_benefit || activity.additional_info || activity.schedule" class="mt-8 w-full activity-card-static">
              <div class="bg-white dark:bg-gray-700 rounded-xl shadow-md p-8">
                <span class="bg-[#48A6A7] text-white px-4 py-1.5 rounded-full text-base inline-block mb-4 animate-fade-in">
                  {{ t('details') }}
                </span>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <!-- Ideal For -->
                  <div v-if="activity.ideal_for" class="space-y-2">
                    <h1 class="text-xl font-bold text-gray-600 dark:text-white">{{ t('idealFor') }}</h1>
                    <p class="text-base text-gray-600 dark:text-gray-300" v-html="activity.ideal_for"></p>
                  </div>
                  
                  <!-- Main Benefit -->
                  <div v-if="activity.main_benefit" class="space-y-2">
                    <h1 class="text-xl font-bold text-gray-600 dark:text-white">{{ t('mainBenefit') }}</h1>
                    <p class="text-base text-gray-600 dark:text-gray-300" v-html="activity.main_benefit"></p>
                  </div>
                  
                  <!-- Additional Info -->
                  <div v-if="activity.additional_info" class="space-y-2">
                    <h1 class="text-xl font-bold text-black dark:text-white">{{ t('additionalInfo') }}</h1>
                    <p class="text-base text-gray-600 dark:text-gray-300" v-html="activity.additional_info"></p>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- Room Card -->
            <div v-if="activity.roomid" class="mt-8 w-full activity-card-static">
              <div v-if="isLoadingRoom" class="bg-white dark:bg-gray-700 rounded-xl shadow-md p-8 text-center">
                <p class="text-gray-600 dark:text-gray-300">{{ t('loadingRoom') }}</p>
              </div>
              <RoomCard v-else-if="room" :room="room" :activityIdsMap="activityIdsMap" />
            </div>
          </div>
        </section>
                
        <!-- Other Activities Section -->
        <section class="py-14 bg-white dark:bg-gray-700 border-t border-gray-200 dark:border-gray-600">
          <div class="container mx-auto px-6 md:px-20 flex flex-col items-center">
            <h2 class="text-3xl font-bold text-primary dark:text-[#9ACBD0] mb-8 animate-fade-in text-center">{{ t('otherActivities') }}</h2>
            
            <div v-if="isLoadingSimilar" class="flex justify-center items-center h-32">
              <div class="loading-spinner animate-fade-in">
                <div class="spinner"></div>
                <p class="mt-4 text-xl text-gray-600 dark:text-gray-300 animate-fade-in">{{ t('loadingSimilar') }}</p>
              </div>
            </div>
            
            <div v-else-if="similarActivities.length === 0" class="text-gray-600 dark:text-gray-300 text-lg animate-fade-in p-8 bg-gray-50 dark:bg-gray-600 rounded-lg text-center">
              {{ t('noSimilarActivities') }}
            </div>
            
            <div v-else class="flex flex-wrap justify-center gap-6 w-full max-w-5xl">
              <div v-for="(similarActivity, index) in similarActivities" :key="similarActivity.id" class="w-full sm:w-[calc(50%-12px)] md:w-[calc(40%-16px)] flex justify-center">
                <ActivityCard 
                  :activity="similarActivity"
                  :style="`animation-delay: ${index * 150}ms`"
                />
              </div>
            </div>
          </div>
        </section>
      </template>
    </main>
    <SiteFooter />
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue'
import NavBar, { selectedLang } from '~/components/home/NavBar.vue'
import BreadCrumbs from '~/components/home/BreadCrumbs.vue'
import SiteFooter from '~/components/home/SiteFooter.vue'
import RoomCard from '~/components/misc/RoomCard.vue'
import ActivityCard from '~/components/misc/ActivityCardSuggestion.vue'
import { API_URL } from '~/utils/api'

// Translations
const translations = {
  en: {
    home: 'Home',
    activities: 'Activities',
    level: 'Level',
    teacher: 'Teacher',
    teachers: 'Teachers',
    about: 'About',
    schedule: 'Schedule',
    description: 'Description',
    details: 'Details',
    idealFor: 'Ideal For',
    mainBenefit: 'Main Benefit',
    additionalInfo: 'Additional Information',
    otherActivities: 'Other Activities You Might Like',
    expertTeacher: 'Expert Teacher',
    allLevels: 'All Levels',
    loadingActivity: 'Loading activity data...',
    loadingImage: 'Loading image...',
    loadingRoom: 'Loading room information...',
    loadingSimilar: 'Loading similar activities...',
    noSimilarActivities: 'No similar activities found.',
    seoTitle: '{name} - Serendipity Yoga',
    seoDescription: 'Discover the details of our activities, including the teachers, schedule, and more.'
  },
  it: {
    home: 'Home',
    activities: 'Attività',
    level: 'Livello',
    teacher: 'Insegnante',
    teachers: 'Insegnanti',
    about: 'Informazioni',
    schedule: 'Orario',
    description: 'Descrizione',
    details: 'Dettagli',
    idealFor: 'Ideale Per',
    mainBenefit: 'Beneficio Principale',
    additionalInfo: 'Informazioni Aggiuntive',
    otherActivities: 'Altre Attività Che Potrebbero Piacerti',
    expertTeacher: 'Insegnante Esperto',
    allLevels: 'Tutti i Livelli',
    loadingActivity: 'Caricamento dati attività...',
    loadingImage: 'Caricamento immagine...',
    loadingRoom: 'Caricamento informazioni sulla sala...',
    loadingSimilar: 'Caricamento attività simili...',
    noSimilarActivities: 'Nessuna attività simile trovata.',
    seoTitle: '{name} - Serendipity Yoga',
    seoDescription: 'Scopri i dettagli delle nostre attività, inclusi gli insegnanti, gli orari e altro ancora.'
  },
  fr: {
    home: 'Accueil',
    activities: 'Activités',
    level: 'Niveau',
    teacher: 'Professeur',
    teachers: 'Professeurs',
    about: 'À propos',
    schedule: 'Horaire',
    description: 'Description',
    details: 'Détails',
    idealFor: 'Idéal Pour',
    mainBenefit: 'Avantage Principal',
    additionalInfo: 'Informations Supplémentaires',
    otherActivities: 'Autres Activités Qui Pourraient Vous Plaire',
    expertTeacher: 'Professeur Expert',
    allLevels: 'Tous Niveaux',
    loadingActivity: 'Chargement des données d\'activité...',
    loadingImage: 'Chargement de l\'image...',
    loadingRoom: 'Chargement des informations de la salle...',
    loadingSimilar: 'Chargement d\'activités similaires...',
    noSimilarActivities: 'Aucune activité similaire trouvée.',
    seoTitle: '{name} - Serendipity Yoga',
    seoDescription: 'Découvrez les détails de nos activités, y compris les professeurs, l\'horaire et plus encore.'
  },
  de: {
    home: 'Startseite',
    activities: 'Aktivitäten',
    level: 'Niveau',
    teacher: 'Lehrer',
    teachers: 'Lehrer',
    about: 'Über',
    schedule: 'Zeitplan',
    description: 'Beschreibung',
    details: 'Details',
    idealFor: 'Ideal Für',
    mainBenefit: 'Hauptvorteil',
    additionalInfo: 'Zusätzliche Informationen',
    otherActivities: 'Andere Aktivitäten, die Ihnen gefallen könnten',
    expertTeacher: 'Erfahrener Lehrer',
    allLevels: 'Alle Niveaus',
    loadingActivity: 'Aktivitätsdaten werden geladen...',
    loadingImage: 'Bild wird geladen...',
    loadingRoom: 'Rauminformationen werden geladen...',
    loadingSimilar: 'Ähnliche Aktivitäten werden geladen...',
    noSimilarActivities: 'Keine ähnlichen Aktivitäten gefunden.',
    seoTitle: '{name} - Serendipity Yoga',
    seoDescription: 'Entdecken Sie die Details unserer Aktivitäten, einschließlich der Lehrer, des Zeitplans und mehr.'
  },
  zh: {
    home: '首页',
    activities: '活动',
    level: '级别',
    teacher: '教师',
    teachers: '教师',
    about: '关于',
    schedule: '时间表',
    description: '描述',
    details: '详情',
    idealFor: '适合',
    mainBenefit: '主要好处',
    additionalInfo: '附加信息',
    otherActivities: '您可能喜欢的其他活动',
    expertTeacher: '专业教师',
    allLevels: '所有级别',
    loadingActivity: '正在加载活动数据...',
    loadingImage: '正在加载图片...',
    loadingRoom: '正在加载房间信息...',
    loadingSimilar: '正在加载类似活动...',
    noSimilarActivities: '未找到类似活动。',
    seoTitle: '{name} - Serendipity瑜伽',
    seoDescription: '了解我们活动的详情，包括教师、时间表等。'
  }
};

// Function to get translations
const t = (key) => {
  const lang = selectedLang.value;
  return translations[lang]?.[key] || translations.en[key];
};

// Get the slug from the route
const route = useRoute();
const slug = ref(route.params.slug);

// Data refs
const activity = ref(null);
const activityId = ref(null);
const teacher = ref(null);
const isLoading = ref(true);
const error = ref(null);
const imageLoaded = ref(false);
const imageError = ref(false);
const room = ref(null);
const isLoadingRoom = ref(false);
const activityIdsMap = ref({});
const similarActivities = ref([]);
const isLoadingSimilar = ref(false);

// Handle image loading error
const handleImageError = () => {
  imageError.value = true;
  imageLoaded.value = true;
};

// Find the activity ID and data from the slug
const findActivityIdBySlug = async () => {
  try {
    const response = await fetch(`${API_URL}/activities?lang=${selectedLang.value}`);
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    
    if (data.activities && data.activities.length > 0) {
      
      data.activities.forEach(a => {
        const activityName = a.title || a.name;
        const activitySlug = activityName.toLowerCase().replace(/\s+/g, '-');
      });
      
      // Find the activity with the matching slug
      const foundActivity = data.activities.find(a => {
        const activityName = a.title || a.name;
        const activitySlug = activityName.toLowerCase().replace(/\s+/g, '-');
        return activitySlug === slug.value;
      });
      
      if (foundActivity) {
        activityId.value = foundActivity.activity_id || foundActivity.id;
        // Set the activity data directly since we already have it
        activity.value = foundActivity;
        return foundActivity;
      } else {
        console.error("No activity matches the slug:", slug.value);
        error.value = 'Activity not found';
        isLoading.value = false;
        return null;
      }
    }
  } catch (err) {
    console.error('Error finding activity by slug:', err);
    error.value = 'Failed to locate activity';
    isLoading.value = false;
    return null;
  }
};

// Fetch teacher data by ID
const fetchTeacher = async (teacherId) => {
  if (!teacherId) return null;
  
  try {
    const response = await fetch(`${API_URL}/teacher/${teacherId}`);
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    return data.teacher;
  } catch (err) {
    console.error('Error fetching teacher:', err);
    return null;
  }
};

// Fetch teacher data when the activity is loaded
const fetchTeacherByActivity = async () => {
  if (!activityId.value) {
    return;
  }

  try {
    const url = `${API_URL}/teacher/activity/${activityId.value}`;
    
    const response = await fetch(url);

    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    const responseText = await response.text();
    
    // Parsa nuovamente come JSON
    const data = JSON.parse(responseText);

    if (data && data.teacher) {
      // Make sure teacher data is properly formatted
      if (Array.isArray(data.teacher)) {
        // It's already an array
        teacher.value = data.teacher;
      } else {
        // It's an object, put it in an array
        teacher.value = [data.teacher];
      }
      
      // Check if we have name/surname fields
      teacher.value.forEach((t, idx) => {
        // If name/surname are missing, try to set defaults
        if (!t.name && !t.surname) {
          t.name = "Yoga";
          t.surname = "Teacher";
        }
      });
      
    } else {
      // No teacher assigned to this activity
      teacher.value = null;
    }
  } catch (err) {
    console.error('Error fetching teacher:', err);
    teacher.value = null;
  }
};

// Fetch room data
const fetchRoom = async (roomId) => {
  if (!roomId) return null;
  
  try {
    isLoadingRoom.value = true;
    const response = await fetch(`${API_URL}/room/${roomId}?lang=${selectedLang.value}`);
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    if (data.room) {
      const roomActivities = data.room.activities || [];
      const legacyActivities = data.room.legacy_activities || [];
      
      room.value = {
        id: data.room.id,
        name: data.room.title || 'Yoga Room',
        image: data.room.image || `/images/default-room.jpg`,
        description: data.room.description || 'Experience the tranquility of our specially designed yoga spaces.',
        features: data.room.features || [],
        activities: roomActivities,
        legacy_activities: legacyActivities,
        quote: data.room.quote || 'Experience the transformative power of our specially designed spaces.'
      };
    }
  } catch (err) {
    console.error('Error fetching room:', err);
    room.value = null;
  } finally {
    isLoadingRoom.value = false;
  }
};

// Fetch activity data from the API
const fetchActivity = async () => {
  try {
    const foundActivity = await findActivityIdBySlug();
    if (!foundActivity) return;

    // If the activity has a roomid, fetch the room
    if (foundActivity.roomid) {
      fetchRoom(foundActivity.roomid);
    }

    // Fetch teacher and similar activities in parallel
    Promise.all([
      fetchTeacherByActivity(),
      fetchSimilarActivities()
    ]);
  } catch (err) {
    console.error('Error in fetchActivity:', err);
    error.value = 'Failed to load activity data';
  } finally {
    isLoading.value = false;
  }
};

// Fetch similar activities
const fetchSimilarActivities = async () => {
  if (!activity.value || !activity.value.id) return;
  
  isLoadingSimilar.value = true;
  try {
    const response = await fetch(`${API_URL}/activities?lang=${selectedLang.value}`);
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    if (data.activities) {
      const filtered = data.activities.filter(a => a.id !== activity.value.id);
      
      // Ensure all activities have both title and name fields populated for URL consistency
      filtered.forEach(act => {
        if (!act.title && act.name) act.title = act.name;
        if (!act.name && act.title) act.name = act.title;
        
        const activitySlug = (act.title || act.name).toLowerCase().replace(/\s+/g, '-');
      });
      
      // Shuffle the array
      const shuffled = [...filtered].sort(() => Math.random() - 0.5);
      
      // Take only 3 activities
      similarActivities.value = shuffled.slice(0, 3);
    }
  } catch (err) {
    console.error('Error fetching similar activities:', err);
    similarActivities.value = [];
  } finally {
    isLoadingSimilar.value = false;
  }
};

// Fetch data when component mounts
onMounted(() => {
  fetchActivity();
});

const scrollToTop = () => {
  if (typeof window !== 'undefined') {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }
};

// Watch for route changes
watch(() => route.params.slug, (newSlug) => {
  if (newSlug) {
    slug.value = newSlug;
    isLoading.value = true;
    error.value = null;
    imageLoaded.value = false;
    imageError.value = false;
    activityId.value = null;
    room.value = null;
    similarActivities.value = [];
    
    // Only call fetchActivity, which will handle all other fetches
    fetchActivity();
    
    // Scroll to top after content is loaded with safety check
    setTimeout(() => {
      scrollToTop();
    }, 100);
  }
}, { immediate: false });

// Remove redundant watchers that cause duplicate fetches
watch(isLoading, (newValue) => {
  if (!newValue) {
    setTimeout(() => {
      scrollToTop();
    }, 100);
  }
});

// Only keep the SEO watcher
watch(activity, (newActivity) => {
  if (newActivity) {
    useSeoMeta({
      title: t('seoTitle').replace('{name}', newActivity.title || newActivity.name),
      description: t('seoDescription'),
    });
  }
});
</script>

<style scoped>
.text-primary {
  color: #006A71;
}

:root.dark .text-primary {
  color: #9ACBD0;
}

.bg-primary {
  background-color: #006A71;
}

/* Activity Card Styles - With hover effect */
.activity-card {
  transition: all 0.4s cubic-bezier(0.25, 0.1, 0.25, 1) !important; /* Slower, more fluid cubic-bezier easing */
  will-change: transform; /* Performance optimization for animations */
  backface-visibility: hidden; /* Prevents flickering in some browsers */
}

.activity-card:hover {
  transform: scale(1.025) !important;
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1) !important;
  z-index: 10;
}

.dark .activity-card:hover {
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3) !important;
}

/* Static Activity Card - No hover effects */
.activity-card-static {
  transition: all 0.4s cubic-bezier(0.25, 0.1, 0.25, 1) !important;
  backface-visibility: hidden;
  /* No hover transform effect */
}

/* Refined animations for labels within cards */
.activity-card .group-hover\:translate-y-\[-2px\] {
  transition: all 0.5s cubic-bezier(0.25, 0.1, 0.25, 1) !important; /* Slightly delayed, more fluid motion */
}

.activity-card:hover .group-hover\:translate-y-\[-2px\] {
  transform: translateY(-2px) !important;
}

.activity-card .group-hover\:bg-opacity-100 {
  transition: all 0.5s cubic-bezier(0.25, 0.1, 0.25, 1) !important;
}

/* Loading spinner */
.loading-spinner {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  opacity: 0; /* Start hidden */
  animation: fadeIn 1s cubic-bezier(0.25, 0.1, 0.25, 1) forwards; /* Slower, more fluid animation */
}

.spinner {
  width: 50px;
  height: 50px;
  border: 5px solid rgba(0, 106, 113, 0.2);
  border-radius: 50%;
  border-top-color: #006A71;
  animation: spin 1.2s cubic-bezier(0.5, 0.1, 0.5, 1) infinite, scale 0.8s cubic-bezier(0.25, 0.1, 0.25, 1) forwards; /* Slower animations */
}

.dark .spinner {
  border-color: rgba(154, 203, 208, 0.2);
  border-top-color: #9ACBD0;
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}

@keyframes scale {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.1); /* Slightly scale up */
  }
  100% {
    transform: scale(1);
  }
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
  animation: fadeIn 0.8s cubic-bezier(0.25, 0.1, 0.25, 1) forwards; /* Slower, more fluid animation */
}

/* Dark mode transition */
.dark-transition {
  transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
}
</style> 