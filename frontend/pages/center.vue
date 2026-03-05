<template>
  <div class="flex flex-col min-h-screen dark:bg-gray-800">
    <NavBar />
    <BreadCrumbs
      :breadcrumbs="[{ text: 'Home', url: '/' }, { text: t('theCenter') }]"
    />
    <main class="flex-grow">
      <!-- Hero Section -->
      <section
        class="relative bg-cover bg-center h-96"
        style="background-image: url(&quot;/images/hero-background.jpg&quot;)"
      >
        <div class="absolute inset-0 bg-black bg-opacity-50"></div>
        <div
          class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32 h-full flex items-center relative z-10"
        >
          <div class="max-w-3xl">
            <h1 class="text-5xl font-bold text-white mb-6">
              {{ t("heroTitle") }}
            </h1>
            <p class="text-xl text-gray-200">{{ t("heroSubtitle") }}</p>
          </div>
        </div>
      </section>

      <!-- Features Section -->
      <section class="bg-beige dark:bg-gray-700 py-20">
        <div class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32">
          <div class="flex flex-wrap justify-center gap-12">
            <div
              class="bg-white dark:bg-gray-600 p-8 rounded-xl shadow-lg dark:shadow-gray-900/70 max-w-sm"
            >
              <div
                class="w-12 h-12 bg-primary rounded-full flex items-center justify-center mb-4"
              >
                <svg
                  class="w-6 h-6 text-white"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"
                  />
                </svg>
              </div>
              <h1
                class="text-xl font-semibold text-gray-800 dark:text-white mb-2"
              >
                {{ t("mindfulPractice") }}
              </h1>
              <p class="text-gray-600 dark:text-gray-300">
                {{ t("mindfulPracticeDesc") }}
              </p>
            </div>

            <div
              class="bg-white dark:bg-gray-600 p-8 rounded-xl shadow-lg dark:shadow-gray-900/70 max-w-sm"
            >
              <div
                class="w-12 h-12 bg-primary rounded-full flex items-center justify-center mb-4"
              >
                <svg
                  class="w-6 h-6 text-white"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"
                  />
                </svg>
              </div>
              <h1
                class="text-xl font-semibold text-gray-800 dark:text-white mb-2"
              >
                {{ t("community") }}
              </h1>
              <p class="text-gray-600 dark:text-gray-300">
                {{ t("communityDesc") }}
              </p>
            </div>

            <div
              class="bg-white dark:bg-gray-600 p-8 rounded-xl shadow-lg dark:shadow-gray-900/70 max-w-sm"
            >
              <div
                class="w-12 h-12 bg-primary rounded-full flex items-center justify-center mb-4"
              >
                <svg
                  class="w-6 h-6 text-white"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"
                  />
                </svg>
              </div>
              <h1
                class="text-xl font-semibold text-gray-800 dark:text-white mb-2"
              >
                {{ t("holisticApproach") }}
              </h1>
              <p class="text-gray-600 dark:text-gray-300">
                {{ t("holisticApproachDesc") }}
              </p>
            </div>
          </div>
        </div>
      </section>

      <!-- About the Center -->
      <section class="py-16 bg-white dark:bg-gray-800">
        <div class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32">
          <h2
            class="text-4xl font-bold text-primary dark:text-[#9ACBD0] text-center mb-8"
          >
            {{ t("centerTitle") }}
          </h2>
          <div class="flex flex-wrap md:flex-nowrap gap-16 items-center">
            <div class="w-full md:w-1/2">
              <div class="prose prose-lg max-w-none dark:prose-invert">
                <p class="mb-4 text-gray-700 dark:text-gray-300">
                  {{ t("centerDesc1") }}
                </p>
                <p class="mb-4 text-gray-700 dark:text-gray-300">
                  {{ t("centerDesc2") }}
                </p>
                <p class="mb-4 text-gray-700 dark:text-gray-300">
                  {{ t("centerDesc3") }}
                </p>
                <p class="mb-4 text-gray-700 dark:text-gray-300">
                  {{ t("centerDesc4") }}
                </p>
                <p class="font-medium text-gray-700 dark:text-gray-300">
                  {{ t("centerDesc5") }}
                </p>
              </div>
            </div>
            <div class="w-full md:w-1/2">
              <img
                :src="orientalRoomImage"
                alt=""
                class="w-full h-auto rounded-3xl shadow-lg dark:shadow-gray-900/70 object-cover h-96"
                loading="lazy"
              />
              <!-- Alt text is empty because it's decorative only -->
            </div>
          </div>
        </div>
      </section>

      <!-- Our Rooms -->
      <section class="bg-beige dark:bg-gray-700 py-16" id="rooms">
        <div class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32">
          <h2
            class="text-4xl font-bold text-primary dark:text-[#9ACBD0] text-center mb-12"
          >
            {{ t("ourYogaRooms") }}
          </h2>

          <div v-if="isLoadingRooms" class="text-center py-8">
            <p class="text-gray-600 dark:text-gray-300">
              {{ t("loadingRooms") }}
            </p>
          </div>

          <div v-else-if="errorRooms" class="text-center py-8">
            <p class="text-gray-600 dark:text-gray-300">
              {{ t("errorLoadingRooms") }}
            </p>
          </div>

          <div v-else-if="rooms.length === 0" class="text-center py-8">
            <p class="text-gray-600 dark:text-gray-300">
              {{ t("noRoomsAvailable") }}
            </p>
          </div>

          <div v-else class="relative">
            <!-- Room Carousel -->
            <div
              class="room-card-fixed"
              :style="maxRoomCardHeight ? `height: ${maxRoomCardHeight}px` : ''"
            >
              <RoomCard
                :room="rooms[currentRoomIndex]"
                :activityIdsMap="activityIdsMap"
                class="bg-white dark:bg-gray-800"
              />
            </div>

            <!-- Room navigation dots -->
            <div class="flex justify-center mt-8 space-x-2">
              <button
                v-for="(room, index) in rooms"
                :key="index"
                @click="currentRoomIndex = index"
                class="w-3 h-3 rounded-full transition-all duration-300 focus:outline-none"
                :class="
                  currentRoomIndex === index
                    ? 'bg-primary dark:bg-[#9ACBD0]'
                    : 'bg-gray-300 dark:bg-gray-500 hover:bg-gray-400 dark:hover:bg-gray-400'
                "
                :aria-label="`View ${room.name}`"
              ></button>
            </div>

            <!-- Carousel Controls -->
            <button
              @click="prevRoom"
              class="absolute left-0 top-1/2 -translate-y-1/2 -translate-x-5 bg-primary hover:bg-primary-dark w-12 h-12 rounded-full flex items-center justify-center text-white focus:outline-none z-10"
              :aria-label="t('previousRoom')"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-6 w-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M15 19l-7-7 7-7"
                />
              </svg>
            </button>
            <button
              @click="nextRoom"
              class="absolute right-0 top-1/2 -translate-y-1/2 translate-x-5 bg-primary hover:bg-primary-dark w-12 h-12 rounded-full flex items-center justify-center text-white focus:outline-none z-10"
              :aria-label="t('nextRoom')"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-6 w-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M9 5l7 7-7 7"
                />
              </svg>
            </button>
          </div>
        </div>
      </section>

      <!-- Our Areas -->
      <section class="py-16 dark:bg-gray-800" id="areas">
        <div class="container mx-auto px-8 sm:px-12 md:px-16 lg:px-24 xl:px-32">
          <h2
            class="text-4xl font-bold text-primary dark:text-[#9ACBD0] text-center mb-12"
          >
            {{ t("areasTitle") }}
          </h2>

          <div v-if="areasLoading" class="text-center py-8">
            <p class="text-gray-600 dark:text-gray-300">
              {{ t("loadingFacilities") }}
            </p>
          </div>

          <div v-else class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
            <!-- Display areas from database -->
            <div v-for="area in areas" :key="area.id" class="flex flex-col">
              <div
                class="rounded-xl shadow-lg dark:shadow-gray-900/70 overflow-hidden h-64 mb-4"
              >
                <img
                  :src="area.image"
                  alt=""
                  class="w-full h-full object-cover"
                  loading="lazy"
                  @error="
                    handleImageError($event, getDefaultImageForArea(area.title))
                  "
                />
                <!-- Alt text is empty because it's decorative only -->
              </div>
              <h3
                class="text-xl font-bold text-primary dark:text-[#9ACBD0] mb-2"
              >
                {{ area.title }}
              </h3>
              <p class="text-gray-700 dark:text-gray-300">
                {{ area.description || getDefaultDescription(area.title) }}
              </p>
            </div>
          </div>
        </div>
      </section>
    </main>
    <SiteFooter />
  </div>
