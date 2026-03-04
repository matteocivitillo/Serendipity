--
-- PostgreSQL database cluster dump
--




--
-- Roles
--


--
-- User Configurations
--

--
-- User Config "anon"
--


--
-- User Config "authenticated"
--


--
-- User Config "authenticator"
--


--
-- User Config "postgres"
--


--
-- User Config "supabase_admin"
--


--
-- User Config "supabase_auth_admin"
--


--
-- User Config "supabase_read_only_user"
--


--
-- User Config "supabase_storage_admin"
--



--
-- Role memberships
--








--
-- Databases
--

--
-- Database "template1" dump
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.14 (Debian 15.14-1.pgdg12+1)

SELECT pg_catalog.set_config('search_path', '', false);

--
-- PostgreSQL database dump complete
--


--
-- Database "postgres" dump
--


--
-- PostgreSQL database dump
--


-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.14 (Debian 15.14-1.pgdg12+1)

SELECT pg_catalog.set_config('search_path', '', false);

--
-- Name: activity_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.activity_type AS ENUM (
    'Activity',
    'Yoga_class'
);


ALTER TYPE public.activity_type OWNER TO postgres;

--
-- Name: level_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.level_type AS ENUM (
    'Beginner',
    'Advanced',
    'Expertise'
);


ALTER TYPE public.level_type OWNER TO postgres;

--
-- Name: teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    main_expertise character varying(100) NOT NULL,
    about character varying(250) NOT NULL,
    image text
);


ALTER TABLE public.teacher OWNER TO postgres;

--
-- Name: get_teacher_by_activityid_old(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_teacher_by_activityid_old(activity_id integer) RETURNS SETOF public.teacher
    LANGUAGE plpgsql
    AS $$
 BEGIN
  RETURN QUERY
  SELECT id, name, surname, role, main_expertise, about, image
  FROM teaches JOIN teacher ON id = idteacher
  WHERE activity_id = idactivity;
 END;
$$;


ALTER FUNCTION public.get_teacher_by_activityid_old(activity_id integer) OWNER TO postgres;

--
-- Name: activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    level public.level_type,
    short_description character varying(100) NOT NULL,
    about character varying(500) NOT NULL,
    ideal_for character varying(250) NOT NULL,
    main_benefit character varying(250) NOT NULL,
    additional_info character varying(250),
    roomid integer,
    schedule text NOT NULL,
    image text,
    type public.activity_type DEFAULT 'Activity'::public.activity_type
);


ALTER TABLE public.activity OWNER TO postgres;

--
-- Name: activity_base; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_base (
    id integer NOT NULL,
    roomid integer,
    schedule text,
    image text,
    type text,
    teacher_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.activity_base OWNER TO postgres;

--
-- Name: activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_id_seq OWNER TO postgres;

--
-- Name: activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_id_seq OWNED BY public.activity.id;


--
-- Name: activity_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_id_seq1 OWNER TO postgres;

--
-- Name: activity_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_id_seq1 OWNED BY public.activity_base.id;


--
-- Name: activity_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_translations (
    id integer NOT NULL,
    activity_id integer,
    language_code character varying(5),
    title text,
    level text,
    short_description text,
    about text,
    ideal_for text,
    main_benefit text,
    additional_info text,
    schedule text
);


ALTER TABLE public.activity_translations OWNER TO postgres;

--
-- Name: activity_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_translations_id_seq OWNER TO postgres;

--
-- Name: activity_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_translations_id_seq OWNED BY public.activity_translations.id;


--
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas (
    id bigint NOT NULL,
    title character varying NOT NULL,
    image text
);


ALTER TABLE public.areas OWNER TO postgres;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.areas ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: messaggi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messaggi (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    testo text
);


ALTER TABLE public.messaggi OWNER TO postgres;

--
-- Name: participant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participant (
    id integer NOT NULL,
    name character varying(50),
    image text
);


ALTER TABLE public.participant OWNER TO postgres;

--
-- Name: partecipant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partecipant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partecipant_id_seq OWNER TO postgres;

--
-- Name: partecipant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partecipant_id_seq OWNED BY public.participant.id;


--
-- Name: review_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_translations (
    id integer NOT NULL,
    review_id integer NOT NULL,
    language_code character varying(5) NOT NULL,
    review text NOT NULL
);


ALTER TABLE public.review_translations OWNER TO postgres;

--
-- Name: review_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_translations_id_seq OWNER TO postgres;

--
-- Name: review_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_translations_id_seq OWNED BY public.review_translations.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    iduser integer NOT NULL,
    idactivity integer NOT NULL,
    stars integer,
    review text,
    date date,
    CONSTRAINT reviews_stars_check CHECK (((stars >= 1) AND (stars <= 5)))
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_base; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_base (
    id integer NOT NULL,
    idparticipant integer NOT NULL,
    idactivity integer NOT NULL,
    stars integer NOT NULL,
    date date NOT NULL,
    CONSTRAINT reviews_stars_check1 CHECK (((stars >= 1) AND (stars <= 5)))
);


ALTER TABLE public.reviews_base OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews_base.id;


--
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    id integer NOT NULL,
    title character varying(30),
    description character varying(450) NOT NULL,
    image text,
    features text
);


ALTER TABLE public.room OWNER TO postgres;

--
-- Name: room_base; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room_base (
    id integer NOT NULL,
    image text NOT NULL
);


ALTER TABLE public.room_base OWNER TO postgres;

--
-- Name: room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_id_seq OWNER TO postgres;

--
-- Name: room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_id_seq OWNED BY public.room.id;


--
-- Name: room_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_id_seq1 OWNER TO postgres;

--
-- Name: room_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_id_seq1 OWNED BY public.room_base.id;


--
-- Name: room_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room_translations (
    id integer NOT NULL,
    room_id integer NOT NULL,
    language_code character varying(5) NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    features text
);


ALTER TABLE public.room_translations OWNER TO postgres;

--
-- Name: room_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_translations_id_seq OWNER TO postgres;

--
-- Name: room_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_translations_id_seq OWNED BY public.room_translations.id;


--
-- Name: teacher_base; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_base (
    id integer NOT NULL,
    image text NOT NULL,
    "Name" text,
    "Surname" text
);


ALTER TABLE public.teacher_base OWNER TO postgres;

--
-- Name: teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teacher_id_seq OWNER TO postgres;

--
-- Name: teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_id_seq OWNED BY public.teacher.id;


--
-- Name: teacher_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teacher_id_seq1 OWNER TO postgres;

--
-- Name: teacher_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_id_seq1 OWNED BY public.teacher_base.id;


--
-- Name: teacher_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_translations (
    "NON_USARE" integer NOT NULL,
    id integer NOT NULL,
    language_code character varying(5) NOT NULL,
    role text NOT NULL,
    main_expertise text NOT NULL,
    about text NOT NULL
);


ALTER TABLE public.teacher_translations OWNER TO postgres;

--
-- Name: COLUMN teacher_translations."NON_USARE"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.teacher_translations."NON_USARE" IS 'non mi fa eliminare la colonna, lasciamola così e non usiamola';


--
-- Name: teacher_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teacher_translations_id_seq OWNER TO postgres;

--
-- Name: teacher_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_translations_id_seq OWNED BY public.teacher_translations."NON_USARE";


--
-- Name: teaches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teaches (
    idteacher integer NOT NULL,
    idactivity integer NOT NULL
);


ALTER TABLE public.teaches OWNER TO postgres;

--
-- Name: activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity ALTER COLUMN id SET DEFAULT nextval('public.activity_id_seq'::regclass);


--
-- Name: activity_base id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_base ALTER COLUMN id SET DEFAULT nextval('public.activity_id_seq1'::regclass);


--
-- Name: activity_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_translations ALTER COLUMN id SET DEFAULT nextval('public.activity_translations_id_seq'::regclass);


--
-- Name: participant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participant ALTER COLUMN id SET DEFAULT nextval('public.partecipant_id_seq'::regclass);


--
-- Name: review_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_translations ALTER COLUMN id SET DEFAULT nextval('public.review_translations_id_seq'::regclass);


--
-- Name: reviews_base id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_base ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: room id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room ALTER COLUMN id SET DEFAULT nextval('public.room_id_seq'::regclass);


--
-- Name: room_base id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_base ALTER COLUMN id SET DEFAULT nextval('public.room_id_seq1'::regclass);


--
-- Name: room_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_translations ALTER COLUMN id SET DEFAULT nextval('public.room_translations_id_seq'::regclass);


--
-- Name: teacher id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher ALTER COLUMN id SET DEFAULT nextval('public.teacher_id_seq'::regclass);


--
-- Name: teacher_base id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_base ALTER COLUMN id SET DEFAULT nextval('public.teacher_id_seq1'::regclass);


