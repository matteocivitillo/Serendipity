from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from supabase import create_client
from dotenv import load_dotenv
import os

load_dotenv()
SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_KEY")
supabase = create_client(SUPABASE_URL, SUPABASE_KEY)

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
      "https://hypermedia-applications-rho.vercel.app",  # Frontend su Vercel
      "http://localhost:5173",
      "http://localhost:8080",
      "http://localhost:3000",
      "http://localhost:3001"
    ],
    allow_credentials=True,
    allow_methods=["GET", "POST"],
    allow_headers=["*"],
)

@app.get("/messaggi")
async def get_messaggi():
    # Seleziono *tutte* le colonne di tutti i record
    resp = supabase.table("messaggi")\
                   .select("*")\
                   .order("id", desc=False)\
    .execute()
    return {"messaggi": resp.data}

# ------------------- TEACHERS ------------------- #

# Get all teachers information
@app.get("/teachers")
async def get_teachers(lang: str = "en"):
    try:
        base_resp = supabase.table("teacher_base").select("*").execute()
        base_teachers = base_resp.data if base_resp.data else []
        if not base_teachers:
            return {"teachers": []}
        teachers = []
        missing_translations = []
        for base in base_teachers:
            # Fix column names - convert "Name" and "Surname" to lowercase
            if "Name" in base:
                base["name"] = base["Name"]
                del base["Name"]
            if "Surname" in base:
                base["surname"] = base["Surname"]
                del base["Surname"]
                
            trans_resp = supabase.table("teacher_translations")\
                .select("*")\
                .eq("id", base["id"])\
                .eq("language_code", lang)\
                .execute()
            trans_data = trans_resp.data[0] if trans_resp.data else None
            if not trans_data:
                missing_translations.append(base["id"])
                continue
            teacher = {**base, **trans_data}
            if "teacher_id" in teacher:
                del teacher["teacher_id"]
            if "language_code" in teacher:
                del teacher["language_code"]
            if "NON_USARE" in teacher:
                del teacher["NON_USARE"]
            teachers.append(teacher)
        if missing_translations:
            return {"error": f"Missing translations for teachers: {missing_translations}", "teachers": []}
        return {"teachers": teachers}
    except Exception as e:
        print(f"Error fetching teachers: {str(e)}")
        return {"teachers": [], "error": str(e)}

# Get a specific teacher by ID
@app.get("/teacher/{teacher_id}")
async def get_teacher(teacher_id: str, lang: str = "en"):
    try:
        base_resp = supabase.table("teacher_base").select("*").eq("id", teacher_id).execute()
        
        if not base_resp.data or len(base_resp.data) == 0:
            # Try to get the teacher_id from teacher_translations
            trans_lookup = supabase.table("teacher_translations").select("id").eq("id", teacher_id).execute()
            
            if trans_lookup.data and len(trans_lookup.data) > 0:
                # Get the actual teacher_id from the translation record
                actual_teacher_id = trans_lookup.data[0]["id"]
                # Now fetch the base teacher with this ID
                base_resp = supabase.table("teacher_base").select("*").eq("id", actual_teacher_id).execute()
                if not base_resp.data or len(base_resp.data) == 0:
                    return {"teacher": None}
            else:
                return {"teacher": None}
            
        base_teacher = base_resp.data[0]
        actual_teacher_id = base_teacher["id"]
        
        if "Name" in base_teacher:
            base_teacher["name"] = base_teacher["Name"]
            del base_teacher["Name"]
        if "Surname" in base_teacher:
            base_teacher["surname"] = base_teacher["Surname"]
            del base_teacher["Surname"]
        
        # Fetch translation for the requested language
        trans_resp = supabase.table("teacher_translations")\
            .select("*")\
            .eq("id", actual_teacher_id)\
            .eq("language_code", lang)\
            .execute()
            
        # If translation not found in requested language, try English as fallback
        if not trans_resp.data or len(trans_resp.data) == 0:
            if lang != "en":
                trans_resp = supabase.table("teacher_translations")\
                    .select("*")\
                    .eq("id", actual_teacher_id)\
                    .eq("language_code", "en")\
                    .execute()
        
        if not trans_resp.data or len(trans_resp.data) == 0:
            return {"teacher": base_teacher}
            
        trans_data = trans_resp.data[0]
        teacher = {**base_teacher, **trans_data}
        
        # Remove duplicate fields
        if "teacher_id" in teacher:
            del teacher["teacher_id"]
        if "language_code" in teacher:
            del teacher["language_code"]
        if "NON_USARE" in teacher:
            del teacher["NON_USARE"]
            
        return {"teacher": teacher}
    except Exception as e:
        print(f"Error fetching teacher {teacher_id}: {str(e)}")
        return {"teacher": None, "error": str(e)}