</template>

<script setup>
import { ref, computed, onMounted, nextTick, watch } from "vue";
import NavBar, { selectedLang } from "~/components/home/NavBar.vue";
import BreadCrumbs from "~/components/home/BreadCrumbs.vue";
import SiteFooter from "~/components/home/SiteFooter.vue";
import RoomCard from "~/components/misc/RoomCard.vue";
import { API_URL } from "../utils/api";

// Translations
const translations = {
  en: {
    theCenter: "The Center",
    heroTitle:
      "Transforming lives through the practice of yoga and meditation.",
    heroSubtitle:
      "Join our community and transform your life with expert guidance in yoga, meditation, and mindful living.",
    mindfulPractice: "Mindful Practice",
    mindfulPracticeDesc:
      "Experience transformative yoga sessions guided by expert instructors.",
    community: "Community",
    communityDesc: "Join a welcoming community of like-minded individuals.",
    holisticApproach: "Holistic Approach",
    holisticApproachDesc:
      "Balance body, mind, and spirit through our comprehensive programs.",
    centerTitle: "Serendipity Yoga Center",
    centerDesc1:
      "At Serendipity Yoga Center, we believe true wellness begins with daily choices.",
    centerDesc2:
      "Our holistic approach blends dynamic yoga, meditation, and rejuvenating activities to guide your full transformation: a stronger body, a clearer mind, a lighter spirit.",
    centerDesc3:
      "From energizing classes to immersive retreats, sunset yoga socials to spa relaxation, every experience is a step toward your best self.",
    centerDesc4:
      "Because lifestyle change isn't about revolution, but conscious evolution.",
    centerDesc5: "Start your journey today.",
    ourYogaRooms: "Our Yoga Rooms",
    loadingRooms: "Loading rooms...",
    errorLoadingRooms: "Error loading rooms. Please try again later.",
    noRoomsAvailable: "No rooms available at the moment.",
    previousRoom: "Previous room",
    nextRoom: "Next room",
    areasTitle: "Serendipity Yoga Center - Areas",
    loadingFacilities: "Loading facilities...",
    seoTitle: "Our Center - Serendipity Yoga",
    seoDescription:
      "Explore our serene and spacious center designed to provide a comfortable and inspiring environment for your yoga practice.",
    defaultAreaDescription:
      "Experience the transformative power of our specially designed spaces.",
  },
  it: {
    theCenter: "Il Centro",
    heroTitle:
      "Trasformiamo vite attraverso la pratica dello yoga e della meditazione.",
    heroSubtitle:
      "Unisciti alla nostra comunità e trasforma la tua vita con la guida di esperti in yoga, meditazione e vita consapevole.",
    mindfulPractice: "Pratica Consapevole",
    mindfulPracticeDesc:
      "Sperimenta sessioni di yoga trasformative guidate da istruttori esperti.",
    community: "Comunità",
    communityDesc:
      "Unisciti a una comunità accogliente di persone con interessi simili.",
    holisticApproach: "Approccio Olistico",
    holisticApproachDesc:
      "Equilibra corpo, mente e spirito attraverso i nostri programmi completi.",
    centerTitle: "Centro Yoga Serendipity",
    centerDesc1:
      "Al Centro Yoga Serendipity, crediamo che il vero benessere inizi con scelte quotidiane.",
    centerDesc2:
      "Il nostro approccio olistico combina yoga dinamico, meditazione e attività ringiovanenti per guidare la tua completa trasformazione: un corpo più forte, una mente più chiara, uno spirito più leggero.",
    centerDesc3:
      "Dalle lezioni energizzanti ai ritiri immersivi, dagli eventi sociali di yoga al tramonto al relax nella spa, ogni esperienza è un passo verso la tua versione migliore.",
    centerDesc4:
      "Perché il cambiamento dello stile di vita non riguarda la rivoluzione, ma l'evoluzione consapevole.",
    centerDesc5: "Inizia il tuo viaggio oggi.",
    ourYogaRooms: "Le Nostre Sale Yoga",
    loadingRooms: "Caricamento sale...",
    errorLoadingRooms: "Errore nel caricamento delle sale. Riprova più tardi.",
    noRoomsAvailable: "Nessuna sala disponibile al momento.",
    previousRoom: "Sala precedente",
    nextRoom: "Sala successiva",
    areasTitle: "Centro Yoga Serendipity - Aree",
    loadingFacilities: "Caricamento strutture...",
    seoTitle: "Il Nostro Centro - Serendipity Yoga",
    seoDescription:
      "Esplora il nostro centro sereno e spazioso progettato per fornire un ambiente confortevole e stimolante per la tua pratica yoga.",
    defaultAreaDescription:
      "Sperimenta il potere trasformativo dei nostri spazi appositamente progettati.",
  },
  fr: {
    theCenter: "Le Centre",
    heroTitle:
      "Transformer des vies grâce à la pratique du yoga et de la méditation.",
    heroSubtitle:
      "Rejoignez notre communauté et transformez votre vie avec les conseils d'experts en yoga, méditation et vie consciente.",
    mindfulPractice: "Pratique Consciente",
    mindfulPracticeDesc:
      "Vivez des séances de yoga transformatrices guidées par des instructeurs experts.",
    community: "Communauté",
    communityDesc:
      "Rejoignez une communauté accueillante de personnes partageant les mêmes idées.",
    holisticApproach: "Approche Holistique",
    holisticApproachDesc:
      "Équilibrez le corps, l'esprit et l'âme grâce à nos programmes complets.",
    centerTitle: "Centre de Yoga Serendipity",
    centerDesc1:
      "Au Centre de Yoga Serendipity, nous croyons que le véritable bien-être commence par des choix quotidiens.",
    centerDesc2:
      "Notre approche holistique combine yoga dynamique, méditation et activités rajeunissantes pour guider votre transformation complète: un corps plus fort, un esprit plus clair, une âme plus légère.",
    centerDesc3:
      "Des cours énergisants aux retraites immersives, des rencontres yoga au coucher du soleil à la relaxation au spa, chaque expérience est un pas vers votre meilleur vous.",
    centerDesc4:
      "Parce que le changement de style de vie n'est pas une révolution, mais une évolution consciente.",
    centerDesc5: "Commencez votre voyage aujourd'hui.",
    ourYogaRooms: "Nos Salles de Yoga",
    loadingRooms: "Chargement des salles...",
    errorLoadingRooms:
      "Erreur lors du chargement des salles. Veuillez réessayer plus tard.",
    noRoomsAvailable: "Aucune salle disponible pour le moment.",
    previousRoom: "Salle précédente",
    nextRoom: "Salle suivante",
    areasTitle: "Centre de Yoga Serendipity - Espaces",
    loadingFacilities: "Chargement des installations...",
    seoTitle: "Notre Centre - Serendipity Yoga",
    seoDescription:
      "Explorez notre centre serein et spacieux conçu pour offrir un environnement confortable et inspirant pour votre pratique du yoga.",
    defaultAreaDescription:
      "Découvrez le pouvoir transformateur de nos espaces spécialement conçus.",
  },
  de: {
    theCenter: "Das Zentrum",
    heroTitle: "Leben durch die Praxis von Yoga und Meditation transformieren.",
    heroSubtitle:
      "Werden Sie Teil unserer Gemeinschaft und transformieren Sie Ihr Leben mit fachkundiger Anleitung in Yoga, Meditation und bewusstem Leben.",
    mindfulPractice: "Achtsame Praxis",
    mindfulPracticeDesc:
      "Erleben Sie transformative Yoga-Sitzungen unter der Anleitung erfahrener Lehrer.",
    community: "Gemeinschaft",
    communityDesc:
      "Treten Sie einer einladenden Gemeinschaft Gleichgesinnter bei.",
    holisticApproach: "Ganzheitlicher Ansatz",
    holisticApproachDesc:
      "Bringen Sie Körper, Geist und Seele durch unsere umfassenden Programme ins Gleichgewicht.",
    centerTitle: "Serendipity Yoga-Zentrum",
    centerDesc1:
      "Im Serendipity Yoga-Zentrum glauben wir, dass wahres Wohlbefinden mit täglichen Entscheidungen beginnt.",
    centerDesc2:
      "Unser ganzheitlicher Ansatz verbindet dynamisches Yoga, Meditation und regenerative Aktivitäten, um Ihre vollständige Transformation zu begleiten: ein stärkerer Körper, ein klarerer Geist, eine leichtere Seele.",
    centerDesc3:
      "Von energetisierenden Kursen bis hin zu immersiven Retreats, von Sonnenuntergangs-Yoga-Treffen bis hin zur Spa-Entspannung, jede Erfahrung ist ein Schritt zu Ihrem besseren Selbst.",
    centerDesc4:
      "Denn Lebensstiländerung ist keine Revolution, sondern bewusste Evolution.",
    centerDesc5: "Beginnen Sie Ihre Reise heute.",
    ourYogaRooms: "Unsere Yoga-Räume",
    loadingRooms: "Räume werden geladen...",
    errorLoadingRooms:
      "Fehler beim Laden der Räume. Bitte versuchen Sie es später erneut.",
    noRoomsAvailable: "Derzeit sind keine Räume verfügbar.",
    previousRoom: "Vorheriger Raum",
    nextRoom: "Nächster Raum",
    areasTitle: "Serendipity Yoga-Zentrum - Bereiche",
    loadingFacilities: "Einrichtungen werden geladen...",
    seoTitle: "Unser Zentrum - Serendipity Yoga",
    seoDescription:
      "Entdecken Sie unser ruhiges und geräumiges Zentrum, das eine komfortable und inspirierende Umgebung für Ihre Yoga-Praxis bietet.",
    defaultAreaDescription:
      "Erleben Sie die transformative Kraft unserer speziell gestalteten Räume.",
  },
  zh: {
    theCenter: "中心",
    heroTitle: "通过瑜伽和冥想的实践改变生活。",
    heroSubtitle:
      "加入我们的社区，在瑜伽、冥想和正念生活方面获得专业指导，改变您的生活。",
    mindfulPractice: "正念练习",
    mindfulPracticeDesc: "体验由专业教练指导的变革性瑜伽课程。",
    community: "社区",
    communityDesc: "加入志同道合者组成的友好社区。",
    holisticApproach: "整体方法",
    holisticApproachDesc: "通过我们全面的计划平衡身体、心灵和精神。",
    centerTitle: "Serendipity瑜伽中心",
    centerDesc1: "在Serendipity瑜伽中心，我们相信真正的健康始于日常选择。",
    centerDesc2:
      "我们的整体方法结合了动态瑜伽、冥想和恢复活动，指导您完成全面转变：更强健的身体，更清晰的思维，更轻盈的精神。",
    centerDesc3:
      "从充满活力的课程到沉浸式静修，从日落瑜伽社交到水疗放松，每一次体验都是迈向更好自我的一步。",
    centerDesc4: "因为生活方式的改变不是关于革命，而是关于有意识的进化。",
    centerDesc5: "今天就开始您的旅程。",
    ourYogaRooms: "我们的瑜伽房间",
    loadingRooms: "正在加载房间...",
    errorLoadingRooms: "加载房间时出错。请稍后再试。",
    noRoomsAvailable: "目前没有可用的房间。",
    previousRoom: "上一个房间",
    nextRoom: "下一个房间",
    areasTitle: "Serendipity瑜伽中心 - 区域",
    loadingFacilities: "正在加载设施...",
    seoTitle: "我们的中心 - Serendipity瑜伽",
    seoDescription:
      "探索我们宁静而宽敞的中心，为您的瑜伽练习提供舒适和鼓舞人心的环境。",
    defaultAreaDescription: "体验我们专门设计的空间的变革力量。",
  },
};