--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity (id, title, level, short_description, about, ideal_for, main_benefit, additional_info, roomid, schedule, image, type) FROM stdin;
23	Ashtanga Yoga	Advanced	A fast-paced, physically demanding style, synchronizing breath and movement.	Ashtanga yoga is a vigorous and structured style of yoga that follows a  specific sequence of postures (asanas) linked with breath (ujjayi  pranayama) and movement (vinyasa). Known for its dynamic flow, Ashtanga  emphasizes discipline and consistency, making it suitable for those  seeking a physically challenging practice. \n	- Individuals seeking a physically demanding workout<br>\n- Practitioners looking to build strength and flexibility<br>\n- Those interested in a structured yoga practice<br>\n- Experienced yogis wanting to deepen their practice	- Improves physical fitness and endurance<br>\n- Increases flexibility and balance<br>\n- Enhances mental clarity and concentration<br>\n- Promotes stress relief and emotional stability<br>\n- Fosters a strong mind-body connection		2	Sun 5:00–6:30 PM	/images/meditation.jpg	Yoga_class
24	Gentle Water Yoga	Advanced	A soothing practice, combining yoga and water therapy for relaxation.	Gentle Water Yoga is a soft, restorative practice suitable for everyone. It combines the principles of yoga with the natural benefits of warm water.\nThe lessons take place in our heated pool, using the support and resistance of water to encourage smooth, light, and low-impact movements, perfect for joint care and body awareness.\n	- Those looking for deep relaxation<br>\n- Recovery from injury or muscle tension<br>\n- Gentle but effective movement practice<br>\n- Mind-body connection in a safe space	Builds strength and stamina	- Suitable for beginners<br>\n- Please bring swimsuit, flip-flops, and towel<br>\n- To reserve a spot, please contact the center staff.	3	Mon/Wed 6:30–7:30 PM	/images/water-yoga_preview.jpg	Activity
22	Kundalini Yoga	Advanced	A spiritual style, focusing on energy release and self-awareness.	Kundalini yoga is a dynamic and spiritual practice that aims to awaken  the dormant energy (Kundalini) at the base of the spine. It combines  physical postures (asanas), breath control (pranayama), chanting  (mantras), and meditation to promote self-awareness and spiritual  growth. This practice enhances mental clarity, emotional balance, and  physical vitality, making it a transformative experience for  practitioners.\n	- Individuals seeking spiritual growth<br>\n- Those looking to enhance self-awareness<br>\n- Practitioners interested in energy work<br>\n- People wanting to reduce stress and anxiety	- Awakens and balances energy centers (chakras)<br>\n- Increases mental clarity and focus<br>\n- Promotes emotional healing and stability<br>\n- Enhances physical strength and flexibility		1	Tue/Thu 6:00–7:00 PM	/images/meditation3.jpg	Yoga_class
30	Mindful Pottery	Beginner	A creative session as a meditative tool for relaxation and self-expression.	Mindful Pottery is a creative and relaxing activity that combines the art of ceramics with mindfulness practice. Through hand-building and wheel-throwing techniques, you’ll explore working with natural materials while cultivating focus, patience, and inner calm.\nThis activity is open to everyone, no previous experience needed. It’s not about perfection, but about enjoying the process.\n	- Anyone looking for a creative and relaxing experience<br>\n- Those who want to slow down and practice mindfulness<br>\n- Exploring manual skills and working with natural materials	- Encourages relaxation and mental clarity<br>\n- Improves focus, patience, and creativity<br>\n- Develops manual dexterity and fine motor skills		5	Sat 10:00–11:00 AM	/images/pottery2.jpg	Activity
27	Dance Fitness Fusion	Beginner	A high-energy workout, blending dance and fitness for a fun challenge.	Dance Fitness Fusion is a high-energy class combining the joy of dance with the benefits of cardio fitness. Inspired by Latin rhythms and designed to get your body moving, it’s a fun, effective way to burn calories, improve coordination, and lift your spirit. \nEach session offers an upbeat atmosphere where music and movement create a total-body experience. No dance background needed, just bring your energy and enthusiasm!\n	- Boosting cardiovascular endurance<br>\n- Burning calories in a fun way<br>\n- Improving rhythm and coordination<br>\n- Anyone who loves music and movement	- Full-body cardio workout<br>\n- Increases stamina and flexibility<br>\n- Enhances mood and confidence<br>\n- Perfect for group motivation and fun	- Comfortable activewear and sneakers recommended<br>\n- High-energy, group-friendly atmosphere	4	Sat 10:00–11:00 AM	/images/zumba-scaled.jpg	Activity
26	Wellness Workshop	Beginner	An educational session, exploring holistic approaches to health and wellbeing.	The Wellness Workshop is a monthly event designed to explore different aspects of physical, mental, and emotional well-being. \nEach session offers a unique experience, combining yoga, meditation, breathing techniques, and holistic practices to support balance and self-care. \nWorkshops are interactive and suitable for everyone a space to learn, share, and recharge together.\n	- Exploring new wellness practices<br>\n- Connecting with like-minded people<br>\n- Deepening your self-care routine<br>\n- Taking time for yourself in a supportive group	- Promotes relaxation and stress relief<br>\n- Increases awareness and personal growth<br>\n- Offers practical tools for daily well-being<br>\n- Builds connection and community		5	Sat 10:00–11:00 AM	/images/workshop.jpg	Activity
29	Sunset Yoga	Beginner	A serene outdoor practice, combining yoga and nature for a peaceful experience.	Sunset Yoga is a calming, open-air practice that blends mindful movement, breathwork, and stillness. Held outdoors, each session aligns with the natural rhythm of sunset, offering a peaceful transition from day to evening.​\nThis class is suitable for all levels and focuses on gentle flow, grounding postures, and deep relaxation.\n	- Unwinding after a busy day​<br>\n- Connecting with nature​<br>\n- Enhancing flexibility and breath awareness​<br>\n- Cultivating inner calm	- Reduces stress and tension​<br>\n- Improves balance and mobility​<br>\n- Promotes mindfulness and presence​<br>\n- Supports restful sleep	Each session concludes with a generous aperitif, offering the perfect moment to unwind, connect, and savor the evening together.	6	Sat 10:00–11:00 AM	/images/aperitif_preview.jpg	Activity
28	Weekend Wellness Retreat	Beginner	A relaxing getaway, offering yoga, meditation, and wellness activities.	The Weekend Wellness Retreat is a monthly escape dedicated to restoring physical, mental, and emotional well-being.\nHeld in a serene natural setting, each retreat combines gentle yoga, guided meditation, breathwork, and self-reflection sessions to promote inner harmony and deep rest. It's a space for stillness, connection, and transformation, open to all levels.\n	- Slowing down and disconnecting from routine<br>\n- Deepening personal awareness and self-care<br>\n- Spending intentional time in nature<br>\n- Recharging body, mind, and spirit	- Promotes stress relief and deep relaxation<br>\n- Enhances mindfulness and emotional clarity<br>\n- Inspires inner growth and self-discovery<br>\n- Encourages a strong sense of community		\N	Sat 10:00–11:00 AM	/images/retreat2.jpg	Activity
25	Mindfulness Meditation	Beginner	A calming practice, cultivating present-moment awareness and inner peace.	Mindfulness Meditation is a guided practice designed to help you develop awareness, presence, and mental balance in your everyday life.\nThrough simple yet powerful meditation techniques, you will learn how to observe thoughts and emotions without judgment, cultivate calm, and foster a deeper connection with the present moment.\n	- Reducing daily stress and anxiety<br>\n- Improving focus and emotional balance<br>\n- Developing mindfulness and inner peace<br>\n- Beginners and experienced meditators alike	- Enhances mental clarity and focus<br>\n- Reduces stress and emotional tension<br>\n- Improves breathing and body awareness<br>\n- Promotes relaxation and well-being<br>\n- Easy to integrate into daily routines	- Suitable for all levels, no previous experience needed<br>\n- Comfortable clothing recommended<br>\n- Mats and cushions provided	2	Sat 10:00–11:00 AM	/images/meditation3.jpg	Activity
21	Hatha Yoga	Beginner	A slow style, working on postures (asana), breathing (pranayama) and relaxation.	Hatha yoga is a foundational style of yoga that focuses on physical  postures (asanas) and breath control (pranayama) to cultivate strength,  flexibility, and balance. \nIt typically involves a slower-paced practice, allowing practitioners to concentrate on proper alignment and  mindfulness. 	- Beginners exploring yoga<br>\n- Individuals seeking stress relief<br>\n- Those wanting to enhance flexibility<br>\n- Practitioners interested in mindfulness<br>\n- Anyone recovering from injuries	- Improves physical health and fitness<br>\n- Increases mental clarity and focus<br>\n- Reduces stress and anxiety levels<br>\n- Enhances posture and body awareness<br>\n- Fosters a sense of inner peace and relaxation		1	Mon/Wed/Fri 7:00–8:00 AM	/images/meditation2.jpg	Yoga_class


--
-- Data for Name: activity_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_base (id, roomid, schedule, image, type, teacher_id) FROM stdin;
23	2	Sun 5:00–6:30 PM	/images/ashtanga.webp	Yoga_class	3
24	3	Mon/Wed 6:30–7:30 PM	/images/water-yoga_preview.webp	Activity	4
29	6	Sat 10:00–11:00 AM	/images/retreats.webp	Activity	5
25	2	Sat 10:00–11:00 AM	/images/meditation_preview.webp	Activity	5
30	5	Sat 10:00–11:00 AM	/images/pottery.webp	Activity	4
26	5	Sat 10:00–11:00 AM	/images/workshop_preview.webp	Activity	2
27	4	Sat 10:00–11:00 AM	/images/zumba-scaled.webp	Activity	3
21	1	Mon/Wed/Fri 7:00–8:00 AM	/images/hatha.webp	Yoga_class	1
22	1	Tue/Thu 6:00–7:00 PM	/images/kundalini.webp	Yoga_class	2
28	\N	Sat 10:00–11:00 AM	/images/retreats.webp	Activity	4