@app.get("/teacher/activity/{activity_id}")
async def get_teacher_by_activityid(activity_id: str, lang: str = "en"):
    try:
        print(f"DEBUG: get_teacher_by_activityid called with activity_id={activity_id}, lang={lang}")
        
        # First get the teacher_id from activity_base
        activity_resp = supabase.table("activity_base")\
            .select("teacher_id")\
            .eq("id", activity_id)\
            .execute()
            
        print(f"DEBUG: activity_base query response: {activity_resp.data}")
        
        if not activity_resp.data or len(activity_resp.data) == 0:
            print(f"Activity with ID {activity_id} not found in activity_base, trying to find in activity_translations")
            
            # Cerchiamo activity_translations.id = activity_id per ottenere activity_translations.activity_id
            translations_resp = supabase.table("activity_translations")\
                .select("activity_id")\
                .eq("id", activity_id)\
                .execute()
                
            print(f"DEBUG: activity_translations query response: {translations_resp.data}")
                
            if translations_resp.data and len(translations_resp.data) > 0:
                corrected_activity_id = translations_resp.data[0]["activity_id"]
                print(f"DEBUG: Found corrected activity_id={corrected_activity_id} for translations.id={activity_id}")
                
                activity_resp = supabase.table("activity_base")\
                    .select("teacher_id")\
                    .eq("id", corrected_activity_id)\
                    .execute()
                    
                print(f"DEBUG: activity_base query response with corrected ID: {activity_resp.data}")
        
        if not activity_resp.data or len(activity_resp.data) == 0:
            print(f"Activity not found for ID {activity_id} (after correction attempt)")
            return {"teacher": None}
            
        teacher_id = activity_resp.data[0]["teacher_id"]
        print(f"DEBUG: Found teacher_id={teacher_id} for activity_id={activity_id}")
        
        # Get the teacher base data
        teacher_resp = supabase.table("teacher_base")\
            .select("*")\
            .eq("id", teacher_id)\
            .execute()
            
        print(f"DEBUG: teacher_base query response: {teacher_resp.data}")
            
        if not teacher_resp.data or len(teacher_resp.data) == 0:
            print(f"Teacher with ID {teacher_id} not found")
            return {"teacher": None}
            
        teacher_base = teacher_resp.data[0]
        print(f"DEBUG: Raw teacher base data: {teacher_base}")
        
        # Fix column names - convert "Name" and "Surname" to lowercase
        if "Name" in teacher_base:
            teacher_base["name"] = teacher_base["Name"]
            del teacher_base["Name"]
        if "Surname" in teacher_base:
            teacher_base["surname"] = teacher_base["Surname"]
            del teacher_base["Surname"]
        
        print(f"DEBUG: After name/surname fix: {teacher_base}")
        
        # Get teacher translations
        trans_resp = supabase.table("teacher_translations")\
            .select("*")\
            .eq("id", teacher_id)\
            .eq("language_code", lang)\
            .execute()
            
        print(f"DEBUG: teacher_translations query response: {trans_resp.data}")
            
        # If translation not found in the requested language, try English
        if not trans_resp.data or len(trans_resp.data) == 0:
            if lang != "en":
                trans_resp = supabase.table("teacher_translations")\
                    .select("*")\
                    .eq("id", teacher_id)\
                    .eq("language_code", "en")\
                    .execute()
                print(f"DEBUG: fallback to EN - teacher_translations query response: {trans_resp.data}")
        
        teacher = {**teacher_base}
        if trans_resp.data and len(trans_resp.data) > 0:
            teacher.update(trans_resp.data[0])
            
        if "language_code" in teacher:
            del teacher["language_code"]
        if "NON_USARE" in teacher:
            del teacher["NON_USARE"]
            
        print(f"DEBUG: Final teacher data to return: {teacher}")
        return {"teacher": teacher}
    except Exception as e:
        print(f"Error fetching teacher for activity {activity_id}: {str(e)}")
        import traceback
        traceback.print_exc()
        return {"teacher": None}

