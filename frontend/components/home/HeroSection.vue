<template>
  <section class="w-full bg-gray-100 dark:bg-gray-800 relative -mt-[1px]">
    <div class="w-full h-screen relative overflow-hidden">
      <!-- Background Image with Overlay -->
      <div class="absolute inset-0 bg-black bg-opacity-40 dark:bg-opacity-50">
        <img src="https://dcrgvkmnavjahkprnkem.supabase.co/storage/v1/object/sign/backgrounds/hero-background.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV9jZGRmOGJkZC0zNDlkLTQyODItOWNkZi05YjVmOWI5NWUyOWYiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJiYWNrZ3JvdW5kcy9oZXJvLWJhY2tncm91bmQuanBnIiwiaWF0IjoxNzUxOTA1NzQ0LCJleHAiOjE3ODM0NDE3NDR9.lBw4wQOdAaPznPC1cih7svx_AVmjq0FHxT77mLYXQdk" alt="" class="w-full h-full object-cover" />
      </div>
      
      <div class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32 h-full flex flex-col justify-center relative z-10">
        <!-- Center Logo -->
        <div class="flex flex-col items-center mb-12">
          <img src="/images/logo-large.svg" alt="Serendipity yoga" class="h-32 mb-4 transition-opacity duration-300" />  <!-- The word "logo" is usually not an important part of the image's content or function.-->
        </div>
        
        <div class="max-w-3xl space-y-6 text-left pl-4 md:pl-16 self-start">
          <h1 class="text-5xl md:text-6xl font-bold text-white leading-tight">
            {{ t('heroTitle') }}
          </h1>
          <p class="text-xl text-gray-200">
            {{ t('heroSubtitle') }}
          </p>
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
    heroTitle: 'Discover Your Inner Peace Through Yoga',
    heroSubtitle: 'Join our community and transform your life with expert guidance in yoga, meditation, and mindful living.'
  },
  it: {
    heroTitle: 'Scopri la Tua Pace Interiore Con lo Yoga',
    heroSubtitle: 'Unisciti alla nostra comunità e trasforma la tua vita con la guida di esperti in yoga, meditazione e vita consapevole.'
  },
  fr: {
    heroTitle: 'Découvrez Votre Paix Intérieure Grâce au Yoga',
    heroSubtitle: 'Rejoignez notre communauté et transformez votre vie avec les conseils d\'experts en yoga, méditation et vie consciente.'
  },
  de: {
    heroTitle: 'Entdecke Deinen Inneren Frieden Durch Yoga',
    heroSubtitle: 'Werde Teil unserer Gemeinschaft und verändere dein Leben mit fachkundiger Anleitung in Yoga, Meditation und bewusstem Leben.'
  },
  zh: {
    heroTitle: '通过瑜伽发现内心平静',
    heroSubtitle: '加入我们的社区，在瑜伽、冥想和正念生活方面获得专业指导，改变您的生活。'
  }
};

// Function to get translations
const t = (key) => {
  const lang = selectedLang.value;
  return translations[lang]?.[key] || translations.en[key];
};
</script>

<style scoped>
.dark img {
  filter: brightness(0.9);
}
</style>

