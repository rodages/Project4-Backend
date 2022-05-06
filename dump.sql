--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: Checklists_checklist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Checklists_checklist" (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    "Amount" integer NOT NULL,
    created_at timestamp with time zone,
    edited_at timestamp with time zone,
    CONSTRAINT "Checklists_checklist_Amount_2b7bb2d3_check" CHECK (("Amount" >= 0))
);


--
-- Name: Checklists_checklist_checklist_sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Checklists_checklist_checklist_sections" (
    id bigint NOT NULL,
    checklist_id bigint NOT NULL,
    subsection_id bigint NOT NULL
);


--
-- Name: Checklists_checklist_chcklist_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Checklists_checklist_chcklist_sections_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Checklists_checklist_chcklist_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Checklists_checklist_chcklist_sections_id_seq" OWNED BY public."Checklists_checklist_checklist_sections".id;


--
-- Name: Checklists_checklist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Checklists_checklist_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Checklists_checklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Checklists_checklist_id_seq" OWNED BY public."Checklists_checklist".id;


--
-- Name: Departments_department; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Departments_department" (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(200),
    image character varying(200)
);


--
-- Name: Departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Departments_department_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Departments_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Departments_department_id_seq" OWNED BY public."Departments_department".id;


--
-- Name: Departments_department_workers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Departments_department_workers" (
    id bigint NOT NULL,
    department_id bigint NOT NULL,
    worker_id bigint NOT NULL
);


--
-- Name: Departments_department_workers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Departments_department_workers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Departments_department_workers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Departments_department_workers_id_seq" OWNED BY public."Departments_department_workers".id;


--
-- Name: InventoryItems_inventoryitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."InventoryItems_inventoryitem" (
    id bigint NOT NULL,
    item_name character varying(200),
    extra_from_checklist_amount integer NOT NULL,
    completed_status boolean NOT NULL,
    created_at timestamp with time zone,
    edited_at timestamp with time zone
);


--
-- Name: InventoryItems_inventoryitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."InventoryItems_inventoryitem_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: InventoryItems_inventoryitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."InventoryItems_inventoryitem_id_seq" OWNED BY public."InventoryItems_inventoryitem".id;


--
-- Name: Posts_post; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Posts_post" (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    content character varying(1000) NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "createdBy_id" bigint
);


--
-- Name: Posts_post_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Posts_post_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Posts_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Posts_post_id_seq" OWNED BY public."Posts_post".id;


--
-- Name: Shifts_shift; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Shifts_shift" (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(250) NOT NULL,
    date date,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL
);


--
-- Name: Shifts_shift_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Shifts_shift_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Shifts_shift_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Shifts_shift_id_seq" OWNED BY public."Shifts_shift".id;


--
-- Name: Subsections_subsection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Subsections_subsection" (
    id bigint NOT NULL,
    name character varying(200),
    created_at timestamp with time zone,
    edited_at timestamp with time zone
);


--
-- Name: Subsections_subsection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Subsections_subsection_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subsections_subsection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Subsections_subsection_id_seq" OWNED BY public."Subsections_subsection".id;


--
-- Name: Subsections_subsection_inventory_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Subsections_subsection_inventory_items" (
    id bigint NOT NULL,
    subsection_id bigint NOT NULL,
    inventoryitem_id bigint NOT NULL
);


--
-- Name: Subsections_subsection_inventory_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Subsections_subsection_inventory_items_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subsections_subsection_inventory_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Subsections_subsection_inventory_items_id_seq" OWNED BY public."Subsections_subsection_inventory_items".id;


--
-- Name: Subsections_subsection_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Subsections_subsection_tasks" (
    id bigint NOT NULL,
    subsection_id bigint NOT NULL,
    task_id bigint NOT NULL
);


--
-- Name: Subsections_subsection_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Subsections_subsection_tasks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subsections_subsection_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Subsections_subsection_tasks_id_seq" OWNED BY public."Subsections_subsection_tasks".id;


--
-- Name: Tasks_task; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Tasks_task" (
    id bigint NOT NULL,
    task_name character varying(200),
    comments character varying(500),
    created_at timestamp with time zone,
    edited_at timestamp with time zone
);


--
-- Name: Tasks_task_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Tasks_task_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Tasks_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Tasks_task_id_seq" OWNED BY public."Tasks_task".id;


--
-- Name: Users_customuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Users_customuser" (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    "DOB" date NOT NULL,
    role character varying(50),
    postcode character varying(10)
);


--
-- Name: Users_customuser_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Users_customuser_groups" (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: Users_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Users_customuser_groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Users_customuser_groups_id_seq" OWNED BY public."Users_customuser_groups".id;


--
-- Name: Users_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Users_customuser_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Users_customuser_id_seq" OWNED BY public."Users_customuser".id;


