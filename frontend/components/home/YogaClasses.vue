<template>
  <section class="py-20 bg-gray-50 dark:bg-gray-700">
    <div class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32">
      <h2 class="text-4xl font-bold text-primary dark:text-[#9ACBD0] text-center mb-16">{{ t('ourYogaClasses') }}</h2>
      
      <div v-if="isLoading" class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div v-for="i in 3" :key="i" class="animate-pulse bg-white dark:bg-gray-600 rounded-xl p-8 shadow-custom dark:shadow-gray-900/70">
          <div class="h-4 bg-gray-200 dark:bg-gray-500 rounded w-1/4 mb-8"></div>
          <div class="h-6 bg-gray-300 dark:bg-gray-500 rounded w-3/4 mb-4"></div>
          <div class="h-20 bg-gray-200 dark:bg-gray-500 rounded mb-8"></div>
          <div class="flex items-center mb-6">
            <div class="rounded-full bg-gray-300 dark:bg-gray-500 h-12 w-12 mr-4"></div>
            <div>
              <div class="h-4 bg-gray-300 dark:bg-gray-500 rounded w-24 mb-2"></div>
            </div>
          </div>
          <div class="h-10 bg-gray-200 dark:bg-gray-500 rounded w-full"></div>
        </div>
      </div>
      
      <div v-else-if="hasError" class="text-center py-12">
        <p class="text-xl text-gray-600 dark:text-gray-300 mb-4">{{ t('couldNotLoadYogaClasses') }}</p>
      </div>
      
      <div v-else-if="yogaClasses.length > 0" class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <!-- Class Card -->
        <div 
          v-for="yogaClass in yogaClasses" 
          :key="yogaClass.id"
          class="bg-white dark:bg-gray-600 rounded-xl shadow-custom dark:shadow-gray-900/70 p-8 transform hover:-translate-y-2 transition-all duration-300"
        >
          <div class="mb-5">
            <span class="bg-primary bg-opacity-70 text-white text-sm font-medium py-1.5 px-4 rounded-full">
              {{ yogaClass.difficulty }}
            </span>
          </div>
          
          <div class="mb-8">
            <h3 class="text-2xl font-bold text-primary dark:text-[#9ACBD0] mb-4">{{ yogaClass.name }}</h3>
            <p class="text-gray-600 dark:text-gray-300 leading-relaxed">
              {{ yogaClass.description }}
            </p>
          </div>
          
          <div class="flex items-center">
            <div class="w-12 h-12 rounded-full bg-gray-300 dark:bg-gray-500 mr-4 overflow-hidden border-2 border-primary dark:border-[#9ACBD0]">
              <img 
                :src="yogaClass.teacher_image" 
                alt=""  
                class="w-full h-full object-cover object-center"
                onerror="this.src='/images/teacher-placeholder.jpg'"
              />  <!-- Alt text is empty because it's decorative only -->
            </div>
            <div>
              <NuxtLink 
                v-if="yogaClass.teacher_id" 
                :to="`/singleteacher?id=${yogaClass.teacher_id}`" 
                class="text-gray-800 dark:text-gray-200 font-medium hover:text-primary dark:hover:text-[#9ACBD0] transition-colors"
              >
                {{ yogaClass.teacher_name || t('yogaTeacher') }}
              </NuxtLink>
              <p v-else class="text-gray-800 dark:text-gray-200 font-medium">{{ yogaClass.teacher_name || t('yogaTeacher') }}</p>
            </div>
          </div>
          
          <NuxtLink 
            :to="`/activity/${yogaClass.name.toLowerCase()}`.replace(/\s+/g, '-')" 
            class="mt-6 block w-full bg-primary dark:bg-primary hover:bg-primary-light dark:hover:bg-primary-light text-white dark:text-[#9ACBD0] font-medium py-3 px-6 rounded-lg text-center transition-colors duration-300"
          >
            {{ t('viewDetails') }}
          </NuxtLink>
        </div>
      </div>
      
      <div v-else class="text-center py-12">
        <p class="text-xl text-gray-600 dark:text-gray-300">{{ t('noYogaClassesFound') }}</p>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue';