# Get all activities for a specific teacher (many-to-many via teaches)
@app.get("/teacher/{teacher_id}/activities")
async def get_teacher_activities(teacher_id: str, lang: str = "en"):
    try:
        # First check if this is a teacher_base ID
        actual_teacher_id = teacher_id
        
        base_check = supabase.table("teacher_base").select("id").eq("id", teacher_id).execute()
        if not base_check.data or len(base_check.data) == 0:
            # Try to get the teacher_id from teacher_translations
            trans_lookup = supabase.table("teacher_translations").select("teacher_id").eq("id", teacher_id).execute()
            
            if trans_lookup.data and len(trans_lookup.data) > 0:
                # Get the actual teacher_id from the translation record
                actual_teacher_id = trans_lookup.data[0]["teacher_id"]
            else:
                return {"activities": []}
    
        # Get all activity IDs from the teaches table for this teacher
        teaches_resp = supabase.table("teaches") \
            .select("idactivity") \
            .eq("idteacher", actual_teacher_id) \
            .execute()
        
        activity_ids = [row["idactivity"] for row in teaches_resp.data] if teaches_resp.data else []
        if not activity_ids:
            return {"activities": []}
        
        # Get all activities with translations
        activities = []
        for base_activity_id in activity_ids:
            # Get base data from activity_base
            base_resp = supabase.table("activity_base") \
                .select("*") \
                .eq("id", base_activity_id) \
                .execute()
                
            if not base_resp.data or len(base_resp.data) == 0:
                print(f"Warning: Activity base record not found for ID {base_activity_id}")
                continue
                
            base_activity = base_resp.data[0]
            
            # Get translation for the requested language
            trans_resp = supabase.table("activity_translations") \
                .select("*") \
                .eq("activity_id", base_activity_id) \
                .eq("language_code", lang) \
                .execute()
                
            # If translation doesn't exist in requested language, fallback to English
            if not trans_resp.data or len(trans_resp.data) == 0:
                if lang != "en":
                    trans_resp = supabase.table("activity_translations") \
                        .select("*") \
                        .eq("activity_id", base_activity_id) \
                        .eq("language_code", "en") \
                        .execute()
            
            # Merge base data with translations if available
            if trans_resp.data and len(trans_resp.data) > 0:
                trans_data = trans_resp.data[0]
                # Create a merged activity object
                activity = {**base_activity, **trans_data}
                
                # Remove duplicate keys from translation table
                if "activity_id" in activity:
                    del activity["activity_id"]
                if "language_code" in activity:
                    del activity["language_code"]
                
                activities.append(activity)
            else:
                # No translation found, use base data only
                activities.append(base_activity)
        
        return {"activities": activities}
    except Exception as e:
        print(f"Error fetching activities for teacher {teacher_id}: {str(e)}")
        return {"activities": [], "error": str(e)}

# ------------------- ACTIVITIES ------------------- #

# Get all activities information with translations for a specific language
@app.get("/activities")
async def get_activities(lang: str = "en"):
    """
    Restituisce tutte le attività con le traduzioni nella lingua richiesta.
    Se una traduzione non esiste per una attività, ritorna errore.
    """
    try:
        base_resp = supabase.table("activity_base").select("*").execute()
        base_activities = base_resp.data if base_resp.data else []

        if not base_activities:
            return {"activities": []}

        activities = []
        missing_translations = []
        for base in base_activities:
            trans_resp = supabase.table("activity_translations")\
                .select("*")\
                .eq("activity_id", base["id"])\
                .eq("language_code", lang)\
                .execute()
            trans_data = trans_resp.data[0] if trans_resp.data else None

            if not trans_data:
                missing_translations.append(base["id"])
                continue

            activity = {**base, **trans_data}
            if "activity_id" in activity:
                del activity["activity_id"]
            if "language_code" in activity:
                del activity["language_code"]

            activities.append(activity)

        if missing_translations:
            return {"error": f"Missing translations for activities: {missing_translations}", "activities": []}

        return {"activities": activities}
    except Exception as e:
        print(f"Error fetching activities: {str(e)}")
        return {"activities": [], "error": str(e)}