--
-- Name: Users_customuser_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Users_customuser_user_permissions" (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: Users_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Users_customuser_user_permissions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Users_customuser_user_permissions_id_seq" OWNED BY public."Users_customuser_user_permissions".id;


--
-- Name: Workers_worker; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Workers_worker" (
    id bigint NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(50) NOT NULL,
    role character varying(30) NOT NULL,
    postcode character varying(10) NOT NULL,
    active boolean NOT NULL,
    "registeredAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


--
-- Name: Workers_worker_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Workers_worker_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Workers_worker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Workers_worker_id_seq" OWNED BY public."Workers_worker".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: Checklists_checklist id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist" ALTER COLUMN id SET DEFAULT nextval('public."Checklists_checklist_id_seq"'::regclass);


--
-- Name: Checklists_checklist_checklist_sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_checklist_sections" ALTER COLUMN id SET DEFAULT nextval('public."Checklists_checklist_chcklist_sections_id_seq"'::regclass);


--
-- Name: Departments_department id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departments_department" ALTER COLUMN id SET DEFAULT nextval('public."Departments_department_id_seq"'::regclass);


--
-- Name: Departments_department_workers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departments_department_workers" ALTER COLUMN id SET DEFAULT nextval('public."Departments_department_workers_id_seq"'::regclass);


--
-- Name: InventoryItems_inventoryitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."InventoryItems_inventoryitem" ALTER COLUMN id SET DEFAULT nextval('public."InventoryItems_inventoryitem_id_seq"'::regclass);


--
-- Name: Posts_post id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Posts_post" ALTER COLUMN id SET DEFAULT nextval('public."Posts_post_id_seq"'::regclass);


--
-- Name: Shifts_shift id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift" ALTER COLUMN id SET DEFAULT nextval('public."Shifts_shift_id_seq"'::regclass);


--
-- Name: Subsections_subsection id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection" ALTER COLUMN id SET DEFAULT nextval('public."Subsections_subsection_id_seq"'::regclass);


--
-- Name: Subsections_subsection_inventory_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection_inventory_items" ALTER COLUMN id SET DEFAULT nextval('public."Subsections_subsection_inventory_items_id_seq"'::regclass);


--
-- Name: Subsections_subsection_tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection_tasks" ALTER COLUMN id SET DEFAULT nextval('public."Subsections_subsection_tasks_id_seq"'::regclass);


--
-- Name: Tasks_task id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tasks_task" ALTER COLUMN id SET DEFAULT nextval('public."Tasks_task_id_seq"'::regclass);


--
-- Name: Users_customuser id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser" ALTER COLUMN id SET DEFAULT nextval('public."Users_customuser_id_seq"'::regclass);


--
-- Name: Users_customuser_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser_groups" ALTER COLUMN id SET DEFAULT nextval('public."Users_customuser_groups_id_seq"'::regclass);


--
-- Name: Users_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."Users_customuser_user_permissions_id_seq"'::regclass);


--
-- Name: Workers_worker id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Workers_worker" ALTER COLUMN id SET DEFAULT nextval('public."Workers_worker_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: Checklists_checklist; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Checklists_checklist" (id, name, description, "Amount", created_at, edited_at) FROM stdin;
2	Tea	checklist for Tea	0	2022-05-04 14:35:20.995829+01	2022-05-04 14:35:20.995829+01
1	Lunch	lunch checklist for the boat	100	2022-05-04 23:27:45.690391+01	2022-05-04 23:27:45.690391+01
\.


--
-- Data for Name: Checklists_checklist_checklist_sections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Checklists_checklist_checklist_sections" (id, checklist_id, subsection_id) FROM stdin;
1	1	8
\.


--
-- Data for Name: Departments_department; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Departments_department" (id, name, description, image) FROM stdin;
\.


--
-- Data for Name: Departments_department_workers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Departments_department_workers" (id, department_id, worker_id) FROM stdin;
\.


--
-- Data for Name: InventoryItems_inventoryitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."InventoryItems_inventoryitem" (id, item_name, extra_from_checklist_amount, completed_status, created_at, edited_at) FROM stdin;
2	Plate	20	f	2022-05-04 16:10:05.200719+01	2022-05-04 16:10:05.200719+01
3	testItem	2	f	2022-05-04 17:17:44.595795+01	2022-05-04 17:17:44.595795+01
5	testItem u	2	f	2022-05-04 21:03:41.69598+01	2022-05-04 21:03:41.69598+01
6	example	2	f	2022-05-05 18:36:47.31418+01	2022-05-05 18:36:47.31418+01
\.


--
-- Data for Name: Posts_post; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts_post" (id, title, content, "createdAt", "updatedAt", "createdBy_id") FROM stdin;
\.


