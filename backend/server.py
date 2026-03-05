from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from dotenv import load_dotenv
import os
import psycopg2
from psycopg2 import pool
from psycopg2.extras import RealDictCursor

load_dotenv()
DATABASE_URL = os.getenv("DATABASE_URL")

try:
    db_pool = pool.SimpleConnectionPool(1, 20, DATABASE_URL)
    if db_pool:
        print("Database connection pool created successfully")
except Exception as e:
    print(f"Error creating connection pool: {e}")
    db_pool = None

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
      "https://hypermedia-applications-rho.vercel.app",
      "http://localhost:5173",
      "http://localhost:8080",
      "http://localhost:3000",
      "http://localhost:3001"
    ],
    allow_credentials=True,
    allow_methods=["GET", "POST"],
    allow_headers=["*"],
)

def get_db_connection():
    if db_pool:
        return db_pool.getconn()
    return psycopg2.connect(DATABASE_URL)

def release_db_connection(conn):
    if db_pool:
        db_pool.putconn(conn)
    else:
        conn.close()

def execute_query(query, params=None, fetch_one=False):
    conn = get_db_connection()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            cur.execute(query, params)
            if fetch_one:
                return cur.fetchone()
            return cur.fetchall()
    finally:
        release_db_connection(conn)

@app.get("/messaggi")
async def get_messaggi():
    data = execute_query("SELECT * FROM messaggi ORDER BY id ASC")
    return {"messaggi": data}

# ------------------- TEACHERS ------------------- #

@app.get("/teachers")
async def get_teachers(lang: str = "en"):
    try:
        base_teachers = execute_query("SELECT * FROM teacher_base")
        if not base_teachers:
            return {"teachers": []}
            
        teachers = []
        missing_translations = []
        for base in base_teachers:
            if "Name" in base:
                base["name"] = base.pop("Name")
            if "Surname" in base:
                base["surname"] = base.pop("Surname")
                
            trans_data = execute_query("SELECT * FROM teacher_translations WHERE id = %s AND language_code = %s", (base["id"], lang), fetch_one=True)
            if not trans_data:
                missing_translations.append(base["id"])
                continue
            
            teacher = {**base, **trans_data}
            teacher.pop("teacher_id", None)
            teacher.pop("language_code", None)
            teacher.pop("NON_USARE", None)
            teachers.append(teacher)
            
        if missing_translations:
            return {"error": f"Missing translations for teachers: {missing_translations}", "teachers": []}
        return {"teachers": teachers}
    except Exception as e:
        print(f"Error fetching teachers: {str(e)}")
        return {"teachers": [], "error": str(e)}

@app.get("/teacher/{teacher_id}")
async def get_teacher(teacher_id: str, lang: str = "en"):
    try:
        base_teacher = execute_query("SELECT * FROM teacher_base WHERE id = %s", (teacher_id,), fetch_one=True)
        
        if not base_teacher:
            trans_lookup = execute_query("SELECT id FROM teacher_translations WHERE id = %s", (teacher_id,), fetch_one=True)
            if trans_lookup:
                actual_teacher_id = trans_lookup["id"]
                base_teacher = execute_query("SELECT * FROM teacher_base WHERE id = %s", (actual_teacher_id,), fetch_one=True)
                if not base_teacher:
                    return {"teacher": None}
            else:
                return {"teacher": None}
                
        actual_teacher_id = base_teacher["id"]
        
        if "Name" in base_teacher:
            base_teacher["name"] = base_teacher.pop("Name")
        if "Surname" in base_teacher:
            base_teacher["surname"] = base_teacher.pop("Surname")
            
        trans_data = execute_query("SELECT * FROM teacher_translations WHERE id = %s AND language_code = %s", (actual_teacher_id, lang), fetch_one=True)
        
        if not trans_data and lang != "en":
            trans_data = execute_query("SELECT * FROM teacher_translations WHERE id = %s AND language_code = 'en'", (actual_teacher_id,), fetch_one=True)
            
        if not trans_data:
            return {"teacher": base_teacher}
            
        teacher = {**base_teacher, **trans_data}
        teacher.pop("teacher_id", None)
        teacher.pop("language_code", None)
        teacher.pop("NON_USARE", None)
            
        return {"teacher": teacher}
    except Exception as e:
        print(f"Error fetching teacher {teacher_id}: {str(e)}")
        return {"teacher": None, "error": str(e)}

