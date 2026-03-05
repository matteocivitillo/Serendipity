# Serendipity Yoga Center - Hypermedia Applications Project – 2024-2025

**Course**: Hypermedia Applications – Web & Multimedia <br>
**Professor**: Franca Garzotto<br>
**Assistant Professors**: Giovanni Caleffi and Matteo Secco <br>
**Team**: Civitillo, Gandini, Vicenzotto, Ye <br>
**Website**: [https://hypermedia-applications-rho.vercel.app/](https://hypermedia-applications-rho.vercel.app/) <br>
**Repository**: [GitHub](https://github.com/yexin01/hypermedia_applications) <br>

---

## Project Overview

Welcome to the **Serendipity Yoga Center** project! This repository contains a full-stack web application developed for the Hypermedia Applications course. The goal is to promote a wellness and yoga center, introduce its teaching staff, describe the various activities (Yoga classes, Retreats, Workshops, Ceramics, etc.), and provide relevant information about rooms and areas.

The project is designed with a clear separation of concerns, featuring a modern **Nuxt/Vue.js** frontend and a robust **FastAPI** Python backend, backed by a **Neon PostgreSQL** database.

---

## System Architecture & Dynamics

The project follows a standard decoupled Client-Server architecture:

### 1. Frontend (Nuxt 3 & Vue.js)

The frontend is built using **Nuxt 3**, offering fast performance and an intuitive file-based routing system.

- **Framework:** Nuxt 3 (based on Vue 3).
- **Styling:** Tailwind CSS for responsive and utility-first styling.
- **Dynamic Content:** Connects to the backend via a centralized API utility (`utils/api.js`) to fetch activities, teachers, rooms, and reviews asynchronously.
- **Localization (i18n):** Implements dynamic language switching (English and Italian). The frontend passes the requested language (`?lang=en` or `?lang=it`) directly to the backend API, which returns the strictly correct translated text without overloading the client.
- **Assets Handling:** All images, icons, and static assets are optimized (primarily `.webp` and `.jpg`) and served locally from the `public/images/` directory to ensure fast loading times and zero external dependency on storage buckets.

### 2. Backend (FastAPI - Python)

A high-performance RESTful API built with Python's **FastAPI** framework.

- **Framework:** FastAPI.
- **Database Connector:** `psycopg2-binary` is used for direct, raw, and efficient SQL queries instead of a bulky ORM.
- **Endpoints:** Provides structured JSON routes for all domains:
  - `/activities`: Retrieves all activities merging base data with their respective translations.
  - `/teachers`: Retrieves all instructors and their biographies.
  - `/rooms` & `/areas`: Provides details about the physical spaces in the center.
  - `/reviews`: Fetches user reviews and structures them by mapping them to their corresponding activities and participants.
- **Intelligent Translation Assembly:** Endpoints queries map the `_base` tables (which contain agnostic data like image URLs and IDs) with the `_translations` tables based on the requested language code. If a translation is missing, it dynamically falls back to English.
- **Configuration:** Environment variables (`.env`) safely manage connection secrets (e.g., `DATABASE_URL`).

### 3. Database (Neon PostgreSQL)

The persistent data layer is hosted on **Neon**, a serverless Postgres cloud platform.

- **Schema Design:** The relational schema is heavily normalized to support localization seamlessly. Tables are split into base tables (`activity_base`, `teacher_base`) and translation tables (`activity_translations`, `teacher_translations`).
- **Entity Relations:** Handles complex relationships such as mapping teachers to their specific activities, activities to specific rooms, and associating participant profile images with their reviews.

---

## Getting Started Locally

To run the project on your local machine, you will need to run both the frontend and backend servers.

### Prerequisites

- **Node.js** (v18 or higher) and npm.
- **Python** (v3.9 or higher).
- A valid Neon `DATABASE_URL` string for PostgreSQL.

### 1. Clone the repository

```bash
git clone https://github.com/yexin01/hypermedia_applications.git
cd hypermedia_applications
```

### 2. Backend Setup

Navigate to the backend directory, set up the Python environment, and run the server.

```bash
cd backend

# Create a virtual environment
python -m venv venv

# Activate the virtual environment
# Windows:
venv\Scripts\activate
# Mac/Linux:
# source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Create a .env file and add your database URL
echo "DATABASE_URL=your_neon_postgres_url_here" > .env

# Run the development server
uvicorn server:app --reload
```

The FastAPI backend will start on [http://127.0.0.1:8000](http://127.0.0.1:8000). You can view the Auto-generated Swagger API documentation at [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs).

### 3. Frontend Setup

Open a new terminal session, navigate to the frontend directory, and run the Nuxt development server.

```bash
cd frontend

# Install dependencies
npm install

# Run the development server
npm run dev
```

The frontend application will be available at [http://localhost:3000](http://localhost:3000).
Any edits made to the `frontend/` codebase will instantly reflect in the browser thanks to Hot Module Replacement (HMR).

---

## Workflow & Deliverables

The workflow followed the methodological design approaches taught in the HYP course, systematically covering content grouping, navigation mapping, and presentation layout design.
For full design specifications, diagrams, and early project documentation, please refer to the **`Deliverables/`** folder inside the repository.
