import { ref } from 'vue'

export default defineNuxtPlugin({
  name: 'theme-init',
  setup() {
    // Solo client-side
    if (import.meta.client) {
      // Inizializza il tema direttamente senza useTheme per evitare onMounted
      const isDark = ref(false)
      
      const initTheme = () => {
        const savedTheme = localStorage.getItem('theme')
        if (savedTheme) {
          isDark.value = savedTheme === 'dark'
        } else {
          isDark.value = false
        }
        
        if (isDark.value) {
          document.documentElement.classList.add('dark')
        } else {
          document.documentElement.classList.remove('dark')
        }
      }
      
      // Inizializza immediatamente
      if (typeof window !== 'undefined') {
        initTheme()
      }
    }
  }
}) 