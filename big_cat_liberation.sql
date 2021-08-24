--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO monkey;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO monkey;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO monkey;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO monkey;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO monkey;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO monkey;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO monkey;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO monkey;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO monkey;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO monkey;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO monkey;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO monkey;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO monkey;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO monkey;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO monkey;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO monkey;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO monkey;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO monkey;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO monkey;

--
-- Name: main_app_cat; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.main_app_cat (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    breed character varying(50) NOT NULL,
    sex character varying(50) NOT NULL,
    age integer NOT NULL,
    health character varying(50) NOT NULL,
    description text NOT NULL,
    image_url character varying(1000) NOT NULL,
    user_id integer NOT NULL,
    pending boolean NOT NULL
);


ALTER TABLE public.main_app_cat OWNER TO monkey;

--
-- Name: main_app_cat_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.main_app_cat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_cat_id_seq OWNER TO monkey;

--
-- Name: main_app_cat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.main_app_cat_id_seq OWNED BY public.main_app_cat.id;


--
-- Name: main_app_cat_needs; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.main_app_cat_needs (
    id bigint NOT NULL,
    cat_id bigint NOT NULL,
    needs_id bigint NOT NULL
);


ALTER TABLE public.main_app_cat_needs OWNER TO monkey;

--
-- Name: main_app_cat_needs_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.main_app_cat_needs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_cat_needs_id_seq OWNER TO monkey;

--
-- Name: main_app_cat_needs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.main_app_cat_needs_id_seq OWNED BY public.main_app_cat_needs.id;


--
-- Name: main_app_needs; Type: TABLE; Schema: public; Owner: monkey
--

CREATE TABLE public.main_app_needs (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    quantity integer NOT NULL,
    link character varying(1000) NOT NULL,
    reason text NOT NULL
);


ALTER TABLE public.main_app_needs OWNER TO monkey;

--
-- Name: main_app_needs_id_seq; Type: SEQUENCE; Schema: public; Owner: monkey
--

CREATE SEQUENCE public.main_app_needs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_needs_id_seq OWNER TO monkey;

--
-- Name: main_app_needs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monkey
--

ALTER SEQUENCE public.main_app_needs_id_seq OWNED BY public.main_app_needs.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: main_app_cat id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.main_app_cat ALTER COLUMN id SET DEFAULT nextval('public.main_app_cat_id_seq'::regclass);


--
-- Name: main_app_cat_needs id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.main_app_cat_needs ALTER COLUMN id SET DEFAULT nextval('public.main_app_cat_needs_id_seq'::regclass);


