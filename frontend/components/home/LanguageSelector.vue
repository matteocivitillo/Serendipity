<template>
  <div class="relative inline-block text-left">
    <button
      @click="isOpen = !isOpen"
      type="button"
      class="flex items-center text-base font-medium bg-transparent text-white rounded-md focus:outline-none px-2 py-1"
      :aria-label="t('selectLanguage')"
      :aria-expanded="isOpen"
      aria-haspopup="true"
    >
      <img :src="current.flag" :alt="t('currentLanguage', { lang: current.name })" class="w-6 h-4 mr-2 rounded-sm object-cover border border-gray-200/20" />
      <span>{{ getCountryCode(current.code) }}</span>
      <svg class="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
      </svg>
    </button>
    <div v-if="isOpen" 
         class="origin-top-right absolute right-0 mt-2 w-36 rounded-md shadow-lg bg-white dark:bg-gray-700 ring-1 ring-black ring-opacity-5 z-50"
         role="menu"
         aria-orientation="vertical"
         aria-labelledby="language-menu">
      <div class="py-1" role="none">
        <button
          v-for="lang in languages"
          :key="lang.code"
          @click="select(lang.code)"
          class="flex items-center w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-600"
          :class="{ 'bg-gray-100 dark:bg-gray-600': lang.code === modelValue }"
          role="menuitem"
          :aria-label="t('switchToLanguage', { lang: lang.name })"
        >
          <img :src="lang.flag" :alt="t('languageFlag', { lang: lang.name })" class="w-6 h-4 mr-3 rounded-sm object-cover border border-gray-200/50" />
          <span>{{ getCountryCode(lang.code) }}</span>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onBeforeUnmount } from 'vue';
import { selectedLang } from '../home/NavBar.vue';
import { useRouter } from 'vue-router';

const props = defineProps({
  modelValue: { type: String, required: true },
  languages: { type: Array, required: true }
});
const emit = defineEmits(['update:modelValue']);

const isOpen = ref(false);
const current = computed(() => props.languages.find(l => l.code === props.modelValue) || props.languages[0]);

const router = useRouter();

// Translations
const translations = {
  en: {
    selectLanguage: 'Select language',
    currentLanguage: 'Current language: {lang}',
    switchToLanguage: 'Switch to {lang}',
    languageFlag: 'Flag of {lang}'
  },
  it: {
    selectLanguage: 'Seleziona lingua',
    currentLanguage: 'Lingua corrente: {lang}',
    switchToLanguage: 'Passa a {lang}',
    languageFlag: 'Bandiera di {lang}'
  },
  fr: {
    selectLanguage: 'Sélectionner la langue',
    currentLanguage: 'Langue actuelle : {lang}',
    switchToLanguage: 'Passer à {lang}',
    languageFlag: 'Drapeau de {lang}'
  },
  de: {
    selectLanguage: 'Sprache auswählen',
    currentLanguage: 'Aktuelle Sprache: {lang}',
    switchToLanguage: 'Wechseln zu {lang}',
    languageFlag: 'Flagge von {lang}'
  },
  zh: {
    selectLanguage: '选择语言',
    currentLanguage: '当前语言：{lang}',
    switchToLanguage: '切换到{lang}',
    languageFlag: '{lang}的旗帜'
  }
};

function t(key, params = {}) {
  const lang = selectedLang.value;
  let text = translations[lang]?.[key] || translations.en[key];
  return text.replace(/\{(\w+)\}/g, (_, key) => params[key] || '');
}

function select(code) {
  emit('update:modelValue', code);
  isOpen.value = false;
  
  router.push('/');
}

function getCountryCode(code) {
  if (code === 'en') return 'GB';
  if (code === 'zh') return 'CN';
  return code.toUpperCase();
}

// Close the menu if clicked outside
function handleClickOutside(event) {
  if (isOpen.value && !event.target.closest('.relative')) {
    isOpen.value = false;
  }
}

if (typeof window !== 'undefined') {
  window.addEventListener('click', handleClickOutside);
}

onBeforeUnmount(() => {
  if (typeof window !== 'undefined') {
    window.removeEventListener('click', handleClickOutside);
  }
});
</script>

<style scoped>
/* Solo stili minimali per le immagini */
img {
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}
</style> 