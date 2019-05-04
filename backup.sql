--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adjuntos_punto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adjuntos_punto (
    id_punto integer NOT NULL,
    ruta character varying NOT NULL,
    nombre character varying,
    tipo character varying
);


ALTER TABLE public.adjuntos_punto OWNER TO postgres;

--
-- Name: sesion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sesion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sesion_id_seq OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer DEFAULT nextval('public.sesion_id_seq'::regclass) NOT NULL,
    lugar character varying(500) NOT NULL,
    hora time without time zone NOT NULL,
    fecha date NOT NULL,
    tipo_sesion integer NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: miembro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miembro (
    idmiembro integer NOT NULL,
    nombremiembro character varying(50),
    apellido1miembro character varying(50),
    apellido2miembro character varying(50),
    correo character varying(200),
    contrasenna character varying(200),
    rol integer
);


ALTER TABLE public.miembro OWNER TO postgres;

--
-- Name: miembro_idmiembro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.miembro ALTER COLUMN idmiembro ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.miembro_idmiembro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: miembrosconvocados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miembrosconvocados (
    idmiembrosconvocados integer NOT NULL,
    ideventoconvocado integer,
    idmiembroconvocado integer,
    convocado integer
);


ALTER TABLE public.miembrosconvocados OWNER TO postgres;

--
-- Name: miembrosconvocados_idmiembrosconvocados_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.miembrosconvocados ALTER COLUMN idmiembrosconvocados ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.miembrosconvocados_idmiembrosconvocados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: punto_agenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.punto_agenda (
    id_punto integer NOT NULL,
    titulo character varying,
    fecha date,
    miembro integer,
    considerando text,
    acuerda text,
    estado boolean,
    punto_para_agenda integer
);


ALTER TABLE public.punto_agenda OWNER TO postgres;

--
-- Name: punto_agenda_id_punto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.punto_agenda_id_punto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.punto_agenda_id_punto_seq OWNER TO postgres;

--
-- Name: punto_agenda_id_punto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.punto_agenda_id_punto_seq OWNED BY public.punto_agenda.id_punto;


--
-- Name: reseteo_contrasennas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reseteo_contrasennas (
    idreseteo integer NOT NULL,
    correo character varying(200),
    tokenreseteo character varying(100)
);


ALTER TABLE public.reseteo_contrasennas OWNER TO postgres;

--
-- Name: reseteo_contrasennas_idreseteo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.reseteo_contrasennas ALTER COLUMN idreseteo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reseteo_contrasennas_idreseteo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reseteocontrasennas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reseteocontrasennas (
    idreseteo integer NOT NULL,
    correo character varying(200),
    tokenreseteo character varying(300)
);


ALTER TABLE public.reseteocontrasennas OWNER TO postgres;

--
-- Name: reseteocontrasennas_idreseteo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.reseteocontrasennas ALTER COLUMN idreseteo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reseteocontrasennas_idreseteo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    idrole integer NOT NULL,
    descripcionrole character varying(256),
    agregarmiembro integer,
    eliminarmiembro integer,
    administrarpuntos integer,
    administraradministrativo integer,
    administrarpresidente integer,
    proponerpuntos integer
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_idrole_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN idrole ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_idrole_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tipo_sesion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_sesion (
    id integer NOT NULL,
    nombre character varying(250)
);


ALTER TABLE public.tipo_sesion OWNER TO postgres;

--
-- Name: tipo_sesion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_sesion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_sesion_id_seq OWNER TO postgres;

--
-- Name: tipo_sesion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_sesion_id_seq OWNED BY public.tipo_sesion.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: punto_agenda id_punto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.punto_agenda ALTER COLUMN id_punto SET DEFAULT nextval('public.punto_agenda_id_punto_seq'::regclass);


--
-- Name: tipo_sesion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_sesion ALTER COLUMN id SET DEFAULT nextval('public.tipo_sesion_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: adjuntos_punto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adjuntos_punto (id_punto, ruta, nombre, tipo) FROM stdin;
2	public/2/Captura de pantalla 2019-01-21 16.50.41.png	Captura de pantalla 2019-01-21 16.50.41.png	\N
5	public/5/Captura de pantalla 2019-02-08 12.52.31.png	Captura de pantalla 2019-02-08 12.52.31.png	\N
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, lugar, hora, fecha, tipo_sesion) FROM stdin;
28	Csa	12:00:00	2019-06-28	1
29	Frente a la U	14:00:00	2019-06-12	2
\.


