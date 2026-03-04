<template>
  <div class="flex flex-col min-h-screen dark:bg-gray-800">
    <NavBar />
    <BreadCrumbs :breadcrumbs="[
      { text: t('home'), url: '/' }, 
      { text: t('contact') }
    ]" />
    <main class="flex-grow">
      <!-- Contact section from the home page -->
      <ContactSection />
      
      <!-- FAQ Section -->
      <section class="bg-white dark:bg-gray-700 py-16 border-t border-gray-200 dark:border-gray-600">
        <div class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32">
          <h2 class="text-3xl font-bold text-primary dark:text-[#9ACBD0] text-center mb-10">{{ t('faq') }}</h2>
          
          <div class="max-w-4xl mx-auto space-y-6">
            <!-- FAQ Item 1 -->
            <div class="bg-gray-50 dark:bg-gray-600 rounded-xl shadow-lg dark:shadow-gray-900/70 p-8">
              <button 
                @click="toggleFaq(0)"
                @keydown.enter="toggleFaq(0)"
                @keydown.space="toggleFaq(0)"
                class="w-full flex justify-between items-center focus:outline-none"
                :aria-expanded="openFaqs[0]"
                :aria-controls="'faq-content-0'"
                role="button"
                tabindex="0">
                <h3 class="text-xl font-medium dark:text-white">{{ t('faq1Title') }}</h3>
                <div class="w-8 h-8 rounded-full bg-gray-300 dark:bg-gray-500 flex items-center justify-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                  </svg>
                </div>
              </button>
              <div 
                :id="'faq-content-0'"
                class="mt-4"
                :class="{ 'hidden': !openFaqs[0] }"
                role="region"
                :aria-labelledby="'faq-title-0'">
                <p class="text-gray-600 dark:text-gray-300">{{ t('faq1Answer') }}</p>
              </div>
            </div>
            
            <!-- FAQ Item 2 -->
            <div class="bg-gray-50 dark:bg-gray-600 rounded-xl shadow-lg dark:shadow-gray-900/70 p-8">
              <button 
                @click="toggleFaq(1)"
                @keydown.enter="toggleFaq(1)"
                @keydown.space="toggleFaq(1)"
                class="w-full flex justify-between items-center focus:outline-none"
                :aria-expanded="openFaqs[1]"
                :aria-controls="'faq-content-1'"
                role="button"
                tabindex="0">
                <h3 class="text-xl font-medium dark:text-white">{{ t('faq2Title') }}</h3>
                <div class="w-8 h-8 rounded-full bg-gray-300 dark:bg-gray-500 flex items-center justify-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                  </svg>
                </div>
              </button>
              <div 
                :id="'faq-content-1'"
                class="mt-4"
                :class="{ 'hidden': !openFaqs[1] }"
                role="region"
                :aria-labelledby="'faq-title-1'">
                <p class="text-gray-600 dark:text-gray-300">{{ t('faq2Answer') }}</p>
              </div>
            </div>
            
            <!-- FAQ Item 3 -->
            <div class="bg-gray-50 dark:bg-gray-600 rounded-xl shadow-lg dark:shadow-gray-900/70 p-8">
              <button 
                @click="toggleFaq(2)"
                @keydown.enter="toggleFaq(2)"
                @keydown.space="toggleFaq(2)"
                class="w-full flex justify-between items-center focus:outline-none"
                :aria-expanded="openFaqs[2]"
                :aria-controls="'faq-content-2'"
                role="button"
                tabindex="0">
                <h3 class="text-xl font-medium dark:text-white">{{ t('faq3Title') }}</h3>
                <div class="w-8 h-8 rounded-full bg-gray-300 dark:bg-gray-500 flex items-center justify-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                  </svg>
                </div>
              </button>
              <div 
                :id="'faq-content-2'"
                class="mt-4"
                :class="{ 'hidden': !openFaqs[2] }"
                role="region"
                :aria-labelledby="'faq-title-2'">
                <p class="text-gray-600 dark:text-gray-300">{{ t('faq3Answer') }}</p>
              </div>
            </div>
            
            <!-- FAQ Item 4 -->
            <div class="bg-gray-50 dark:bg-gray-600 rounded-xl shadow-lg dark:shadow-gray-900/70 p-8">
              <button 
                @click="toggleFaq(3)"
                @keydown.enter="toggleFaq(3)"
                @keydown.space="toggleFaq(3)"
                class="w-full flex justify-between items-center focus:outline-none"
                :aria-expanded="openFaqs[3]"
                :aria-controls="'faq-content-3'"
                role="button"
                tabindex="0">
                <h3 class="text-xl font-medium dark:text-white">{{ t('faq4Title') }}</h3>
                <div class="w-8 h-8 rounded-full bg-gray-300 dark:bg-gray-500 flex items-center justify-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                  </svg>
                </div>
              </button>
              <div 
                :id="'faq-content-3'"
                class="mt-4"
                :class="{ 'hidden': !openFaqs[3] }"
                role="region"
                :aria-labelledby="'faq-title-3'">
                <p class="text-gray-600 dark:text-gray-300">{{ t('faq4Answer') }}</p>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Contact Form Section -->
      <section class="bg-white dark:bg-gray-700 py-16">
        <div class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32">
          <div class="max-w-4xl mx-auto">
            <ContactForm 
              :title="t('contactFormTitle')"
              :labels="{
                name: t('formName'),
                email: t('formEmail'),
                message: t('formMessage'),
                submit: t('formSubmit'),
                successMessage: t('formSuccess')
              }"
              :placeholders="{
                name: t('formNamePlaceholder'),
                email: t('formEmailPlaceholder'),
                messageHelp: t('formMessagePlaceholder')
              }"
            />
          </div>
        </div>
      </section>
    </main>
    <SiteFooter />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import NavBar, { selectedLang } from '~/components/home/NavBar.vue'
