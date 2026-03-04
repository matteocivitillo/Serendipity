<template>
  <section class="py-20 bg-gray-50 dark:bg-gray-700">
    <div class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32">
      <h2 class="text-4xl font-bold text-primary dark:text-[#9ACBD0] text-center mb-6">{{ t('yogaStories') }}</h2>
      <p class="text-lg text-gray-600 dark:text-gray-300 text-center max-w-3xl mx-auto mb-8">{{ t('yogaStoriesSubtitle') }}</p>
      
      <!-- Social Media Links -->
      <div class="mb-12 text-center">
        <h3 class="text-xl font-bold text-gray-700 dark:text-gray-200 mb-4">{{ t('followUs') }}</h3>
        <div class="flex justify-center space-x-6">
          <a href="https://www.facebook.com" 
              aria-label="Facebook link"
              class="text-gray-500 dark:text-gray-400 hover:text-primary dark:hover:text-[#9ACBD0] transition-colors duration-300">
            <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path fill-rule="evenodd" d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z" clip-rule="evenodd"></path>
            </svg>
          </a>
          <a href="https://www.instagram.com" 
              aria-label="Instagram link"
              class="text-gray-500 dark:text-gray-400 hover:text-primary dark:hover:text-[#9ACBD0] transition-colors duration-300">
            <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path fill-rule="evenodd" d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z" clip-rule="evenodd"></path>
            </svg>
          </a>
          <a href="https://www.youtube.com" 
              aria-label="Youtube link"
              class="text-gray-500 dark:text-gray-400 hover:text-primary dark:hover:text-[#9ACBD0] transition-colors duration-300">
            <svg class="w-7 h-7" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path d="M21.8 8.001s-.2-1.4-.8-2c-.7-.8-1.5-.8-1.9-.9C16.1 5 12 5 12 5h-.1s-4.1 0-7.1.1c-.4 0-1.2.1-1.9.9-.6.6-.8 2-.8 2S2 9.6 2 11.2v1.6c0 1.6.2 3.2.2 3.2s.2 1.4.8 2c.7.8 1.7.8 2.1.9 1.5.1 6.9.1 6.9.1s4.1 0 7.1-.1c.4 0 1.2-.1 1.9-.9.6-.6.8-2 .8-2s.2-1.6.2-3.2v-1.6c0-1.6-.2-3.2-.2-3.2zM9.8 15.1V8.9l6.2 3.1-6.2 3.1z"/>
            </svg>
          </a>
        </div>
      </div>
      
      <!-- Masonry Layout for Reviews -->
      <div v-if="isLoading" class="flex justify-center items-center h-64">
        <div class="loading-spinner animate-fade-in">
          <div class="spinner"></div>
          <p class="mt-4 text-lg text-gray-600 dark:text-gray-300">Loading reviews...</p>
        </div>
      </div>
      
      <div v-else-if="hasError" class="text-center py-10">
        <p class="text-lg text-red-500 dark:text-red-400">{{ errorMessage || 'Error loading reviews.' }}</p>
      </div>
      
      <div v-else-if="reviews.length === 0" class="text-center py-10">
        <p class="text-lg text-gray-600 dark:text-gray-300">No reviews available at the moment.</p>
      </div>
      
      <div v-else class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-5">
        <!-- Review Cards -->
        <div 
          v-for="(review, index) in reviews" 
          :key="index"
          class="bg-white dark:bg-gray-600 rounded-lg p-5 shadow-custom dark:shadow-gray-900/70 transform transition-all duration-300 hover:-translate-y-1"
          :class="{'md:col-span-2': review.featured && index < 2}"
        >
          <div class="flex items-center mb-3">
            <div class="w-10 h-10 rounded-full overflow-hidden mr-3 border-2 border-secondary dark:border-[#9ACBD0]/50">
              <img :src="review.image || '/images/default-avatar.png'" alt="" class="w-full h-full object-cover" />  <!-- Alt text is empty because it's decorative only -->
            </div>
            <div>
              <p class="text-gray-800 dark:text-gray-200 font-medium text-sm">{{ review.name }}</p>
              <p class="text-gray-500 dark:text-gray-400 text-xs">{{ review.title }}</p>
            </div>
          </div>
          
          <div class="space-y-3">
            <div class="flex items-center">
              <svg 
                v-for="star in 5" 
                :key="`star-${star}`" 
                class="w-4 h-4" 
                :class="star <= review.rating ? 'text-yellow-400' : 'text-gray-300 dark:text-gray-500'"
                fill="currentColor" 
                viewBox="0 0 20 20"
              >
                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
              </svg>
              <span class="text-gray-500 dark:text-gray-400 ml-2 text-xs">{{ review.date }}</span>
            </div>
            
            <p class="text-gray-700 dark:text-gray-300 text-sm leading-relaxed line-clamp-4">
              {{ review.review }}
            </p>
            
            <div v-if="review.image_url && review.featured" class="mt-2 rounded-lg overflow-hidden">
              <img :src="review.image_url" alt="" class="w-full h-auto" />  <!-- Alt text is empty because it's decorative only -->
            </div>
            
            <div v-if="review.activity_id" class="flex items-center mt-2 text-xs text-gray-500 dark:text-gray-400">
              <NuxtLink
                :to="review.activity_id ? `/activity/${review.activity_name.toLowerCase().replace(/\s+/g, '-')}` : ''"
                class="bg-secondary bg-opacity-20 dark:bg-opacity-30 text-primary dark:text-[#9ACBD0] py-1 px-2 rounded-full hover:underline"
              >
                {{ review.class_attended }}
              </NuxtLink>
            </div>
            <span v-else class="bg-secondary bg-opacity-20 dark:bg-opacity-30 text-primary dark:text-[#9ACBD0] py-1 px-2 rounded-full">
              {{ review.class_attended }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue';
import { API_URL } from '../../utils/api';
import NavBar, { selectedLang } from '~/components/home/NavBar.vue';

const reviews = ref([]);
const isLoading = ref(true);
const hasError = ref(false);
const errorMessage = ref('');

// Translations
const translations = {
  en: {
    yogaStories: 'Yoga Stories',
    yogaStoriesSubtitle: 'See what our community members have to say about their transformative experiences with us.',
    followUs: 'Follow Us'
  },
  it: {
    yogaStories: 'Storie di Yoga',
    yogaStoriesSubtitle: 'Scopri cosa hanno da dire i membri della nostra comunità sulle loro esperienze trasformative con noi.',
    followUs: 'Seguici'
  },
  fr: {
    yogaStories: 'Histoires de Yoga',
    yogaStoriesSubtitle: 'Découvrez ce que les membres de notre communauté ont à dire sur leurs expériences transformatrices avec nous.',
    followUs: 'Suivez-nous'
  },
  de: {
    yogaStories: 'Yoga-Geschichten',
    yogaStoriesSubtitle: 'Erfahren Sie, was die Mitglieder unserer Gemeinschaft über ihre transformativen Erfahrungen mit uns zu sagen haben.',
    followUs: 'Folgen Sie uns'
  },
  zh: {
    yogaStories: '瑜伽故事',
    yogaStoriesSubtitle: '看看我们社区成员对他们与我们一起的变革性体验有何评价。',
    followUs: '关注我们'
  }
};

// Function to get translations
const t = (key) => {
  const lang = selectedLang.value;
  return translations[lang]?.[key] || translations.en[key];
};

const fetchReviews = async () => {
  try {
    isLoading.value = true;
    const response = await fetch(`${API_URL}/reviews?lang=${selectedLang.value}`);
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    const data = await response.json();
    if (data.error) {
      errorMessage.value = data.error;
      throw new Error(data.error);
    }
    if (data.reviews && data.reviews.length > 0) {
      reviews.value = data.reviews.map(review => {
        const participant = review.participant || {};
        const activity = review.activity || {};
        let formattedDate = review.date;
        try {
          if (review.date) {
            formattedDate = new Date(review.date).toLocaleDateString('en-US', {
              year: 'numeric',
              month: 'long',
              day: 'numeric'
            });
          }
        } catch (err) {
          console.error('Error formatting date:', err);
        }
        
        
        return {
          name: participant.name || 'Yoga Enthusiast',
          image: participant.image || '/images/default-avatar.png',
          rating: review.stars || 0,
          date: formattedDate,
          review: review.review || 'Great experience at Serendipity Yoga!',
          class_attended: activity.title || 'Yoga Class',
          activity_id: review.idactivity || null,
          activity_name: activity.title || 'Yoga Class',
          featured: review.stars === 5
        };
      });
    } else {
      hasError.value = true;
      errorMessage.value = 'No reviews found.';
    }
  } catch (error) {
    console.error('Error fetching reviews:', error);
    hasError.value = true;
    errorMessage.value = error.message;
  } finally {
    isLoading.value = false;
  }
};

onMounted(fetchReviews);
watch(selectedLang, fetchReviews);
</script>

<style scoped>
.shadow-custom {
  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
}

.dark .shadow-custom {
  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.3), 0 8px 10px -6px rgba(0, 0, 0, 0.2);
}

.line-clamp-4 {
  display: -webkit-box;
  -webkit-line-clamp: 4;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

/* Loading spinner */
.loading-spinner {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  opacity: 0; /* Start hidden */
  animation: fadeIn 1s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}

.spinner {
  width: 50px;
  height: 50px;
  border: 5px solid rgba(0, 106, 113, 0.2);
  border-radius: 50%;
  border-top-color: #006A71;
  animation: spin 1.2s cubic-bezier(0.5, 0.1, 0.5, 1) infinite;
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