--
-- Name: main_app_needs id; Type: DEFAULT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.main_app_needs ALTER COLUMN id SET DEFAULT nextval('public.main_app_needs_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.auth_group (id, name) FROM stdin;
1	site_admin
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	35
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add needs	1	add_needs
2	Can change needs	1	change_needs
3	Can delete needs	1	delete_needs
4	Can view needs	1	view_needs
5	Can add cat	2	add_cat
6	Can change cat	2	change_cat
7	Can delete cat	2	delete_cat
8	Can view cat	2	view_cat
9	Can add log entry	3	add_logentry
10	Can change log entry	3	change_logentry
11	Can delete log entry	3	delete_logentry
12	Can view log entry	3	view_logentry
13	Can add permission	4	add_permission
14	Can change permission	4	change_permission
15	Can delete permission	4	delete_permission
16	Can view permission	4	view_permission
17	Can add group	5	add_group
18	Can change group	5	change_group
19	Can delete group	5	delete_group
20	Can view group	5	view_group
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add content type	7	add_contenttype
26	Can change content type	7	change_contenttype
27	Can delete content type	7	delete_contenttype
28	Can view content type	7	view_contenttype
29	Can add session	8	add_session
30	Can change session	8	change_session
31	Can delete session	8	delete_session
32	Can view session	8	view_session
35	Can add needs	1	can_add_needs
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$72jbVWHx1daa1eEEYf7CBx$hB2m/lg2ze6XYVgwPu1+GG0WWwwRYzJu/LrfHcRA06I=	2021-08-23 10:31:22.300776-07	f	Liis				f	t	2021-08-23 10:31:22.07807-07
2	pbkdf2_sha256$260000$BNES5Lvqt8Cf6gKtjzybKa$0qSUMAn5nJeuGpB8ZyzMJ0t7YgBulnD0rQ+5nOzt700=	2021-08-23 10:35:20.239522-07	f	Liisu				f	t	2021-08-23 10:35:20.043426-07
3	pbkdf2_sha256$260000$czXJJKxNL6KKn7XlaghPMr$DCbpWTe58aiYVvFw/dtrRTtAxUkvRWtkgJF1FZo9VQw=	2021-08-23 10:40:19.574551-07	t	Monkiki			monkiki@mail.com	t	t	2021-08-23 10:39:47.678432-07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	main_app	needs
2	main_app	cat
3	admin	logentry
4	auth	permission
5	auth	group
6	auth	user
7	contenttypes	contenttype
8	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-08-19 16:04:25.827075-07
2	auth	0001_initial	2021-08-19 16:04:25.904794-07
3	admin	0001_initial	2021-08-19 16:04:25.930724-07
4	admin	0002_logentry_remove_auto_add	2021-08-19 16:04:25.944272-07
5	admin	0003_logentry_add_action_flag_choices	2021-08-19 16:04:25.954137-07
6	contenttypes	0002_remove_content_type_name	2021-08-19 16:04:25.981237-07
7	auth	0002_alter_permission_name_max_length	2021-08-19 16:04:25.99021-07
8	auth	0003_alter_user_email_max_length	2021-08-19 16:04:25.998341-07
9	auth	0004_alter_user_username_opts	2021-08-19 16:04:26.017223-07
10	auth	0005_alter_user_last_login_null	2021-08-19 16:04:26.03133-07
11	auth	0006_require_contenttypes_0002	2021-08-19 16:04:26.034299-07
12	auth	0007_alter_validators_add_error_messages	2021-08-19 16:04:26.052362-07
13	auth	0008_alter_user_username_max_length	2021-08-19 16:04:26.066545-07
14	auth	0009_alter_user_last_name_max_length	2021-08-19 16:04:26.09072-07
15	auth	0010_alter_group_name_max_length	2021-08-19 16:04:26.101413-07
16	auth	0011_update_proxy_permissions	2021-08-19 16:04:26.12312-07
17	auth	0012_alter_user_first_name_max_length	2021-08-19 16:04:26.132063-07
18	main_app	0001_initial	2021-08-19 16:04:26.176734-07
19	sessions	0001_initial	2021-08-19 16:04:26.194666-07
20	main_app	0002_auto_20210820_1752	2021-08-23 10:14:49.878876-07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
v4muv6w5ahoxss71qee9emp1k0zewirf	e30:1mIDn8:wS1ohZDE03hVes6UOiDtvVot23J3JhNKUyMy-FmqMcs	2021-09-06 10:31:22.299161-07
3swa2apl7mrydfc8tw56g9jvkqtm6pcx	.eJxVjEEOwiAQRe_C2pChLbS4dO8ZyDAzSNVAUtqV8e7apAvd_vfef6mA25rD1mQJM6uz6tXpd4tIDyk74DuWW9VUy7rMUe-KPmjT18ryvBzu30HGlr81DT6RuEkoWQBE8SMwMXYmknCyzrtIcex6ADOBdTJ42xtE8kPH1oB6fwATSjhS:1mIDvn:ChRsJNCdLJFhDhlc9Qc6y3WWcL_m4dQKti5j4WtuSVA	2021-09-06 10:40:19.579187-07
\.


--
-- Data for Name: main_app_cat; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.main_app_cat (id, name, breed, sex, age, health, description, image_url, user_id, pending) FROM stdin;
1	Mufasa	Lion	M	7	Critical	Mufasa fell from a cliff so he needs massive help	mufasa.com	2	t
\.


--
-- Data for Name: main_app_cat_needs; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.main_app_cat_needs (id, cat_id, needs_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: main_app_needs; Type: TABLE DATA; Schema: public; Owner: monkey
--

COPY public.main_app_needs (id, name, quantity, link, reason) FROM stdin;
1	First-aid kit	10	firstaid.com	Cats fight
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: main_app_cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.main_app_cat_id_seq', 1, true);


--
-- Name: main_app_cat_needs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.main_app_cat_needs_id_seq', 1, true);


--
-- Name: main_app_needs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: monkey
--

SELECT pg_catalog.setval('public.main_app_needs_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: main_app_cat_needs main_app_cat_needs_cat_id_needs_id_70701fe4_uniq; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.main_app_cat_needs
    ADD CONSTRAINT main_app_cat_needs_cat_id_needs_id_70701fe4_uniq UNIQUE (cat_id, needs_id);


--
-- Name: main_app_cat_needs main_app_cat_needs_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.main_app_cat_needs
    ADD CONSTRAINT main_app_cat_needs_pkey PRIMARY KEY (id);


--
-- Name: main_app_cat main_app_cat_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.main_app_cat
    ADD CONSTRAINT main_app_cat_pkey PRIMARY KEY (id);


--
-- Name: main_app_needs main_app_needs_pkey; Type: CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.main_app_needs
    ADD CONSTRAINT main_app_needs_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: main_app_cat_needs_cat_id_dd4b9d6b; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX main_app_cat_needs_cat_id_dd4b9d6b ON public.main_app_cat_needs USING btree (cat_id);


--
-- Name: main_app_cat_needs_needs_id_52bd173d; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX main_app_cat_needs_needs_id_52bd173d ON public.main_app_cat_needs USING btree (needs_id);


--
-- Name: main_app_cat_user_id_4d40db12; Type: INDEX; Schema: public; Owner: monkey
--

CREATE INDEX main_app_cat_user_id_4d40db12 ON public.main_app_cat USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_app_cat_needs main_app_cat_needs_cat_id_dd4b9d6b_fk_main_app_cat_id; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.main_app_cat_needs
    ADD CONSTRAINT main_app_cat_needs_cat_id_dd4b9d6b_fk_main_app_cat_id FOREIGN KEY (cat_id) REFERENCES public.main_app_cat(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_app_cat_needs main_app_cat_needs_needs_id_52bd173d_fk_main_app_needs_id; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.main_app_cat_needs
    ADD CONSTRAINT main_app_cat_needs_needs_id_52bd173d_fk_main_app_needs_id FOREIGN KEY (needs_id) REFERENCES public.main_app_needs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_app_cat main_app_cat_user_id_4d40db12_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: monkey
--

ALTER TABLE ONLY public.main_app_cat
    ADD CONSTRAINT main_app_cat_user_id_4d40db12_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