# Get a specific activity by ID
@app.get("/activity/{activity_id}")
async def get_activity(activity_id: str, lang: str = "en"):
    try:
        base_resp = supabase.table("activity_base").select("*").eq("id", activity_id).execute()
        
        if not base_resp.data or len(base_resp.data) == 0:
            # Try to get the activity_id from activity_translations
            trans_lookup = supabase.table("activity_translations").select("activity_id").eq("id", activity_id).execute()
            
            if trans_lookup.data and len(trans_lookup.data) > 0:
                # Get the actual activity_id from the translation record
                actual_activity_id = trans_lookup.data[0]["activity_id"]
                base_resp = supabase.table("activity_base").select("*").eq("id", actual_activity_id).execute()
                if not base_resp.data or len(base_resp.data) == 0:
                    return {"activity": None}
            else:
                return {"activity": None}
            
        base_activity = base_resp.data[0]
        actual_activity_id = base_activity["id"]
        
        # Fetch translation for the requested language
        trans_resp = supabase.table("activity_translations")\
            .select("*")\
            .eq("activity_id", actual_activity_id)\
            .eq("language_code", lang)\
            .execute()
            
        # If translation not found in requested language, try English as fallback
        if not trans_resp.data or len(trans_resp.data) == 0:
            if lang != "en":
                trans_resp = supabase.table("activity_translations")\
                    .select("*")\
                    .eq("activity_id", actual_activity_id)\
                    .eq("language_code", "en")\
                    .execute()
        
        if not trans_resp.data or len(trans_resp.data) == 0:
            # If still no translation, return just the base data
            return {"activity": base_activity}
            
        # Merge base and translation data
        trans_data = trans_resp.data[0]
        activity = {**base_activity, **trans_data}
        
        if "activity_id" in activity:
            del activity["activity_id"]
        if "language_code" in activity:
            del activity["language_code"]
            
        return {"activity": activity}
    except Exception as e:
        print(f"Error fetching activity {activity_id}: {str(e)}")
        return {"activity": None, "error": str(e)}

# Get a specific activity by name
@app.get("/activity_by_name")
async def get_activity_by_name(name: str):
    # First try exact match
    resp = supabase.table("activity")\
                   .select("*")\
                   .eq("title", name)\
                   .execute()
    
    if len(resp.data) == 0:
        resp = supabase.table("activity")\
                       .select("*")\
                       .ilike("title", f"%{name}%")\
                       .execute()
    
    if len(resp.data) > 0:
        return {"activity": resp.data[0], "activity_id": resp.data[0]["id"]}
    
    activity_mappings = {
        "mindful pottery": "Mindful Pottery",
        "mindful potter": "Mindful Pottery",
        "wellness workshop": "Wellness Workshop",
        "wellness workshops": "Wellness Workshop",
        "meditation": "Mindfulness Meditation",
        "mindfulness": "Mindfulness Meditation",
        "hatha yoga": "Hatha Yoga",
        "kundalini yoga": "Kundalini Yoga",
        "kundalini & hatha yoga": "Kundalini Yoga",
        "ashtanga yoga": "Ashtanga Yoga"
    }
    
    normalized_name = name.lower().strip()
    if normalized_name in activity_mappings:
        mapped_name = activity_mappings[normalized_name]
        resp = supabase.table("activity")\
                       .select("*")\
                       .eq("title", mapped_name)\
                       .execute()
        
        if len(resp.data) > 0:
            return {"activity": resp.data[0], "activity_id": resp.data[0]["id"]}
    
    return {"activity": None, "activity_id": None}

