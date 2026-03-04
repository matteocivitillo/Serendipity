<template>
  <div>
    <!-- This is just a redirect page -->
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { API_URL } from '~/utils/api'

// Query parameters to get activity ID
const route = useRoute()
const activityId = ref(route.query.id)

const redirectToNewFormat = async () => {
  if (!activityId.value) {
    navigateTo('/activities')
    return
  }
  
  try {
    // Fetch all activities
    const response = await fetch(`${API_URL}/activities`)
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`)
    }
    
    const data = await response.json()
    
    if (data.activities && data.activities.length > 0) {
      // Find the activity with matching ID
      const foundActivity = data.activities.find(a => 
        a.id === activityId.value || a.activity_id === activityId.value
      )
      
      if (foundActivity) {
        const activityName = foundActivity.title || foundActivity.name
        // Create the slug and redirect
        const slug = activityName.toLowerCase().replace(/\s+/g, '-')
        navigateTo(`/activity/${slug}`, { redirectCode: 301 })
      } else {
        // If activity not found, redirect to activities list
        navigateTo('/activities')
      }
    } else {
      navigateTo('/activities')
    }
  } catch (err) {
    console.error('Error redirecting:', err)
    navigateTo('/activities')
  }
}

onMounted(redirectToNewFormat)
</script> 