--
-- Data for Name: activity_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_translations (id, activity_id, language_code, title, level, short_description, about, ideal_for, main_benefit, additional_info, schedule) FROM stdin;
2	21	fr	Hatha Yoga	Débutant	Un style lent axé sur les postures (asana), la respiration (pranayama) et la relaxation.	Le Hatha Yoga est une forme de yoga fondamentale qui met l’accent sur les postures physiques et la respiration pour développer la force, la souplesse et l’équilibre.	- Débutants<br>- Ceux qui cherchent à réduire le stress<br>- Améliorer la souplesse<br>- Pratiquer la pleine conscience<br>- En convalescence de blessures	- Améliore la santé physique<br>- Augmente la clarté mentale<br>- Réduit le stress et l’anxiété<br>- Améliore la posture<br>- Favorise la paix intérieure		Lun/Mer/Ven 7h00-8h00
3	21	zh	哈他瑜伽	初学者	一种缓慢的瑜伽风格，注重姿势（体式）、呼吸（调息）和放松。	哈他瑜伽是一种基础瑜伽风格，专注于体式和呼吸控制（调息），以培养力量、柔韧性和平衡感。练习节奏较慢，有助于专注于正确的体位和正念。	- 瑜伽初学者<br>- 需要减压的人群<br>- 希望增强柔韧性的人<br>- 对正念感兴趣的练习者<br>- 正在恢复中的人	- 改善身体健康和体能<br>- 增强心理清晰度和专注力<br>- 减轻压力和焦虑<br>- 改善姿势和身体意识<br>- 提升内在的平静与放松		周一/周三/周五 上午 7:00–8:00
4	21	de	Hatha-Yoga	Anfänger	Ein langsamer Yogastil, der sich auf Körperhaltungen (Asanas), Atmung (Pranayama) und Entspannung konzentriert.	Hatha-Yoga ist ein grundlegender Yogastil, der den Fokus auf physische Haltungen (Asanas) und Atemkontrolle (Pranayama) legt, um Kraft, Flexibilität und Gleichgewicht zu fördern. Die Praxis ist in der Regel langsam, sodass die Ausführenden sich auf Ausrichtung und Achtsamkeit konzentrieren können.	- Anfänger, die Yoga entdecken möchten<br>- Menschen, die Stress abbauen wollen<br>- Personen, die ihre Flexibilität verbessern möchten<br>- Übende, die sich für Achtsamkeit interessieren<br>- Menschen in der Genesung	- Verbessert die körperliche Gesundheit und Fitness<br>- Erhöht die geistige Klarheit und Konzentration<br>- Reduziert Stress und Angst<br>- Verbessert die Körperhaltung und Körperbewusstsein<br>- Fördert inneren Frieden und Entspannung		Mo./Mi./Fr. 7:00–8:00 Uhr
6	22	fr	Kundalini Yoga	Avancé	Un style spirituel, axé sur la libération de l’énergie et la conscience de soi.	Le Kundalini Yoga est une pratique dynamique et spirituelle qui vise à éveiller l’énergie dormante (Kundalini) à la base de la colonne vertébrale. Il combine des postures physiques (asanas), la respiration (pranayama), des mantras et la méditation pour favoriser la conscience de soi et la croissance spirituelle.	- Personnes recherchant un développement spirituel<br>- Celles souhaitant accroître leur conscience de soi<br>- Pratiquants intéressés par le travail énergétique<br>- Personnes souhaitant réduire le stress et l’anxiété	- Éveille et équilibre les centres d’énergie (chakras)<br>- Améliore la clarté mentale et la concentration<br>- Favorise la guérison émotionnelle et la stabilité<br>- Renforce la force physique et la souplesse		Mar/Jeu 18h00-19h00
5	22	it	Kundalini Yoga	Avanzato	Uno stile spirituale, focalizzato sul rilascio dell’energia e sull’autoconsapevolezza.	Il Kundalini Yoga è una pratica dinamica e spirituale che mira a risvegliare l’energia dormiente (Kundalini) alla base della colonna vertebrale. Combina posture fisiche (asana), controllo del respiro (pranayama), mantra e meditazione per promuovere la consapevolezza e la crescita spirituale.	- Chi cerca crescita spirituale<br>- Chi vuole aumentare l’autoconsapevolezza<br>- Praticanti interessati al lavoro energetico<br>- Persone che vogliono ridurre stress e ansia	- Risveglia e bilancia i centri energetici (chakra)<br>- Aumenta chiarezza mentale e concentrazione<br>- Promuove guarigione emotiva e stabilità<br>- Migliora forza fisica e flessibilità		Mar/Gio 18:00–19:00
7	22	zh	昆达里尼瑜伽	高级	一种精神性风格，专注于能量释放和自我觉察。	昆达里尼瑜伽是一种动态且具有精神性的练习，旨在唤醒脊柱底部沉睡的能量（昆达里尼）。它结合体式、呼吸控制、吟唱和冥想，促进自我意识和灵性成长。	- 寻求灵性成长的人<br>- 想增强自我觉察的人<br>- 对能量工作感兴趣的练习者<br>- 想减少压力和焦虑的人	- 唤醒和平衡能量中心（脉轮）<br>- 提高心理清晰度和专注力<br>- 促进情绪疗愈和稳定<br>- 增强身体力量和柔韧性		周二/周四 下午 6:00–7:00
8	22	de	Kundalini-Yoga	Fortgeschrittene	Ein spiritueller Stil mit Fokus auf Energieentfaltung und Selbstwahrnehmung.	Kundalini-Yoga ist eine dynamische und spirituelle Praxis, die darauf abzielt, die ruhende Energie (Kundalini) an der Basis der Wirbelsäule zu erwecken. Sie kombiniert Körperhaltungen (Asanas), Atemtechniken (Pranayama), Mantras und Meditation zur Förderung von Selbstbewusstsein und spirituellem Wachstum.	- Personen mit spirituellem Interesse<br>- Menschen, die mehr Selbstwahrnehmung entwickeln möchten<br>- Übende, die sich mit Energiearbeit beschäftigen<br>- Personen, die Stress und Angst abbauen möchten	- Aktiviert und balanciert Energiezentren (Chakren)<br>- Steigert mentale Klarheit und Fokus<br>- Unterstützt emotionale Heilung und Stabilität<br>- Fördert körperliche Stärke und Flexibilität		Di./Do. 18:00–19:00 Uhr
9	23	it	Ashtanga Yoga	Avanzato	Uno stile veloce e fisicamente impegnativo che sincronizza respiro e movimento.	Ashtanga yoga è uno stile vigoroso e strutturato che segue una sequenza precisa di posture (asana) collegate al respiro (ujjayi pranayama) e al movimento (vinyasa). Conosciuto per il suo flusso dinamico, enfatizza disciplina e costanza.	- Chi cerca un allenamento fisico intenso<br>- Chi vuole sviluppare forza e flessibilità<br>- Chi è interessato a una pratica strutturata<br>- Yogis esperti che vogliono approfondire la pratica	- Migliora la forma fisica e la resistenza<br>- Aumenta la flessibilità e l’equilibrio<br>- Migliora la chiarezza mentale e la concentrazione<br>- Favorisce il rilassamento e la stabilità emotiva<br>- Rafforza la connessione mente-corpo		Dom 17:00–18:30
10	24	it	Yoga dolce in acqua	Avanzato	Una pratica rilassante che combina yoga e idroterapia.	Gentle Water Yoga è una pratica dolce e rigenerante adatta a tutti. Si svolge in piscina riscaldata, sfruttando il sostegno e la resistenza dell’acqua per movimenti leggeri e a basso impatto.	- Chi cerca rilassamento profondo<br>- Recupero da infortuni<br>- Pratica delicata ma efficace<br>- Connessione mente-corpo in ambiente sicuro	Rafforza il corpo e la resistenza	- Adatto ai principianti<br>- Portare costume, ciabatte e asciugamano<br>- Per prenotazioni, contattare lo staff	Dom 17:00–18:30
15	23	de	Ashtanga-Yoga	Fortgeschritten	Ein schneller, körperlich anspruchsvoller Stil, der Atmung und Bewegung synchronisiert.	Ashtanga-Yoga ist ein intensiver, strukturierter Yogastil mit festgelegter Abfolge, Atemtechnik und Bewegung. Er legt großen Wert auf Disziplin und Regelmäßigkeit.	- Wer ein intensives Training sucht<br>- Zur Verbesserung von Kraft und Flexibilität<br>- Strukturierte Praxis bevorzugt<br>- Fortgeschrittene Yogis	- Verbessert Fitness und Ausdauer<br>- Erhöht Flexibilität und Gleichgewicht<br>- Steigert mentale Klarheit<br>- Reduziert Stress<br>- Fördert die Verbindung von Körper und Geist		So. 17:00–18:30 Uhr
11	23	fr	Ashtanga Yoga	Avancé	Un style rapide et exigeant physiquement, synchronisant respiration et mouvement.	L'Ashtanga est un style vigoureux et structuré qui suit une séquence spécifique de postures liées à la respiration et au mouvement. Il met l'accent sur la discipline et la régularité.	- Ceux qui recherchent un effort physique intense<br>- Développer force et souplesse<br>- Une pratique structurée<br>- Yogis expérimentés	- Améliore la condition physique<br>- Augmente la souplesse et l'équilibre<br>- Favorise la clarté mentale<br>- Réduit le stress<br>- Renforce la connexion corps-esprit		Dim 17h00–18h30
13	23	zh	阿斯汤加瑜伽	高级	一种快节奏、需要体力的风格，呼吸与动作同步。	阿斯汤加瑜伽是一种强度高、结构明确的瑜伽风格，遵循固定体式顺序，结合呼吸（ujjayi）与流动（vinyasa）。注重纪律与持续练习。	- 寻求高强度锻炼的人<br>- 增强力量与柔韧性者<br>- 喜欢结构化练习者<br>- 经验丰富的瑜伽士	- 提升体能与耐力<br>- 增强柔韧性与平衡<br>- 提高专注力<br>- 帮助减压<br>- 加强身心连接		周日下午 5:00–6:30
12	24	fr	Yoga aquatique doux	Avancé	Une pratique apaisante combinant yoga et thérapie aquatique.	Le Gentle Water Yoga est une pratique douce et réparatrice. Les cours se déroulent en piscine chauffée, en utilisant la résistance naturelle de l'eau pour favoriser des mouvements fluides et doux.	- Recherche de détente profonde<br>- Récupération musculaire<br>- Mouvement en douceur<br>- Connexion corps-esprit	Développe la force et l'endurance	- Convient aux débutants<br>- Apporter maillot, sandales et serviette<br>- Réservation auprès du personnel	Dim 17h00–18h30
14	24	zh	温和水中瑜伽	高级	结合瑜伽与水疗的舒缓练习。	温和水中瑜伽是一种适合所有人的修复性练习，在加热泳池中进行，借助水的支撑与阻力，进行柔和、低冲击的动作，适合关节保护与身体意识培养。	- 寻求深度放松者<br>- 伤后恢复者<br>- 温和有效的运动方式<br>- 安全空间中的身心连接	增强力量与耐力	- 适合初学者<br>- 请带泳衣、拖鞋和毛巾<br>- 预约请联系工作人员	周日下午 5:00–6:30
16	24	de	Sanftes Wasser-Yoga	Fortgeschritten	Eine beruhigende Praxis, die Yoga und Wassertherapie kombiniert.	Gentle Water Yoga ist eine sanfte, regenerierende Praxis im beheizten Pool. Die Übungen nutzen den Widerstand des Wassers für fließende, gelenkschonende Bewegungen.	- Tiefe Entspannung suchende<br>- Genesung nach Verletzungen<br>- Sanftes, effektives Training<br>- Körper-Geist-Verbindung in sicherem Umfeld	Stärkt Kraft und Ausdauer	- Für Anfänger geeignet<br>- Badeanzug, Handtuch und Badeschuhe mitbringen<br>- Anmeldung über das Personal	So. 17:00–18:30 Uhr
18	25	fr	Méditation de pleine conscience	Débutant	Une pratique apaisante qui cultive la pleine conscience et la paix intérieure.	La méditation de pleine conscience est une pratique guidée conçue pour développer la conscience, la présence et l'équilibre mental. Grâce à des techniques simples mais puissantes, vous apprendrez à observer vos pensées et émotions sans jugement, et à vous connecter au moment présent.	- Réduction du stress quotidien<br>- Amélioration de la concentration<br>- Développement de la pleine conscience<br>- Adapté aux débutants et expérimentés	- Améliore la clarté mentale<br>- Réduit le stress émotionnel<br>- Favorise la conscience corporelle<br>- Encourage le bien-être<br>- Facile à intégrer au quotidien	- Convient à tous les niveaux<br>- Vêtements confortables recommandés<br>- Tapis et coussins fournis	Sam 10h00-11h00
19	25	zh	正念冥想	初学者	一种宁静的练习，培养当下意识与内心平静。	正念冥想是一种引导式练习，帮助你在日常生活中培养觉知、专注和心理平衡。通过简单而有效的冥想技巧，你将学会观察思想和情绪而不加评判，培养内在平静，与当下建立更深的连接。	- 减轻日常压力和焦虑<br>- 提高专注力和平衡情绪<br>- 培养正念与内在平静<br>- 适合初学者和有经验的人	- 增强心理清晰度和专注力<br>- 减轻压力与情绪紧张<br>- 改善呼吸与身体觉察<br>- 促进放松与身心健康<br>- 易于融入日常生活	- 适合所有级别，无需经验<br>- 建议穿着舒适衣物<br>- 提供瑜伽垫和坐垫	周六 上午 10:00–11:00
20	25	de	Achtsamkeitsmeditation	Anfänger	Eine beruhigende Praxis zur Förderung von Achtsamkeit und innerem Frieden.	Achtsamkeitsmeditation ist eine geführte Praxis, die dir hilft, im Alltag Bewusstsein, Präsenz und mentale Ausgeglichenheit zu entwickeln. Mit einfachen, aber kraftvollen Techniken lernst du, Gedanken und Emotionen ohne Urteil zu beobachten, Ruhe zu finden und dich mit dem gegenwärtigen Moment zu verbinden.	- Stressreduktion im Alltag<br>- Verbesserung der Konzentration und des emotionalen Gleichgewichts<br>- Entwicklung von Achtsamkeit und innerem Frieden<br>- Für Anfänger und erfahrene Meditierende geeignet	- Fördert mentale Klarheit und Fokus<br>- Reduziert Stress und emotionale Anspannung<br>- Verbessert Atmung und Körperbewusstsein<br>- Unterstützt Entspannung und Wohlbefinden<br>- Leicht in den Alltag integrierbar	- Für alle Erfahrungsstufen geeignet<br>- Bequeme Kleidung empfohlen<br>- Matten und Kissen werden bereitgestellt	Sa 10:00–11:00 Uhr
25	27	it	Danza Fitness Fusion	Principiante	Un allenamento ad alta energia che unisce danza e fitness per una sfida divertente.	Dance Fitness Fusion è una lezione energica che combina la gioia della danza con i benefici del cardio fitness. Ispirata ai ritmi latini, è un modo divertente ed efficace per bruciare calorie, migliorare la coordinazione e sollevare lo spirito. Ogni sessione offre un'atmosfera vivace dove musica e movimento creano un'esperienza completa per il corpo.	- Aumentare la resistenza cardiovascolare<br>- Bruciare calorie in modo divertente<br>- Migliorare ritmo e coordinazione<br>- Per chi ama la musica e il movimento	- Allenamento cardio total-body<br>- Aumenta la resistenza e la flessibilità<br>- Migliora l'umore e la fiducia<br>- Perfetto per la motivazione di gruppo	- Abbigliamento sportivo e scarpe comode consigliati<br>- Atmosfera energica e adatta ai gruppi	Sab 10:00–11:00
22	26	fr	Atelier Bien-être	Débutant	Une session éducative qui explore des approches holistiques de la santé et du bien-être.	L'Atelier Bien-être est un événement mensuel conçu pour explorer divers aspects du bien-être physique, mental et émotionnel. Chaque session offre une expérience unique, combinant yoga, méditation, techniques de respiration et pratiques holistiques pour soutenir l'équilibre et les soins personnels.	- Explorer de nouvelles pratiques de bien-être<br>- Se connecter avec des personnes partageant les mêmes idées<br>- Approfondir sa routine de self-care<br>- Prendre du temps pour soi dans un groupe bienveillant	- Favorise la détente et la réduction du stress<br>- Accroît la conscience de soi et le développement personnel<br>- Offre des outils pratiques pour le bien-être quotidien<br>- Renforce le lien social et la communauté		Sam 10h00-11h00
26	27	fr	Fusion Danse Fitness	Débutant	Un entraînement énergique combinant danse et fitness pour un défi amusant.	Dance Fitness Fusion est un cours dynamique qui associe le plaisir de la danse aux bienfaits du cardio. Inspirée des rythmes latins, cette activité permet de brûler des calories, d'améliorer la coordination et d'élever l'humeur. Chaque séance offre une ambiance joyeuse où musique et mouvement créent une expérience complète.	- Améliorer l'endurance cardio<br>- Brûler des calories avec plaisir<br>- Développer rythme et coordination<br>- Pour les amateurs de musique et de mouvement	- Entraînement cardio complet<br>- Augmente l'endurance et la souplesse<br>- Renforce la confiance en soi et la bonne humeur<br>- Parfait pour la motivation en groupe	- Tenue de sport confortable et baskets recommandées<br>- Ambiance énergique et conviviale	Sam 10h00-11h00
27	27	zh	舞蹈健身融合课	初学者	高能量锻炼课程，结合舞蹈和健身，充满乐趣与挑战。	Dance Fitness Fusion 是一堂充满活力的课程，将舞蹈的乐趣与有氧健身的益处相结合。受拉丁节奏启发，课程帮助你燃烧卡路里、改善协调性并提升情绪。每节课都营造出充满节奏感的氛围，是全身性的健身体验。	- 提高心肺耐力<br>- 以愉快方式燃烧卡路里<br>- 增强节奏感和协调性<br>- 适合喜欢音乐与舞动的人	- 全身有氧锻炼<br>- 增强耐力和柔韧性<br>- 改善心情与自信<br>- 适合团队动力和互动	- 建议穿着舒适运动装和运动鞋<br>- 氛围活跃，适合群体活动	周六 上午 10:00–11:00
24	26	de	Wellness-Workshop	Anfänger	Eine lehrreiche Sitzung, die ganzheitliche Ansätze für Gesundheit und Wohlbefinden erforscht.	Der Wellness-Workshop ist eine monatliche Veranstaltung, die verschiedene Aspekte des körperlichen, mentalen und emotionalen Wohlbefindens erkundet. Jede Sitzung bietet ein einzigartiges Erlebnis mit Yoga, Meditation, Atemübungen und ganzheitlichen Methoden zur Unterstützung von Gleichgewicht und Selbstfürsorge.	- Neue Wellness-Praktiken entdecken<br>- Mit Gleichgesinnten in Kontakt kommen<br>- Die eigene Selfcare-Routine vertiefen<br>- Zeit für sich selbst in einer unterstützenden Gruppe nehmen	- Fördert Entspannung und Stressabbau<br>- Stärkt Selbstwahrnehmung und persönliches Wachstum<br>- Bietet praktische Werkzeuge für den Alltag<br>- Fördert Gemeinschaft und Verbindung		Sa 10:00–11:00 Uhr
28	27	de	Dance Fitness Fusion	Anfänger	Ein energiegeladenes Training, das Tanz und Fitness für eine spaßige Herausforderung vereint.	Dance Fitness Fusion ist ein energiegeladenes Workout, das die Freude am Tanzen mit den Vorteilen eines Cardio-Trainings kombiniert. Inspiriert von lateinamerikanischen Rhythmen, ist es eine unterhaltsame und effektive Möglichkeit, Kalorien zu verbrennen, Koordination zu verbessern und die Stimmung zu heben. Jede Einheit schafft eine motivierende Atmosphäre für ein Ganzkörpertraining.	- Verbesserung der Ausdauer<br>- Kalorienverbrennung mit Spaß<br>- Förderung von Rhythmus und Koordination<br>- Für alle, die Musik und Bewegung lieben	- Ganzkörper-Cardiotraining<br>- Erhöht Ausdauer und Beweglichkeit<br>- Stärkt Selbstvertrauen und Stimmung<br>- Ideal für Gruppentraining	- Bequeme Sportkleidung und Turnschuhe empfohlen<br>- Energiegeladene, gruppenfreundliche Atmosphäre	Sa 10:00–11:00 Uhr
23	26	zh	健康工作坊	初学者	一场探索整体健康方法的教育性课程。	健康工作坊是一个每月举行的活动，旨在探索身体、心理和情感健康的各个方面。每节课融合瑜伽、冥想、呼吸技巧和整体实践，帮助实现平衡和自我关怀。	- 探索新的健康实践<br>- 与志同道合的人建立联系<br>- 深化自我关怀<br>- 在支持性团体中放松和分享	- 有助于放松与减压<br>- 提升自我觉察与成长<br>- 提供日常实用工具<br>- 建立联系与社区归属感		周六 上午 10:00–11:00
34	29	it	Yoga al Tramonto	Principiante	Una pratica all’aperto serena, che unisce yoga e natura per un’esperienza pacifica.	Lo Yoga al Tramonto è una pratica rilassante in spazi aperti che fonde movimento consapevole, respirazione e quiete. Ogni sessione si svolge in armonia con il tramonto, offrendo una transizione tranquilla tra giorno e sera, adatta a tutti i livelli.	- Rilassarsi dopo una giornata intensa<br>- Connettersi con la natura<br>- Migliorare la flessibilità e la consapevolezza del respiro<br>- Coltivare calma interiore	- Riduce stress e tensioni<br>- Migliora equilibrio e mobilità<br>- Promuove la presenza mentale<br>- Favorisce un sonno riposante	Ogni sessione si conclude con un generoso aperitivo: un momento perfetto per rilassarsi, connettersi e godersi la serata insieme.	Sab 10:00–11:00
38	30	it	Ceramica Consapevole	Principiante	Una sessione creativa come strumento meditativo per il rilassamento e l’espressione di sé.	La Ceramica Consapevole è un’attività creativa e rilassante che unisce l’arte della ceramica alla pratica della mindfulness. Attraverso tecniche manuali e al tornio, si esplora il lavoro con materiali naturali sviluppando concentrazione, pazienza e calma interiore.	- Chi cerca un’esperienza creativa e rilassante<br>- Chi vuole rallentare e praticare consapevolezza<br>- Chi vuole riscoprire la manualità	- Favorisce il rilassamento e la chiarezza mentale<br>- Migliora concentrazione, pazienza e creatività<br>- Sviluppa destrezza manuale e coordinazione fine		Sab 10:00–11:00
35	29	fr	Yoga au coucher du soleil	Débutant	Une pratique en plein air paisible alliant yoga et nature.	Le Yoga au coucher du soleil est une pratique apaisante en extérieur, mêlant mouvements conscients, respiration et immobilité. Chaque séance suit le rythme naturel du coucher du soleil pour offrir une transition paisible de la journée à la soirée, accessible à tous les niveaux.	- Se détendre après une journée bien remplie<br>- Se connecter à la nature<br>- Améliorer sa souplesse et sa respiration<br>- Cultiver la paix intérieure	- Réduit le stress et les tensions<br>- Améliore l'équilibre et la mobilité<br>- Favorise la pleine conscience<br>- Favorise un sommeil réparateur	Chaque séance se termine par un généreux apéritif – un moment idéal pour se détendre, échanger et savourer la soirée ensemble.	Sam 10h00-11h00
32	28	zh	周末健康静修营	初学者	一次放松的假期，提供瑜伽、冥想和健康活动。	周末健康静修营是每月一次的活动，致力于恢复身体、心理和情绪的平衡。在宁静的自然环境中进行，每次静修融合了温和瑜伽、冥想、呼吸练习和自我探索课程，促进内在和谐与深层放松。	- 慢下来，暂时脱离日常节奏<br>- 加强自我觉察与自我关怀<br>- 与大自然共处<br>- 为身心灵充电	- 缓解压力，放松身心<br>- 提升正念与情绪清晰度<br>- 激发内在成长与探索<br>- 培养归属感与社区意识		周六 上午 10:00–11:00
40	30	zh	正念陶艺	初学者	一个融合创意与冥想的放松与自我表达课程。	正念陶艺是一种结合陶瓷艺术与正念练习的创造性放松活动。通过手工与拉坯技巧，探索天然材质的同时，培养专注、耐心与内在平静。	- 寻求创意与放松体验的人<br>- 希望慢下来并练习正念的人<br>- 喜欢动手或手工艺的人	- 有助于放松和提升心理清晰度<br>- 培养专注、耐心与创造力<br>- 提升手部灵活性与精细动作协调		周六 上午 10:00–11:00
36	29	zh	日落瑜伽	初学者	一场融合自然与瑜伽的户外宁静练习。	日落瑜伽是一种舒缓的户外课程，结合正念动作、呼吸训练与静止冥想。课程在日落时分进行，帮助学员从白天平稳过渡到夜晚，适合所有练习水平。	- 忙碌一天后的放松<br>- 与自然连接<br>- 提高柔韧性与呼吸觉察<br>- 培养内心平静	- 减轻压力与紧张感<br>- 改善平衡感与身体灵活性<br>- 增强正念与当下觉知<br>- 有助于放松入眠	每次课程结束后将提供精致开胃小食，完美结束充实的一天，享受与他人的交流时光。	周六 上午 10:00–11:00
33	28	de	Wellness-Retreat am Wochenende	Anfänger	Ein entspannender Rückzugsort mit Yoga, Meditation und Wellness-Aktivitäten.	Das Wellness-Retreat am Wochenende ist eine monatliche Auszeit zur Wiederherstellung des körperlichen, geistigen und emotionalen Wohlbefindens. In einer ruhigen, natürlichen Umgebung vereint jedes Retreat sanftes Yoga, geführte Meditation, Atemübungen und Selbstreflexion, um innere Harmonie und tiefe Erholung zu fördern.	- Entschleunigen und vom Alltag abschalten<br>- Selbstfürsorge und Achtsamkeit vertiefen<br>- Zeit in der Natur bewusst genießen<br>- Körper, Geist und Seele auftanken	- Fördert Entspannung und Stressabbau<br>- Stärkt Achtsamkeit und emotionale Klarheit<br>- Regt inneres Wachstum und Selbstfindung an<br>- Baut ein starkes Gemeinschaftsgefühl auf		Sa 10:00–11:00 Uhr
37	29	de	Sonnenuntergangs-Yoga	Anfänger	Eine friedliche Outdoor-Praxis, die Yoga und Natur vereint.	Sonnenuntergangs-Yoga ist eine beruhigende Praxis im Freien, bei der achtsame Bewegungen, Atemarbeit und Stille kombiniert werden. Die Sitzungen orientieren sich am natürlichen Rhythmus des Sonnenuntergangs und bieten einen sanften Übergang vom Tag in den Abend – geeignet für alle Niveaus.	- Entspannen nach einem anstrengenden Tag<br>- Verbindung mit der Natur<br>- Verbesserung von Flexibilität und Atembewusstsein<br>- Entwicklung innerer Ruhe	- Reduziert Stress und Anspannung<br>- Verbessert Gleichgewicht und Beweglichkeit<br>- Fördert Achtsamkeit und Präsenz<br>- Unterstützt einen erholsamen Schlaf	Jede Einheit endet mit einem großzügigen Aperitif – der perfekte Moment, um zu entspannen, sich zu verbinden und den Abend zu genießen.	Sa 10:00–11:00 Uhr
43	22	en	Kundalini Yoga	Advanced	A spiritual style, focusing on energy release and self-awareness.	Kundalini yoga is a dynamic and spiritual practice that aims to awaken the dormant energy (Kundalini) at the base of the spine. It combines physical postures (asanas), breath control (pranayama), chanting (mantras), and meditation to promote self-awareness and spiritual growth. This practice enhances mental clarity, emotional balance, and physical vitality, making it a transformative experience for practitioners.	- Individuals seeking spiritual growth<br>- Those looking to enhance self-awareness<br>- Practitioners interested in energy work<br>- People wanting to reduce stress and anxiety	- Awakens and balances energy centers (chakras)<br>- Increases mental clarity and focus<br>- Promotes emotional healing and stability<br>- Enhances physical strength and flexibility		Tue/Thu 6:00–7:00 PM
44	23	en	Ashtanga Yoga	Advanced	A fast-paced, physically demanding style, synchronizing breath and movement.	Ashtanga yoga is a vigorous and structured style of yoga that follows a specific sequence of postures (asanas) linked with breath (ujjayi pranayama) and movement (vinyasa). Known for its dynamic flow, Ashtanga emphasizes discipline and consistency, making it suitable for those seeking a physically challenging practice.	- Individuals seeking a physically demanding workout<br>- Practitioners looking to build strength and flexibility<br>- Those interested in a structured yoga practice<br>- Experienced yogis wanting to deepen their practice	- Improves physical fitness and endurance<br>- Increases flexibility and balance<br>- Enhances mental clarity and concentration<br>- Promotes stress relief and emotional stability<br>- Fosters a strong mind-body connection		Sun 5:00–6:30 PM
45	24	en	Gentle Water Yoga	Advanced	A soothing practice, combining yoga and water therapy for relaxation.	Gentle Water Yoga is a soft, restorative practice suitable for everyone. It combines the principles of yoga with the natural benefits of warm water. The lessons take place in our heated pool, using the support and resistance of water to encourage smooth, light, and low-impact movements, perfect for joint care and body awareness.	- Those looking for deep relaxation<br>- Recovery from injury or muscle tension<br>- Gentle but effective movement practice<br>- Mind-body connection in a safe space	Builds strength and stamina	- Suitable for beginners<br>- Please bring swimsuit, flip-flops, and towel<br>- To reserve a spot, please contact the center staff.	Mon/Wed 6:30–7:30 PM
46	25	en	Mindfulness Meditation	Beginner	A calming practice, cultivating present-moment awareness and inner peace.	Mindfulness Meditation is a guided practice designed to help you develop awareness, presence, and mental balance in your everyday life. Through simple yet powerful meditation techniques, you will learn how to observe thoughts and emotions without judgment, cultivate calm, and foster a deeper connection with the present moment.	- Reducing daily stress and anxiety<br>- Improving focus and emotional balance<br>- Developing mindfulness and inner peace<br>- Beginners and experienced meditators alike	- Enhances mental clarity and focus<br>- Reduces stress and emotional tension<br>- Improves breathing and body awareness<br>- Promotes relaxation and well-being<br>- Easy to integrate into daily routines	- Suitable for all levels, no previous experience needed<br>- Comfortable clothing recommended<br>- Mats and cushions provided	Sat 10:00–11:00 AM
47	26	en	Wellness Workshop	Beginner	An educational session, exploring holistic approaches to health and wellbeing.	The Wellness Workshop is a monthly event designed to explore different aspects of physical, mental, and emotional well-being. Each session offers a unique experience, combining yoga, meditation, breathing techniques, and holistic practices to support balance and self-care. Workshops are interactive and suitable for everyone — a space to learn, share, and recharge together.	- Exploring new wellness practices<br>- Connecting with like-minded people<br>- Deepening your self-care routine<br>- Taking time for yourself in a supportive group	- Promotes relaxation and stress relief<br>- Increases awareness and personal growth<br>- Offers practical tools for daily well-being<br>- Builds connection and community		Sat 10:00–11:00 AM
39	30	fr	Poterie en pleine conscience	Débutant	Une session créative et méditative pour la détente et l’expression de soi.	La poterie en pleine conscience est une activité créative et apaisante qui associe l’art de la céramique à la pratique de la pleine conscience. À travers des techniques de façonnage manuel et au tour, les participants travaillent avec des matériaux naturels tout en développant leur concentration, patience et calme intérieur.	- Pour ceux qui recherchent une expérience créative et relaxante<br>- Pour ralentir et pratiquer la pleine conscience<br>- Pour explorer la créativité manuelle	- Encourage la détente et la clarté mentale<br>- Améliore la concentration, la patience et la créativité<br>- Développe la dextérité manuelle et la motricité fine		Sam 10h00-11h00
41	30	de	Achtsame Töpferkunst	Anfänger	Eine kreative Einheit als meditative Methode zur Entspannung und Selbstausdruck.	Achtsame Töpferkunst ist eine kreative und entspannende Aktivität, die die Kunst der Keramik mit Achtsamkeit verbindet. Mit Handformungs- und Drehscheibentechniken wird mit natürlichen Materialien gearbeitet, um Fokus, Geduld und innere Ruhe zu fördern.	- Für alle, die eine kreative und entspannende Erfahrung suchen<br>- Zum Entschleunigen und Üben von Achtsamkeit<br>- Für handwerklich Interessierte	- Fördert Entspannung und mentale Klarheit<br>- Verbessert Fokus, Geduld und Kreativität<br>- Entwickelt manuelle Geschicklichkeit und Feinmotorik		Sa 10:00–11:00 Uhr
1	21	it	Hatha Yoga	Principiante	Uno stile lento che lavora su posture (asana), respirazione (pranayama) e rilassamento.	Lo Hatha Yoga è uno stile base dello yoga che si concentra su posture fisiche (asana) e controllo del respiro (pranayama) per sviluppare forza, flessibilità ed equilibrio.	- Principianti<br>- Chi cerca sollievo dallo stress<br>- Chi vuole migliorare la flessibilità- Chi pratica la consapevolezza<br>- Chi sta recuperando da infortuni	- Migliora la salute fisica<br>- Aumenta la chiarezza mentale<br>- Riduce stress e ansia<br>- Migliora la postura e la consapevolezza del corpo<br>- Favorisce rilassamento interiore		Lun/Mer/Ven 7:00–8:00
42	21	en	Hatha Yoga	Beginner	A slow style, working on postures (asana), breathing (pranayama) and relaxation.	Hatha yoga is a foundational style of yoga that focuses on physical postures (asanas) and breath control (pranayama) to cultivate strength, flexibility, and balance. It typically involves a slower-paced practice, allowing practitioners to concentrate on proper alignment and mindfulness.	- Beginners exploring yoga<br>- Individuals seeking stress relief<br>- Those wanting to enhance flexibility<br>- Practitioners interested in mindfulness<br>- Anyone recovering from injuries	- Improves physical health and fitness<br>- Increases mental clarity and focus<br>- Reduces stress and anxiety levels<br>- Enhances posture and body awareness<br>- Fosters a sense of inner peace and relaxation		Mon/Wed/Fri 7:00–8:00 AM
48	27	en	Dance Fitness Fusion	Beginner	A high-energy workout, blending dance and fitness for a fun challenge.	Dance Fitness Fusion is a high-energy class combining the joy of dance with the benefits of cardio fitness. Inspired by Latin rhythms and designed to get your body moving, it’s a fun, effective way to burn calories, improve coordination, and lift your spirit. Each session offers an upbeat atmosphere where music and movement create a total-body experience. No dance background needed, just bring your energy and enthusiasm!	- Boosting cardiovascular endurance<br>- Burning calories in a fun way<br>- Improving rhythm and coordination<br>- Anyone who loves music and movement	- Full-body cardio workout<br>- Increases stamina and flexibility<br>- Enhances mood and confidence<br>- Perfect for group motivation and fun	- Comfortable activewear and sneakers recommended<br>- High-energy, group-friendly atmosphere	Sat 10:00–11:00 AM
49	28	en	Weekend Wellness Retreat	Beginner	A relaxing getaway, offering yoga, meditation, and wellness activities.	The Weekend Wellness Retreat is a monthly escape dedicated to restoring physical, mental, and emotional well-being. Held in a serene natural setting, each retreat combines gentle yoga, guided meditation, breathwork, and self-reflection sessions to promote inner harmony and deep rest. It's a space for stillness, connection, and transformation, open to all levels.	- Slowing down and disconnecting from routine<br>- Deepening personal awareness and self-care<br>- Spending intentional time in nature<br>- Recharging body, mind, and spirit	- Promotes stress relief and deep relaxation<br>- Enhances mindfulness and emotional clarity<br>- Inspires inner growth and self-discovery<br>- Encourages a strong sense of community		Sat 10:00–11:00 AM
50	29	en	Sunset Yoga	Beginner	A serene outdoor practice, combining yoga and nature for a peaceful experience.	Sunset Yoga is a calming, open-air practice that blends mindful movement, breathwork, and stillness. Held outdoors, each session aligns with the natural rhythm of sunset, offering a peaceful transition from day to evening. This class is suitable for all levels and focuses on gentle flow, grounding postures, and deep relaxation.	- Unwinding after a busy day<br>- Connecting with nature<br>- Enhancing flexibility and breath awareness<br>- Cultivating inner calm	- Reduces stress and tension<br>- Improves balance and mobility<br>- Promotes mindfulness and presence<br>- Supports restful sleep	Each session concludes with a generous aperitif, offering the perfect moment to unwind, connect, and savor the evening together.	Sat 10:00–11:00 AM
51	30	en	Mindful Pottery	Beginner	A creative session as a meditative tool for relaxation and self-expression.	Mindful Pottery is a creative and relaxing activity that combines the art of ceramics with mindfulness practice. Through hand-building and wheel-throwing techniques, you’ll explore working with natural materials while cultivating focus, patience, and inner calm. This activity is open to everyone, no previous experience needed. It’s not about perfection, but about enjoying the process.	- Anyone looking for a creative and relaxing experience<br>- Those who want to slow down and practice mindfulness<br>- Exploring manual skills and working with natural materials	- Encourages relaxation and mental clarity<br>- Improves focus, patience, and creativity<br>- Develops manual dexterity and fine motor skills		Sat 10:00–11:00 AM
17	25	it	Meditazione Mindfulness	Principiante	Una pratica rilassante che coltiva la consapevolezza del momento presente e la pace interiore.	La Meditazione Mindfulness è una pratica guidata che ti aiuta a sviluppare consapevolezza, presenza ed equilibrio mentale nella vita quotidiana. Attraverso tecniche semplici ma efficaci, imparerai a osservare pensieri ed emozioni senza giudizio e a coltivare calma e connessione profonda con il presente.	- Riduzione dello stress quotidiano<br>- Miglioramento della concentrazione ed equilibrio emotivo<br>- Sviluppo della consapevolezza e della pace interiore<br>- Adatta a principianti ed esperti	- Aumenta la chiarezza mentale<br>- Riduce lo stress e la tensione emotiva<br>- Migliora la respirazione e la consapevolezza corporea<br>- Promuove il benessere e il rilassamento<br>- Facile da integrare nella vita quotidiana	- Adatta a tutti i livelli<br>- Abbigliamento comodo consigliato<br>- Tappetini e cuscini forniti	Sab 10:00–11:00
21	26	it	Workshop Benessere	Principiante	Un incontro formativo che esplora approcci olistici alla salute e al benessere.	Il Workshop Benessere è un evento mensile pensato per esplorare diversi aspetti del benessere fisico, mentale ed emotivo. Ogni sessione offre un'esperienza unica, combinando yoga, meditazione, tecniche di respirazione e pratiche olistiche per sostenere l'equilibrio e la cura di sé.	- Esplorare nuove pratiche di benessere<br>- Connettersi con persone affini<br>- Approfondire la propria routine di self-care<br>- Prendersi del tempo per sé in un ambiente accogliente	- Favorisce il rilassamento e la riduzione dello stress<br>- Aumenta la consapevolezza e la crescita personale<br>- Offre strumenti pratici per il benessere quotidiano<br>- Rafforza la connessione e il senso di comunità		Sab 10:00–11:00
30	28	it	Ritiro del Benessere del Weekend	Principiante	Una pausa rilassante che offre yoga, meditazione e attività per il benessere.	Il Weekend Wellness Retreat è un appuntamento mensile dedicato a ripristinare il benessere fisico, mentale ed emotivo. Tenuto in un ambiente naturale e tranquillo, ogni ritiro combina yoga dolce, meditazione guidata, tecniche di respirazione e sessioni di introspezione per promuovere l’armonia interiore e il riposo profondo.	- Rallentare e disconnettersi dalla routine<br>- Approfondire la consapevolezza e la cura di sé<br>- Trascorrere tempo consapevole nella natura<br>- Ricaricare corpo, mente e spirito	- Favorisce il rilassamento e il sollievo dallo stress<br>- Aumenta la consapevolezza e la chiarezza emotiva<br>- Ispira la crescita interiore e la scoperta di sé<br>- Rafforza il senso di comunità		Sab 10:00–11:00
31	28	fr	Retraite Bien-être du Week-end	Débutant	Une escapade relaxante avec yoga, méditation et activités de bien-être.	La Retraite Bien-être du Week-end est une parenthèse mensuelle consacrée à la restauration du bien-être physique, mental et émotionnel. Organisée dans un cadre naturel paisible, chaque retraite combine yoga doux, méditation guidée, respiration consciente et introspection pour favoriser l’harmonie intérieure et un profond repos.	- Ralentir et se déconnecter<br>- Approfondir la conscience de soi et les soins personnels<br>- Passer du temps dans la nature<br>- Recharger le corps, l’esprit et l’âme	- Réduit le stress et favorise la détente<br>- Renforce la pleine conscience et la clarté émotionnelle<br>- Encourage la croissance intérieure<br>- Favorise un fort sentiment de communauté		Sam 10h00-11h00


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.areas (id, title, image) FROM stdin;
1	bar	/images/bar.webp
2	play area	/images/GiochiBimbi.webp
3	SPA	/images/SPA.webp


