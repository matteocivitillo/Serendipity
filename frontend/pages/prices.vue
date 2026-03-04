<template>
  <div class="flex flex-col min-h-screen dark:bg-gray-800">
    <NavBar />
    <BreadCrumbs :breadcrumbs="[
      { text: t('home'), url: '/' }, 
      { text: t('prices') }
    ]" />
    <main class="flex-grow">
      
      <!-- Introduction Section -->
      <section class="py-10 px-8 md:px-20 bg-gradient-to-b dark:bg-gray-800">
        <div class="container mx-auto text-center">
          <h1 class="text-3xl font-bold text-primary dark:text-[#9ACBD0] mb-4">
            {{ t('ourMembershipPlans') }}
          </h1>
          <p class="text-xl text-gray-600 dark:text-gray-200 mb-2">
            {{ t('visitReception') }}
          </p>
          <p class="text-xl text-gray-600 dark:text-gray-200 mb-2">
            {{ t('pricingOptions') }}
          </p>
        </div>
      </section>
      
      <!-- Subscription Plans by Type -->
      <section class="py-14 px-4 border-b border-gray-200 dark:border-gray-600 bg-white dark:bg-gray-700 animate-fade-in">
        <div class="container mx-auto">
          <h2 class="text-3xl font-bold text-gray-900 dark:text-white text-center mb-10 relative">
            <span class="inline-block relative">
              Yoga4You
            </span>
          </h2>
          
          <!-- Combined Features and Pricing -->
          <div class="flex flex-col lg:flex-row justify-between items-center max-w-6xl mx-auto">
            <!-- Features Box -->
            <div class="w-full lg:w-1/3 max-w-md animate-fade-in">
              <div class="bg-white dark:bg-gray-600 rounded-xl shadow-xl dark:shadow-gray-900/70 overflow-hidden border border-gray-100 dark:border-gray-500">
                <div class="bg-gradient-to-br from-primary/5 to-transparent dark:from-primary/10 dark:to-gray-600 p-5 rounded-t-xl">
                  <h3 class="text-xl font-bold text-primary dark:text-[#9ACBD0] mb-3 flex items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                    </svg>
                    {{ t('featuresIncluded') }}
                  </h3>
                  <div class="space-y-1 text-gray-600 dark:text-gray-200">
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('unlimitedAccess') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('meditationRoom') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('showers') }}
                    </p>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- Pricing Comparison -->
            <div class="w-full lg:w-3/5 max-w-xl animate-fade-in mt-6 lg:mt-0">
              <div class="bg-white dark:bg-gray-600 rounded-xl shadow-xl dark:shadow-gray-900/70 overflow-hidden border border-gray-200 dark:border-gray-500">
                <div class="overflow-x-auto w-full sm:overflow-x-visible">
                  <table class="w-full text-left text-sm sm:text-base">
                  <thead>
                    <tr class="border-b-2 dark:border-gray-500">
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('planDuration') }}</th>
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('totalPrice') }}</th>
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('monthlyEquivalent') }}</th>
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('savings') }}</th>
                    </tr>
                  </thead>
                  <tbody class="divide-y divide-gray-300 dark:divide-gray-500">
                    <tr class="bg-gray-50 dark:bg-gray-700 transition-colors">
                      <td class="px-4 py-3 font-medium text-primary dark:text-[#9ACBD0]">{{ t('monthly') }}</td>
                      <td class="px-4 py-3 font-bold text-gray-900 dark:text-white">25€</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">25€/{{ t('month') }}</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">-</td>
                    </tr>
                    <tr class="bg-white dark:bg-gray-600 transition-colors">
                      <td class="px-4 py-3 font-medium text-primary dark:text-[#9ACBD0]">{{ t('months') }}</td>
                      <td class="px-4 py-3 font-bold text-gray-900 dark:text-white">140€</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">23.33€/{{ t('month') }}</td>
                      <td class="px-4 py-3">
                        <span class="text-green-600 dark:text-green-400 text-sm font-medium px-2 py-0.5 bg-green-50 dark:bg-green-900/30 rounded-md border border-green-100 dark:border-green-700">{{ t('save') }} 10€</span>
                      </td>
                    </tr>
                    <tr class="bg-gray-50 dark:bg-gray-700 transition-colors">
                      <td class="px-4 py-3 font-medium text-primary dark:text-[#9ACBD0]">{{ t('yearly') }}</td>
                      <td class="px-4 py-3 font-bold text-gray-900 dark:text-white">270€</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">22.50€/{{ t('month') }}</td>
                      <td class="px-4 py-3">
                        <span class="text-green-600 dark:text-green-400 text-sm font-medium px-2 py-0.5 bg-green-50 dark:bg-green-900/30 rounded-md border border-green-100 dark:border-green-700">{{ t('save') }} 30€</span>
                      </td>
                    </tr>
                  </tbody>
                </table>
                </div>
                <div class="p-3 bg-gradient-to-r from-primary/5 to-primary/10 dark:from-gray-500 dark:to-gray-600 border-t dark:border-gray-500">
                  <p class="italic text-gray-700 dark:text-gray-200 text-center text-sm">{{ t('unlockYoga') }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      
      <!-- Standard Plans Section -->
      <section class="py-14 px-4 border-b border-gray-200 dark:border-gray-600 bg-white dark:bg-gray-700 animate-fade-in">
        <div class="container mx-auto">
          <h2 class="text-3xl font-bold text-gray-900 dark:text-white text-center mb-10 relative">
            <span class="inline-block relative">
              Standard
            </span>
          </h2>
          
          <!-- Combined Features and Pricing -->
          <div class="flex flex-col lg:flex-row justify-between items-center max-w-6xl mx-auto">
            <!-- Features Box -->
            <div class="w-full lg:w-1/3 max-w-md animate-fade-in">
              <div class="bg-white dark:bg-gray-600 rounded-xl shadow-xl dark:shadow-gray-900/70 overflow-hidden border border-gray-100 dark:border-gray-500">
                <div class="bg-gradient-to-br from-primary/5 to-transparent dark:from-primary/10 dark:to-gray-600 p-5 rounded-t-xl">
                  <h3 class="text-xl font-bold text-primary dark:text-[#9ACBD0] mb-3 flex items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                    </svg>
                    {{ t('featuresIncluded') }}
                  </h3>
                  <div class="space-y-1 text-gray-600 dark:text-gray-200">
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('unlimitedAccess') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('meditationRoom') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('showers') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('activitiesReservation') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('allAreas') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('spaAccess') }}
                    </p>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- Pricing Comparison -->
            <div class="w-full lg:w-3/5 max-w-xl animate-fade-in mt-6 lg:mt-0">
              <div class="bg-white dark:bg-gray-600 rounded-xl shadow-xl dark:shadow-gray-900/70 overflow-hidden border border-gray-200 dark:border-gray-500">
                <div class="overflow-x-auto w-full sm:overflow-x-visible">
                  <table class="w-full text-left text-sm sm:text-base">
                  <thead>
                    <tr class="border-b-2 dark:border-gray-500">
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('planDuration') }}</th>
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('totalPrice') }}</th>
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('monthlyEquivalent') }}</th>
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('savings') }}</th>
                    </tr>
                  </thead>
                  <tbody class="divide-y divide-gray-300 dark:divide-gray-500">
                    <tr class="bg-gray-50 dark:bg-gray-700 transition-colors">
                      <td class="px-4 py-3 font-medium text-primary dark:text-[#9ACBD0]">{{ t('monthly') }}</td>
                      <td class="px-4 py-3 font-bold text-gray-900 dark:text-white">35€</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">35€/{{ t('month') }}</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">-</td>
                    </tr>
                    <tr class="bg-white dark:bg-gray-600 transition-colors">
                      <td class="px-4 py-3 font-medium text-primary dark:text-[#9ACBD0]">{{ t('months') }}</td>
                      <td class="px-4 py-3 font-bold text-gray-900 dark:text-white">200€</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">33.33€/{{ t('month') }}</td>
                      <td class="px-4 py-3">
                        <span class="text-green-600 dark:text-green-400 text-sm font-medium px-2 py-0.5 bg-green-50 dark:bg-green-900/30 rounded-md border border-green-100 dark:border-green-700">{{ t('save') }} 10€</span>
                      </td>
                    </tr>
                    <tr class="bg-gray-50 dark:bg-gray-700 transition-colors">
                      <td class="px-4 py-3 font-medium text-primary dark:text-[#9ACBD0]">{{ t('yearly') }}</td>
                      <td class="px-4 py-3 font-bold text-gray-900 dark:text-white">380€</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">31.67€/{{ t('month') }}</td>
                      <td class="px-4 py-3">
                        <span class="text-green-600 dark:text-green-400 text-sm font-medium px-2 py-0.5 bg-green-50 dark:bg-green-900/30 rounded-md border border-green-100 dark:border-green-700">{{ t('save') }} 40€</span>
                      </td>
                    </tr>
                  </tbody>
                </table>
                </div>
                <div class="p-3 bg-gradient-to-r from-primary/5 to-primary/10 dark:from-gray-500 dark:to-gray-600 border-t dark:border-gray-500">
                  <p class="italic text-gray-700 dark:text-gray-200 text-center text-sm">{{ t('elevateAccess') }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      
      <!-- Plus Plans Section -->
      <section class="py-14 px-4 bg-white dark:bg-gray-700 animate-fade-in">
        <div class="container mx-auto">
          <h2 class="text-3xl font-bold text-gray-900 dark:text-white text-center mb-10 relative">
            <span class="inline-block relative">
              Premium
            </span>
          </h2>
          
          <!-- Combined Features and Pricing -->
          <div class="flex flex-col lg:flex-row justify-between items-center max-w-6xl mx-auto">
            <!-- Features Box -->
            <div class="w-full lg:w-1/3 max-w-md animate-fade-in">
              <div class="bg-white dark:bg-gray-600 rounded-xl shadow-xl dark:shadow-gray-900/70 overflow-hidden border border-gray-100 dark:border-gray-500">
                <div class="bg-gradient-to-br from-primary/5 to-transparent dark:from-primary/10 dark:to-gray-600 p-5 rounded-t-xl">
                  <h3 class="text-xl font-bold text-primary dark:text-[#9ACBD0] mb-3 flex items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                    </svg>
                    {{ t('featuresIncluded') }}
                  </h3>
                  <div class="space-y-1 text-gray-600 dark:text-gray-200">
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('unlimitedAccess') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('privilegedMeditation') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('showers') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('activitiesNoReservation') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('allAreas') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('spaAccess') }}
                    </p>
                    <p class="flex items-center text-gray-700 dark:text-gray-200">
                      <span class="inline-block w-5 h-5 rounded-full bg-primary/10 dark:bg-primary/20 text-primary dark:text-[#9ACBD0] mr-2 flex items-center justify-center text-xs">✓</span>
                      {{ t('barDiscounts') }}
                    </p>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- Pricing Comparison -->
            <div class="w-full lg:w-3/5 max-w-xl animate-fade-in mt-6 lg:mt-0">
              <div class="bg-white dark:bg-gray-600 rounded-xl shadow-xl dark:shadow-gray-900/70 overflow-hidden border border-gray-200 dark:border-gray-500">
                <div class="overflow-x-auto w-full sm:overflow-x-visible">
                  <table class="w-full text-left text-sm sm:text-base">
                  <thead>
                    <tr class="border-b-2 dark:border-gray-500">
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('planDuration') }}</th>
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('totalPrice') }}</th>
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('monthlyEquivalent') }}</th>
                      <th class="px-4 py-3 font-bold text-white bg-primary">{{ t('savings') }}</th>
                    </tr>
                  </thead>
                  <tbody class="divide-y divide-gray-300 dark:divide-gray-500">
                    <tr class="bg-gray-50 dark:bg-gray-700 transition-colors">
                      <td class="px-4 py-3 font-medium text-primary dark:text-[#9ACBD0]">{{ t('monthly') }}</td>
                      <td class="px-4 py-3 font-bold text-gray-900 dark:text-white">40€</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">40€/{{ t('month') }}</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">-</td>
                    </tr>
                    <tr class="bg-white dark:bg-gray-600 transition-colors">
                      <td class="px-4 py-3 font-medium text-primary dark:text-[#9ACBD0]">{{ t('months') }}</td>
                      <td class="px-4 py-3 font-bold text-gray-900 dark:text-white">220€</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">36.67€/{{ t('month') }}</td>
                      <td class="px-4 py-3">
                        <span class="text-green-600 dark:text-green-400 text-sm font-medium px-2 py-0.5 bg-green-50 dark:bg-green-900/30 rounded-md border border-green-100 dark:border-green-700">{{ t('save') }} 20€</span>
                      </td>
                    </tr>
                    <tr class="bg-gray-50 dark:bg-gray-700 transition-colors">
                      <td class="px-4 py-3 font-medium text-primary dark:text-[#9ACBD0]">{{ t('yearly') }}</td>
                      <td class="px-4 py-3 font-bold text-gray-900 dark:text-white">420€</td>
                      <td class="px-4 py-3 text-gray-700 dark:text-gray-200">35.00€/{{ t('month') }}</td>
                      <td class="px-4 py-3">
                        <span class="text-green-600 dark:text-green-400 text-sm font-medium px-2 py-0.5 bg-green-50 dark:bg-green-900/30 rounded-md border border-green-100 dark:border-green-700">{{ t('save') }} 60€</span>
                      </td>
                    </tr>
                  </tbody>
                </table>
                </div>
                <div class="p-3 bg-gradient-to-r from-primary/5 to-primary/10 dark:from-gray-500 dark:to-gray-600 border-t dark:border-gray-500">
                  <p class="italic text-gray-700 dark:text-gray-200 text-center text-sm">{{ t('ultimateWellness') }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      
      <!-- Comparison Table Section -->
      <section class="py-14 px-4 bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-600 animate-fade-in">
        <div class="container mx-auto">
          <h1 class="text-3xl font-bold text-primary dark:text-[#9ACBD0] text-center mb-4">
            {{ t('comparePlans') }}
          </h1>
          <p class="text-lg text-gray-600 dark:text-gray-200 text-center mb-6">
            {{ t('comparePlansDescription') }}
          </p>
          
          <!-- Responsive Table Wrapper -->
          <div class="max-w-5xl mx-auto overflow-x-auto w-full sm:overflow-x-visible border border-gray-200 dark:border-gray-500 rounded-xl shadow-xl dark:shadow-gray-900/70 overflow-hidden">
            <table class="w-full min-w-[600px] text-left text-sm sm:text-base rounded-xl">
              <thead>
                <tr class="bg-primary text-white">
                  <th class="px-6 py-4 font-semibold">{{ t('features') }}</th>
                  <th class="px-6 py-4 font-semibold text-center">Yoga4You</th>
                  <th class="px-6 py-4 font-semibold text-center">Standard</th>
                  <th class="px-6 py-4 font-semibold text-center">Premium</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-300 dark:divide-gray-500">
                <tr class="bg-white dark:bg-gray-600 transition-colors">
                  <td class="px-6 py-4 text-gray-800 dark:text-gray-200">{{ t('unlimitedAccess') }}</td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                </tr>
                <tr class="bg-gray-50 dark:bg-gray-700 transition-colors">
                  <td class="px-6 py-4 text-gray-800 dark:text-gray-200">{{ t('meditationRoom') }}</td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                </tr>
                <tr class="bg-white dark:bg-gray-600 transition-colors">
                  <td class="px-6 py-4 text-gray-800 dark:text-gray-200">{{ t('showers') }}</td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                </tr>
                <tr class="bg-gray-50 dark:bg-gray-700 transition-colors">
                  <td class="px-6 py-4 text-gray-800 dark:text-gray-200">{{ t('activitiesReservation') }}</td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-gray-300" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                </tr>
                <tr class="bg-white dark:bg-gray-600 transition-colors">
                  <td class="px-6 py-4 text-gray-800 dark:text-gray-200">{{ t('allAreas') }}</td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-gray-300" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                </tr>
                <tr class="bg-gray-50 dark:bg-gray-700 transition-colors">
                  <td class="px-6 py-4 text-gray-800 dark:text-gray-200">{{ t('spaAccess') }}</td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-gray-300" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                </tr>
                <tr class="bg-white dark:bg-gray-600 transition-colors">
                  <td class="px-6 py-4 text-gray-800 dark:text-gray-200">{{ t('privilegedMeditation') }}</td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-gray-300" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-gray-300" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                </tr>
                <tr class="bg-gray-50 dark:bg-gray-700 transition-colors">
                  <td class="px-6 py-4 text-gray-800 dark:text-gray-200">{{ t('activitiesNoReservation') }}</td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-gray-300" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-gray-300" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                </tr>
                <tr class="bg-white dark:bg-gray-600 transition-colors">
                  <td class="px-6 py-4 text-gray-800 dark:text-gray-200">{{ t('barDiscounts') }}</td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-gray-300" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-gray-300" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                  </td>
                  <td class="px-6 py-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mx-auto text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </td>
                </tr>
              </tbody>
            </table>
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

// Translations
const translations = {
  en: {
    home: 'Home',
    prices: 'Prices',
    ourMembershipPlans: 'Our Membership Plans',
    visitReception: 'To activate any of our subscription plans, please visit our reception desk at our center.',
    pricingOptions: 'Below you\'ll find all our available pricing options to suit your needs.',
    featuresIncluded: 'Features included',
    planDuration: 'Plan Duration',
    totalPrice: 'Total Price',
    monthlyEquivalent: 'Monthly Equivalent',
    savings: 'Savings',
    monthly: 'Monthly',
    months: '6 Months',
    yearly: 'Yearly',
    month: 'month',
    save: 'Save',
    unlockYoga: 'Unlock your yoga journey with our essential experience',
    elevateAccess: 'Elevate your practice with comprehensive access',
    ultimateWellness: 'Experience ultimate wellness with premium benefits',
    comparePlans: 'Compare Plans',
    comparePlansDescription: 'Below is a table that highlights the main feature differences for each type of membership.',
    features: 'Features',
    unlimitedAccess: 'Unlimited access to all classes',
    meditationRoom: 'Access to meditation room',
    privilegedMeditation: 'Privileged access to meditation room',
    showers: 'Use of shower facilities',
    activitiesReservation: 'Access to all activities under reservation',
    activitiesNoReservation: 'Access to all activities without reservation',
    allAreas: 'Access to all areas',
    spaAccess: 'Spa access',
    barDiscounts: 'Discounts and free drinks at the bar',
    seoTitle: 'Our Prices - Serendipity Yoga',
    seoDescription: 'Explore our pricing options for yoga classes, retreats, and spa services. Choose the perfect package to suit your needs and budget.'
  },
  it: {
    home: 'Home',
    prices: 'Prezzi',
    ourMembershipPlans: 'I Nostri Piani di Abbonamento',
    visitReception: 'Per attivare uno dei nostri piani di abbonamento, visita la reception del nostro centro.',
    pricingOptions: 'Di seguito troverai tutte le opzioni di prezzo disponibili per soddisfare le tue esigenze.',
    featuresIncluded: 'Caratteristiche incluse',
    planDuration: 'Durata del Piano',
    totalPrice: 'Prezzo Totale',
    monthlyEquivalent: 'Equivalente Mensile',
    savings: 'Risparmio',
    monthly: 'Mensile',
    months: '6 Mesi',
    yearly: 'Annuale',
    month: 'mese',
    save: 'Risparmia',
    unlockYoga: 'Sblocca il tuo percorso yoga con la nostra esperienza essenziale',
    elevateAccess: 'Eleva la tua pratica con un accesso completo',
    ultimateWellness: 'Sperimenta il benessere definitivo con benefici premium',
    comparePlans: 'Confronta i Piani',
    comparePlansDescription: 'Di seguito è riportata una tabella che evidenzia le principali differenze tra i vari tipi di abbonamento.',
    features: 'Caratteristiche',
    unlimitedAccess: 'Accesso illimitato a tutte le lezioni',
    meditationRoom: 'Accesso alla sala meditazione',
    privilegedMeditation: 'Accesso privilegiato alla sala meditazione',
    showers: 'Utilizzo delle docce',
    activitiesReservation: 'Accesso a tutte le attività su prenotazione',
    activitiesNoReservation: 'Accesso a tutte le attività senza prenotazione',
    allAreas: 'Accesso a tutte le aree',
    spaAccess: 'Accesso alla spa',
    barDiscounts: 'Sconti e bevande gratuite al bar',
    seoTitle: 'I Nostri Prezzi - Serendipity Yoga',
    seoDescription: 'Esplora le nostre opzioni di prezzo per lezioni di yoga, ritiri e servizi spa. Scegli il pacchetto perfetto per le tue esigenze e il tuo budget.'
  },
  fr: {
    home: 'Accueil',
    prices: 'Prix',
    ourMembershipPlans: 'Nos Formules d\'Abonnement',
    visitReception: 'Pour activer l\'une de nos formules d\'abonnement, veuillez vous rendre à la réception de notre centre.',
    pricingOptions: 'Vous trouverez ci-dessous toutes nos options tarifaires disponibles pour répondre à vos besoins.',
    featuresIncluded: 'Fonctionnalités incluses',
    planDuration: 'Durée du Forfait',
    totalPrice: 'Prix Total',
    monthlyEquivalent: 'Équivalent Mensuel',
    savings: 'Économies',
    monthly: 'Mensuel',
    months: '6 Mois',
    yearly: 'Annuel',
    month: 'mois',
    save: 'Économisez',
    unlockYoga: 'Débloquez votre parcours yoga avec notre expérience essentielle',
    elevateAccess: 'Élevez votre pratique avec un accès complet',
    ultimateWellness: 'Découvrez le bien-être ultime avec des avantages premium',
    comparePlans: 'Comparez les Forfaits',
    comparePlansDescription: 'Vous trouverez ci-dessous un tableau qui met en évidence les principales différences entre chaque type d\'adhésion.',
    features: 'Fonctionnalités',
    unlimitedAccess: 'Accès illimité à tous les cours',
    meditationRoom: 'Accès à la salle de méditation',
    privilegedMeditation: 'Accès privilégié à la salle de méditation',
    showers: 'Utilisation des douches',
    activitiesReservation: 'Accès à toutes les activités sous réservation',
    activitiesNoReservation: 'Accès à toutes les activités sans réservation',
    allAreas: 'Accès à toutes les zones',
    spaAccess: 'Accès au spa',
    barDiscounts: 'Réductions et boissons gratuites au bar',
    seoTitle: 'Nos Prix - Serendipity Yoga',
    seoDescription: 'Explorez nos options tarifaires pour les cours de yoga, les retraites et les services de spa. Choisissez le forfait parfait qui correspond à vos besoins et à votre budget.'
  },
  de: {
    home: 'Startseite',
    prices: 'Preise',
    ourMembershipPlans: 'Unsere Mitgliedschaftspläne',
    visitReception: 'Um einen unserer Abonnementpläne zu aktivieren, besuchen Sie bitte unseren Empfang in unserem Zentrum.',
    pricingOptions: 'Unten finden Sie alle verfügbaren Preisoptionen, die Ihren Bedürfnissen entsprechen.',
    featuresIncluded: 'Enthaltene Funktionen',
    planDuration: 'Plandauer',
    totalPrice: 'Gesamtpreis',
    monthlyEquivalent: 'Monatliches Äquivalent',
    savings: 'Ersparnis',
    monthly: 'Monatlich',
    months: '6 Monate',
    yearly: 'Jährlich',
    month: 'Monat',
    save: 'Sparen Sie',
    unlockYoga: 'Entdecken Sie Ihre Yoga-Reise mit unserem wesentlichen Erlebnis',
    elevateAccess: 'Verbessern Sie Ihre Praxis mit umfassendem Zugang',
    ultimateWellness: 'Erleben Sie ultimatives Wohlbefinden mit Premium-Vorteilen',
    comparePlans: 'Pläne vergleichen',
    comparePlansDescription: 'Unten finden Sie eine Tabelle, die die wichtigsten Unterschiede für jeden Mitgliedschaftstyp hervorhebt.',
    features: 'Funktionen',
    unlimitedAccess: 'Unbegrenzter Zugang zu allen Kursen',
    meditationRoom: 'Zugang zum Meditationsraum',
    privilegedMeditation: 'Privilegierter Zugang zum Meditationsraum',
    showers: 'Nutzung der Duscheinrichtungen',
    activitiesReservation: 'Zugang zu allen Aktivitäten mit Reservierung',
    activitiesNoReservation: 'Zugang zu allen Aktivitäten ohne Reservierung',
    allAreas: 'Zugang zu allen Bereichen',
    spaAccess: 'Spa-Zugang',
    barDiscounts: 'Rabatte und kostenlose Getränke an der Bar',
    seoTitle: 'Unsere Preise - Serendipity Yoga',
    seoDescription: 'Entdecken Sie unsere Preisoptionen für Yoga-Kurse, Retreats und Spa-Dienstleistungen. Wählen Sie das perfekte Paket für Ihre Bedürfnisse und Ihr Budget.'
  },
  zh: {
    home: '首页',
    prices: '价格',
    ourMembershipPlans: '我们的会员计划',
    visitReception: '要激活我们的任何订阅计划，请访问我们中心的接待处。',
    pricingOptions: '以下是我们所有可用的价格选项，以满足您的需求。',
    featuresIncluded: '包含的功能',
    planDuration: '计划时长',
    totalPrice: '总价',
    monthlyEquivalent: '月度等价',
    savings: '节省',
    monthly: '月度',
    months: '6个月',
    yearly: '年度',
    month: '月',
    save: '节省',
    unlockYoga: '通过我们的基本体验解锁您的瑜伽之旅',
    elevateAccess: '通过全面访问提升您的练习',
    ultimateWellness: '体验带有高级福利的终极健康',
    comparePlans: '比较计划',
    comparePlansDescription: '下面是一个表格，突出显示了每种会员类型的主要功能差异。',
    features: '功能',
    unlimitedAccess: '无限制访问所有课程',
    meditationRoom: '访问冥想室',
    privilegedMeditation: '特权访问冥想室',
    showers: '使用淋浴设施',
    activitiesReservation: '预约访问所有活动',
    activitiesNoReservation: '无需预约访问所有活动',
    allAreas: '访问所有区域',
    spaAccess: '水疗访问',
    barDiscounts: '酒吧折扣和免费饮料',
    seoTitle: '我们的价格 - Serendipity瑜伽',
    seoDescription: '探索我们的瑜伽课程、静修和水疗服务的价格选项。选择最适合您需求和预算的完美套餐。'
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
</script>

<style scoped>
.text-primary {
  color: #006A71;
}

/* Dark mode override */
:root.dark .text-primary {
  color: #9ACBD0;
}

/* Animations */
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
  animation: fadeIn 0.6s ease-out forwards;
}

/* Transition for theme switching */
.dark-transition {
  transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
}
</style> 