# Get activity ID from name
@app.get("/activity_id_from_name")
async def get_activity_id_from_name(name: str):
    # First try exact match
    resp = supabase.table("activity")\
                   .select("id, title")\
                   .eq("title", name)\
                   .execute()
    
    if len(resp.data) == 0:
        resp = supabase.table("activity")\
                       .select("id, title")\
                       .ilike("title", f"%{name}%")\
                       .execute()
    
    if len(resp.data) > 0:
        return {"id": resp.data[0]["id"], "title": resp.data[0]["title"]}
    
    activity_mappings = {
        "mindful pottery": "Mindful Pottery",
        "mindful potter": "Mindful Pottery",
        "wellness workshop": "Wellness Workshop",
        "wellness workshops": "Wellness Workshop",
        "meditation": "Mindfulness Meditation",
        "mindfulness": "Mindfulness Meditation",
        "hatha yoga": "Hatha Yoga",
        "kundalini yoga": "Kundalini Yoga",
        "kundalini & hatha yoga": "Kundalini Yoga",
        "ashtanga yoga": "Ashtanga Yoga"
    }
    
    normalized_name = name.lower().strip()
    if normalized_name in activity_mappings:
        mapped_name = activity_mappings[normalized_name]
        resp = supabase.table("activity")\
                       .select("id, title")\
                       .eq("title", mapped_name)\
                       .execute()
        
        if len(resp.data) > 0:
            return {"id": resp.data[0]["id"], "title": resp.data[0]["title"]}
    
    return {"id": None, "title": None}

# ------------------- ROOMS ------------------- #

# Get all rooms information
@app.get("/rooms")
async def get_rooms(lang: str = "en"):
    try:
        base_resp = supabase.table("room_base").select("*").execute()
        base_rooms = base_resp.data if base_resp.data else []
        if not base_rooms:
            return {"rooms": []}
        rooms = []
        missing_translations = []
        for base in base_rooms:
            room_id = base["id"]
            
            trans_resp = supabase.table("room_translations")\
                .select("*")\
                .eq("room_id", room_id)\
                .eq("language_code", lang)\
                .execute()
            trans_data = trans_resp.data[0] if trans_resp.data else None
            if not trans_data:
                missing_translations.append(room_id)
                continue
            room = {**base, **trans_data}
            if "room_id" in room:
                del room["room_id"]
            if "language_code" in room:
                del room["language_code"]
                
            features = room.get("features", "")
            features_list = []
            
            if isinstance(features, str):
                features = features.strip()
                
                if "-" in features:
                    features_list = [f.strip() for f in features.split("-") if f.strip()]
                elif "," in features:
                    features_list = [f.strip() for f in features.split(",") if f.strip()]
                elif features:
                    features_list = [features]
            elif isinstance(features, list):
                features_list = features
                
            # Aggiorna le features nel room
            room["features"] = features_list
            
            activities_resp = supabase.table("activity_base")\
                                     .select("id, type")\
                                     .eq("roomid", room_id)\
                                     .execute()
            
            room_activities = []
            
            if activities_resp.data and len(activities_resp.data) > 0:
                for activity_base in activities_resp.data:
                    activity_id = activity_base["id"]
                    
                    trans_resp = supabase.table("activity_translations")\
                                        .select("title, short_description")\
                                        .eq("activity_id", activity_id)\
                                        .eq("language_code", lang)\
                                        .execute()
                    
                    if not trans_resp.data or len(trans_resp.data) == 0:
                        if lang != "en":
                            trans_resp = supabase.table("activity_translations")\
                                              .select("title, short_description")\
                                              .eq("activity_id", activity_id)\
                                              .eq("language_code", "en")\
                                              .execute()
                    
                    if trans_resp.data and len(trans_resp.data) > 0:
                        activity_info = {
                            "id": activity_id,
                            "title": trans_resp.data[0].get("title", ""),
                            "type": activity_base.get("type", ""),
                            "description": trans_resp.data[0].get("short_description", "")
                        }
                        room_activities.append(activity_info)
            
            room["activities"] = room_activities
            
            rooms.append(room)
        if missing_translations:
            return {"error": f"Missing translations for rooms: {missing_translations}", "rooms": []}
        return {"rooms": rooms}
    except Exception as e:
        print(f"Error fetching rooms: {str(e)}")
        return {"rooms": [], "error": str(e)}