--
-- Data for Name: messaggi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messaggi (id, testo) FROM stdin;
5e2f27bb-cdab-4bcc-b812-b190a2c64106	Ciao dal database!
13212e4b-fd66-499d-a0f6-1e35877930b1	spero che stia  andando tutto bene


--
-- Data for Name: participant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participant (id, name, image) FROM stdin;
1	Emma Rossi	/images/EmmaRossi.webp
2	Marco Bianchi	/images/MarcoBianchi.webp
3	Sofia Esposito\n	/images/SofiaEsposito.webp
4	Luca Moretti	/images/LucaMoretti.webp
5	Alessia Conti	/images/AlessiaConti.webp
6	Giovanni Romano	/images/GiovanniRomano.webp


--
-- Data for Name: review_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_translations (id, review_id, language_code, review) FROM stdin;
1	1	en	I've been practicing yoga for years, but joining Serendipity has truly transformed my practice. The instructors are incredibly knowledgeable and create a supportive environment where I can deepen my practice. The Hatha classes have helped me improve my flexibility and find balance in my busy life.
2	2	en	As a complete beginner, I was nervous about trying yoga, but the instructors at Serendipity made me feel welcome from day one. The beginner classes are perfectly paced, and they take time to explain proper alignment. After just two months, I'm already noticing improvements in my posture and overall well-being.
3	3	en	The Ashtanga classes here are challenging in the best way possible. I appreciate how the teachers provide modifications for different levels while still encouraging us to push our boundaries. The studio's peaceful atmosphere makes it my favorite place to practice and grow.
4	4	en	I started coming to Serendipity for yoga but discovered their meditation sessions, which have been life-changing. Learning to quiet my mind and focus on my breath has helped me manage stress much better. The instructors create such a calming environment - it's my sanctuary in the middle of a hectic week.
5	5	en	After a back injury, I was recommended to try yoga therapy at Serendipity. The personalized approach and gentle guidance from my instructor have made a significant difference in my recovery. I've gained strength, mobility, and most importantly, confidence in my body again. Forever grateful for this amazing studio!
6	6	en	The variety of classes offered at Serendipity keeps my practice interesting and challenging. I particularly enjoy the Kundalini yoga sessions which have helped me develop both physical strength and mental clarity. The community here is supportive and welcoming - it feels like a second home.
7	1	it	Pratico yoga da anni, ma unirmi a Serendipity ha davvero trasformato la mia pratica. Gli insegnanti sono estremamente competenti e creano un ambiente di supporto in cui posso approfondire il mio percorso. Le lezioni di Hatha mi hanno aiutato a migliorare la flessibilità e a trovare equilibrio nella mia vita frenetica.
8	2	it	Ero completamente principiante e avevo un po' di timore nell'iniziare yoga, ma gli insegnanti di Serendipity mi hanno fatto sentire il benvenuto fin dal primo giorno. Le lezioni per principianti hanno un ritmo perfetto e spiegano con cura l'allineamento. Dopo soli due mesi, noto già miglioramenti nella postura e nel benessere generale.
9	3	it	Le lezioni di Ashtanga qui sono stimolanti nel modo migliore. Apprezzo il fatto che gli insegnanti offrano modifiche per diversi livelli, pur incoraggiandoci a superare i nostri limiti. L'atmosfera tranquilla dello studio lo rende il mio posto preferito per praticare e crescere.
10	4	it	Ho iniziato a frequentare Serendipity per lo yoga, ma ho scoperto le sessioni di meditazione, che sono state rivoluzionarie. Imparare a calmare la mente e concentrarmi sul respiro mi ha aiutato moltissimo a gestire lo stress. Gli insegnanti creano un ambiente così sereno: è il mio rifugio nel caos della settimana.
11	5	it	Dopo un infortunio alla schiena, mi è stato consigliato di provare la yoga terapia a Serendipity. L'approccio personalizzato e la guida gentile dell'insegnante hanno avuto un impatto enorme sulla mia guarigione. Ho recuperato forza, mobilità e, cosa più importante, fiducia nel mio corpo. Sarò per sempre grata a questo studio fantastico!
12	6	it	La varietà di lezioni offerte da Serendipity rende la mia pratica interessante e stimolante. Mi piacciono in particolare le sessioni di Kundalini yoga, che mi hanno aiutato a sviluppare forza fisica e chiarezza mentale. La comunità qui è accogliente e solidale – mi sento come a casa.
13	1	fr	Je pratique le yoga depuis des années, mais rejoindre Serendipity a vraiment transformé ma pratique. Les instructeurs sont incroyablement compétents et créent un environnement bienveillant où je peux approfondir mon parcours. Les cours de Hatha m'ont aidée à améliorer ma souplesse et à trouver un équilibre dans ma vie bien remplie.
14	2	fr	En tant que débutant complet, j'étais un peu anxieux à l'idée d'essayer le yoga, mais les instructeurs de Serendipity m'ont mis à l'aise dès le premier jour. Les cours pour débutants sont parfaitement rythmés et prennent le temps d'expliquer correctement les alignements. Après seulement deux mois, je remarque déjà une amélioration de ma posture et de mon bien-être général.
15	3	fr	Les cours d'Ashtanga ici sont exigeants de la meilleure des façons. J'apprécie la façon dont les enseignants proposent des variantes pour chaque niveau tout en nous encourageant à repousser nos limites. L'atmosphère paisible du studio en fait mon endroit préféré pour pratiquer et progresser.
16	4	fr	Je suis venu à Serendipity pour le yoga, mais j'ai découvert leurs séances de méditation, qui ont changé ma vie. Apprendre à calmer mon esprit et à me concentrer sur ma respiration m'a beaucoup aidé à gérer le stress. Les instructeurs créent une ambiance tellement apaisante – c'est mon refuge au milieu d'une semaine chargée.
17	5	fr	Après une blessure au dos, on m'a recommandé d'essayer la thérapie par le yoga chez Serendipity. L'approche personnalisée et les conseils bienveillants de mon instructeur ont eu un impact significatif sur ma guérison. J'ai retrouvé de la force, de la mobilité et, surtout, confiance en mon corps. Je serai éternellement reconnaissant à ce studio incroyable !
18	6	fr	La variété des cours proposés chez Serendipity rend ma pratique à la fois intéressante et stimulante. J'apprécie particulièrement les séances de Kundalini yoga, qui m'ont permis de développer à la fois force physique et clarté mentale. La communauté ici est accueillante et solidaire – on s'y sent comme chez soi.
19	1	zh	我练习瑜伽多年，但加入 Serendipity 真正改变了我的修行。这里的老师非常专业，营造出一个支持性的环境，让我能够更深入地练习。哈他瑜伽课程帮助我提升柔韧性，在忙碌生活中找到平衡。
20	2	zh	作为一个完全的初学者，我一开始对尝试瑜伽感到紧张，但 Serendipity 的教练们从第一天起就让我感到受欢迎。初学者课程节奏适中，老师们耐心讲解正确的姿势。仅仅两个月后，我就感觉到身体姿势和整体健康有了明显改善。
21	3	zh	这里的阿斯汤加课程具有挑战性，但非常值得。我很感激老师们为不同水平的学员提供动作调整，同时也鼓励我们突破自我。这个工作室安静的氛围让我非常喜欢来这里练习和成长。
22	4	zh	我最初是为了瑜伽来到 Serendipity，但后来发现了他们的冥想课程，真的改变了我的生活。学习如何安静内心、专注呼吸，帮助我更好地应对压力。教练们创造出一种非常平静的氛围——这是我繁忙一周中的避风港。
23	5	zh	背部受伤后，我被建议尝试 Serendipity 的瑜伽疗愈。教练的个性化指导和温柔陪伴对我的康复产生了重大影响。我重拾了力量、灵活性，最重要的是，对自己身体的信心。我将永远感激这个了不起的工作室！
24	6	zh	Serendipity 提供的课程种类丰富，让我的练习保持新鲜感和挑战性。我特别喜欢昆达里尼瑜伽，它帮助我增强了身体力量和心智清晰度。这里的社群非常温暖和包容——感觉就像第二个家。
25	1	de	Ich praktiziere seit Jahren Yoga, aber der Beitritt zu Serendipity hat meine Praxis wirklich verändert. Die Lehrer sind unglaublich kompetent und schaffen eine unterstützende Atmosphäre, in der ich meine Praxis vertiefen kann. Die Hatha-Kurse haben mir geholfen, meine Flexibilität zu verbessern und mehr Ausgleich in meinem hektischen Leben zu finden.
26	2	de	Als völliger Anfänger war ich zunächst nervös, Yoga auszuprobieren, aber die Lehrer bei Serendipity haben mich von Anfang an herzlich aufgenommen. Die Einsteigerkurse sind genau richtig getaktet, und die korrekte Ausrichtung wird sorgfältig erklärt. Nach nur zwei Monaten sehe ich bereits Verbesserungen in meiner Haltung und meinem allgemeinen Wohlbefinden.
27	3	de	Die Ashtanga-Kurse hier sind auf die beste Art herausfordernd. Ich schätze es sehr, dass die Lehrer Modifikationen für verschiedene Level anbieten und uns gleichzeitig ermutigen, unsere Grenzen zu erweitern. Die ruhige Atmosphäre im Studio macht es zu meinem Lieblingsort zum Üben und Wachsen.
28	4	de	Ich kam ursprünglich wegen Yoga zu Serendipity, entdeckte dann aber die Meditationssitzungen – und sie haben mein Leben verändert. Zu lernen, meinen Geist zu beruhigen und mich auf meinen Atem zu konzentrieren, hat mir enorm geholfen, mit Stress umzugehen. Die Lehrer schaffen eine so entspannende Umgebung – es ist mein Rückzugsort in einer hektischen Woche.
29	5	de	Nach einer Rückenverletzung wurde mir empfohlen, Yogatherapie bei Serendipity zu versuchen. Der persönliche Ansatz und die einfühlsame Begleitung durch meine Lehrerin haben einen großen Unterschied in meiner Genesung gemacht. Ich habe Kraft, Beweglichkeit und vor allem wieder Vertrauen in meinen Körper gewonnen. Ich bin diesem wunderbaren Studio für immer dankbar!
30	6	de	Die Vielfalt der Kurse bei Serendipity hält meine Praxis spannend und herausfordernd. Besonders schätze ich die Kundalini-Yoga-Stunden, die mir geholfen haben, körperliche Stärke und mentale Klarheit zu entwickeln. Die Gemeinschaft hier ist unterstützend und herzlich – es fühlt sich an wie ein zweites Zuhause.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (iduser, idactivity, stars, review, date) FROM stdin;
1	21	5	I've been practicing yoga for years, but joining Serendipity has truly transformed my practice. The instructors are incredibly knowledgeable and create a supportive environment where I can deepen my practice. The Hatha classes have helped me improve my flexibility and find balance in my busy life.	2023-07-15
2	21	4	As a complete beginner, I was nervous about trying yoga, but the instructors at Serendipity made me feel welcome from day one. The beginner classes are perfectly paced, and they take time to explain proper alignment. After just two months, I'm already noticing improvements in my posture and overall well-being.	2023-11-03
3	23	5	The Ashtanga classes here are challenging in the best way possible. I appreciate how the teachers provide modifications for different levels while still encouraging us to push our boundaries. The studio's peaceful atmosphere makes it my favorite place to practice and grow.	2024-08-28
4	25	5	I started coming to Serendipity for yoga but discovered their meditation sessions, which have been life-changing. Learning to quiet my mind and focus on my breath has helped me manage stress much better. The instructors create such a calming environment - it's my sanctuary in the middle of a hectic week.	2025-02-15
5	24	4	After a back injury, I was recommended to try yoga therapy at Serendipity. The personalized approach and gentle guidance from my instructor have made a significant difference in my recovery. I've gained strength, mobility, and most importantly, confidence in my body again. Forever grateful for this amazing studio!	2024-01-29
6	22	4	The variety of classes offered at Serendipity keeps my practice interesting and challenging. I particularly enjoy the Kundalini yoga sessions which have helped me develop both physical strength and mental clarity. The community here is supportive and welcoming - it feels like a second home.	2025-03-19