// Function to get translations
const t = (key) => {
  const lang = selectedLang.value;
  return translations[lang]?.[key] || translations.en[key];
};

// Define languages locally
const languages = [
  { code: "en", name: "English", flag: "🇬🇧" },
  { code: "it", name: "Italiano", flag: "🇮🇹" },
  { code: "fr", name: "Français", flag: "🇫🇷" },
  { code: "de", name: "Deutsch", flag: "🇩🇪" },
  { code: "zh", name: "中文", flag: "🇨🇳" },
];

// Room data
const rooms = ref([]);
const isLoadingRooms = ref(true);
const currentRoomIndex = ref(0);
const maxRoomCardHeight = ref(0);
const errorRooms = ref(null);

// Areas data
const areas = ref([]);
const areasLoading = ref(true);

// Map to store activity names to their IDs
const activityIdsMap = ref({});

// Reviews data
const reviews = ref([]);
const isLoadingReviews = ref(true);
const errorReviews = ref(null);

// Funzione per recuperare le recensioni
const fetchReviews = async () => {
  isLoadingReviews.value = true;
  errorReviews.value = null;
  try {
    const response = await fetch(
      `${API_URL}/reviews?lang=${selectedLang.value}`,
    );
    if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
    const data = await response.json();
    if (data.reviews && data.reviews.length > 0) {
      reviews.value = data.reviews;
    } else {
      errorReviews.value = "No reviews found";
    }
  } catch (err) {
    errorReviews.value = "Failed to load reviews";
  } finally {
    isLoadingReviews.value = false;
  }
};