@app.get("/teacher/activity/{activity_id}")
async def get_teacher_by_activityid(activity_id: str, lang: str = "en"):
    try:
        activity_data = execute_query("SELECT teacher_id FROM activity_base WHERE id = %s", (activity_id,), fetch_one=True)
        
        if not activity_data:
            translations_lookup = execute_query("SELECT activity_id FROM activity_translations WHERE id = %s", (activity_id,), fetch_one=True)
            if translations_lookup:
                corrected_activity_id = translations_lookup["activity_id"]
                activity_data = execute_query("SELECT teacher_id FROM activity_base WHERE id = %s", (corrected_activity_id,), fetch_one=True)
                
        if not activity_data:
            return {"teacher": None}
            
        teacher_id = activity_data["teacher_id"]
        
        teacher_base = execute_query("SELECT * FROM teacher_base WHERE id = %s", (teacher_id,), fetch_one=True)
        if not teacher_base:
            return {"teacher": None}
            
        if "Name" in teacher_base:
            teacher_base["name"] = teacher_base.pop("Name")
        if "Surname" in teacher_base:
            teacher_base["surname"] = teacher_base.pop("Surname")
            
        trans_data = execute_query("SELECT * FROM teacher_translations WHERE id = %s AND language_code = %s", (teacher_id, lang), fetch_one=True)
        
        if not trans_data and lang != "en":
            trans_data = execute_query("SELECT * FROM teacher_translations WHERE id = %s AND language_code = 'en'", (teacher_id,), fetch_one=True)
            
        teacher = {**teacher_base}
        if trans_data:
            teacher.update(trans_data)
            
        teacher.pop("language_code", None)
        teacher.pop("NON_USARE", None)
            
        return {"teacher": teacher}
    except Exception as e:
        print(f"Error fetching teacher for activity {activity_id}: {str(e)}")
        return {"teacher": None}

@app.get("/teacher/{teacher_id}/activities")
async def get_teacher_activities(teacher_id: str, lang: str = "en"):
    try:
        actual_teacher_id = teacher_id
        base_check = execute_query("SELECT id FROM teacher_base WHERE id = %s", (teacher_id,), fetch_one=True)
        
        if not base_check:
            trans_lookup = execute_query("SELECT teacher_id FROM teacher_translations WHERE id = %s", (teacher_id,), fetch_one=True)
            if trans_lookup:
                actual_teacher_id = trans_lookup["teacher_id"]
            else:
                return {"activities": []}
                
        teaches_data = execute_query("SELECT idactivity FROM teaches WHERE idteacher = %s", (actual_teacher_id,))
        activity_ids = [row["idactivity"] for row in teaches_data] if teaches_data else []
        
        if not activity_ids:
            return {"activities": []}
            
        activities = []
        for base_activity_id in activity_ids:
            base_activity = execute_query("SELECT * FROM activity_base WHERE id = %s", (base_activity_id,), fetch_one=True)
            if not base_activity:
                continue
                
            trans_data = execute_query("SELECT * FROM activity_translations WHERE activity_id = %s AND language_code = %s", (base_activity_id, lang), fetch_one=True)
            
            if not trans_data and lang != "en":
                trans_data = execute_query("SELECT * FROM activity_translations WHERE activity_id = %s AND language_code = 'en'", (base_activity_id,), fetch_one=True)
                
            if trans_data:
                activity = {**base_activity, **trans_data}
                activity.pop("activity_id", None)
                activity.pop("language_code", None)
                activities.append(activity)
            else:
                activities.append(base_activity)
                
        return {"activities": activities}
    except Exception as e:
        print(f"Error fetching activities for teacher {teacher_id}: {str(e)}")
        return {"activities": [], "error": str(e)}

# ------------------- ACTIVITIES ------------------- #

@app.get("/activities")
async def get_activities(lang: str = "en"):
    try:
        base_activities = execute_query("SELECT * FROM activity_base")
        if not base_activities:
            return {"activities": []}
            
        activities = []
        missing_translations = []
        for base in base_activities:
            trans_data = execute_query("SELECT * FROM activity_translations WHERE activity_id = %s AND language_code = %s", (base["id"], lang), fetch_one=True)
            
            if not trans_data:
                missing_translations.append(base["id"])
                continue
                
            activity = {**base, **trans_data}
            activity.pop("activity_id", None)
            activity.pop("language_code", None)
            activities.append(activity)
            
        if missing_translations:
            return {"error": f"Missing translations for activities: {missing_translations}", "activities": []}
            
        return {"activities": activities}
    except Exception as e:
        print(f"Error fetching activities: {str(e)}")
        return {"activities": [], "error": str(e)}