--
-- Data for Name: miembro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miembro (idmiembro, nombremiembro, apellido1miembro, apellido2miembro, correo, contrasenna, rol) FROM stdin;
4	Arturo	Luna	Luna	manuelitojm28@gmail.com	j	4
1	Jose	Jimenez	Madrigal	jimenezjm28j@gmail.com	j	1
5	j	j	j	jimenezjm28j@gmail.com	j	2
6	j	j	j	jimenezjm28j@gmail.com	j	2
7	j	j	j	jimenezjm28j@gmail.com	j	2
8	j	j	j	jimenezjm28j@gmail.com	j	2
9	j	j	j	jimenezjm28j@gmail.com	j	2
10	j	j	j	jimenezjm28j@gmail.com	j	2
11	p	p	p	jimenezjm28j@gmail.com	j	1
12	p	p	p	jimenezjm28j@gmail.com	j	1
19	Georffrey	Carmona	Martínez	georffreycarmona@gmail.com	j	4
20	Georffrey	Carmona	Martínez	georffreycarmona@gmail.com	j	4
21	u	u	u	jimenezjm28j@gmail.com	j	1
22	u	u	u	jimenezjm28j@gmail.com	j	1
\.


--
-- Data for Name: miembrosconvocados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miembrosconvocados (idmiembrosconvocados, ideventoconvocado, idmiembroconvocado, convocado) FROM stdin;
6	28	4	0
5	28	1	1
7	29	22	1
8	29	21	1
9	29	12	1
10	29	11	1
11	29	1	1
12	29	10	1
13	29	9	1
14	29	8	1
15	29	7	1
16	29	6	1
17	29	5	1
18	29	20	1
19	29	19	1
20	29	4	1
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: punto_agenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.punto_agenda (id_punto, titulo, fecha, miembro, considerando, acuerda, estado, punto_para_agenda) FROM stdin;
3	nuevo	2019-04-11	1	Nadaa	Nadita	t	28
2	Marco Rasta	2019-04-11	1	Nada	Nada 2	t	28
5	Nueva	2019-04-11	22	Nueva	Nueva	t	29
\.


--
-- Data for Name: reseteo_contrasennas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reseteo_contrasennas (idreseteo, correo, tokenreseteo) FROM stdin;
27	jimenezjm28j@gmail.com	bTcbC5sww83jBefwu3vR8xs4AKHhAm09UpctNT7eaJfYGB8jbH0FKARaad8P
28	jimenezjm28j@gmail.com	hLizDqrRmqSwyyScnLSdZQBdEvZA2c4r3qYujQBNJQaqBSmL4ysbnpu6oFsM
29	jimenezjm28j@gmail.com	kazw9lWKxzUg9rC5GtOQiFpXqJ1rO3EZYudJmJEeCyguIp8oCW5wJeyR9GwB
30	jimenezjm28j@gmail.com	RgAiNYzAwJY3JzYiSbFg43b28oUAbI5ft7gQ2jCBw9gzNQIeE32LbqNKM8fr
31	jimenezjm28j@gmail.com	7binM5CYg1YWuiyJxvRg6meWsq2PABmfVBFhk1zPpVlQ4br2KGB1OmiHLTZ8
32	jimenezjm28j@gmail.com	LOOWHt0RqPTFDwE8YXIWLiAD82eeLqenn5ii9tp2iDaGbmR5HqPtDB3qep3E
33	jimenezjm28j@gmail.com	Zo3Gos3iwcX8jv0Ewu31gwjLgBOus516byTi31NLfdt9oNCRzV3jmLBAEV5N
34	jimenezjm28j@gmail.com	k73LiRfsayzcCmlpH2uPEglqRAizVmNx5WogE9MsjirUu2jPeMfldLVfYNCA
35	jimenezjm28j@gmail.com	DmtflHobSoDjvsHPkzsuA0TaJ9xnxX8aGxBXxGCrWcrqNmyzntQnqIxVdYLV
36	jimenezjm28j@gmail.com	SJxc7bRjT2aqn35a75VfEImwDx1IvYtSuNSoMPPtZ03S7VNNffKj28enOXOY
37	jimenezjm28j@gmail.com	xkbyLjm4btDK0Q81q94jLgqcUqsxnS6hC4HMpWn5zF1DFUmcsKPnnU5QgaZa
38	jimenezjm28j@gmail.com	ARaAXUTjKsuPqLeADQQKPXf16dIQFSTbC1KA7uJTWvxKuKQaOgTsYIeONf5j
39	jimenezjm28j@gmail.com	s2TJO1Z1m09ryvuxMtdkAduLkmDjZ2wFchXou8jJbMAYxceqrIFT6qM03z2b
40	jimenezjm28j@gmail.com	l9dx2FQCfo8HztQHUqXfXr9qtJoy8RbVLxaHQJmD6vkdgo6xoSjjsbwhifin
41	georffreycarmona@gmail.com	zcLg38M8J7Y0itcuXRNmI2o9q622kfesWqB331R5WTlHzuGw03MaVDNsOqIw
42	georffreycarmona@gmail.com	kOfR6X6NwryKZjZnVdKvq0EnvRlaVli4qNl1EddAbdZ3zwsver0MnZQ0YiSi
43	jimenezjm28j@gmail.com	TSF5fDojyIJlim8DA16DYEug2GJaSFOIjZT6Vcc0Sxj7cwLa5PPp9jDKR5BC
44	jimenezjm28j@gmail.com	ZM2UE8SAXqkJ93M1p8mGmtsZ1kf51iuZFb3StmlDckzf0LZzOJUioIr8HfXn
\.