// Funzione per aggiornare l'altezza massima delle card delle stanze
const updateMaxRoomCardHeight = async () => {
  await nextTick();

  // Troviamo tutte le room cards
  const roomCards = document.querySelectorAll(".room-card");

  if (roomCards.length === 0) return;

  // Troviamo l'altezza massima tra tutte le cards
  let maxHeight = 0;
  roomCards.forEach((card) => {
    const height = card.offsetHeight;
    if (height > maxHeight) {
      maxHeight = height;
    }
  });

  // Impostiamo l'altezza massima nel ref
  maxHeight += 40;
  maxRoomCardHeight.value = maxHeight;
};

// Funzione per recuperare le stanze
const fetchRooms = async () => {
  isLoadingRooms.value = true;
  errorRooms.value = null;
  try {
    const response = await fetch(`${API_URL}/rooms?lang=${selectedLang.value}`);
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    const data = await response.json();

    if (data.error) {
      console.error("API Error:", data.error);
      errorRooms.value = data.error;
    } else if (data.rooms && data.rooms.length > 0) {
      rooms.value = data.rooms.map((room) => {
        return {
          ...room,
        };
      });

      // Reset current index to 0 when rooms are fetched
      currentRoomIndex.value = 0;
    } else {
      rooms.value = [];
      errorRooms.value = "No rooms found";
    }
  } catch (err) {
    console.error("Error fetching rooms:", err);
    errorRooms.value = err.message;
  } finally {
    isLoadingRooms.value = false;
    if (rooms.value.length > 0) {
      updateMaxRoomCardHeight();
    }
  }
};