# Get a specific room by ID
@app.get("/room/{room_id}")
async def get_room(room_id: str, lang: str = "en"):
    try:
        # Otteniamo prima i dati di base della stanza
        base_resp = supabase.table("room_base").select("*").eq("id", room_id).execute()
        
        if not base_resp.data or len(base_resp.data) == 0:
            return {"room": None, "error": f"Room with ID {room_id} not found"}
            
        base_room = base_resp.data[0]
        
        # Otteniamo la traduzione nella lingua richiesta
        trans_resp = supabase.table("room_translations")\
            .select("*")\
            .eq("room_id", room_id)\
            .eq("language_code", lang)\
            .execute()
            
        if not trans_resp.data or len(trans_resp.data) == 0:
            if lang != "en":
                trans_resp = supabase.table("room_translations")\
                    .select("*")\
                    .eq("room_id", room_id)\
                    .eq("language_code", "en")\
                    .execute()
                    
        room_data = {**base_room}
        if trans_resp.data and len(trans_resp.data) > 0:
            room_data.update(trans_resp.data[0])
            if "room_id" in room_data:
                del room_data["room_id"]
            if "language_code" in room_data:
                del room_data["language_code"]
        
        features = room_data.get("features", "")
        features_list = []
        
        if isinstance(features, str):
            features = features.strip()
            
            if "-" in features:
                features_list = [f.strip() for f in features.split("-") if f.strip()]
            elif "," in features:
                features_list = [f.strip() for f in features.split(",") if f.strip()]
            elif features:
                features_list = [features]
        elif isinstance(features, list):
            features_list = features
        
        # Recupera le attività associate a questa stanza
        activities_resp = supabase.table("activity_base")\
                                .select("id, type")\
                                .eq("roomid", room_id)\
                                .execute()
            
        room_activities = []
        
        # Se ci sono attività associate a questa stanza
        if activities_resp.data and len(activities_resp.data) > 0:
            for activity_base in activities_resp.data:
                activity_id = activity_base["id"]
                
                # Recupera i dettagli tradotti dell'attività nella stessa lingua
                trans_resp = supabase.table("activity_translations")\
                                    .select("title, short_description")\
                                    .eq("activity_id", activity_id)\
                                    .eq("language_code", lang)\
                                    .execute()
                
                if not trans_resp.data or len(trans_resp.data) == 0:
                    if lang != "en":
                        trans_resp = supabase.table("activity_translations")\
                                        .select("title, short_description")\
                                        .eq("activity_id", activity_id)\
                                        .eq("language_code", "en")\
                                        .execute()
                
                if trans_resp.data and len(trans_resp.data) > 0:
                    activity_info = {
                        "id": activity_id,
                        "title": trans_resp.data[0].get("title", ""),
                        "type": activity_base.get("type", ""),
                        "description": trans_resp.data[0].get("short_description", "")
                    }
                    room_activities.append(activity_info)
        
        legacy_activities = []
        if room_data.get("activity1"):
            legacy_activities.append(room_data.get("activity1"))
        if room_data.get("activity2"):
            legacy_activities.append(room_data.get("activity2"))
        
        if not legacy_activities and room_data.get("activities"):
            activities_text = room_data.get("activities")
            if isinstance(activities_text, str):
                if "-" in activities_text:
                    legacy_activities = [a.strip() for a in activities_text.split("-") if a.strip()]
                elif "," in activities_text:
                    legacy_activities = [a.strip() for a in activities_text.split(",") if a.strip()]
                else:
                    legacy_activities = [activities_text]
            elif isinstance(activities_text, list):
                legacy_activities = activities_text
        
        # Format the processed room data
        processed_room = {
            "id": room_data.get("id"),
            "title": room_data.get("title", ""),
            "description": room_data.get("description", ""),
            "features": features_list,
            "activities": room_activities,
            "legacy_activities": legacy_activities,
            "image": room_data.get("image", ""),
            "quote": room_data.get("quote", "Experience the transformative power of our specially designed spaces.")
        }
        
        return {"room": processed_room}
    except Exception as e:
        print(f"Error fetching room {room_id}: {str(e)}")
        return {"room": None, "error": str(e)}

# ------------------- AREAS ------------------- #

# Get all areas information
@app.get("/areas")
async def get_areas():
    resp = supabase.table("areas")\
                   .select("*")\
                   .execute()
    
    areas_data = []
    for area in resp.data:
        # Create a complete URL if it's partial
        image_url = area.get("image", "")
        if image_url and "dcrgvkmnnavjahkprnkem.supabase" in image_url:
            if not "/storage/v1/object/public/yoga/" in image_url:
                area_title = area.get("title", "").lower()
                if area_title == "bar":
                    image_url = "https://dcrgvkmnnavjahkprnkem.supabase.co/storage/v1/object/public/yoga/bar.jpg"
                elif area_title == "play area":
                    image_url = "https://dcrgvkmnnavjahkprnkem.supabase.co/storage/v1/object/public/yoga/play_area.jpg"
                elif area_title == "spa":
                    image_url = "https://dcrgvkmnnavjahkprnkem.supabase.co/storage/v1/object/public/yoga/spa.jpg"
        
        # Update the area with the complete image URL
        area["image"] = image_url
        areas_data.append(area)
    
    return {"areas": areas_data}