--
-- Data for Name: reviews_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_base (id, idparticipant, idactivity, stars, date) FROM stdin;
1	1	21	5	2023-07-15
2	2	21	4	2023-11-03
3	3	23	5	2024-08-28
4	4	25	5	2025-02-15
5	5	24	4	2024-01-29
6	6	22	4	2025-03-19


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (id, title, description, image, features) FROM stdin;
1	Oriental Room	A serene haven infused with Eastern tranquility. Practice amidst elegant Asian-inspired decor, where harmony flows through every detail.\n\n"Where ancient wisdom meets mindful movement."	/images/orientalRoom.webp	- Warm teak floors & silk drapery\r\n- Soft lantern lighting & incense scents\r\n- Traditional singing bowls & chimes
2	Forest Room	An earthy sanctuary where nature embraces practice. Breathe in forest scents, unwind under leafy canopies, and reconnect with grounding energy.\n\n"Where every exhale returns you to the wild."	/images/ForestRoom.webp	- Biophilic design with wood & greenery\r\n- Soft nature sounds & dappled light\r\n- Aromatherapy (pine, cedar, vetiver)\r\n
3	Swimming Pool	A warm, mineral-rich oasis for mindful movement. Swim, float, or practice aqua yoga in this tranquil space designed to amplify hydrotherapy benefits.\n\n"Where water supports both body and spirit."	/images/swimmingPool.webp	- 32°C magnesium enriched water\r\n- Mood lighting & silent swim hours\r\n- Solar heated, ecofriendly system
5	Le Cantinette	A cozy, character-filled space perfect for creativity and focus. Set in a vaulted brick room, it’s ideal for workshops, small group sessions, and hands-on activities.	/images/workshopSala.webp	- intimate, quiet atmosphere with arched ceilings\r\n- Flexible table setup for group or solo work\r\n- Authentic terracotta floors and rustic charm
6	Garden Terrace	A serene outdoor haven designed for calm and connection. Surrounded by greenery and natural light, this multi-level garden space is ideal for mindful movement and open-air experiences.	/images/Giardino.webp	\r\n- Peaceful atmosphere with lush plants and modern design\r\n- Elevated area perfect for meditation or individual practice\r\n- Natural setting ideal for golden hour sessions
4	Zumba Studio	An energizing space made for movement and rhythm. Ideal for Zumba and dance workouts, with vibrant lighting, mirrored walls, and upbeat music.\n	/images/areaZumba.webp	- Spacious, mirrored studio for full visibility\r\n- Professional sound system with Latin beats\r\n- Shock absorbing wooden flooring for joint comfort\r\n