--
-- Data for Name: Shifts_shift; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Shifts_shift" (id, name, description, date, start_time, end_time) FROM stdin;
\.


--
-- Data for Name: Subsections_subsection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Subsections_subsection" (id, name, created_at, edited_at) FROM stdin;
1	Crockery	2022-05-04 17:22:41.736376+01	2022-05-04 17:22:41.736376+01
7	test	2022-05-04 19:51:29.287328+01	2022-05-04 19:51:29.288325+01
8	test u	2022-05-04 21:03:41.709186+01	2022-05-04 21:03:41.709186+01
9	example	2022-05-05 18:36:47.29822+01	2022-05-05 18:36:47.29822+01
\.


--
-- Data for Name: Subsections_subsection_inventory_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Subsections_subsection_inventory_items" (id, subsection_id, inventoryitem_id) FROM stdin;
1	1	2
2	1	3
9	7	3
10	8	3
11	8	5
12	9	6
\.


--
-- Data for Name: Subsections_subsection_tasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Subsections_subsection_tasks" (id, subsection_id, task_id) FROM stdin;
1	8	3
2	8	4
3	9	5
\.


--
-- Data for Name: Tasks_task; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Tasks_task" (id, task_name, comments, created_at, edited_at) FROM stdin;
2	clean bar surfaces	make sure spray is used	2022-05-04 16:09:21.325021+01	2022-05-04 16:09:21.325021+01
3	clean cups	make them sparkly	2022-05-04 19:51:29.306277+01	2022-05-04 19:51:29.306277+01
4	clean cups u	make them sparkly	2022-05-04 21:03:41.706267+01	2022-05-04 21:03:41.706267+01
5	example	example	2022-05-05 18:36:47.325151+01	2022-05-05 18:36:47.325151+01
\.


--
-- Data for Name: Users_customuser; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users_customuser" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, "DOB", role, postcode) FROM stdin;
2	pbkdf2_sha256$320000$tfp0yqZ1b9lFWaL4XFncC1$iW7LsxJHuPzopyxJVU02UjAA+8lqVfLBO8lC2MNsyhw=	\N	f	test	First	Second	email@mail.com	f	t	2022-05-04 14:20:19.880822+01	2022-05-04	Regular Staff	\N
3	pbkdf2_sha256$320000$YxSL0ekBskjuh3OD1S5wed$d+TT9bwIlsiuknAjPi+KWQiXqDcr1jkI7o4BnXsF4F8=	2022-05-05 02:21:39.129071+01	f	rest	r	est	rest@mail.com	f	t	2022-05-05 01:54:00.594971+01	2022-05-05	Regular Staff	\N
4	pbkdf2_sha256$320000$fToEitLzZZPR6asVo8EYu3$SVESK8LSW6467tV2+Xpb282fEUek9oR4gpZD4GqbtX8=	2022-05-05 18:59:16.313153+01	t	Andre	First	Second	unique@mail.com	t	t	2022-05-05 18:52:55.700181+01	2022-05-05	Regular Staff	\N
5	pbkdf2_sha256$320000$LPjNR2xNxdsk1hdcthyQpy$Q0R/TcRtxU8thP0zLZuBXbDz5ixQYvsnoh5AYhotuLM=	\N	f	zan	First	Second	unique1@mail.com	f	t	2022-05-05 19:01:48.945622+01	2000-01-01	Regular Staff	\N
1	pbkdf2_sha256$320000$Rj4NTHziwEhjAuzoiEu4MN$jYsHH8w1rVy8adIXBXn1rg1D+aKtyD1oaXxXK0SJbOo=	2022-05-05 19:36:27.492751+01	t	admin			admin@admin.com	t	t	2022-05-04 14:09:04.597442+01	2022-05-04	Regular Staff	\N
6	pbkdf2_sha256$320000$X3PpBScN7TYiCdfYscZEWd$MfqUngS+AWiUWOWt2ZJU7DD6l79ngR3MraalPmA4rFI=	\N	f	testingdate	First	Second	unique2@mail.com	f	t	2022-05-05 19:45:48.236925+01	2000-01-01	Regular Staff	\N
\.


