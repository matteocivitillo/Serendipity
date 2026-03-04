<template>
  <div class="bg-gray-50 dark:bg-gray-600 rounded-xl shadow-custom dark:shadow-gray-900/70 p-8 h-full">
    <h3 class="text-2xl font-bold text-primary dark:text-[#9ACBD0] mb-6 text-center">{{ title }}</h3>

    <form class="space-y-6" @submit.prevent="handleSubmit">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div class="space-y-2">
          <label for="name" class="text-gray-600 dark:text-gray-300 block">{{ labels.name }}</label>
          <input 
            type="text" 
            id="name" 
            v-model="formData.name"
            class="w-full px-4 py-3 rounded-lg border border-gray-200 bg-white dark:border-gray-500 dark:bg-gray-500 dark:text-white focus:border-primary dark:focus:border-[#9ACBD0] focus:ring-2 focus:ring-primary/20 dark:focus:ring-[#9ACBD0]/20 outline-none transition" 
            :placeholder="placeholders.name" 
          />
        </div>

        <div class="space-y-2">
          <label for="email" class="text-gray-600 dark:text-gray-300 block">{{ labels.email }}</label>
          <input 
            type="email" 
            id="email" 
            v-model="formData.email"
            class="w-full px-4 py-3 rounded-lg border border-gray-200 bg-white dark:border-gray-500 dark:bg-gray-500 dark:text-white focus:border-primary dark:focus:border-[#9ACBD0] focus:ring-2 focus:ring-primary/20 dark:focus:ring-[#9ACBD0]/20 outline-none transition" 
            :placeholder="placeholders.email" 
          />
        </div>
      </div>

      <div class="space-y-2">
        <label for="message" class="text-gray-600 dark:text-gray-300 block">{{ labels.message }}</label>
        <textarea 
          id="message" 
          rows="4" 
          v-model="formData.message"
          class="w-full px-4 py-3 rounded-lg border border-gray-200 bg-white dark:border-gray-500 dark:bg-gray-500 dark:text-white focus:border-primary dark:focus:border-[#9ACBD0] focus:ring-2 focus:ring-primary/20 dark:focus:ring-[#9ACBD0]/20 outline-none transition resize-none" 
          :placeholder="placeholders.messageHelp"
        ></textarea>
      </div>

      <button 
        type="submit" 
        class="w-full bg-primary hover:bg-primary-dark text-white font-medium py-3 px-4 rounded-lg transition-colors duration-300"
      >
        {{ labels.submit }}
      </button>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const props = defineProps({
  title: {
    type: String,
    default: 'Send Us a Message' // Default value if no title is provided
  },
  labels: {
    type: Object,
    default: () => ({
      name: 'Your Name',
      email: 'Your Email',
      message: 'Message',
      submit: 'Send Message',
      successMessage: 'Message sent successfully!'
    })
  },
  placeholders: {
    type: Object,
    default: () => ({
      name: 'John Doe',
      email: 'john@example.com',
      messageHelp: 'How can we help you?'
    })
  }
})

const formData = ref({
  name: '',
  email: '',
  message: ''
})

const handleSubmit = () => {
  // Reset form after submission
  formData.value = {
    name: '',
    email: '',
    message: ''
  }
  
  alert(props.labels.successMessage || 'Message sent successfully!')
}
</script>

<style scoped>
.text-primary {
  color: #006A71;
}

.bg-primary {
  background-color: #006A71;
}

.bg-primary-dark {
  background-color: #004d52;
}

.shadow-custom {
  box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
}

.dark .text-primary {
  color: #9ACBD0;
}

.dark .shadow-custom {
  box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.2), 0 2px 4px -2px rgb(0 0 0 / 0.2);
}
</style> 