import { API_URL } from '../../utils/api';
import { selectedLang } from '../home/NavBar.vue';

const yogaClasses = ref([]);
const isLoading = ref(true);
const hasError = ref(false);

// List of yoga class types we want to display
const targetYogaTypes = ['hatha', 'kundalini', 'ashtanga'];

// Traduzioni
const translations = {
  en: {
    ourYogaClasses: 'Our Yoga Classes',
    couldNotLoadYogaClasses: 'Could not load yoga classes. Please try again later.',
    yogaTeacher: 'Yoga Teacher',
    viewDetails: 'View Details',
    noYogaClassesFound: 'No yoga classes found.',
    beginner: 'Beginner',
    intermediate: 'Intermediate',
    advanced: 'Advanced',
    hathaDescription: 'A slow-paced style of yoga focusing on postures (asana), breathing (pranayama) and deep relaxation.',
    kundaliniDescription: 'Intense energy work incorporating breathing, mantra, meditation and repetitive movements.',
    ashtangaDescription: 'A dynamic, physically demanding practice that synchronizes breath with a progressive series of postures.'
  },
  it: {
    ourYogaClasses: 'Le Nostre Lezioni di Yoga',
    couldNotLoadYogaClasses: 'Impossibile caricare le lezioni di yoga. Riprova più tardi.',
    yogaTeacher: 'Insegnante di Yoga',
    viewDetails: 'Vedi Dettagli',
    noYogaClassesFound: 'Nessuna lezione di yoga trovata.',
    beginner: 'Principiante',
    intermediate: 'Intermedio',
    advanced: 'Avanzato',
    hathaDescription: 'Uno stile di yoga lento che si concentra sulle posture (asana), la respirazione (pranayama) e il rilassamento profondo.',
    kundaliniDescription: 'Intenso lavoro energetico che incorpora respirazione, mantra, meditazione e movimenti ripetitivi.',
    ashtangaDescription: 'Una pratica dinamica e fisicamente impegnativa che sincronizza il respiro con una serie progressiva di posture.'
  },
  fr: {
    ourYogaClasses: 'Nos Cours de Yoga',
    couldNotLoadYogaClasses: 'Impossible de charger les cours de yoga. Veuillez réessayer plus tard.',
    yogaTeacher: 'Professeur de Yoga',
    viewDetails: 'Voir les Détails',
    noYogaClassesFound: 'Aucun cours de yoga trouvé.',
    beginner: 'Débutant',
    intermediate: 'Intermédiaire',
    advanced: 'Avancé',
    hathaDescription: 'Un style de yoga lent axé sur les postures (asana), la respiration (pranayama) et la relaxation profonde.',
    kundaliniDescription: 'Travail énergétique intense incorporant respiration, mantra, méditation et mouvements répétitifs.',
    ashtangaDescription: 'Une pratique dynamique et physiquement exigeante qui synchronise la respiration avec une série progressive de postures.'
  },
  de: {
    ourYogaClasses: 'Unsere Yoga-Kurse',
    couldNotLoadYogaClasses: 'Yoga-Kurse konnten nicht geladen werden. Bitte versuchen Sie es später erneut.',
    yogaTeacher: 'Yoga-Lehrer',
    viewDetails: 'Details Anzeigen',
    noYogaClassesFound: 'Keine Yoga-Kurse gefunden.',
    beginner: 'Anfänger',
    intermediate: 'Mittelstufe',
    advanced: 'Fortgeschritten',
    hathaDescription: 'Ein langsamer Yoga-Stil, der sich auf Körperhaltungen (Asana), Atmung (Pranayama) und tiefe Entspannung konzentriert.',
    kundaliniDescription: 'Intensive Energiearbeit mit Atmung, Mantra, Meditation und wiederholten Bewegungen.',
    ashtangaDescription: 'Eine dynamische, körperlich anspruchsvolle Praxis, die den Atem mit einer progressiven Reihe von Haltungen synchronisiert.'
  },
  zh: {
    ourYogaClasses: '我们的瑜伽课程',
    couldNotLoadYogaClasses: '无法加载瑜伽课程。请稍后再试。',
    yogaTeacher: '瑜伽老师',
    viewDetails: '查看详情',
    noYogaClassesFound: '未找到瑜伽课程。',
    beginner: '初学者',
    intermediate: '中级',
    advanced: '高级',
    hathaDescription: '一种缓慢的瑜伽风格，专注于姿势（阿萨那）、呼吸（普拉纳亚马）和深度放松。',
    kundaliniDescription: '强烈的能量工作，结合呼吸、咒语、冥想和重复性动作。',
    ashtangaDescription: '一种动态的、身体上要求严格的练习，将呼吸与一系列渐进的姿势同步。'
  }
};

