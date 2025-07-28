--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: clases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clases (
    id integer NOT NULL,
    nombre character varying(50),
    id_entrenador integer,
    descripcion text,
    duracion_minutos integer NOT NULL,
    capacidad_maxima integer NOT NULL,
    fecha timestamp without time zone,
    horario_inicio timestamp without time zone,
    horario_fin timestamp without time zone NOT NULL,
    estado character varying(50),
    fecha_creacion timestamp without time zone NOT NULL
);


ALTER TABLE public.clases OWNER TO postgres;

--
-- Name: clases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clases_id_seq OWNER TO postgres;

--
-- Name: clases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clases_id_seq OWNED BY public.clases.id;


--
-- Name: entrenadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrenadores (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    id_clase integer NOT NULL,
    apellido character varying(50),
    genero character varying(1),
    direccion text,
    telefono character varying(15),
    email character varying(100) NOT NULL,
    fecha_registro timestamp without time zone,
    especialidad character varying(50),
    certifcicacion text NOT NULL
);


ALTER TABLE public.entrenadores OWNER TO postgres;

--
-- Name: entrenadores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrenadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entrenadores_id_seq OWNER TO postgres;

--
-- Name: entrenadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrenadores_id_seq OWNED BY public.entrenadores.id;


--
-- Name: inscripciones_clases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones_clases (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    id_miembro integer NOT NULL,
    id_clases integer NOT NULL,
    fecha_inscripcion timestamp without time zone NOT NULL,
    asistencia boolean NOT NULL
);


ALTER TABLE public.inscripciones_clases OWNER TO postgres;

--
-- Name: inscripciones_clases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_clases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_clases_id_seq OWNER TO postgres;

--
-- Name: inscripciones_clases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_clases_id_seq OWNED BY public.inscripciones_clases.id;


--
-- Name: inscripciones_membresias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones_membresias (
    id integer NOT NULL,
    entrenadores_id integer NOT NULL,
    miembros_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    caracteristicas character varying(50) NOT NULL,
    fecha_inicio timestamp without time zone NOT NULL,
    fecha_fin timestamp without time zone NOT NULL,
    estado character varying(50) NOT NULL,
    fecha_ultima_actualizacion timestamp without time zone NOT NULL
);


ALTER TABLE public.inscripciones_membresias OWNER TO postgres;

--
-- Name: inscripciones_membresias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_membresias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_membresias_id_seq OWNER TO postgres;

--
-- Name: inscripciones_membresias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_membresias_id_seq OWNED BY public.inscripciones_membresias.id;


--
-- Name: membresia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membresia (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    caracteristicas character varying(50) NOT NULL,
    duracion_dias integer NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL,
    estado_activo boolean,
    precio numeric(10,2) NOT NULL
);


ALTER TABLE public.membresia OWNER TO postgres;

--
-- Name: membresia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membresia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membresia_id_seq OWNER TO postgres;

--
-- Name: membresia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membresia_id_seq OWNED BY public.membresia.id;


--
-- Name: miembros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miembros (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    genero character varying(1) NOT NULL,
    direccion text NOT NULL,
    telefono character varying(15) NOT NULL,
    email character varying(100) NOT NULL,
    fecha_registro timestamp without time zone NOT NULL,
    estado_activo boolean
);


ALTER TABLE public.miembros OWNER TO postgres;

--
-- Name: miembros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.miembros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.miembros_id_seq OWNER TO postgres;

--
-- Name: miembros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.miembros_id_seq OWNED BY public.miembros.id;


--
-- Name: clases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases ALTER COLUMN id SET DEFAULT nextval('public.clases_id_seq'::regclass);


--
-- Name: entrenadores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores ALTER COLUMN id SET DEFAULT nextval('public.entrenadores_id_seq'::regclass);


--
-- Name: inscripciones_clases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_clases ALTER COLUMN id SET DEFAULT nextval('public.inscripciones_clases_id_seq'::regclass);


--
-- Name: inscripciones_membresias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_membresias ALTER COLUMN id SET DEFAULT nextval('public.inscripciones_membresias_id_seq'::regclass);


--
-- Name: membresia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresia ALTER COLUMN id SET DEFAULT nextval('public.membresia_id_seq'::regclass);


--
-- Name: miembros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembros ALTER COLUMN id SET DEFAULT nextval('public.miembros_id_seq'::regclass);