watch(currentRoomIndex, () => {
  updateMaxRoomCardHeight();
});

watch(selectedLang, fetchRooms);
watch(selectedLang, fetchReviews);

function nextRoom() {
  if (currentRoomIndex.value < rooms.value.length - 1) {
    currentRoomIndex.value++;
  } else {
    currentRoomIndex.value = 0;
  }
}

function prevRoom() {
  if (currentRoomIndex.value > 0) {
    currentRoomIndex.value--;
  } else {
    currentRoomIndex.value = rooms.value.length - 1;
  }
}

onMounted(() => {
  fetchRooms();
  fetchReviews();

  // Fetch areas
  areasLoading.value = true;
  fetch(`${API_URL}/areas`)
    .then((response) => response.json())
    .then((data) => {
      if (data.areas) {
        areas.value = data.areas;
      }
    })
    .catch((error) => {
      console.error("Error fetching areas:", error);
      // In case of error, use default areas
      areas.value = getDefaultAreas();
    })
    .finally(() => {
      areasLoading.value = false;
    });
});

// SEO metadata for this page
useSeoMeta({
  title: t("seoTitle"),
  description: t("seoDescription"),
});

// Default areas per quando l'API fallisce
function getDefaultAreas() {
  return [
    {
      id: 1,
      title: "Bar",
      image: "/images/areas/webp/bar.webp",
      description: getDefaultDescription("bar"),
    },
    {
      id: 2,
      title: "Play Area",
      image: "/images/areas/webp/GiochiBimbi.webp",
      description: getDefaultDescription("play area"),
    },
    {
      id: 3,
      title: "SPA",
      image: "/images/areas/webp/SPA.webp",
      description: getDefaultDescription("spa"),
    },
  ];
}

