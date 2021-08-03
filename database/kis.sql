--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 13.2

-- Started on 2021-08-03 16:18:02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 41544)
-- Name: cases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases (
    case_id integer NOT NULL,
    case_topic character varying(100),
    case_desc character varying(1000),
    additionaldata jsonb NOT NULL,
    farm_id integer NOT NULL,
    crop_id integer,
    consultant_id integer,
    case_status character varying(50) DEFAULT 'Pending'::character varying,
    assignment_date date DEFAULT now(),
    closing_date date,
    remarks character varying(1000) DEFAULT NULL::character varying
);


ALTER TABLE public.cases OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 41542)
-- Name: cases_case_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cases_case_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cases_case_id_seq OWNER TO postgres;

--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 211
-- Name: cases_case_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cases_case_id_seq OWNED BY public.cases.case_id;


--
-- TOC entry 207 (class 1259 OID 41456)
-- Name: crops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crops (
    crop_id integer NOT NULL,
    crop_name character varying(100)
);


ALTER TABLE public.crops OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 41454)
-- Name: crops_crop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crops_crop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crops_crop_id_seq OWNER TO postgres;

--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 206
-- Name: crops_crop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crops_crop_id_seq OWNED BY public.crops.crop_id;


--
-- TOC entry 209 (class 1259 OID 41464)
-- Name: farm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.farm (
    farm_id integer NOT NULL,
    farm_owner integer NOT NULL,
    crop_id integer NOT NULL,
    total_acre numeric,
    logitude numeric,
    latitude numeric,
    address character varying(100),
    farm_name character varying(200) NOT NULL
);


ALTER TABLE public.farm OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 41462)
-- Name: farm_farm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.farm_farm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.farm_farm_id_seq OWNER TO postgres;

--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 208
-- Name: farm_farm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.farm_farm_id_seq OWNED BY public.farm.farm_id;


--
-- TOC entry 210 (class 1259 OID 41483)
-- Name: farm_managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.farm_managers (
    farm_manager integer NOT NULL,
    farm_id integer NOT NULL
);


ALTER TABLE public.farm_managers OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 41586)
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    image_id integer NOT NULL,
    image character varying(1000),
    case_id integer NOT NULL
);


ALTER TABLE public.images OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 41584)
-- Name: images_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_image_id_seq OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 213
-- Name: images_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_image_id_seq OWNED BY public.images.image_id;


--
-- TOC entry 203 (class 1259 OID 41304)
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    role_id integer NOT NULL,
    role_name character varying(100) NOT NULL
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 41302)
-- Name: user_role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_role_role_id_seq OWNER TO postgres;

--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 202
-- Name: user_role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_role_role_id_seq OWNED BY public.user_role.role_id;


--
-- TOC entry 205 (class 1259 OID 41352)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(150) NOT NULL,
    password character varying(50) NOT NULL,
    role_id integer NOT NULL,
    nic character varying(13),
    mobile character varying(20),
    registration_date date DEFAULT now(),
    city character varying(50),
    country character varying(50),
    email character varying(150) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 41350)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 2730 (class 2604 OID 41547)
-- Name: cases case_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases ALTER COLUMN case_id SET DEFAULT nextval('public.cases_case_id_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 41459)
-- Name: crops crop_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crops ALTER COLUMN crop_id SET DEFAULT nextval('public.crops_crop_id_seq'::regclass);


--
-- TOC entry 2728 (class 2604 OID 41467)
-- Name: farm farm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.farm ALTER COLUMN farm_id SET DEFAULT nextval('public.farm_farm_id_seq'::regclass);


--
-- TOC entry 2733 (class 2604 OID 41589)
-- Name: images image_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN image_id SET DEFAULT nextval('public.images_image_id_seq'::regclass);


--
-- TOC entry 2724 (class 2604 OID 41307)
-- Name: user_role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role ALTER COLUMN role_id SET DEFAULT nextval('public.user_role_role_id_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 41355)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 2747 (class 2606 OID 41555)
-- Name: cases cases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT cases_pkey PRIMARY KEY (case_id);


--
-- TOC entry 2743 (class 2606 OID 41461)
-- Name: crops crops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crops
    ADD CONSTRAINT crops_pkey PRIMARY KEY (crop_id);


--
-- TOC entry 2745 (class 2606 OID 41472)
-- Name: farm farm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.farm
    ADD CONSTRAINT farm_pkey PRIMARY KEY (farm_id);


--
-- TOC entry 2749 (class 2606 OID 41594)
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (image_id);


--
-- TOC entry 2735 (class 2606 OID 41309)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (role_id);


--
-- TOC entry 2737 (class 2606 OID 41311)
-- Name: user_role user_role_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_role_name_key UNIQUE (role_name);


--
-- TOC entry 2739 (class 2606 OID 41541)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2741 (class 2606 OID 41358)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2758 (class 2606 OID 41595)
-- Name: images fk_case; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT fk_case FOREIGN KEY (case_id) REFERENCES public.cases(case_id);


--
-- TOC entry 2757 (class 2606 OID 41566)
-- Name: cases fk_consultant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT fk_consultant FOREIGN KEY (consultant_id) REFERENCES public.users(user_id);


--
-- TOC entry 2751 (class 2606 OID 41473)
-- Name: farm fk_crop; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.farm
    ADD CONSTRAINT fk_crop FOREIGN KEY (crop_id) REFERENCES public.crops(crop_id);


--
-- TOC entry 2756 (class 2606 OID 41561)
-- Name: cases fk_crop1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT fk_crop1 FOREIGN KEY (crop_id) REFERENCES public.crops(crop_id);


--
-- TOC entry 2754 (class 2606 OID 41491)
-- Name: farm_managers fk_farm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.farm_managers
    ADD CONSTRAINT fk_farm FOREIGN KEY (farm_id) REFERENCES public.farm(farm_id);


--
-- TOC entry 2755 (class 2606 OID 41556)
-- Name: cases fk_farm1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT fk_farm1 FOREIGN KEY (farm_id) REFERENCES public.farm(farm_id);


--
-- TOC entry 2753 (class 2606 OID 41486)
-- Name: farm_managers fk_farm_manager; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.farm_managers
    ADD CONSTRAINT fk_farm_manager FOREIGN KEY (farm_manager) REFERENCES public.users(user_id);


--
-- TOC entry 2752 (class 2606 OID 41478)
-- Name: farm fk_farmowner; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.farm
    ADD CONSTRAINT fk_farmowner FOREIGN KEY (farm_owner) REFERENCES public.users(user_id);


--
-- TOC entry 2750 (class 2606 OID 41359)
-- Name: users fk_user_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES public.user_role(role_id) ON DELETE CASCADE;


-- Completed on 2021-08-03 16:18:04

--
-- PostgreSQL database dump complete
--