--
-- Data for Name: reseteocontrasennas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reseteocontrasennas (idreseteo, correo, tokenreseteo) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (idrole, descripcionrole, agregarmiembro, eliminarmiembro, administrarpuntos, administraradministrativo, administrarpresidente, proponerpuntos) FROM stdin;
1	Presidente	1	1	1	1	0	1
2	Administrativo	1	1	1	1	0	1
3	Profesor	0	0	0	0	0	1
4	Estudiante	0	0	0	0	2	1
\.


--
-- Data for Name: tipo_sesion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_sesion (id, nombre) FROM stdin;
1	Ordinaria
2	Extraordinaria
3	Ordinaria
4	Extraordinaria
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
1	Silvia	silviluc.n@hotmail.com	\N	$2y$10$Z0lYpu3zvbIvn6p41qgSwOUIzfFx9Zg.XOnWW168kUnfyLPjsyRw.	\N	2019-03-11 02:51:38	2019-03-11 02:51:38
\.


--
-- Name: miembro_idmiembro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.miembro_idmiembro_seq', 22, true);


--
-- Name: miembrosconvocados_idmiembrosconvocados_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.miembrosconvocados_idmiembrosconvocados_seq', 20, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 2, true);


--
-- Name: punto_agenda_id_punto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.punto_agenda_id_punto_seq', 5, true);


--
-- Name: reseteo_contrasennas_idreseteo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reseteo_contrasennas_idreseteo_seq', 44, true);


--
-- Name: reseteocontrasennas_idreseteo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reseteocontrasennas_idreseteo_seq', 1, false);


--
-- Name: roles_idrole_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_idrole_seq', 4, true);


--
-- Name: sesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sesion_id_seq', 29, true);


--
-- Name: tipo_sesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_sesion_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: adjuntos_punto adjuntos_punto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adjuntos_punto
    ADD CONSTRAINT adjuntos_punto_pkey PRIMARY KEY (id_punto, ruta);


--
-- Name: miembro miembro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro
    ADD CONSTRAINT miembro_pkey PRIMARY KEY (idmiembro);


--
-- Name: miembrosconvocados miembrosconvocados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembrosconvocados
    ADD CONSTRAINT miembrosconvocados_pkey PRIMARY KEY (idmiembrosconvocados);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: punto_agenda punto_agenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.punto_agenda
    ADD CONSTRAINT punto_agenda_pkey PRIMARY KEY (id_punto);


--
-- Name: reseteo_contrasennas reseteo_contrasennas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseteo_contrasennas
    ADD CONSTRAINT reseteo_contrasennas_pkey PRIMARY KEY (idreseteo);


--
-- Name: reseteocontrasennas reseteocontrasennas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reseteocontrasennas
    ADD CONSTRAINT reseteocontrasennas_pkey PRIMARY KEY (idreseteo);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (idrole);


--
-- Name: events sesion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT sesion_pkey PRIMARY KEY (id);


--
-- Name: tipo_sesion tipo_sesion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_sesion
    ADD CONSTRAINT tipo_sesion_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: adjuntos_punto adjuntos_punto_id_punto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adjuntos_punto
    ADD CONSTRAINT adjuntos_punto_id_punto_fkey FOREIGN KEY (id_punto) REFERENCES public.punto_agenda(id_punto) ON DELETE CASCADE;


--
-- Name: punto_agenda miembro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.punto_agenda
    ADD CONSTRAINT miembro FOREIGN KEY (miembro) REFERENCES public.miembro(idmiembro);


--
-- Name: miembro miembro_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembro
    ADD CONSTRAINT miembro_rol_fkey FOREIGN KEY (rol) REFERENCES public.roles(idrole);


--
-- Name: miembrosconvocados miembrosconvocados_ideventoconvocado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembrosconvocados
    ADD CONSTRAINT miembrosconvocados_ideventoconvocado_fkey FOREIGN KEY (ideventoconvocado) REFERENCES public.events(id);


--
-- Name: miembrosconvocados miembrosconvocados_idmiembroconvocado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembrosconvocados
    ADD CONSTRAINT miembrosconvocados_idmiembroconvocado_fkey FOREIGN KEY (idmiembroconvocado) REFERENCES public.miembro(idmiembro);


--
-- Name: punto_agenda punto_para; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.punto_agenda
    ADD CONSTRAINT punto_para FOREIGN KEY (punto_para_agenda) REFERENCES public.events(id);


--
-- Name: events sesion_tipo_sesion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT sesion_tipo_sesion_fkey FOREIGN KEY (tipo_sesion) REFERENCES public.tipo_sesion(id);


--
-- PostgreSQL database dump complete
--