const orientalRoomImage = computed(() => {
  if (rooms.value.length === 0) {
    return "/images/meditation.jpg"; // Fallback image if no rooms are available
  }
  const orientalRoom = rooms.value.find(
    (room) => room.name && room.name.toLowerCase().includes("oriental"),
  );
  return orientalRoom ? orientalRoom.image : rooms.value[0].image;
});

// Get area image by title
function getAreaImage(title) {
  // Find the area case-insensitively
  const area = areas.value.find(
    (a) => a.title.toLowerCase() === title.toLowerCase(),
  );

  if (area && area.image) {
    return area.image;
  }

  // Fallback images if not found in database
  const fallbackImages = {
    bar: "/images/areas/webp/bar.webp",
    "play area": "/images/areas/webp/GiochiBimbi.webp",
    spa: "/images/areas/webp/SPA.webp",
  };

  return fallbackImages[title.toLowerCase()];
}

// Handle image loading errors
function handleImageError(event, fallbackSrc) {
  event.target.src = fallbackSrc;
}

// Default descriptions for areas
function getDefaultDescription(areaTitle) {
  const areaDescriptions = {
    en: {
      bar: "Our elegant bar serves fresh juices, smoothies, and healthy snacks. The perfect place to recharge after your yoga session or socialize with fellow practitioners in a peaceful atmosphere.",
      "play area":
        "A colorful and safe space where children can play while parents practice yoga. Equipped with toys and games, supervised by trained staff, allowing you to focus on your practice with peace of mind.",
      spa: "Indulge in our tranquil spa offering massage therapy, aromatherapy, and relaxation treatments that complement your yoga practice. The perfect way to enhance your wellness journey and promote deeper healing.",
    },
    it: {
      bar: "Il nostro elegante bar serve succhi freschi, frullati e snack salutari. Il luogo perfetto per ricaricarsi dopo la sessione di yoga o socializzare con altri praticanti in un'atmosfera tranquilla.",
      "play area":
        "Uno spazio colorato e sicuro dove i bambini possono giocare mentre i genitori praticano yoga. Dotato di giocattoli e giochi, supervisionato da personale qualificato, che permette di concentrarsi sulla pratica con tranquillità.",
      spa: "Concediti alla nostra tranquilla spa che offre massaggi, aromaterapia e trattamenti rilassanti che completano la tua pratica yoga. Il modo perfetto per migliorare il tuo percorso di benessere e promuovere una guarigione più profonda.",
    },
    fr: {
      bar: "Notre élégant bar sert des jus frais, des smoothies et des collations saines. L'endroit idéal pour se ressourcer après votre séance de yoga ou socialiser avec d'autres pratiquants dans une atmosphère paisible.",
      "play area":
        "Un espace coloré et sécurisé où les enfants peuvent jouer pendant que les parents pratiquent le yoga. Équipé de jouets et de jeux, supervisé par un personnel qualifié, vous permettant de vous concentrer sur votre pratique en toute tranquillité.",
      spa: "Profitez de notre spa tranquille offrant des massages, de l'aromathérapie et des traitements relaxants qui complètent votre pratique du yoga. Le moyen parfait d'améliorer votre parcours de bien-être et de favoriser une guérison plus profonde.",
    },
    de: {
      bar: "Unsere elegante Bar serviert frische Säfte, Smoothies und gesunde Snacks. Der perfekte Ort, um nach Ihrer Yoga-Sitzung neue Energie zu tanken oder sich in einer ruhigen Atmosphäre mit anderen Praktizierenden auszutauschen.",
      "play area":
        "Ein bunter und sicherer Raum, in dem Kinder spielen können, während Eltern Yoga praktizieren. Ausgestattet mit Spielzeug und Spielen, beaufsichtigt von geschultem Personal, damit Sie sich mit einem ruhigen Gewissen auf Ihre Praxis konzentrieren können.",
      spa: "Gönnen Sie sich unser ruhiges Spa mit Massagetherapie, Aromatherapie und Entspannungsbehandlungen, die Ihre Yoga-Praxis ergänzen. Der perfekte Weg, um Ihre Wellness-Reise zu verbessern und eine tiefere Heilung zu fördern.",
    },
    zh: {
      bar: "我们优雅的酒吧提供新鲜果汁、冰沙和健康小吃。这是瑜伽课后补充能量或在宁静的氛围中与其他练习者社交的完美场所。",
      "play area":
        "这是一个色彩缤纷、安全的空间，孩子们可以在父母练习瑜伽时玩耍。配备玩具和游戏，由经过培训的工作人员监督，让您可以安心专注于练习。",
      spa: "享受我们宁静的水疗中心，提供按摩疗法、芳香疗法和放松治疗，补充您的瑜伽练习。这是增强您的健康之旅并促进更深层次愈合的完美方式。",
    },
  };

  const lang = selectedLang.value;
  const lowerAreaTitle = areaTitle.toLowerCase();

  return (
    areaDescriptions[lang]?.[lowerAreaTitle] ||
    areaDescriptions.en[lowerAreaTitle] ||
    t("defaultAreaDescription")
  );
}