--
-- Data for Name: room_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room_base (id, image) FROM stdin;
1	/images/orientalRoom.webp
2	/images/ForestRoom.webp
3	/images/swimmingPool.webp
4	/images/areaZumba.webp
5	/images/workshopSala.webp
6	/images/Giardino.webp


--
-- Data for Name: room_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room_translations (id, room_id, language_code, title, description, features) FROM stdin;
2	1	fr	Salle Orientale	Un havre de paix imprégné de sérénité orientale. Pratiquez dans un décor d’inspiration asiatique, où l’harmonie se ressent dans chaque détail.\r\n\r\n"Là où la sagesse ancienne rencontre le mouvement conscient."	- Parquet en teck et rideaux en soie\r\n- Lanterne douce et senteurs d’encens\r\n- Bols chantants et carillons traditionnels
3	1	zh	东方静室	一个充满东方宁静氛围的静修之地。在充满亚洲风格的优雅环境中练习，让和谐在每个细节中流动。\r\n\r\n“在这里，古老的智慧与正念的运动相遇。”	- 柚木地板和丝绸帷幔\r\n- 柔和灯笼与熏香\r\n- 唱颂钵与风铃声
4	1	de	Orientalischer Raum	Ein ruhiger Zufluchtsort mit östlicher Gelassenheit. Übe in einem elegant gestalteten Raum im asiatischen Stil, in dem Harmonie in jedem Detail spürbar ist.\r\n\r\n"Wo alte Weisheit auf achtsame Bewegung trifft."	- Warmer Teakboden und seidene Vorhänge\r\n- Sanftes Laternenlicht und Weihrauchduft\r\n- Klangschalen und traditionelle Windspiele
5	2	it	Sala Foresta	Un santuario naturale dove la pratica si fonde con la natura. Respira i profumi del bosco, rilassati sotto le fronde e riconnettiti con l’energia della terra.\r\n\r\n"Dove ogni respiro ti riporta alla natura."	- Design biofilico con legno e vegetazione\r\n- Suoni naturali e luce filtrata\r\n- Aromaterapia (pino, cedro, vetiver)
6	2	fr	Salle Forêt	Un sanctuaire terrestre où la nature enveloppe la pratique. Respirez les senteurs de la forêt, détendez-vous sous les feuillages et reconnectez-vous à l’énergie de la terre.\r\n\r\n"Là où chaque expiration vous ramène à la nature."	- Design biophilique avec bois et verdure\r\n- Sons naturels apaisants et lumière tamisée\r\n- Aromathérapie (pin, cèdre, vétiver)
7	2	zh	森林房	一个与大自然融合的静谧圣地。在树叶的遮荫下深呼吸森林的气息，感受大地的能量，放松身心。\r\n\r\n“在这里，每一次呼气都带你回归自然。”	- 仿生设计，结合木材与绿植\r\n- 自然音效与斑驳光影\r\n- 芳香疗法（松木、雪松、岩兰草）
8	2	de	Waldraum	Ein erdiges Refugium, in dem die Natur die Praxis umarmt. Atme die Düfte des Waldes ein, entspanne unter Blätterdächern und finde zurück zur Erdung.\r\n\r\n"Wo jeder Ausatmen dich zurück zur Wildnis bringt."	- Biophiles Design mit Holz und Pflanzen\r\n- Sanfte Naturgeräusche und Lichtspiele\r\n- Aromatherapie (Kiefer, Zeder, Vetiver)
9	3	it	Piscina Termale	Un’oasi calda e ricca di minerali per un movimento consapevole. Nuota, galleggia o pratica aqua yoga in questo spazio tranquillo progettato per amplificare i benefici dell’idroterapia.\r\n\r\n"Dove l’acqua sostiene corpo e spirito."	- Acqua a 32°C arricchita con magnesio\r\n- Luci d’atmosfera e orari di nuoto silenzioso\r\n- Sistema solare ecologico per il riscaldamento
10	3	fr	Piscine Bien-être	Un oasis chaud et riche en minéraux pour un mouvement en pleine conscience. Nagez, flottez ou pratiquez l’aqua yoga dans cet espace conçu pour renforcer les bienfaits de l’hydrothérapie.\r\n\r\n"Là où l’eau soutient le corps et l’esprit."	- Eau enrichie en magnésium à 32°C\r\n- Éclairage d’ambiance et horaires silencieux\r\n- Chauffage solaire respectueux de l’environnement
11	3	zh	温泉泳池	一个富含矿物质的温暖空间，适合正念运动。在宁静氛围中游泳、漂浮或进行水中瑜伽，充分发挥水疗的益处。\r\n\r\n“在这里，水支撑着你的身体与心灵。”	- 富含镁的32°C温水\r\n- 氛围灯光与安静游泳时间\r\n- 太阳能环保加热系统
12	3	de	Thermalbecken	Eine warme, mineralreiche Oase für achtsame Bewegung. Schwimmen, schweben oder praktiziere Aqua-Yoga in diesem ruhigen Raum, der die Vorteile der Hydrotherapie verstärkt.\r\n\r\n"Wo Wasser Körper und Geist trägt."	- 32°C magnesiumangereichertes Wasser\r\n- Stimmungslicht & stille Schwimmzeiten\r\n- Solarbeheiztes, umweltfreundliches System
13	4	it	Studio Zumba	Uno spazio energizzante pensato per il movimento e il ritmo. Ideale per Zumba e allenamenti di danza, con luci vibranti, specchi a parete e musica coinvolgente.	- Studio spazioso con pareti a specchio\r\n- Impianto audio professionale con ritmi latini\r\n- Pavimento ammortizzato per il comfort articolare
14	4	fr	Studio Zumba	Un espace dynamique conçu pour le mouvement et le rythme. Idéal pour la Zumba et les entraînements dansés, avec éclairage vibrant, miroirs muraux et musique entraînante.	- Studio spacieux avec miroirs muraux\r\n- Système audio professionnel aux rythmes latins\r\n- Sol en bois amortissant pour protéger les articulations
15	4	zh	尊巴舞教室	一个充满活力的空间，专为舞蹈与节奏而设计。非常适合尊巴和舞蹈训练，配有炫酷灯光、全身镜和动感音乐。	- 宽敞的镜面教室\r\n- 配备拉丁音乐的专业音响系统\r\n- 减震木地板，保护关节
16	4	de	Zumba-Studio	Ein energiegeladener Raum für Bewegung und Rhythmus. Ideal für Zumba- und Tanztrainings mit lebendiger Beleuchtung, Spiegelwänden und mitreißender Musik.	- Geräumiges Studio mit Wandspiegeln\r\n- Professionelles Soundsystem mit lateinamerikanischen Beats\r\n- Stoßdämpfender Holzboden für Gelenkschonung
17	5	it	Le Cantinette	Uno spazio accogliente e ricco di carattere, perfetto per creatività e concentrazione. Situato in una sala con volta in mattoni, è ideale per workshop, piccoli gruppi e attività manuali.	- Atmosfera intima e silenziosa con soffitti a volta\r\n- Disposizione flessibile dei tavoli per gruppi o lavoro individuale\r\n- Pavimenti in cotto e fascino rustico
18	5	fr	Les Cantinette	Un espace chaleureux et plein de caractère, parfait pour la créativité et la concentration. Situé dans une pièce voûtée en briques, idéal pour les ateliers, petits groupes et activités pratiques.	- Ambiance intime et calme avec plafonds voûtés\r\n- Tables modulables pour travail en groupe ou individuel\r\n- Sols en terre cuite et charme rustique
19	5	zh	拱顶小厅	一个温馨且富有特色的空间，适合创作与专注。坐落于砖砌拱顶房间内，非常适合工作坊、小组课程及动手活动。	- 拱顶天花板营造亲密安静的氛围\r\n- 灵活的桌椅布置适合小组或个人使用\r\n- 赤陶地板与质朴风格
20	5	de	Die Cantinette	Ein gemütlicher Raum voller Charakter – perfekt für Kreativität und Fokus. Unter einem Backsteingewölbe gelegen, ideal für Workshops, kleine Gruppen und praktische Aktivitäten.	- Intime, ruhige Atmosphäre mit Gewölbedecken\r\n- Flexible Tischanordnung für Gruppen- oder Einzelarbeit\r\n- Terrakottaboden und rustikaler Charme
1	1	it	Sala Orientale	Un rifugio sereno intriso di tranquillità orientale. Pratica in un ambiente ispirato all’estetica asiatica, dove l’armonia fluisce in ogni dettaglio.\r\n\r\n"Dove l’antica saggezza incontra il movimento consapevole."	- Pavimenti in teak e tendaggi di seta\r\n- Lanterne soffuse e profumo d’incenso\r\n- Campane tibetane e carillon tradizionali
21	6	it	Terrazza Giardino	Un’oasi all’aperto progettata per la calma e la connessione. Circondata da vegetazione e luce naturale, questa terrazza su più livelli è ideale per movimenti consapevoli e attività en plein air.	- Atmosfera serena con piante rigogliose e design moderno\r\n- Area rialzata perfetta per meditazione o pratica individuale\r\n- Ambientazione naturale ideale per sessioni al tramonto
26	2	en	Forest Room	An earthy sanctuary where nature embraces practice. Breathe in forest scents, unwind under leafy canopies, and reconnect with grounding energy.\\n\\n"Where every exhale returns you to the wild."	- Biophilic design with wood & greenery\r\n- Soft nature sounds & dappled light\r\n- Aromatherapy (pine, cedar, vetiver)
22	6	fr	Terrasse Jardin	Un havre de paix en plein air conçu pour le calme et la connexion. Entouré de verdure et de lumière naturelle, cet espace jardin en terrasses est idéal pour les pratiques de pleine conscience et les expériences en plein air.	- Atmosphère paisible avec végétation luxuriante et design moderne\r\n- Espace surélevé parfait pour la méditation ou la pratique individuelle\r\n- Cadre naturel idéal pour les séances au coucher du soleil
23	6	zh	花园露台	一个为宁静与连接而设计的户外空间。环绕于绿意和自然光之中，这个多层次花园空间非常适合正念练习和户外体验。	- 绿植环绕与现代设计打造平静氛围\r\n- 高处区域适合冥想或个人练习\r\n- 自然环境，非常适合黄昏时分练习
24	6	de	Gartenterrasse	Ein ruhiger Außenbereich, der für Gelassenheit und Verbindung geschaffen wurde. Umgeben von Pflanzen und natürlichem Licht bietet diese mehrstufige Terrasse den idealen Rahmen für achtsame Bewegungen und Erlebnisse im Freien.	- Friedliche Atmosphäre mit üppigem Grün und modernem Design\r\n- Erhöhter Bereich ideal für Meditation oder Einzelpraxis\r\n- Natürliche Umgebung perfekt für Einheiten bei Sonnenuntergang
25	1	en	Oriental Room	A serene haven infused with Eastern tranquility. Practice amidst elegant Asian-inspired decor, where harmony flows through every detail.\\n\\n"Where ancient wisdom meets mindful movement."	- Warm teak floors & silk drapery\r\n- Soft lantern lighting & incense scents\r\n- Traditional singing bowls & chimes
27	3	en	Swimming Pool	A warm, mineral-rich oasis for mindful movement. Swim, float, or practice aqua yoga in this tranquil space designed to amplify hydrotherapy benefits.\\n\\n"Where water supports both body and spirit."	- 32°C magnesium enriched water\r\n- Mood lighting & silent swim hours\r\n- Solar heated, ecofriendly system
28	4	en	Zumba Studio	An energizing space made for movement and rhythm. Ideal for Zumba and dance workouts, with vibrant lighting, mirrored walls, and upbeat music.	- Spacious, mirrored studio for full visibility\r\n- Professional sound system with Latin beats\r\n- Shock absorbing wooden flooring for joint comfort
29	5	en	Le Cantinette	A cozy, character-filled space perfect for creativity and focus. Set in a vaulted brick room, it’s ideal for workshops, small group sessions, and hands-on activities.	- Intimate, quiet atmosphere with arched ceilings\r\n- Flexible table setup for group or solo work\r\n- Authentic terracotta floors and rustic charm
30	6	en	Garden Terrace	A serene outdoor haven designed for calm and connection. Surrounded by greenery and natural light, this multi-level garden space is ideal for mindful movement and open-air experiences.	- Peaceful atmosphere with lush plants and modern design\r\n- Elevated area perfect for meditation or individual practice\r\n- Natural setting ideal for golden hour sessions


