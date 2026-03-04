<template>
  <footer class="bg-primary footer text-gray-300">
    <!-- Main Footer Content -->
    <div class="container mx-auto py-12 px-6 md:px-16 lg:px-24 xl:px-32">
      <div class="grid grid-cols-1 md:grid-cols-12 gap-8">
        <!-- Logo and Tagline -->
        <div class="md:col-span-3 flex flex-col items-center">
          <img src="/images/logo.svg" alt="Serendipity yoga" class="h-24 mb-2" />
          <p class="text-xs text-[#DEDEDE] text-center whitespace-normal text-[9px] md:text-[10px]">
            {{ t('tagline') }}
          </p>
        </div>
        
        <!-- Quick Links -->
        <div class="md:col-span-2 md:col-start-5 flex flex-col items-center">
          <h3 class="text-xl font-bold text-white mb-4">{{ t('quickLinks') }}</h3>
          <ul class="space-y-2 text-center">
            <li><router-link to="/center" class="text-[#DEDEDE] hover:text-white transition-colors">{{ t('aboutUs') }}</router-link></li>
            <li><a href="#" @click.prevent="goToHighlights" class="text-[#DEDEDE] hover:text-white transition-colors cursor-pointer">{{ t('highlights') }}</a></li>
            <li><router-link to="/activities" class="text-[#DEDEDE] hover:text-white transition-colors">{{ t('activities') }}</router-link></li>
            <li><router-link to="/teachers" class="text-[#DEDEDE] hover:text-white transition-colors">{{ t('teachers') }}</router-link></li>
          </ul>
        </div>
        
        <!-- Contact Information -->
        <div class="md:col-span-2 md:col-start-8 flex flex-col items-center">
          <h3 class="text-xl font-bold text-white mb-4">{{ t('contactUs') }}</h3>
          <ul class="space-y-2 text-center">
            <li class="flex items-start justify-center">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mt-0.5 mr-2 flex-shrink-0 text-[#DEDEDE]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              <span class="text-sm">Via Stefano Canzio, 2, 20131 Milano MI</span>
            </li>
            <li class="flex items-center justify-center">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 flex-shrink-0 text-[#DEDEDE]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
              </svg>
              <span>+1 234 567 890</span>
            </li>
            <li class="flex items-center justify-center">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 flex-shrink-0 text-[#DEDEDE]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
              </svg>
              <span>info@serendipity.com</span>
            </li>
          </ul>
        </div>
        
        <!-- Follow Us -->
        <div class="md:col-span-2 md:col-start-11 flex flex-col items-center">
          <h3 class="text-xl font-bold text-white mb-4">{{ t('followUs') }}</h3>
          <div class="flex space-x-4">
            <a href="https://www.facebook.com" 
                aria-label="Facebook link"
                class="text-gray-400 hover:text-white transition-colors">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z" />
              </svg>
            </a>
            <a href="https://www.instagram.com" 
                aria-label="Instagram link"
                class="text-gray-400 hover:text-white transition-colors">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.052.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98C8.333 23.986 8.741 24 12 24c3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z" />
              </svg>
            </a>
            <a href="https://www.youtube.com/" 
                aria-label="Youtube link"
                class="text-gray-400 hover:text-white transition-colors">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
              </svg>
            </a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Divider Line -->
    <div class="border-t border-gray-700 dark:border-gray-600"></div>
    
    <!-- Copyright -->
    <div class="container mx-auto px-6 md:px-16 lg:px-24 xl:px-32 py-4 text-center">
      <p class="text-sm">{{ t('copyright') }}</p>
    </div>
    
    <!-- Bottom Dark Bar -->
    <div class="h-10 bg-gray-800 dark:bg-black"></div>
  </footer>
</template>

<script>
import { selectedLang } from './NavBar.vue'

// Translations for the footer
const translations = {
  en: {
    tagline: 'TRANSFORMING LIVES THROUGH THE PRACTICE OF YOGA AND MEDITATION.',
    quickLinks: 'Quick Links',
    aboutUs: 'About Us',
    highlights: 'Highlights',
    activities: 'Activities',
    teachers: 'Teachers',
    contactUs: 'Contact Us',
    followUs: 'Follow Us',
    copyright: '© 2025 Serendipity Yoga. All rights reserved.'
  },
  it: {
    tagline: 'TRASFORMARE VITE ATTRAVERSO LA PRATICA DELLO YOGA E DELLA MEDITAZIONE.',
    quickLinks: 'Link Utili',
    aboutUs: 'Chi Siamo',
    highlights: 'In Evidenza',
    activities: 'Attività',
    teachers: 'Insegnanti',
    contactUs: 'Contattaci',
    followUs: 'Seguici',
    copyright: '© 2025 Serendipity Yoga. Tutti i diritti riservati.'
  },
  fr: {
    tagline: 'TRANSFORMER DES VIES PAR LA PRATIQUE DU YOGA ET DE LA MÉDITATION.',
    quickLinks: 'Liens Rapides',
    aboutUs: 'À Propos',
    highlights: 'À la Une',
    activities: 'Activités',
    teachers: 'Professeurs',
    contactUs: 'Contactez-nous',
    followUs: 'Suivez-nous',
    copyright: '© 2025 Serendipity Yoga. Tous droits réservés.'
  },
  de: {
    tagline: 'LEBEN DURCH DIE PRAXIS VON YOGA UND MEDITATION VERÄNDERN.',
    quickLinks: 'Schnelllinks',
    aboutUs: 'Über Uns',
    highlights: 'Highlights',
    activities: 'Aktivitäten',
    teachers: 'Lehrer',
    contactUs: 'Kontakt',
    followUs: 'Folgen Sie uns',
    copyright: '© 2025 Serendipity Yoga. Alle Rechte vorbehalten.'
  },
  zh: {
    tagline: '通过瑜伽和冥想实践改变生活。',
    quickLinks: '快速链接',
    aboutUs: '关于我们',
    highlights: '精选',
    activities: '活动',
    teachers: '教师',
    contactUs: '联系我们',
    followUs: '关注我们',
    copyright: '© 2025 Serendipity瑜伽。保留所有权利。'
  }
};

// Funzione per ottenere traduzioni
const t = (key) => {
  return translations[selectedLang.value]?.[key] || translations.en[key];
};

export default {
  data() {
    return {
      selectedLang
    }
  },
  methods: {
    t,
    goToHighlights() {
      // Navigate to home page if not already there
      if (this.$route.path !== '/') {
        // We want to scroll to the highlighted activities section
        if (typeof localStorage !== 'undefined') {
          localStorage.setItem('scrollToHighlights', 'true');
        }
        this.$router.push('/');
      } else {
        this.scrollToHighlights();
      }
    },
    scrollToHighlights() {
      // Find the Highlighted Activities section
      this.$nextTick(() => {
        // Metodo 1: HighlightedActivities è la seconda section all'interno di main
        const mainElement = document.querySelector('main');
        if (mainElement) {
          const sections = mainElement.querySelectorAll(':scope > section');
          if (sections.length >= 2) {
            const highlightsSection = sections[1]; // HighlightedActivities è la seconda sezione
            if (highlightsSection) {
              // Calculate position to center the element in viewport
              const elementRect = highlightsSection.getBoundingClientRect();
              const absoluteElementTop = elementRect.top + window.pageYOffset;
              const middle = absoluteElementTop - (window.innerHeight / 2) + (elementRect.height / 2);
              
              // Smooth scroll with animation
              window.scrollTo({
                top: middle,
                behavior: 'smooth'
              });
              return; // Stop here if we found and scrolled to the section
            }
          }
        }
        
        // Metodo 2: Fallback - cerca una sezione con il componente HighlightedActivities
        // che di solito ha classi specifiche
        const highlightsSection = document.querySelector('section.py-16.bg-white') ||
                                 document.querySelector('section.py-16.dark\\:bg-gray-800');
                                 
        if (highlightsSection) {
          // Calculate position to center the element in viewport
          const elementRect = highlightsSection.getBoundingClientRect();
          const absoluteElementTop = elementRect.top + window.pageYOffset;
          const middle = absoluteElementTop - (window.innerHeight / 2) + (elementRect.height / 2);
          
          // Smooth scroll with animation
          window.scrollTo({
            top: middle,
            behavior: 'smooth'
          });
        }
      });
    }
  }
}
</script>

<style scoped>
/* Footer transition */
footer {
  transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
}
</style> 