// Get default image for an area based on title
function getDefaultImageForArea(title) {
  const fallbackImages = {
    bar: "/images/areas/webp/bar.webp",
    "play area": "/images/areas/webp/GiochiBimbi.webp",
    spa: "/images/areas/webp/SPA.webp",
  };

  const key = title.toLowerCase();
  return fallbackImages[key] || "/images/hero-background.jpg";
}

// Navigate to a specific activity
async function navigateToActivity(activityName) {
  try {
    // If we already have the ID in our mapping, use it
    if (activityIdsMap.value[activityName]) {
      const id = activityIdsMap.value[activityName];
      window.location.href = `/activity/${activityName.toLowerCase().replace(/\s+/g, "-")}`;
      return;
    }

    // Otherwise, fetch it from the backend
    const response = await fetch(
      `${API_URL}/activity_id_from_name?name=${encodeURIComponent(activityName)}`,
    );
    if (response.ok) {
      const data = await response.json();
      if (data.id) {
        // Store the ID in our map for future use
        activityIdsMap.value[activityName] = data.id;

        // Navigate to the activity page
        window.location.href = `/activity/${activityName.toLowerCase().replace(/\s+/g, "-")}`;
      } else {
        console.error("Could not find activity ID for:", activityName);
        // Fallback to activities page
        window.location.href = "/activities";
      }
    } else {
      console.error("Error fetching activity ID:", response.statusText);
      window.location.href = "/activities";
    }
  } catch (error) {
    console.error("Error navigating to activity:", error);
    window.location.href = "/activities";
  }
}
</script>

<style scoped>
.text-primary {
  color: #006a71;
}

:root.dark .text-primary {
  color: #9acbd0;
}

.bg-primary {
  background-color: #006a71;
}

.bg-primary-light {
  background-color: #e0f2f3;
}

.bg-primary-dark {
  background-color: #00585d;
}

.bg-beige {
  background-color: #f2efe7;
}

.dark .bg-beige {
  background-color: #374151;
}

.bg-secondary {
  background-color: #f2efe7;
}

.prose img {
  margin-top: 1.5rem;
  margin-bottom: 1.5rem;
}

.dark-transition {
  transition:
    background-color 0.3s ease,
    color 0.3s ease,
    border-color 0.3s ease;
}
</style>