--
-- Data for Name: clases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clases (id, nombre, id_entrenador, descripcion, duracion_minutos, capacidad_maxima, fecha, horario_inicio, horario_fin, estado, fecha_creacion) FROM stdin;
\.


--
-- Data for Name: entrenadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrenadores (id, nombre, id_clase, apellido, genero, direccion, telefono, email, fecha_registro, especialidad, certifcicacion) FROM stdin;
\.


--
-- Data for Name: inscripciones_clases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones_clases (id, nombre, id_miembro, id_clases, fecha_inscripcion, asistencia) FROM stdin;
\.


--
-- Data for Name: inscripciones_membresias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones_membresias (id, entrenadores_id, miembros_id, nombre, caracteristicas, fecha_inicio, fecha_fin, estado, fecha_ultima_actualizacion) FROM stdin;
\.


--
-- Data for Name: membresia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membresia (id, nombre, caracteristicas, duracion_dias, fecha_creacion, estado_activo, precio) FROM stdin;
1	string	string	0	2025-07-28 00:00:00	t	0.00
\.


--
-- Data for Name: miembros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miembros (id, nombre, apellido, genero, direccion, telefono, email, fecha_registro, estado_activo) FROM stdin;
\.


--
-- Name: clases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clases_id_seq', 1, false);


--
-- Name: entrenadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entrenadores_id_seq', 1, false);


--
-- Name: inscripciones_clases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_clases_id_seq', 1, false);


--
-- Name: inscripciones_membresias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_membresias_id_seq', 1, false);


--
-- Name: membresia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membresia_id_seq', 1, true);


--
-- Name: miembros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.miembros_id_seq', 1, false);


--
-- Name: clases clases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_pkey PRIMARY KEY (id);


--
-- Name: entrenadores entrenadores_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_email_key UNIQUE (email);


--
-- Name: entrenadores entrenadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_pkey PRIMARY KEY (id);


--
-- Name: inscripciones_clases inscripciones_clases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_clases
    ADD CONSTRAINT inscripciones_clases_pkey PRIMARY KEY (id);


--
-- Name: inscripciones_membresias inscripciones_membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_membresias
    ADD CONSTRAINT inscripciones_membresias_pkey PRIMARY KEY (id);


--
-- Name: membresia membresia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_pkey PRIMARY KEY (id);


--
-- Name: miembros miembros_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembros
    ADD CONSTRAINT miembros_email_key UNIQUE (email);


--
-- Name: miembros miembros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembros
    ADD CONSTRAINT miembros_pkey PRIMARY KEY (id);


--
-- Name: ix_clases_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_clases_id ON public.clases USING btree (id);


--
-- Name: ix_entrenadores_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_entrenadores_id ON public.entrenadores USING btree (id);


--
-- Name: ix_inscripciones_clases_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_inscripciones_clases_id ON public.inscripciones_clases USING btree (id);


--
-- Name: ix_inscripciones_membresias_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_inscripciones_membresias_id ON public.inscripciones_membresias USING btree (id);


--
-- Name: ix_membresia_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_membresia_id ON public.membresia USING btree (id);


--
-- Name: ix_miembros_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_miembros_id ON public.miembros USING btree (id);


--
-- Name: clases clases_id_entrenador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_id_entrenador_fkey FOREIGN KEY (id_entrenador) REFERENCES public.entrenadores(id);


--
-- Name: entrenadores entrenadores_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES public.clases(id);


--
-- Name: inscripciones_clases inscripciones_clases_id_clases_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_clases
    ADD CONSTRAINT inscripciones_clases_id_clases_fkey FOREIGN KEY (id_clases) REFERENCES public.clases(id);


--
-- Name: inscripciones_clases inscripciones_clases_id_miembro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_clases
    ADD CONSTRAINT inscripciones_clases_id_miembro_fkey FOREIGN KEY (id_miembro) REFERENCES public.miembros(id);


--
-- Name: inscripciones_membresias inscripciones_membresias_entrenadores_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_membresias
    ADD CONSTRAINT inscripciones_membresias_entrenadores_id_fkey FOREIGN KEY (entrenadores_id) REFERENCES public.entrenadores(id);


--
-- Name: inscripciones_membresias inscripciones_membresias_miembros_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_membresias
    ADD CONSTRAINT inscripciones_membresias_miembros_id_fkey FOREIGN KEY (miembros_id) REFERENCES public.miembros(id);


--
-- PostgreSQL database dump complete
--

