<template>
  <section class="py-20 dark:bg-gray-800">
    <div class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32">
      <h2 class="text-4xl font-bold text-primary dark:text-[#9ACBD0] text-center mb-6">{{ t('aboutUs') }}</h2>
      
      <!-- Contact Info -->
      <div class="flex flex-col md:flex-row justify-center items-center space-y-4 md:space-y-0 md:space-x-12 mb-12">
        <a href="tel:+1234567890" class="flex items-center space-x-3 text-gray-700 dark:text-gray-300 text-lg hover:text-primary dark:hover:text-[#9ACBD0] transition-colors">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-primary dark:text-[#9ACBD0]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
          </svg>
          <span>+1 234 567 890</span>
        </a>
        
        <a href="mailto:info@serendipity.com" class="flex items-center space-x-3 text-gray-700 dark:text-gray-300 text-lg hover:text-primary dark:hover:text-[#9ACBD0] transition-colors">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-primary dark:text-[#9ACBD0]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
          </svg>
          <span>info@serendipity.com</span>
        </a>
      </div>
      
      <!-- Map + Hours in the first row -->
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-16">
        <!-- Interactive Map -->
        <div class="bg-gray-50 dark:bg-gray-600 rounded-xl shadow-custom dark:shadow-gray-900/70 p-8 h-full flex">
          <div class="w-full h-full rounded-lg overflow-hidden flex-1">
            <!-- Google Maps Embedded -->
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2797.8929508304364!2d9.212862715528456!3d45.47972887910111!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4786c40b6fe5c5e1%3A0x8f7f8f8f8f8f8f8f!2sVia%20Stefano%20Canzio%2C%202%2C%2020131%20Milano%20MI%2C%20Italy!5e0!3m2!1sen!2sus!4v1692000000000!5m2!1sen!2sus"
              width="100%"
              style="border:0; border-radius: 8px; height: 100%;"
              allowfullscreen=""
              loading="lazy"
              referrerpolicy="no-referrer-when-downgrade"
              title="Serendipity Yoga Location Map - Via Stefano Canzio, 2, 20131 Milano MI">
            </iframe>
          </div>
        </div>
        
        <!-- Working Hours -->
        <div class="bg-gray-50 dark:bg-gray-600 rounded-xl shadow-custom dark:shadow-gray-900/70 p-8 h-full">
          <h3 class="text-2xl font-bold text-primary dark:text-[#9ACBD0] mb-6">{{ t('workingHours') }}</h3>
          
          <div class="overflow-hidden rounded-lg">
            <table class="w-full border-collapse table-alternate">
              <thead>
                <tr>
                  <th class="bg-primary text-white py-3 font-medium text-base text-left pl-4">{{ t('day') }}</th>
                  <th class="bg-primary text-white py-3 font-medium text-base text-center">{{ t('open') }}</th>
                  <th class="bg-primary text-white py-3 font-medium text-base text-center">{{ t('close') }}</th>
                </tr>
              </thead>
              <tbody>
                <tr class="border-b border-gray-200 dark:border-gray-500">
                  <td class="py-3 pl-4 text-gray-700 dark:text-gray-300">{{ t('monday') }}</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">09:00</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">21:00</td>
                </tr>
                <tr class="border-b border-gray-200 dark:border-gray-500 bg-gray-50 dark:bg-gray-500">
                  <td class="py-3 pl-4 text-gray-700 dark:text-gray-300">{{ t('tuesday') }}</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">09:00</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">21:00</td>
                </tr>
                <tr class="border-b border-gray-200 dark:border-gray-500">
                  <td class="py-3 pl-4 text-gray-700 dark:text-gray-300">{{ t('wednesday') }}</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">09:00</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">21:00</td>
                </tr>
                <tr class="border-b border-gray-200 dark:border-gray-500 bg-gray-50 dark:bg-gray-500">
                  <td class="py-3 pl-4 text-gray-700 dark:text-gray-300">{{ t('thursday') }}</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">09:00</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">21:00</td>
                </tr>
                <tr class="border-b border-gray-200 dark:border-gray-500">
                  <td class="py-3 pl-4 text-gray-700 dark:text-gray-300">{{ t('friday') }}</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">09:00</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">21:00</td>
                </tr>
                <tr class="border-b border-gray-200 dark:border-gray-500 bg-gray-50 dark:bg-gray-500">
                  <td class="py-3 pl-4 text-gray-700 dark:text-gray-300">{{ t('saturday') }}</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">10:00</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">19:00</td>
                </tr>
                <tr>
                  <td class="py-3 pl-4 text-gray-700 dark:text-gray-300">{{ t('sunday') }}</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">10:00</td>
                  <td class="py-3 text-center text-gray-700 dark:text-gray-300">15:00</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { selectedLang } from '../home/NavBar.vue';

// Translations
const translations = {
  en: {
    aboutUs: 'About Us',
    workingHours: 'Working Hours',
    day: 'DAY',
    open: 'OPEN',
    close: 'CLOSE',
    monday: 'Monday',
    tuesday: 'Tuesday',
    wednesday: 'Wednesday',
    thursday: 'Thursday',
    friday: 'Friday',
    saturday: 'Saturday',
    sunday: 'Sunday'
  },
  it: {
    aboutUs: 'Chi Siamo',
    workingHours: 'Orari di Apertura',
    day: 'GIORNO',
    open: 'APRE',
    close: 'CHIUDE',
    monday: 'Lunedì',
    tuesday: 'Martedì',
    wednesday: 'Mercoledì',
    thursday: 'Giovedì',
    friday: 'Venerdì',
    saturday: 'Sabato',
    sunday: 'Domenica'
  },
  fr: {
    aboutUs: 'À Propos de Nous',
    workingHours: 'Heures d\'Ouverture',
    day: 'JOUR',
    open: 'OUVERT',
    close: 'FERMÉ',
    monday: 'Lundi',
    tuesday: 'Mardi',
    wednesday: 'Mercredi',
    thursday: 'Jeudi',
    friday: 'Vendredi',
    saturday: 'Samedi',
    sunday: 'Dimanche'
  },
  de: {
    aboutUs: 'Über Uns',
    workingHours: 'Öffnungszeiten',
    day: 'TAG',
    open: 'ÖFFNET',
    close: 'SCHLIEßT',
    monday: 'Montag',
    tuesday: 'Dienstag',
    wednesday: 'Mittwoch',
    thursday: 'Donnerstag',
    friday: 'Freitag',
    saturday: 'Samstag',
    sunday: 'Sonntag'
  },
  zh: {
    aboutUs: '关于我们',
    workingHours: '营业时间',
    day: '天',
    open: '开放',
    close: '关闭',
    monday: '星期一',
    tuesday: '星期二',
    wednesday: '星期三',
    thursday: '星期四',
    friday: '星期五',
    saturday: '星期六',
    sunday: '星期日'
  }
};

// Function to get translations
const t = (key) => {
  const lang = selectedLang.value;
  return translations[lang]?.[key] || translations.en[key];
};
</script>

<style scoped>
.shadow-custom {
  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
}

.dark .shadow-custom {
  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.3), 0 8px 10px -6px rgba(0, 0, 0, 0.2);
}
</style> 