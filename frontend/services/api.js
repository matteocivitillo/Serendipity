// API service for fetching data from the backend
const API_BASE_URL = 'https://hypermedia-applications.onrender.com';
//const API_BASE_URL = 'http://localhost:8000';

export async function fetchAllActivities() {
  try {
    const response = await fetch(`${API_BASE_URL}/activities`);
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    return data.activities || [];
  } catch (error) {
    console.error('Error fetching activities:', error);
    return [];
  }
}

export async function fetchActivity(id) {
  try {
    const response = await fetch(`${API_BASE_URL}/activity/${id}`);
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    return data.activity || null;
  } catch (error) {
    console.error(`Error fetching activity ${id}:`, error);
    return null;
  }
}

export async function fetchAllTeachers() {
  try {
    const response = await fetch(`${API_BASE_URL}/teachers`);
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    return data.teachers || [];
  } catch (error) {
    console.error('Error fetching teachers:', error);
    return [];
  }
}

export async function fetchTeacher(id) {
  try {
    const response = await fetch(`${API_BASE_URL}/teacher/${id}`);
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    return data.teacher || null;
  } catch (error) {
    console.error(`Error fetching teacher ${id}:`, error);
    return null;
  }
} 