import BreadCrumbs from '~/components/home/BreadCrumbs.vue'
import SiteFooter from '~/components/home/SiteFooter.vue'
import ContactSection from '~/components/home/ContactSection.vue'
import ContactForm from '~/components/misc/ContactForm.vue'

// Translations
const translations = {
  en: {
    home: 'Home',
    contact: 'Contact',
    faq: 'Frequently Asked Questions',
    faq1Title: 'What makes Serendipity different from other yoga studios?',
    faq1Answer: 'At Serendipity, we focus on creating a complete wellness experience. Unlike typical studios, we blend traditional yoga practices with modern techniques, offering a range of complementary activities. Our spaces are designed for tranquility with attention to every sensory detail, and our instructors are not just teachers but guides on your wellness journey.',
    faq2Title: 'Do I need to be experienced to join your classes?',
    faq2Answer: 'Not at all! We welcome practitioners of all levels, from complete beginners to advanced yogis. Our classes are designed to be adaptable, with modifications offered for different experience levels. Our supportive instructors will guide you through each pose, ensuring you practice safely at your own pace.',
    faq3Title: 'Is the swimming pool included with membership?',
    faq3Answer: 'Yes, access to our swimming pool is included with our Standard and Plus memberships. The pool is available during regular center hours, with dedicated times for different activities like open swimming, water yoga, and aqua fitness classes.',
    faq4Title: 'Do you have childcare during morning classes?',
    faq4Answer: 'We offer childcare services during select morning classes from Monday to Friday, between 9:00 AM and 12:00 PM. Our childcare specialists engage kids with age-appropriate activities while you enjoy your yoga practice. This service is available for Plus members at no extra cost and can be added to other memberships for a small fee.',
    contactFormTitle: 'FAQs not enough? Write to us!',
    formName: 'Your Name',
    formNamePlaceholder: 'John Doe',
    formEmail: 'Your Email',
    formEmailPlaceholder: 'john@example.com',
    formMessage: 'Message',
    formMessagePlaceholder: 'How can we help you?',
    formSubmit: 'Send Message',
    formSuccess: 'Message sent successfully!',
    seoTitle: 'Contact Us - Serendipity Yoga',
    seoDescription: 'Contact us for more information or to schedule a visit. We are here to help you on your wellness journey.'
  },
  it: {
    home: 'Home',
    contact: 'Contatti',
    faq: 'Domande Frequenti',
    faq1Title: 'Cosa rende Serendipity diverso dagli altri studi di yoga?',
    faq1Answer: 'A Serendipity, ci concentriamo sulla creazione di un\'esperienza completa di benessere. A differenza degli studi tipici, uniamo pratiche yoga tradizionali con tecniche moderne, offrendo una gamma di attività complementari. I nostri spazi sono progettati per la tranquillità con attenzione a ogni dettaglio sensoriale, e i nostri istruttori non sono solo insegnanti ma guide nel tuo percorso di benessere.',
    faq2Title: 'Devo avere esperienza per partecipare alle vostre lezioni?',
    faq2Answer: 'Assolutamente no! Accogliamo praticanti di tutti i livelli, dai principianti completi agli yogi avanzati. Le nostre lezioni sono pensate per essere adattabili, con modifiche offerte per i diversi livelli di esperienza. I nostri istruttori di supporto ti guideranno attraverso ogni posizione, assicurandoti di praticare in sicurezza al tuo ritmo.',
    faq3Title: 'La piscina è inclusa nell\'abbonamento?',
    faq3Answer: 'Sì, l\'accesso alla nostra piscina è incluso negli abbonamenti Standard e Plus. La piscina è disponibile durante gli orari regolari del centro, con orari dedicati per diverse attività come nuoto libero, yoga in acqua e lezioni di fitness acquatico.',
    faq4Title: 'Offrite servizio di childcare durante le lezioni mattutine?',
    faq4Answer: 'Offriamo servizi di childcare durante alcune lezioni mattutine dal lunedì al venerdì, tra le 9:00 e le 12:00. I nostri specialisti si occupano dei bambini con attività adatte all\'età mentre ti godi la tua pratica yoga. Questo servizio è disponibile per i membri Plus senza costi aggiuntivi e può essere aggiunto ad altri abbonamenti con un piccolo supplemento.',
    contactFormTitle: 'Le FAQ non bastano? Scrivici!',
    formName: 'Il tuo nome',
    formNamePlaceholder: 'Mario Rossi',
    formEmail: 'La tua email',
    formEmailPlaceholder: 'mario@esempio.com',
    formMessage: 'Messaggio',
    formMessagePlaceholder: 'Come possiamo aiutarti?',
    formSubmit: 'Invia messaggio',
    formSuccess: 'Messaggio inviato con successo!',
    seoTitle: 'Contattaci - Serendipity Yoga',
    seoDescription: 'Contattaci per maggiori informazioni o per programmare una visita. Siamo qui per aiutarti nel tuo percorso di benessere.'
  },
  fr: {
    home: 'Accueil',
    contact: 'Contact',
    faq: 'Questions fréquemment posées',
    faq1Title: 'Qu\'est-ce qui rend Serendipity différent des autres studios de yoga ?',
    faq1Answer: 'À Serendipity, nous nous concentrons sur la création d\'une expérience de bien-être complète. Contrairement aux studios typiques, nous mélangeons les pratiques de yoga traditionnelles avec des techniques modernes, offrant une gamme d\'activités complémentaires. Nos espaces sont conçus pour la tranquillité avec une attention à chaque détail sensoriel, et nos instructeurs ne sont pas seulement des enseignants mais des guides dans votre parcours de bien-être.',
    faq2Title: 'Dois-je avoir de l\'expérience pour rejoindre vos cours ?',
    faq2Answer: 'Pas du tout ! Nous accueillons des pratiquants de tous niveaux, des débutants complets aux yogis avancés. Nos cours sont conçus pour être adaptables, avec des modifications proposées pour différents niveaux d\'expérience. Nos instructeurs bienveillants vous guideront à travers chaque posture, vous assurant de pratiquer en toute sécurité à votre propre rythme.',
    faq3Title: 'La piscine est-elle incluse dans l\'abonnement ?',
    faq3Answer: 'Oui, l\'accès à notre piscine est inclus dans nos abonnements Standard et Plus. La piscine est disponible pendant les heures d\'ouverture régulières du centre, avec des horaires dédiés pour différentes activités comme la natation libre, le yoga aquatique et les cours de fitness aquatique.',
    faq4Title: 'Proposez-vous un service de garde d\'enfants pendant les cours du matin ?',
    faq4Answer: 'Nous proposons des services de garde d\'enfants pendant certains cours du matin du lundi au vendredi, entre 9h00 et 12h00. Nos spécialistes de la garde d\'enfants engagent les enfants dans des activités adaptées à leur âge pendant que vous profitez de votre pratique de yoga. Ce service est disponible pour les membres Plus sans frais supplémentaires et peut être ajouté à d\'autres abonnements pour un petit supplément.',
    contactFormTitle: 'Les FAQ ne suffisent pas ? Écrivez-nous !',
    formName: 'Votre nom',
    formNamePlaceholder: 'Jean Dupont',
    formEmail: 'Votre email',
    formEmailPlaceholder: 'jean@exemple.com',
    formMessage: 'Message',
    formMessagePlaceholder: 'Comment pouvons-nous vous aider ?',
    formSubmit: 'Envoyer le message',
    formSuccess: 'Message envoyé avec succès !',
    seoTitle: 'Contactez-nous - Serendipity Yoga',
    seoDescription: 'Contactez-nous pour plus d\'informations ou pour planifier une visite. Nous sommes là pour vous aider dans votre parcours de bien-être.'
  },
  de: {
    home: 'Startseite',
    contact: 'Kontakt',
    faq: 'Häufig gestellte Fragen',
    faq1Title: 'Was macht Serendipity anders als andere Yoga-Studios?',
    faq1Answer: 'Bei Serendipity konzentrieren wir uns darauf, ein vollständiges Wellness-Erlebnis zu schaffen. Im Gegensatz zu typischen Studios kombinieren wir traditionelle Yoga-Praktiken mit modernen Techniken und bieten eine Reihe von ergänzenden Aktivitäten an. Unsere Räume sind auf Ruhe ausgerichtet, mit Aufmerksamkeit für jedes sensorische Detail, und unsere Lehrer sind nicht nur Unterrichtende, sondern Begleiter auf Ihrer Wellness-Reise.',
    faq2Title: 'Muss ich Erfahrung haben, um an Ihren Kursen teilzunehmen?',
    faq2Answer: 'Überhaupt nicht! Wir heißen Praktiker aller Niveaus willkommen, von kompletten Anfängern bis hin zu fortgeschrittenen Yogis. Unsere Kurse sind anpassungsfähig gestaltet, mit Modifikationen für verschiedene Erfahrungsstufen. Unsere unterstützenden Lehrer werden Sie durch jede Pose führen und sicherstellen, dass Sie in Ihrem eigenen Tempo sicher praktizieren.',
    faq3Title: 'Ist der Swimmingpool in der Mitgliedschaft enthalten?',
    faq3Answer: 'Ja, der Zugang zu unserem Swimmingpool ist in unseren Standard- und Plus-Mitgliedschaften enthalten. Der Pool ist während der regulären Öffnungszeiten des Zentrums verfügbar, mit speziellen Zeiten für verschiedene Aktivitäten wie freies Schwimmen, Wasser-Yoga und Aqua-Fitnesskurse.',
    faq4Title: 'Bieten Sie Kinderbetreuung während der Morgenkurse an?',
    faq4Answer: 'Wir bieten Kinderbetreuung während ausgewählter Morgenkurse von Montag bis Freitag, zwischen 9:00 und 12:00 Uhr an. Unsere Kinderbetreuungsspezialisten beschäftigen die Kinder mit altersgerechten Aktivitäten, während Sie Ihre Yoga-Praxis genießen. Dieser Service ist für Plus-Mitglieder ohne zusätzliche Kosten verfügbar und kann für eine kleine Gebühr zu anderen Mitgliedschaften hinzugefügt werden.',
    contactFormTitle: 'FAQ nicht ausreichend? Schreiben Sie uns!',
    formName: 'Ihr Name',
    formNamePlaceholder: 'Max Mustermann',
    formEmail: 'Ihre E-Mail',
    formEmailPlaceholder: 'max@beispiel.de',
    formMessage: 'Nachricht',
    formMessagePlaceholder: 'Wie können wir Ihnen helfen?',
    formSubmit: 'Nachricht senden',
    formSuccess: 'Nachricht erfolgreich gesendet!',
    seoTitle: 'Kontaktieren Sie uns - Serendipity Yoga',
    seoDescription: 'Kontaktieren Sie uns für weitere Informationen oder um einen Besuch zu planen. Wir sind hier, um Ihnen auf Ihrem Weg zum Wohlbefinden zu helfen.'
  },
  zh: {
    home: '首页',
    contact: '联系我们',
    faq: '常见问题',
    faq1Title: '什么让Serendipity与其他瑜伽工作室不同？',
    faq1Answer: '在Serendipity，我们专注于创造完整的健康体验。与典型的工作室不同，我们将传统瑜伽实践与现代技术相结合，提供一系列互补活动。我们的空间专为宁静而设计，注重每一个感官细节，我们的教练不仅是老师，还是您健康之旅的向导。',
    faq2Title: '我需要有经验才能参加你们的课程吗？',
    faq2Answer: '完全不需要！我们欢迎各个水平的练习者，从完全的初学者到高级瑜伽士。我们的课程设计为可适应的，为不同经验水平提供修改。我们支持性的教练将引导您完成每个姿势，确保您以自己的节奏安全练习。',
    faq3Title: '会员资格包括游泳池使用吗？',
    faq3Answer: '是的，我们的标准和高级会员资格包括游泳池使用权。游泳池在中心正常开放时间内可用，有专门时段用于不同活动，如自由游泳、水中瑜伽和水中健身课程。',
    faq4Title: '你们在早上课程期间提供儿童看护服务吗？',
    faq4Answer: '我们在周一至周五早上9:00至12:00之间的特定课程期间提供儿童看护服务。当您享受瑜伽练习时，我们的儿童专家会让孩子们参与适合年龄的活动。此服务对高级会员免费提供，其他会员可以支付少量费用添加此服务。',
    contactFormTitle: '常见问题不够？给我们写信！',
    formName: '您的姓名',
    formNamePlaceholder: '张三',
    formEmail: '您的邮箱',
    formEmailPlaceholder: 'zhang@example.com',
    formMessage: '留言',
    formMessagePlaceholder: '我们如何帮助您？',
    formSubmit: '发送留言',
    formSuccess: '留言发送成功！',
    seoTitle: '联系我们 - Serendipity瑜伽',
    seoDescription: '联系我们获取更多信息或安排访问。我们在这里帮助您的健康之旅。'
  }
};

// Function to get translations
const t = (key) => {
  const lang = selectedLang.value;
  return translations[lang]?.[key] || translations.en[key];
};

// SEO metadata for this page
useSeoMeta({
  title: t('seoTitle'),
  description: t('seoDescription'),
})

const openFaqs = ref([false, false, false, false]);

const toggleFaq = (index) => {
  openFaqs.value[index] = !openFaqs.value[index];
};
</script>

<script>
export default {
  mounted() {
  }
}
</script> 

<style scoped>
.dark-transition {
  transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
}
</style> 
