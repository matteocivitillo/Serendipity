<template>
  <div class="flex flex-col min-h-screen dark:bg-gray-800">
    <NavBar />
    <BreadCrumbs :breadcrumbs="[{ text: t('home'), url: '/' }, { text: t('teachers'), url: '/teachers' }]" />
    <main class="flex-grow">
      <!-- Teachers Section -->
      <section class="bg-white dark:bg-gray-800 py-14 px-20">
        <div class="container mx-auto">
          <!-- Section Header -->
          <div class="flex flex-col items-center gap-5 mb-12">
            <h1 v-if="isLoading" class="loading-title animate-fade-in">{{ t('loadingTitle') }}</h1>
            <h1 v-else class="text-3xl font-bold text-primary dark:text-[#9ACBD0] text-center animate-fade-in">{{ t('ourTeachers') }}</h1>
            <p v-if="isLoading" class="loading-description animate-fade-in">{{ t('loadingDescription') }}</p>
            <p v-else class="text-xl text-gray-600 dark:text-gray-300 text-center max-w-3xl animate-fade-in">
              {{ t('teachersDescription') }}<br/><br/> {{ t('teachersSubDescription') }}<br />
            </p>
          </div>

          <!-- Loading State -->
          <div v-if="isLoading" class="flex justify-center items-center h-56">
            <div class="loading-spinner">
              <div class="spinner"></div>
              <p class="mt-4 text-xl text-gray-600 dark:text-gray-300">{{ t('loadingTeachers') }}</p>
            </div>
          </div>
          
          <!-- Error State -->
          <div v-else-if="error" class="flex justify-center items-center h-56">
            <p class="text-xl text-red-600">{{ error }}</p>
          </div>

          <!-- Teachers Grid - Flexible layout with auto-placement -->
          <div v-else class="flex flex-wrap justify-center gap-8 max-w-6xl mx-auto">
            <!-- Dynamic Teacher Cards -->
            <TeacherCard
              v-for="(teacher, index) in teachers"
              :key="teacher.id"
              :teacher="teacher"
              :index="index"
              :t="t"
            />
          </div>
        </div>
      </section>

      <!-- Teachers List -->
      <section class="py-16 hidden dark:bg-gray-800">
        <div class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32">
          <!-- Existing content -->
        </div>
      </section>
    </main>
    <SiteFooter />
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue'
import NavBar, { selectedLang } from '~/components/home/NavBar.vue'
import BreadCrumbs from '~/components/home/BreadCrumbs.vue'
import SiteFooter from '~/components/home/SiteFooter.vue'
import { API_URL } from '../utils/api'
import TeacherCard from '~/components/misc/TeacherCard.vue'