@app.get("/activity/{activity_id}")
async def get_activity(activity_id: str, lang: str = "en"):
    try:
        base_activity = execute_query("SELECT * FROM activity_base WHERE id = %s", (activity_id,), fetch_one=True)
        
        if not base_activity:
            trans_lookup = execute_query("SELECT activity_id FROM activity_translations WHERE id = %s", (activity_id,), fetch_one=True)
            if trans_lookup:
                actual_activity_id = trans_lookup["activity_id"]
                base_activity = execute_query("SELECT * FROM activity_base WHERE id = %s", (actual_activity_id,), fetch_one=True)
                if not base_activity:
                    return {"activity": None}
            else:
                return {"activity": None}
                
        actual_activity_id = base_activity["id"]
        
        trans_data = execute_query("SELECT * FROM activity_translations WHERE activity_id = %s AND language_code = %s", (actual_activity_id, lang), fetch_one=True)
        
        if not trans_data and lang != "en":
            trans_data = execute_query("SELECT * FROM activity_translations WHERE activity_id = %s AND language_code = 'en'", (actual_activity_id,), fetch_one=True)
            
        if not trans_data:
            return {"activity": base_activity}
            
        activity = {**base_activity, **trans_data}
        activity.pop("activity_id", None)
        activity.pop("language_code", None)
            
        return {"activity": activity}
    except Exception as e:
        print(f"Error fetching activity {activity_id}: {str(e)}")
        return {"activity": None, "error": str(e)}

@app.get("/activity_by_name")
async def get_activity_by_name(name: str):
    # First try exact match
    exact_match = execute_query("SELECT * FROM activity WHERE title = %s", (name,), fetch_one=True)
    if not exact_match:
        like_match = execute_query("SELECT * FROM activity WHERE title ILIKE %s", (f"%{name}%",), fetch_one=True)
        if like_match:
            return {"activity": like_match, "activity_id": like_match["id"]}
    else:
        return {"activity": exact_match, "activity_id": exact_match["id"]}
        
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
        mapped_match = execute_query("SELECT * FROM activity WHERE title = %s", (mapped_name,), fetch_one=True)
        if mapped_match:
            return {"activity": mapped_match, "activity_id": mapped_match["id"]}
            
    return {"activity": None, "activity_id": None}

@app.get("/activity_id_from_name")
async def get_activity_id_from_name(name: str):
    exact_match = execute_query("SELECT id, title FROM activity WHERE title = %s", (name,), fetch_one=True)
    if not exact_match:
        like_match = execute_query("SELECT id, title FROM activity WHERE title ILIKE %s", (f"%{name}%",), fetch_one=True)
        if like_match:
            return {"id": like_match["id"], "title": like_match["title"]}
    else:
        return {"id": exact_match["id"], "title": exact_match["title"]}
        
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
        mapped_match = execute_query("SELECT id, title FROM activity WHERE title = %s", (mapped_name,), fetch_one=True)
        if mapped_match:
            return {"id": mapped_match["id"], "title": mapped_match["title"]}
            
    return {"id": None, "title": None}

# ------------------- ROOMS ------------------- #

