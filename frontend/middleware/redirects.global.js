/**
 * Global middleware for URL redirects
 * This handles redirecting old URL patterns to new ones
 */
export default defineNuxtRouteMiddleware((to, from) => {
  // Check if the URL matches the old pattern (/singleteacher?id=X)
  if (to.path === '/singleteacher' && to.query.id) {
    // The redirection will be handled by the singleteacher.vue page
    return;
  }
  
  // Check if the URL matches the old pattern (/singleactivity?id=X)
  if (to.path === '/singleactivity' && to.query.id) {
    // The redirection will be handled by the singleactivity.vue page
    return;
  }
}); 