--
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher (id, name, surname, role, main_expertise, about, image) FROM stdin;
2	Michael	Chen	Wellness Director	Traditional Yoga & Water Yoga	Michael specializes in traditional yoga practices and has pioneered our  water yoga program. His gentle approach makes yoga accessible to  practitioners of all levels.	/images/michael-chen.jpg
3	Emma	Rodriguez	Dance & Movement Specialist	Zumba & Dynamic Flow	Emma brings energy and  rhythm to our center through her dynamic Zumba classes and flow  sessions. Her background in dance adds a unique perspective to movement  practices.	/images/emma-rodriguez.jpg
4	David	Kumar	Meditation Guide	Mindfulness & Spiritual Wellness	David's approach to  meditation combines traditional techniques with modern mindfulness  practices. He leads our retreat programs and spiritual workshops.	/images/david-kumar.jpg
5	Sofia	Bianchi	Creative Arts Instructor	Ceramics & Mindful Creation	Sofia brings artistry to our center through ceramics classes and creative workshops. She believes in the meditative power of working with clay and creative expression.	/images/sofia-bianchi.jpg
1	Sarah	Mitchell	Lead Yoga instructor	Vinyasa Flow & Meditation	With over 15 years of experience in yoga practice and teaching, Sarah  brings a wealth of knowledge in Vinyasa Flow and meditation techniques.  Her classes focus on mindful movement and breath awareness.	/images/sarah-mitchell.jpg


--
-- Data for Name: teacher_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher_base (id, image, "Name", "Surname") FROM stdin;
1	/images/sarah-mitchell.webp	Sarah	Mitchell
2	/images/michael-chen.webp	Michael	Chen
3	/images/emma-rodriguez.webp	Emma	Rodriguez
4	/images/david-kumar.webp	David	Kumar
5	/images/sofia-bianchi.webp	Sofia	Bianchi