// Funzione per ottenere traduzioni
const t = (key) => {
  const lang = selectedLang.value;
  return translations[lang]?.[key] || translations.en[key];
};

// Helper function to assign a difficulty level based on yoga type
function getDifficultyFromType(yogaName) {
  const lowerName = yogaName.toLowerCase();
  if (lowerName.includes('hatha')) return t('beginner');
  if (lowerName.includes('kundalini')) return t('intermediate');
  if (lowerName.includes('ashtanga')) return t('advanced');
  return null;
}

// Helper function to provide default descriptions
function getDefaultDescription(yogaName) {
  const lowerName = yogaName.toLowerCase();
  if (lowerName.includes('hatha')) {
    return t('hathaDescription');
  }
  if (lowerName.includes('kundalini')) {
    return t('kundaliniDescription');
  }
  if (lowerName.includes('ashtanga')) {
    return t('ashtangaDescription');
  }
  return '';
}

// Fetch yoga classes
const fetchYogaClasses = async () => {
  isLoading.value = true;
  hasError.value = false;
  
  try {
    const response = await fetch(`${API_URL}/activities?lang=${selectedLang.value}`);
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    
    if (data.activities && data.activities.length > 0) {
      
      // Filter per trovare queste specifiche classi di yoga
      let selectedYogaClasses = [];
            
      // Prima proviamo a trovare attività che hanno specificamente questi nomi
      targetYogaTypes.forEach(yogaType => {
        
        const matchingActivity = data.activities.find(activity => {
          const name = activity.name?.toLowerCase() || '';
          const title = activity.title?.toLowerCase() || '';
          const type = activity.type?.toLowerCase() || '';
          
          return name.includes(yogaType) || title.includes(yogaType) || type.includes(yogaType);
        });
        
        if (matchingActivity) {
          selectedYogaClasses.push(matchingActivity);
        } else {
          // Se non troviamo attività con questo nome, creiamo un'attività predefinita
          const defaultActivity = {
            id: `default-${yogaType}`,
            name: `${yogaType.charAt(0).toUpperCase() + yogaType.slice(1)} Yoga`,
            title: `${yogaType.charAt(0).toUpperCase() + yogaType.slice(1)} Yoga`,
            type: yogaType,
            difficulty: getDifficultyFromType(`${yogaType} yoga`),
            short_description: getDefaultDescription(`${yogaType} yoga`)
          };
          selectedYogaClasses.push(defaultActivity);
        }
      });
      
      // Dovremmo sempre avere almeno le attività predefinite
      if (selectedYogaClasses.length === 0) {
        console.error("No yoga classes were found or created");
        hasError.value = true;
        return;
      }
      
      // Fetch teachers
      try {
        const teacherResponse = await fetch(`${API_URL}/teachers?lang=${selectedLang.value}`);
        
        if (!teacherResponse.ok) {
          throw new Error(`HTTP error! Status: ${teacherResponse.status}`);
        }
        
        const teacherData = await teacherResponse.json();
        const teachers = teacherData.teachers || [];
        
        // Assegna insegnanti fissi per ogni tipo di yoga
        const teacherAssignments = {
          'hatha': 'Michael Chen',
          'kundalini': 'Sara Johnson',
          'ashtanga': 'Diego Martinez'
        };
        
        // Process yoga classes with teacher data
        yogaClasses.value = selectedYogaClasses.map(yoga => {
          // Ottieni nome della classe in modo che corrisponda alle specifiche richieste
          let yogaName = yoga.name || yoga.title || "Yoga Class";
          let yogaType = '';
          
          for (const type of targetYogaTypes) {
            if (yogaName.toLowerCase().includes(type)) {
              // Capitalize first letter of each word
              yogaName = type.charAt(0).toUpperCase() + type.slice(1) + " Yoga";
              yogaType = type;
              break;
            }
          }
          
          // Trova l'insegnante giusto in base al tipo di yoga
          let teacherName = teacherAssignments[yogaType] || t('yogaTeacher');
          
          // Look for a teacher with matching name or similar to our assignment
          let teacher = teachers.find(t => 
            t.name === teacherName || 
            (t.name && t.name.includes(teacherName.split(' ')[0]))
          );
          
          // If we couldn't find a match by name, assign a specific teacher based on yoga type
          if (!teacher) {
            // Find a backup teacher based on index
            const index = targetYogaTypes.indexOf(yogaType);
            if (index >= 0 && index < teachers.length) {
              teacher = teachers[index];
            } else if (teachers.length > 0) {
              // If still no match, use the first available teacher
              teacher = teachers[0];
            }
          }
          
          return {
            id: yoga.id,
            name: yogaName,
            difficulty: getDifficultyFromType(yogaName) || yoga.level || yoga.difficulty,
            description: yoga.short_description || yoga.description || getDefaultDescription(yogaName),
            teacher_name: teacher ? teacher.name : teacherName,
            teacher_image: teacher ? (teacher.image?.startsWith('http') ? teacher.image : `/images/teacher-${yogaType === 'hatha' ? '1' : yogaType === 'kundalini' ? '2' : '3'}.jpg`) : '/images/teacher-placeholder.jpg',
            teacher_id: teacher ? teacher.id : yoga.teacher_id || null
          };
        });
        
      } catch (error) {
        console.error('Failed to fetch teachers:', error);
        // If we can't get teacher info, we'll still show the yoga classes but without teacher data
        yogaClasses.value = selectedYogaClasses.map(yoga => {
          let yogaName = yoga.name || yoga.title || "Yoga Class";
          let yogaType = '';
          
          for (const type of targetYogaTypes) {
            if (yogaName.toLowerCase().includes(type)) {
              yogaName = type.charAt(0).toUpperCase() + type.slice(1) + " Yoga";
              yogaType = type;
              break;
            }
          }
          
          return {
            id: yoga.id,
            name: yogaName,
            difficulty: getDifficultyFromType(yogaName) || yoga.level || yoga.difficulty,
            description: yoga.short_description || yoga.description || getDefaultDescription(yogaName),
            teacher_name: t('yogaTeacher'),
            teacher_image: '/images/teacher-placeholder.jpg',
            teacher_id: null
          };
        });
      }
    } else {
      // No activities found in the response
      hasError.value = true;
    }
  } catch (error) {
    console.error('Failed to fetch yoga classes:', error);
    hasError.value = true;
  } finally {
    isLoading.value = false;
  }
};

onMounted(fetchYogaClasses);

// Quando cambia la lingua, aggiorna le classi yoga
watch(selectedLang, () => {
  fetchYogaClasses();
});
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

.shadow-custom {
  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
}

.dark .shadow-custom {
  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.3), 0 8px 10px -6px rgba(0, 0, 0, 0.2);
}
</style> 