# Get a specific area by ID
@app.get("/area/{area_id}")
async def get_area(area_id: str):
    resp = supabase.table("areas")\
                   .select("*")\
                   .eq("id", area_id)\
                   .execute()
    
    if len(resp.data) > 0:
        area = resp.data[0]
        
        # Create a complete URL if it's partial
        image_url = area.get("image", "")
        if image_url and "dcrgvkmnnavjahkprnkem.supabase" in image_url:
            if not "/storage/v1/object/public/yoga/" in image_url:
                area_title = area.get("title", "").lower()
                if area_title == "bar":
                    image_url = "https://dcrgvkmnnavjahkprnkem.supabase.co/storage/v1/object/public/yoga/bar.jpg"
                elif area_title == "play area":
                    image_url = "https://dcrgvkmnnavjahkprnkem.supabase.co/storage/v1/object/public/yoga/play_area.jpg"
                elif area_title == "spa":
                    image_url = "https://dcrgvkmnnavjahkprnkem.supabase.co/storage/v1/object/public/yoga/spa.jpg"
                
                area["image"] = image_url
        
        return {"area": area}
    return {"area": None}

# ------------------- REVIEWS ------------------- #

@app.get("/reviews")
async def get_reviews(lang: str = "en"):
    try:
        base_resp = supabase.table("reviews_base").select("*").order("date", desc=True).execute()
        base_reviews = base_resp.data if base_resp.data else []
        if not base_reviews:
            return {"reviews": []}
            
        reviews = []
        
        for base in base_reviews:
            trans_resp = supabase.table("review_translations")\
                .select("*")\
                .eq("review_id", base["id"])\
                .eq("language_code", lang)\
                .execute()
            trans_data = trans_resp.data[0] if trans_resp.data else None
            
            if not trans_data and lang != "en":
                trans_resp = supabase.table("review_translations")\
                    .select("*")\
                    .eq("review_id", base["id"])\
                    .eq("language_code", "en")\
                    .execute()
                trans_data = trans_resp.data[0] if trans_resp.data else None
            
            review = {**base}
            
            if trans_data:
                review.update(trans_data)
                if "review_id" in review:
                    del review["review_id"]
                if "language_code" in review:
                    del review["language_code"]
                
            participant_resp = supabase.table("participant")\
                .select("*")\
                .eq("id", base["idparticipant"])\
                .execute()
            participant_data = participant_resp.data[0] if participant_resp.data else {}
            
            activity_resp = supabase.table("activity_base")\
                .select("id")\
                .eq("id", base["idactivity"])\
                .execute()
                
            activity_id = None
            activity_title = None
            if activity_resp.data and len(activity_resp.data) > 0:
                activity_id = activity_resp.data[0].get("id")
                
                # Recupera il titolo dell'attività nella lingua specifica
                activity_trans_resp = supabase.table("activity_translations")\
                    .select("title")\
                    .eq("activity_id", activity_id)\
                    .eq("language_code", lang)\
                    .execute()
                    
                if activity_trans_resp.data and len(activity_trans_resp.data) > 0:
                    activity_title = activity_trans_resp.data[0].get("title")
                else:
                    activity_trans_resp = supabase.table("activity_translations")\
                        .select("title")\
                        .eq("activity_id", activity_id)\
                        .eq("language_code", "en")\
                        .execute()
                    if activity_trans_resp.data and len(activity_trans_resp.data) > 0:
                        activity_title = activity_trans_resp.data[0].get("title")
            
            review["participant"] = participant_data
            
            review["activity"] = {
                "id": activity_id,
                "title": activity_title
            }
            
            if "review" not in review:
                review["review"] = "Great experience at Serendipity Yoga!"
            
            reviews.append(review)
            
        return {"reviews": reviews}
    except Exception as e:
        print(f"Error fetching reviews: {str(e)}")
        return {"reviews": [], "error": str(e)}