--
-- Data for Name: teacher_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher_translations ("NON_USARE", id, language_code, role, main_expertise, about) FROM stdin;
1	1	it	Istruttrice principale di Yoga	Vinyasa Flow e Meditazione	Con oltre 15 anni di esperienza nella pratica e nell’insegnamento dello yoga, Sarah porta con sé una profonda conoscenza del Vinyasa Flow e delle tecniche di meditazione. Le sue lezioni si concentrano sul movimento consapevole e sulla consapevolezza del respiro.
2	1	fr	Instructrice principale de yoga	Vinyasa Flow et méditation	Avec plus de 15 ans d’expérience dans la pratique et l’enseignement du yoga, Sarah apporte une riche expertise en Vinyasa Flow et techniques de méditation. Ses cours sont axés sur le mouvement conscient et la conscience de la respiration.
3	1	zh	首席瑜伽导师	流瑜伽与冥想	Sarah 拥有超过15年的瑜伽练习与教学经验，精通流瑜伽和冥想技巧。她的课程注重正念运动与呼吸觉察，带来深入的身心体验。
4	1	de	Leitende Yogalehrerin	Vinyasa Flow & Meditation	Mit über 15 Jahren Erfahrung in der Yogapraxis und im Unterricht bringt Sarah ein fundiertes Wissen über Vinyasa Flow und Meditationstechniken mit. Ihre Kurse legen den Fokus auf achtsame Bewegung und Atembewusstsein.
5	1	en	Lead Yoga Instructor	Vinyasa Flow & Meditation	With over 15 years of experience in yoga practice and teaching, Sarah brings a wealth of knowledge in Vinyasa Flow and meditation techniques. Her classes focus on mindful movement and breath awareness.
6	2	en	Wellness Director	Traditional Yoga & Water Yoga	Michael specializes in traditional yoga practices and has pioneered our water yoga program. His gentle approach makes yoga accessible to practitioners of all levels.
7	2	it	Direttore del Benessere	Yoga Tradizionale e Yoga in Acqua	Michael è specializzato nelle pratiche tradizionali di yoga ed è il pioniere del nostro programma di yoga in acqua. Il suo approccio gentile rende lo yoga accessibile a praticanti di tutti i livelli.
8	2	fr	Directeur du bien-être	Yoga traditionnel et yoga aquatique	Michael est spécialisé dans les pratiques traditionnelles de yoga et a développé notre programme de yoga aquatique. Son approche douce rend le yoga accessible à tous les niveaux.
9	2	zh	健康总监	传统瑜伽与水中瑜伽	Michael 精通传统瑜伽，同时开创了我们的水中瑜伽项目。他温和的教学方式让各个层次的练习者都能轻松参与。
10	2	de	Wellness-Leiter	Traditionelles Yoga & Wasser-Yoga	Michael ist auf traditionelle Yoga-Praktiken spezialisiert und hat unser Wasser-Yoga-Programm ins Leben gerufen. Sein sanfter Ansatz macht Yoga für alle Erfahrungsstufen zugänglich.
11	3	en	Dance & Movement Specialist	Zumba & Dynamic Flow	Emma brings energy and rhythm to our center through her dynamic Zumba classes and flow sessions. Her background in dance adds a unique perspective to movement practices.
12	3	it	Specialista in Danza e Movimento	Zumba e Flusso Dinamico	Emma porta energia e ritmo nel nostro centro con le sue lezioni dinamiche di Zumba e sessioni di movimento fluido. Il suo background nella danza dona un tocco unico alle pratiche motorie.
13	3	fr	Spécialiste en danse et mouvement	Zumba et Flow dynamique	Emma apporte énergie et rythme à notre centre à travers ses cours dynamiques de Zumba et de flow. Son parcours en danse offre une perspective unique sur la pratique du mouvement.
14	3	zh	舞蹈与身体活动导师	尊巴与动态流动	Emma 通过富有活力的尊巴课程和流动练习为中心注入了节奏与活力。她的舞蹈背景为身体练习带来了独特视角。
15	3	de	Spezialistin für Tanz und Bewegung	Zumba & Dynamisches Flow-Training	Emma bringt durch ihre dynamischen Zumba-Stunden und Flow-Sessions Energie und Rhythmus in unser Zentrum. Ihr Hintergrund im Tanz verleiht den Bewegungspraktiken eine besondere Tiefe.
16	4	en	Meditation Guide	Mindfulness & Spiritual Wellness	David's approach to meditation combines traditional techniques with modern mindfulness practices. He leads our retreat programs and spiritual workshops.
17	4	it	Guida alla Meditazione	Mindfulness e Benessere Spirituale	L’approccio di David alla meditazione unisce tecniche tradizionali con pratiche moderne di mindfulness. Conduce i nostri ritiri e workshop spirituali.
18	4	fr	Guide de méditation	Pleine conscience et bien-être spirituel	L’approche de David en matière de méditation combine des techniques traditionnelles avec des pratiques modernes de pleine conscience. Il dirige nos retraites et ateliers spirituels.
19	4	zh	冥想导师	正念与灵性健康	David 的冥想教学结合了传统技巧与现代正念实践。他负责领导我们的静修课程与灵性工作坊。
20	4	de	Meditationsleiter	Achtsamkeit und spirituelles Wohlbefinden	Davids Ansatz zur Meditation vereint traditionelle Techniken mit moderner Achtsamkeitspraxis. Er leitet unsere Retreats und spirituellen Workshops.
21	5	en	Creative Arts Instructor	Ceramics & Mindful Creation	Sofia brings artistry to our center through ceramics classes and creative workshops. She believes in the meditative power of working with clay and creative expression.
22	5	it	Istruttrice di Arti Creative	Ceramica e Creazione Consapevole	Sofia porta arte e creatività nel nostro centro attraverso corsi di ceramica e laboratori espressivi. Crede profondamente nel potere meditativo della manipolazione dell’argilla e dell’espressione creativa.
23	5	fr	Formatrice en arts créatifs	Céramique et création en pleine conscience	Sofia apporte une touche artistique à notre centre à travers des cours de céramique et des ateliers créatifs. Elle croit au pouvoir méditatif du travail de l’argile et de l’expression artistique.
24	5	zh	创意艺术讲师	陶艺与正念创作	Sofia 通过陶艺课程和创意工作坊为中心注入艺术气息。她坚信与黏土互动和创造性表达具有冥想般的力量。
25	5	de	Dozentin für kreative Künste	Keramik & achtsames Gestalten	Sofia bringt künstlerischen Ausdruck in unser Zentrum durch Keramikkurse und kreative Workshops. Sie glaubt an die meditative Kraft des Arbeitens mit Ton und kreativen Ausdrucks.


--
-- Data for Name: teaches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teaches (idteacher, idactivity) FROM stdin;
1	21
2	21
2	22
2	26
3	23
3	27
4	24
4	28
4	30
5	25
5	29


--
-- Name: activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_id_seq', 30, true);


--
-- Name: activity_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_id_seq1', 1, false);


--
-- Name: activity_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_translations_id_seq', 51, true);


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.areas_id_seq', 1, false);


--
-- Name: partecipant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partecipant_id_seq', 1, false);


--
-- Name: review_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_translations_id_seq', 30, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_id_seq', 38, true);


--
-- Name: room_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_id_seq1', 1, false);


--
-- Name: room_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_translations_id_seq', 30, true);


--
-- Name: teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_id_seq', 35, true);


--
-- Name: teacher_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_id_seq1', 1, false);


--
-- Name: teacher_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_translations_id_seq', 26, true);


--
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- Name: activity_base activity_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_base
    ADD CONSTRAINT activity_pkey1 PRIMARY KEY (id);


--
-- Name: activity activity_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_title_key UNIQUE (title);


--
-- Name: activity_translations activity_translations_activity_id_language_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_translations
    ADD CONSTRAINT activity_translations_activity_id_language_code_key UNIQUE (activity_id, language_code);


--
-- Name: activity_translations activity_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_translations
    ADD CONSTRAINT activity_translations_pkey PRIMARY KEY (id);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: messaggi messaggi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messaggi
    ADD CONSTRAINT messaggi_pkey PRIMARY KEY (id);


--
-- Name: participant partecipant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participant
    ADD CONSTRAINT partecipant_pkey PRIMARY KEY (id);


--
-- Name: review_translations review_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_translations
    ADD CONSTRAINT review_translations_pkey PRIMARY KEY (id);


--
-- Name: review_translations review_translations_review_id_language_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_translations
    ADD CONSTRAINT review_translations_review_id_language_code_key UNIQUE (review_id, language_code);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (iduser, idactivity);


--
-- Name: reviews_base reviews_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_base
    ADD CONSTRAINT reviews_pkey1 PRIMARY KEY (id);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- Name: room_base room_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_base
    ADD CONSTRAINT room_pkey1 PRIMARY KEY (id);


--
-- Name: room room_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_title_key UNIQUE (title);


--
-- Name: room_translations room_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_translations
    ADD CONSTRAINT room_translations_pkey PRIMARY KEY (id);


--
-- Name: room_translations room_translations_room_id_language_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_translations
    ADD CONSTRAINT room_translations_room_id_language_code_key UNIQUE (room_id, language_code);


--
-- Name: teacher teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (id);


--
-- Name: teacher_base teacher_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_base
    ADD CONSTRAINT teacher_pkey1 PRIMARY KEY (id);


--
-- Name: teacher_translations teacher_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_translations
    ADD CONSTRAINT teacher_translations_pkey PRIMARY KEY (id, language_code);


--
-- Name: teacher_translations teacher_translations_teacher_id_language_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_translations
    ADD CONSTRAINT teacher_translations_teacher_id_language_code_key UNIQUE (id, language_code);


--
-- Name: teaches teaches_new_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_new_pkey PRIMARY KEY (idteacher, idactivity);


--
-- Name: activity_base activity_base_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_base
    ADD CONSTRAINT activity_base_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teacher_base(id);


--
-- Name: activity activity_roomid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_roomid_fkey FOREIGN KEY (roomid) REFERENCES public.room(id) ON UPDATE CASCADE;


--
-- Name: activity_translations activity_translations_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_translations
    ADD CONSTRAINT activity_translations_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.activity_base(id) ON DELETE CASCADE;


--
-- Name: review_translations review_translations_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_translations
    ADD CONSTRAINT review_translations_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews_base(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_idactivity_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_idactivity_fkey FOREIGN KEY (idactivity) REFERENCES public.activity(id);


--
-- Name: reviews_base reviews_idactivity_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_base
    ADD CONSTRAINT reviews_idactivity_fkey1 FOREIGN KEY (idactivity) REFERENCES public.activity_base(id);


--
-- Name: reviews_base reviews_idparticipant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_base
    ADD CONSTRAINT reviews_idparticipant_fkey FOREIGN KEY (idparticipant) REFERENCES public.participant(id);


--
-- Name: reviews reviews_iduser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_iduser_fkey FOREIGN KEY (iduser) REFERENCES public.participant(id) ON UPDATE CASCADE;


--
-- Name: room_translations room_translations_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_translations
    ADD CONSTRAINT room_translations_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.room_base(id) ON DELETE CASCADE;


--
-- Name: teacher_translations teacher_translations_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_translations
    ADD CONSTRAINT teacher_translations_id_fkey FOREIGN KEY (id) REFERENCES public.teacher_base(id) ON DELETE CASCADE;


--
-- Name: teaches teaches_new_idactivity_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_new_idactivity_fkey FOREIGN KEY (idactivity) REFERENCES public.activity_base(id) ON DELETE CASCADE;


--
-- Name: teaches teaches_new_idteacher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_new_idteacher_fkey FOREIGN KEY (idteacher) REFERENCES public.teacher_base(id) ON DELETE CASCADE;


--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--



--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--



--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--



--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--



--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--



--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--



--
-- Name: TABLE teacher; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: FUNCTION get_teacher_by_activityid_old(activity_id integer); Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE activity; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE activity_base; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE activity_id_seq; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE activity_id_seq1; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE activity_translations; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE activity_translations_id_seq; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE areas; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE areas_id_seq; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE messaggi; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE participant; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE partecipant_id_seq; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE review_translations; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE review_translations_id_seq; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE reviews; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE reviews_base; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE reviews_id_seq; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE room; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE room_base; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE room_id_seq; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE room_id_seq1; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE room_translations; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE room_translations_id_seq; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE teacher_base; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE teacher_id_seq; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE teacher_id_seq1; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE teacher_translations; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: SEQUENCE teacher_translations_id_seq; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: TABLE teaches; Type: ACL; Schema: public; Owner: postgres
--



--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database cluster dump complete
--