@app.get("/rooms")
async def get_rooms(lang: str = "en"):
    try:
        base_rooms = execute_query("SELECT * FROM room_base")
        if not base_rooms:
            return {"rooms": []}
            
        rooms = []
        missing_translations = []
        for base in base_rooms:
            room_id = base["id"]
            trans_data = execute_query("SELECT * FROM room_translations WHERE room_id = %s AND language_code = %s", (room_id, lang), fetch_one=True)
            
            if not trans_data:
                missing_translations.append(room_id)
                continue
                
            room = {**base, **trans_data}
            room.pop("room_id", None)
            room.pop("language_code", None)
            
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
                
            room["features"] = features_list
            
            activities_base = execute_query("SELECT id, type FROM activity_base WHERE roomid = %s", (room_id,))
            room_activities = []
            
            if activities_base:
                for activity_base in activities_base:
                    activity_id = activity_base["id"]
                    trans_act = execute_query("SELECT title, short_description FROM activity_translations WHERE activity_id = %s AND language_code = %s", (activity_id, lang), fetch_one=True)
                    
                    if not trans_act and lang != "en":
                        trans_act = execute_query("SELECT title, short_description FROM activity_translations WHERE activity_id = %s AND language_code = 'en'", (activity_id,), fetch_one=True)
                        
                    if trans_act:
                        activity_info = {
                            "id": activity_id,
                            "title": trans_act.get("title", ""),
                            "type": activity_base.get("type", ""),
                            "description": trans_act.get("short_description", "")
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

@app.get("/room/{room_id}")
async def get_room(room_id: str, lang: str = "en"):
    try:
        base_room = execute_query("SELECT * FROM room_base WHERE id = %s", (room_id,), fetch_one=True)
        if not base_room:
            return {"room": None, "error": f"Room with ID {room_id} not found"}
            
        trans_data = execute_query("SELECT * FROM room_translations WHERE room_id = %s AND language_code = %s", (room_id, lang), fetch_one=True)
        if not trans_data and lang != "en":
            trans_data = execute_query("SELECT * FROM room_translations WHERE room_id = %s AND language_code = 'en'", (room_id,), fetch_one=True)
            
        room_data = {**base_room}
        if trans_data:
            room_data.update(trans_data)
            room_data.pop("room_id", None)
            room_data.pop("language_code", None)
            
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
            
        activities_base = execute_query("SELECT id, type FROM activity_base WHERE roomid = %s", (room_id,))
        room_activities = []
        
        if activities_base:
            for activity_base in activities_base:
                activity_id = activity_base["id"]
                trans_act = execute_query("SELECT title, short_description FROM activity_translations WHERE activity_id = %s AND language_code = %s", (activity_id, lang), fetch_one=True)
                
                if not trans_act and lang != "en":
                    trans_act = execute_query("SELECT title, short_description FROM activity_translations WHERE activity_id = %s AND language_code = 'en'", (activity_id,), fetch_one=True)
                    
                if trans_act:
                    activity_info = {
                        "id": activity_id,
                        "title": trans_act.get("title", ""),
                        "type": activity_base.get("type", ""),
                        "description": trans_act.get("short_description", "")
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

@app.get("/areas")
async def get_areas():
    areas_base = execute_query("SELECT * FROM areas")
    areas_data = []
    
    for area in (areas_base or []):
        areas_data.append(area)
        
    return {"areas": areas_data}

@app.get("/area/{area_id}")
async def get_area(area_id: str):
    area = execute_query("SELECT * FROM areas WHERE id = %s", (area_id,), fetch_one=True)
    if area:
        return {"area": area}
    return {"area": None}

@app.get("/reviews")
async def get_reviews(lang: str = "en"):
    try:
        base_reviews = execute_query("SELECT * FROM reviews_base ORDER BY date DESC")
        if not base_reviews:
            return {"reviews": []}
            
        reviews = []
        for base in base_reviews:
            trans_data = execute_query("SELECT * FROM review_translations WHERE review_id = %s AND language_code = %s", (base["id"], lang), fetch_one=True)
            
            if not trans_data and lang != "en":
                trans_data = execute_query("SELECT * FROM review_translations WHERE review_id = %s AND language_code = 'en'", (base["id"],), fetch_one=True)
                
            review = {**base}
            if trans_data:
                review.update(trans_data)
                review.pop("review_id", None)
                review.pop("language_code", None)
                
            participant_data = execute_query("SELECT * FROM participant WHERE id = %s", (base["idparticipant"],), fetch_one=True)
            if not participant_data:
                participant_data = {}
                
            activity_base = execute_query("SELECT id FROM activity_base WHERE id = %s", (base["idactivity"],), fetch_one=True)
            activity_id = None
            activity_title = None
            
            if activity_base:
                activity_id = activity_base.get("id")
                activity_trans = execute_query("SELECT title FROM activity_translations WHERE activity_id = %s AND language_code = %s", (activity_id, lang), fetch_one=True)
                
                if not activity_trans:
                    activity_trans = execute_query("SELECT title FROM activity_translations WHERE activity_id = %s AND language_code = 'en'", (activity_id,), fetch_one=True)
                    
                if activity_trans:
                    activity_title = activity_trans.get("title")
                    
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