// Translations
const translations = {
  en: {
    home: 'Home',
    teachers: 'Teachers',
    loadingTitle: 'Loading title...',
    ourTeachers: 'Our Teachers',
    loadingDescription: 'Loading description...',
    teachersDescription: 'At Serendipity Yoga, we pride ourselves on having a team of passionate and experienced instructors who bring their diverse skills and expertise to every class.',
    teachersSubDescription: 'Below, you\'ll meet the wonderful individuals who lead our various activities and help guide you on your journey to wellness.',
    loadingTeachers: 'Loading teachers...',
    loadingImage: 'Loading image...',
    seoTitle: 'Our Teachers - Serendipity Yoga',
    seoDescription: 'Meet our dedicated teachers and learn more about their expertise and teaching style.',
    noTeachersFound: 'No teachers found',
    failedToLoad: 'Failed to load teachers',
    imageError: 'Failed to load image'
  },
  it: {
    home: 'Home',
    teachers: 'Insegnanti',
    loadingTitle: 'Caricamento titolo...',
    ourTeachers: 'I Nostri Insegnanti',
    loadingDescription: 'Caricamento descrizione...',
    teachersDescription: 'A Serendipity Yoga, siamo orgogliosi di avere un team di istruttori appassionati ed esperti che portano le loro diverse competenze in ogni lezione.',
    teachersSubDescription: 'Di seguito, conoscerai le meravigliose persone che guidano le nostre varie attività e ti aiutano nel tuo percorso verso il benessere.',
    loadingTeachers: 'Caricamento insegnanti...',
    loadingImage: 'Caricamento immagine...',
    seoTitle: 'I Nostri Insegnanti - Serendipity Yoga',
    seoDescription: 'Conosci i nostri insegnanti dedicati e scopri di più sulla loro esperienza e stile di insegnamento.',
    noTeachersFound: 'Nessun insegnante trovato',
    failedToLoad: 'Impossibile caricare gli insegnanti',
    imageError: 'Impossibile caricare l\'immagine'
  },
  fr: {
    home: 'Accueil',
    teachers: 'Professeurs',
    loadingTitle: 'Chargement du titre...',
    ourTeachers: 'Nos Professeurs',
    loadingDescription: 'Chargement de la description...',
    teachersDescription: 'À Serendipity Yoga, nous sommes fiers d\'avoir une équipe d\'instructeurs passionnés et expérimentés qui apportent leurs diverses compétences et expertises à chaque cours.',
    teachersSubDescription: 'Ci-dessous, vous rencontrerez les personnes merveilleuses qui dirigent nos diverses activités et vous aident à vous guider dans votre parcours vers le bien-être.',
    loadingTeachers: 'Chargement des professeurs...',
    loadingImage: 'Chargement de l\'image...',
    seoTitle: 'Nos Professeurs - Serendipity Yoga',
    seoDescription: 'Rencontrez nos professeurs dévoués et apprenez-en davantage sur leur expertise et leur style d\'enseignement.',
    noTeachersFound: 'Aucun professeur trouvé',
    failedToLoad: 'Échec du chargement des professeurs',
    imageError: 'Impossible de charger l\'image'
  },
  de: {
    home: 'Startseite',
    teachers: 'Lehrer',
    loadingTitle: 'Titel wird geladen...',
    ourTeachers: 'Unsere Lehrer',
    loadingDescription: 'Beschreibung wird geladen...',
    teachersDescription: 'Bei Serendipity Yoga sind wir stolz darauf, ein Team von leidenschaftlichen und erfahrenen Lehrern zu haben, die ihre vielfältigen Fähigkeiten und ihr Fachwissen in jede Klasse einbringen.',
    teachersSubDescription: 'Unten treffen Sie die wunderbaren Personen, die unsere verschiedenen Aktivitäten leiten und Ihnen auf Ihrem Weg zum Wohlbefinden helfen.',
    loadingTeachers: 'Lehrer werden geladen...',
    loadingImage: 'Bild wird geladen...',
    seoTitle: 'Unsere Lehrer - Serendipity Yoga',
    seoDescription: 'Lernen Sie unsere engagierten Lehrer kennen und erfahren Sie mehr über ihr Fachwissen und ihren Unterrichtsstil.',
    noTeachersFound: 'Keine Lehrer gefunden',
    failedToLoad: 'Lehrer konnten nicht geladen werden',
    imageError: 'Bild konnte nicht geladen werden'
  },
  zh: {
    home: '首页',
    teachers: '教师',
    loadingTitle: '正在加载标题...',
    ourTeachers: '我们的教师',
    loadingDescription: '正在加载描述...',
    teachersDescription: '在Serendipity瑜伽，我们自豪地拥有一支充满激情和经验的教师团队，他们将多样化的技能和专业知识带到每堂课程中。',
    teachersSubDescription: '在下面，您将遇见那些带领我们各种活动并帮助指导您走向健康之旅的精彩人物。',
    loadingTeachers: '正在加载教师信息...',
    loadingImage: '正在加载图片...',
    seoTitle: '我们的教师 - Serendipity瑜伽',
    seoDescription: '认识我们敬业的教师，了解更多关于他们的专业知识和教学风格。',
    noTeachersFound: '未找到教师',
    failedToLoad: '加载教师失败',
    imageError: '无法加载图片'
  }
};

// Function to get translations
const t = (key) => {
  const lang = selectedLang.value;
  return translations[lang]?.[key] || translations.en[key];
};

const teachers = ref([])
const isLoading = ref(true)
const error = ref(null)

const fetchTeachers = async () => {
  isLoading.value = true
  error.value = null
  try {
    const response = await fetch(`${API_URL}/teachers?lang=${selectedLang.value}`)
    if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`)
    const data = await response.json()
    if (data.teachers && data.teachers.length > 0) {
      teachers.value = data.teachers.map(teacher => ({
        ...teacher,
        imageLoaded: false,
        imageError: false
      }))
    } else {
      error.value = t('noTeachersFound')
    }
  } catch (err) {
    error.value = t('failedToLoad')
  } finally {
    isLoading.value = false
  }
}

onMounted(fetchTeachers)

const handleImageLoad = (teacher) => {
  teacher.imageLoaded = true
  teacher.imageError = false
}

const handleImageError = (teacher) => {
  teacher.imageError = true
  teacher.imageLoaded = false
}

// SEO metadata for this page
useSeoMeta({
  title: t('seoTitle'),
  description: t('seoDescription'),
})
</script>

<style scoped>
.text-primary {
  color: #006A71;
}

:root.dark .text-primary {
  color: #9ACBD0;
}

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

.loading-spinner {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  opacity: 0;
  animation: fadeIn 1s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
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
    transform: scale(1.1);
  }
  100% {
    transform: scale(1);
  }
}

@keyframes fadeInUp {
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

.loading-title, .loading-description {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.dark-transition {
  transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
}
</style> 