--
-- Data for Name: Users_customuser_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users_customuser_groups" (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: Users_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users_customuser_user_permissions" (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: Workers_worker; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workers_worker" (id, first_name, last_name, role, postcode, active, "registeredAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add Token	1	add_token
2	Can change Token	1	change_token
3	Can delete Token	1	delete_token
4	Can view Token	1	view_token
5	Can add token	2	add_tokenproxy
6	Can change token	2	change_tokenproxy
7	Can delete token	2	delete_tokenproxy
8	Can view token	2	view_tokenproxy
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
21	Can add content type	6	add_contenttype
22	Can change content type	6	change_contenttype
23	Can delete content type	6	delete_contenttype
24	Can view content type	6	view_contenttype
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
29	Can add department	8	add_department
30	Can change department	8	change_department
31	Can delete department	8	delete_department
32	Can view department	8	view_department
33	Can add worker	9	add_worker
34	Can change worker	9	change_worker
35	Can delete worker	9	delete_worker
36	Can view worker	9	view_worker
37	Can add post	10	add_post
38	Can change post	10	change_post
39	Can delete post	10	delete_post
40	Can view post	10	view_post
41	Can add shift	11	add_shift
42	Can change shift	11	change_shift
43	Can delete shift	11	delete_shift
44	Can view shift	11	view_shift
45	Can add checklist	12	add_checklist
46	Can change checklist	12	change_checklist
47	Can delete checklist	12	delete_checklist
48	Can view checklist	12	view_checklist
49	Can add inventory item	13	add_inventoryitem
50	Can change inventory item	13	change_inventoryitem
51	Can delete inventory item	13	delete_inventoryitem
52	Can view inventory item	13	view_inventoryitem
53	Can add subsection	14	add_subsection
54	Can change subsection	14	change_subsection
55	Can delete subsection	14	delete_subsection
56	Can view subsection	14	view_subsection
57	Can add task	15	add_task
58	Can change task	15	change_task
59	Can delete task	15	delete_task
60	Can view task	15	view_task
61	Can add user	16	add_customuser
62	Can change user	16	change_customuser
63	Can delete user	16	delete_customuser
64	Can view user	16	view_customuser
65	Can add subsection	17	add_subsection
66	Can change subsection	17	change_subsection
67	Can delete subsection	17	delete_subsection
68	Can view subsection	17	view_subsection
69	Can add inventory item	18	add_inventoryitem
70	Can change inventory item	18	change_inventoryitem
71	Can delete inventory item	18	delete_inventoryitem
72	Can view inventory item	18	view_inventoryitem
73	Can add task	19	add_task
74	Can change task	19	change_task
75	Can delete task	19	delete_task
76	Can view task	19	view_task
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
5ff46ad48f54d1152ecfaa64eac1155ac9665e05	2022-05-05 01:50:16.520152+01	1
6d158c84160b9f24b3b7799d5d15dc36a147f089	2022-05-05 01:54:26.369999+01	3
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-05-04 14:31:22.736104+01	1	Lunch	1	[{"added": {}}]	12	1
2	2022-05-04 15:36:10.744642+01	1	Subsection object (1)	1	[{"added": {}}]	17	1
3	2022-05-04 16:09:21.327016+01	2	clean bar surfaces	1	[{"added": {}}]	19	1
4	2022-05-04 16:10:05.204709+01	2	Plate	1	[{"added": {}}]	18	1
5	2022-05-04 17:22:41.740367+01	1	Crockery	2	[{"changed": {"fields": ["Inventory items"]}}]	17	1
6	2022-05-04 19:12:21.087083+01	3	test	3		17	1
7	2022-05-04 19:13:54.588467+01	4	testItem2	3		18	1
8	2022-05-04 19:14:30.755434+01	6	test	3		17	1
9	2022-05-04 19:14:38.646491+01	5	test	3		17	1
10	2022-05-04 19:17:34.855177+01	4	test	3		17	1
11	2022-05-04 19:17:47.366758+01	2	test	3		17	1
12	2022-05-04 23:27:45.695375+01	1	Lunch	2	[{"changed": {"fields": ["Chcklist sections"]}}]	12	1
13	2022-05-05 20:59:12.391067+01	8	unique.roles	2	[{"changed": {"fields": ["Username", "Role"]}}]	16	1
14	2022-05-05 21:50:26.184185+01	8	unique.roles	3		16	1
15	2022-05-05 21:51:11.047313+01	7	unique.name	2	[{"changed": {"fields": ["Password", "Role"]}}]	16	1
16	2022-05-05 21:51:23.457821+01	7	unique.name	3		16	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	authtoken	token
2	authtoken	tokenproxy
3	admin	logentry
4	auth	permission
5	auth	group
6	contenttypes	contenttype
7	sessions	session
8	Departments	department
9	Workers	worker
10	Posts	post
11	Shifts	shift
12	Checklists	checklist
13	Checklists	inventoryitem
14	Checklists	subsection
15	Checklists	task
16	Users	customuser
17	Subsections	subsection
18	InventoryItems	inventoryitem
19	Tasks	task
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	Checklists	0001_initial	2022-05-04 14:06:33.517326+01
2	Workers	0001_initial	2022-05-04 14:06:33.526302+01
3	contenttypes	0001_initial	2022-05-04 14:06:33.538271+01
4	contenttypes	0002_remove_content_type_name	2022-05-04 14:06:33.552234+01
5	auth	0001_initial	2022-05-04 14:06:33.611077+01
6	auth	0002_alter_permission_name_max_length	2022-05-04 14:06:33.616063+01
7	auth	0003_alter_user_email_max_length	2022-05-04 14:06:33.62105+01
8	auth	0004_alter_user_username_opts	2022-05-04 14:06:33.626037+01
9	auth	0005_alter_user_last_login_null	2022-05-04 14:06:33.631022+01
10	auth	0006_require_contenttypes_0002	2022-05-04 14:06:33.634015+01
11	auth	0007_alter_validators_add_error_messages	2022-05-04 14:06:33.639002+01
12	auth	0008_alter_user_username_max_length	2022-05-04 14:06:33.644986+01
13	auth	0009_alter_user_last_name_max_length	2022-05-04 14:06:33.649972+01
14	auth	0010_alter_group_name_max_length	2022-05-04 14:06:33.658949+01
15	auth	0011_update_proxy_permissions	2022-05-04 14:06:33.667924+01
16	auth	0012_alter_user_first_name_max_length	2022-05-04 14:06:33.673908+01
17	Users	0001_initial	2022-05-04 14:06:33.724772+01
18	Workers	0002_worker_userid_alter_worker_registeredat_and_more	2022-05-04 14:06:33.749707+01
19	Workers	0003_alter_worker_userid	2022-05-04 14:06:33.783615+01
20	Workers	0004_alter_worker_userid	2022-05-04 14:06:33.798575+01
21	Departments	0001_initial	2022-05-04 14:06:33.811542+01
22	Departments	0002_department_workers	2022-05-04 14:06:33.825503+01
23	Departments	0003_remove_department_workers_department_workers	2022-05-04 14:06:33.860409+01
24	Departments	0004_alter_department_workers	2022-05-04 14:06:33.869386+01
25	Workers	0005_alter_worker_active	2022-05-04 14:06:33.877365+01
26	Posts	0001_initial	2022-05-04 14:06:33.889332+01
27	Posts	0002_post_createdby	2022-05-04 14:06:33.902298+01
28	Shifts	0001_initial	2022-05-04 14:06:33.911275+01
29	Workers	0006_remove_worker_userid	2022-05-04 14:06:33.925237+01
30	Workers	0007_worker_userid	2022-05-04 14:06:33.9392+01
31	Workers	0008_remove_worker_userid	2022-05-04 14:06:33.95017+01
32	admin	0001_initial	2022-05-04 14:06:33.975103+01
33	admin	0002_logentry_remove_auto_add	2022-05-04 14:06:33.985076+01
34	admin	0003_logentry_add_action_flag_choices	2022-05-04 14:06:33.993055+01
35	authtoken	0001_initial	2022-05-04 14:06:34.014+01
36	authtoken	0002_auto_20160226_1747	2022-05-04 14:06:34.041924+01
37	authtoken	0003_tokenproxy	2022-05-04 14:06:34.044923+01
38	sessions	0001_initial	2022-05-04 14:06:34.059876+01
39	Checklists	0002_alter_checklist_amount	2022-05-04 14:32:14.175828+01
40	Subsections	0001_initial	2022-05-04 15:28:04.461032+01
41	Checklists	0003_rename_extrafromchecklistamount_inventoryitem_extra_from_checklist_amount_and_more	2022-05-04 16:07:42.901319+01
42	InventoryItems	0001_initial	2022-05-04 16:07:42.937222+01
43	Tasks	0001_initial	2022-05-04 16:07:42.951183+01
44	Tasks	0002_rename_task_name_task_task_name	2022-05-04 16:09:08.148977+01
45	Subsections	0002_subsection_inventory_items	2022-05-04 17:22:26.743114+01
46	Subsections	0003_subsection_tasks_alter_subsection_inventory_items	2022-05-04 19:51:56.322745+01
47	Checklists	0004_checklist_chcklist_sections_and_more	2022-05-04 23:27:13.707991+01
48	Tasks	0003_alter_task_created_at	2022-05-04 23:27:13.71996+01
49	Checklists	0005_delete_inventoryitem_delete_subsection_delete_task_and_more	2022-05-05 01:13:56.638457+01
50	Checklists	0006_rename_cheklist_sections_checklist_checklist_sections	2022-05-05 01:14:49.969994+01
51	Users	0002_alter_customuser_dob	2022-05-05 18:52:18.641203+01
52	Users	0003_customuser_role	2022-05-05 20:49:04.239312+01
53	Users	0004_customuser_postcode	2022-05-05 21:42:59.438239+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
6liajzergnhy1x0lhoflotcul1ab3nu1	.eJxVjMEOwiAQRP-FsyEW6LL16N1vIAvLStWUpLQn47_bJj3oYS7z3sxbBVqXEtaW5zCyuiirTr9dpPTM0w74QdO96lSnZR6j3hV90KZvlfPrerh_B4Va2dYiDJ4RPSFR7jmfBXJCkSjoBTrsfEoW3BYAizH2BoZERsgZ73BQny8aBziQ:1nmQBX:aeI4IvBtvsoBJwl9TLre842BU0a0CNItA2SrTBT0Dhg	2022-05-19 02:21:39.1301+01
izh3w5b3t5p8enop3xy3ks5pbvqd3126	.eJxVjEEOwiAQRe_C2hBmoC24dO8ZyMBMbdVAUtqV8e7apAvd_vfef6lI2zrFrckSZ1ZnBer0uyXKDyk74DuVW9W5lnWZk94VfdCmr5XleTncv4OJ2vStrXdkjJeABjEEAOes80CpY0AzptF3aSCLzoSceoQBuButHcT2wiis3h-jvTbP:1nmgKx:VMqE8OOXPY3T9WlwnGM7vVDV1cd6RhgFm4NX4ojXEBs	2022-05-19 19:36:27.493749+01
\.


--
-- Name: Checklists_checklist_chcklist_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Checklists_checklist_chcklist_sections_id_seq"', 1, true);


--
-- Name: Checklists_checklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Checklists_checklist_id_seq"', 2, true);


--
-- Name: Departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Departments_department_id_seq"', 1, false);


--
-- Name: Departments_department_workers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Departments_department_workers_id_seq"', 1, false);


--
-- Name: InventoryItems_inventoryitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."InventoryItems_inventoryitem_id_seq"', 6, true);


--
-- Name: Posts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Posts_post_id_seq"', 1, false);


--
-- Name: Shifts_shift_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Shifts_shift_id_seq"', 1, false);


--
-- Name: Subsections_subsection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Subsections_subsection_id_seq"', 9, true);


--
-- Name: Subsections_subsection_inventory_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Subsections_subsection_inventory_items_id_seq"', 12, true);


--
-- Name: Subsections_subsection_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Subsections_subsection_tasks_id_seq"', 3, true);


--
-- Name: Tasks_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Tasks_task_id_seq"', 5, true);


--
-- Name: Users_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Users_customuser_groups_id_seq"', 1, false);


--
-- Name: Users_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Users_customuser_id_seq"', 8, true);


--
-- Name: Users_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Users_customuser_user_permissions_id_seq"', 1, false);


--
-- Name: Workers_worker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Workers_worker_id_seq"', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 16, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 53, true);


--
-- Name: Checklists_checklist_checklist_sections Checklists_checklist_chc_checklist_id_subsection__3dfec289_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_checklist_sections"
    ADD CONSTRAINT "Checklists_checklist_chc_checklist_id_subsection__3dfec289_uniq" UNIQUE (checklist_id, subsection_id);


--
-- Name: Checklists_checklist_checklist_sections Checklists_checklist_chcklist_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_checklist_sections"
    ADD CONSTRAINT "Checklists_checklist_chcklist_sections_pkey" PRIMARY KEY (id);


--
-- Name: Checklists_checklist Checklists_checklist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist"
    ADD CONSTRAINT "Checklists_checklist_pkey" PRIMARY KEY (id);


--
-- Name: Departments_department Departments_department_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departments_department"
    ADD CONSTRAINT "Departments_department_name_key" UNIQUE (name);


--
-- Name: Departments_department Departments_department_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departments_department"
    ADD CONSTRAINT "Departments_department_pkey" PRIMARY KEY (id);


--
-- Name: Departments_department_workers Departments_department_w_department_id_worker_id_d95b99a4_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departments_department_workers"
    ADD CONSTRAINT "Departments_department_w_department_id_worker_id_d95b99a4_uniq" UNIQUE (department_id, worker_id);


--
-- Name: Departments_department_workers Departments_department_workers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departments_department_workers"
    ADD CONSTRAINT "Departments_department_workers_pkey" PRIMARY KEY (id);


--
-- Name: InventoryItems_inventoryitem InventoryItems_inventoryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."InventoryItems_inventoryitem"
    ADD CONSTRAINT "InventoryItems_inventoryitem_pkey" PRIMARY KEY (id);


--
-- Name: Posts_post Posts_post_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Posts_post"
    ADD CONSTRAINT "Posts_post_pkey" PRIMARY KEY (id);


--
-- Name: Shifts_shift Shifts_shift_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift"
    ADD CONSTRAINT "Shifts_shift_pkey" PRIMARY KEY (id);


--
-- Name: Subsections_subsection_inventory_items Subsections_subsection_i_subsection_id_inventoryi_b877f062_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection_inventory_items"
    ADD CONSTRAINT "Subsections_subsection_i_subsection_id_inventoryi_b877f062_uniq" UNIQUE (subsection_id, inventoryitem_id);


--
-- Name: Subsections_subsection_inventory_items Subsections_subsection_inventory_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection_inventory_items"
    ADD CONSTRAINT "Subsections_subsection_inventory_items_pkey" PRIMARY KEY (id);


--
-- Name: Subsections_subsection Subsections_subsection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection"
    ADD CONSTRAINT "Subsections_subsection_pkey" PRIMARY KEY (id);


--
-- Name: Subsections_subsection_tasks Subsections_subsection_t_subsection_id_task_id_3ed3b3fd_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection_tasks"
    ADD CONSTRAINT "Subsections_subsection_t_subsection_id_task_id_3ed3b3fd_uniq" UNIQUE (subsection_id, task_id);


--
-- Name: Subsections_subsection_tasks Subsections_subsection_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection_tasks"
    ADD CONSTRAINT "Subsections_subsection_tasks_pkey" PRIMARY KEY (id);


--
-- Name: Tasks_task Tasks_task_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tasks_task"
    ADD CONSTRAINT "Tasks_task_pkey" PRIMARY KEY (id);


--
-- Name: Users_customuser_groups Users_customuser_groups_customuser_id_group_id_5ac5fb62_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser_groups"
    ADD CONSTRAINT "Users_customuser_groups_customuser_id_group_id_5ac5fb62_uniq" UNIQUE (customuser_id, group_id);


--
-- Name: Users_customuser_groups Users_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser_groups"
    ADD CONSTRAINT "Users_customuser_groups_pkey" PRIMARY KEY (id);


--
-- Name: Users_customuser Users_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser"
    ADD CONSTRAINT "Users_customuser_pkey" PRIMARY KEY (id);


--
-- Name: Users_customuser_user_permissions Users_customuser_user_pe_customuser_id_permission_12209533_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser_user_permissions"
    ADD CONSTRAINT "Users_customuser_user_pe_customuser_id_permission_12209533_uniq" UNIQUE (customuser_id, permission_id);


--
-- Name: Users_customuser_user_permissions Users_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser_user_permissions"
    ADD CONSTRAINT "Users_customuser_user_permissions_pkey" PRIMARY KEY (id);


--
-- Name: Users_customuser Users_customuser_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser"
    ADD CONSTRAINT "Users_customuser_username_key" UNIQUE (username);


--
-- Name: Workers_worker Workers_worker_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Workers_worker"
    ADD CONSTRAINT "Workers_worker_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: Checklists_checklist_chcklist_sections_checklist_id_3196bf81; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Checklists_checklist_chcklist_sections_checklist_id_3196bf81" ON public."Checklists_checklist_checklist_sections" USING btree (checklist_id);


--
-- Name: Checklists_checklist_chcklist_sections_subsection_id_89958355; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Checklists_checklist_chcklist_sections_subsection_id_89958355" ON public."Checklists_checklist_checklist_sections" USING btree (subsection_id);


--
-- Name: Departments_department_name_7d30f8e8_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Departments_department_name_7d30f8e8_like" ON public."Departments_department" USING btree (name varchar_pattern_ops);


--
-- Name: Departments_department_workers_department_id_803d1a37; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Departments_department_workers_department_id_803d1a37" ON public."Departments_department_workers" USING btree (department_id);


--
-- Name: Departments_department_workers_worker_id_6cbbb76d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Departments_department_workers_worker_id_6cbbb76d" ON public."Departments_department_workers" USING btree (worker_id);


--
-- Name: Posts_post_createdBy_id_0c24779d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Posts_post_createdBy_id_0c24779d" ON public."Posts_post" USING btree ("createdBy_id");


--
-- Name: Subsections_subsection_inv_inventoryitem_id_20a6d873; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Subsections_subsection_inv_inventoryitem_id_20a6d873" ON public."Subsections_subsection_inventory_items" USING btree (inventoryitem_id);


--
-- Name: Subsections_subsection_inventory_items_subsection_id_f90f6a19; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Subsections_subsection_inventory_items_subsection_id_f90f6a19" ON public."Subsections_subsection_inventory_items" USING btree (subsection_id);


--
-- Name: Subsections_subsection_tasks_subsection_id_b4a0d782; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Subsections_subsection_tasks_subsection_id_b4a0d782" ON public."Subsections_subsection_tasks" USING btree (subsection_id);


--
-- Name: Subsections_subsection_tasks_task_id_26044be1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Subsections_subsection_tasks_task_id_26044be1" ON public."Subsections_subsection_tasks" USING btree (task_id);


--
-- Name: Users_customuser_groups_customuser_id_2cb9ebc6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Users_customuser_groups_customuser_id_2cb9ebc6" ON public."Users_customuser_groups" USING btree (customuser_id);


--
-- Name: Users_customuser_groups_group_id_c15c8f40; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Users_customuser_groups_group_id_c15c8f40" ON public."Users_customuser_groups" USING btree (group_id);


--
-- Name: Users_customuser_user_permissions_customuser_id_f80eaa53; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Users_customuser_user_permissions_customuser_id_f80eaa53" ON public."Users_customuser_user_permissions" USING btree (customuser_id);


--
-- Name: Users_customuser_user_permissions_permission_id_ff591115; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Users_customuser_user_permissions_permission_id_ff591115" ON public."Users_customuser_user_permissions" USING btree (permission_id);


--
-- Name: Users_customuser_username_1be623d2_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Users_customuser_username_1be623d2_like" ON public."Users_customuser" USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: Checklists_checklist_checklist_sections Checklists_checklist_checklist_id_3196bf81_fk_Checklist; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_checklist_sections"
    ADD CONSTRAINT "Checklists_checklist_checklist_id_3196bf81_fk_Checklist" FOREIGN KEY (checklist_id) REFERENCES public."Checklists_checklist"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Checklists_checklist_checklist_sections Checklists_checklist_subsection_id_89958355_fk_Subsectio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_checklist_sections"
    ADD CONSTRAINT "Checklists_checklist_subsection_id_89958355_fk_Subsectio" FOREIGN KEY (subsection_id) REFERENCES public."Subsections_subsection"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Departments_department_workers Departments_departme_department_id_803d1a37_fk_Departmen; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departments_department_workers"
    ADD CONSTRAINT "Departments_departme_department_id_803d1a37_fk_Departmen" FOREIGN KEY (department_id) REFERENCES public."Departments_department"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Departments_department_workers Departments_departme_worker_id_6cbbb76d_fk_Workers_w; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departments_department_workers"
    ADD CONSTRAINT "Departments_departme_worker_id_6cbbb76d_fk_Workers_w" FOREIGN KEY (worker_id) REFERENCES public."Workers_worker"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Posts_post Posts_post_createdBy_id_0c24779d_fk_Workers_worker_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Posts_post"
    ADD CONSTRAINT "Posts_post_createdBy_id_0c24779d_fk_Workers_worker_id" FOREIGN KEY ("createdBy_id") REFERENCES public."Workers_worker"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Subsections_subsection_inventory_items Subsections_subsecti_inventoryitem_id_20a6d873_fk_Inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection_inventory_items"
    ADD CONSTRAINT "Subsections_subsecti_inventoryitem_id_20a6d873_fk_Inventory" FOREIGN KEY (inventoryitem_id) REFERENCES public."InventoryItems_inventoryitem"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Subsections_subsection_tasks Subsections_subsecti_subsection_id_b4a0d782_fk_Subsectio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection_tasks"
    ADD CONSTRAINT "Subsections_subsecti_subsection_id_b4a0d782_fk_Subsectio" FOREIGN KEY (subsection_id) REFERENCES public."Subsections_subsection"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Subsections_subsection_inventory_items Subsections_subsecti_subsection_id_f90f6a19_fk_Subsectio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection_inventory_items"
    ADD CONSTRAINT "Subsections_subsecti_subsection_id_f90f6a19_fk_Subsectio" FOREIGN KEY (subsection_id) REFERENCES public."Subsections_subsection"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Subsections_subsection_tasks Subsections_subsection_tasks_task_id_26044be1_fk_Tasks_task_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subsections_subsection_tasks"
    ADD CONSTRAINT "Subsections_subsection_tasks_task_id_26044be1_fk_Tasks_task_id" FOREIGN KEY (task_id) REFERENCES public."Tasks_task"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Users_customuser_groups Users_customuser_gro_customuser_id_2cb9ebc6_fk_Users_cus; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser_groups"
    ADD CONSTRAINT "Users_customuser_gro_customuser_id_2cb9ebc6_fk_Users_cus" FOREIGN KEY (customuser_id) REFERENCES public."Users_customuser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Users_customuser_groups Users_customuser_groups_group_id_c15c8f40_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser_groups"
    ADD CONSTRAINT "Users_customuser_groups_group_id_c15c8f40_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Users_customuser_user_permissions Users_customuser_use_customuser_id_f80eaa53_fk_Users_cus; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser_user_permissions"
    ADD CONSTRAINT "Users_customuser_use_customuser_id_f80eaa53_fk_Users_cus" FOREIGN KEY (customuser_id) REFERENCES public."Users_customuser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Users_customuser_user_permissions Users_customuser_use_permission_id_ff591115_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users_customuser_user_permissions"
    ADD CONSTRAINT "Users_customuser_use_permission_id_ff591115_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_Users_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT "authtoken_token_user_id_35299eff_fk_Users_customuser_id" FOREIGN KEY (user_id) REFERENCES public."Users_customuser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_Users_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Users_customuser_id" FOREIGN KEY (user_id) REFERENCES public."Users_customuser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

