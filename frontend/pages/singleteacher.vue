<template>
  <div>
    <!-- This is just a redirect page -->
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { API_URL } from '~/utils/api'

// Query parameters to get teacher ID
const route = useRoute()
const teacherId = ref(route.query.id)


const redirectToNewFormat = async () => {
  
  if (!teacherId.value) {
    navigateTo('/teachers')
    return
  }
  
  try {
    // Fetch the teacher data to get the name and surname
    const response = await fetch(`${API_URL}/teacher/${teacherId.value}`)
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`)
    }
    
    const data = await response.json()
    
    if (data.teacher) {
      const { name, surname } = data.teacher
      // Create the slug and redirect
      const slug = `${name.toLowerCase()}-${surname.toLowerCase()}`.replace(/\s+/g, '-')
      navigateTo(`/teacher/${slug}`, { redirectCode: 301 })
    } else {
      // If teacher not found, redirect to teachers list
      navigateTo('/teachers')
    }
  } catch (err) {
    console.error('Error redirecting:', err)
    navigateTo('/teachers')
  }
}

onMounted(redirectToNewFormat)
</script> 