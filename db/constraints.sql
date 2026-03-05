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

