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
    description character varying(100),
    created_at timestamp with time zone,
    edited_at timestamp with time zone,
    sales_target double precision NOT NULL,
    department_id bigint
);


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
-- Name: Checklists_checklist_inventory_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Checklists_checklist_inventory_items" (
    id bigint NOT NULL,
    checklist_id bigint NOT NULL,
    inventoryitem_id bigint NOT NULL
);


--
-- Name: Checklists_checklist_inventory_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Checklists_checklist_inventory_items_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Checklists_checklist_inventory_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Checklists_checklist_inventory_items_id_seq" OWNED BY public."Checklists_checklist_inventory_items".id;


--
-- Name: Checklists_checklist_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Checklists_checklist_tasks" (
    id bigint NOT NULL,
    checklist_id bigint NOT NULL,
    task_id bigint NOT NULL
);


--
-- Name: Checklists_checklist_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Checklists_checklist_tasks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Checklists_checklist_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Checklists_checklist_tasks_id_seq" OWNED BY public."Checklists_checklist_tasks".id;


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
    customuser_id bigint NOT NULL
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
    name character varying(200),
    extra_from_checklist_amount integer NOT NULL,
    created_at timestamp with time zone,
    edited_at timestamp with time zone,
    created_by_id bigint,
    comment character varying(500),
    section_name character varying(50),
    edited_by_id bigint,
    image character varying(200)
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
    "createdBy_id" bigint,
    department_id bigint,
    "departmentID" integer
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
-- Name: Shifts_checklistitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Shifts_checklistitem" (
    id bigint NOT NULL,
    name character varying(100),
    comment character varying(200),
    completed_status boolean NOT NULL,
    "order" integer NOT NULL,
    extra_from_checklist_amount integer,
    checklist_name character varying(100),
    section_name character varying(100),
    assigned_to character varying(50),
    type character varying(100)
);


--
-- Name: Shifts_checklistitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Shifts_checklistitem_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Shifts_checklistitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Shifts_checklistitem_id_seq" OWNED BY public."Shifts_checklistitem".id;


--
-- Name: Shifts_shift; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Shifts_shift" (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(250) NOT NULL,
    date date,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    created_by_id bigint,
    department_id bigint,
    used_as_template boolean NOT NULL,
    boarding time without time zone,
    dropoff time without time zone,
    leaving_pier time without time zone
);


--
-- Name: Shifts_shift_checklist_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Shifts_shift_checklist_items" (
    id bigint NOT NULL,
    shift_id bigint NOT NULL,
    checklistitem_id bigint NOT NULL
);


--
-- Name: Shifts_shift_checklist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Shifts_shift_checklist_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Shifts_shift_checklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Shifts_shift_checklist_id_seq" OWNED BY public."Shifts_shift_checklist_items".id;


--
-- Name: Shifts_shift_checklists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Shifts_shift_checklists" (
    id bigint NOT NULL,
    shift_id bigint NOT NULL,
    checklist_id bigint NOT NULL
);


--
-- Name: Shifts_shift_checklists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Shifts_shift_checklists_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Shifts_shift_checklists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Shifts_shift_checklists_id_seq" OWNED BY public."Shifts_shift_checklists".id;


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
-- Name: Tasks_task; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Tasks_task" (
    id bigint NOT NULL,
    name character varying(200),
    comment character varying(500),
    created_at timestamp with time zone,
    edited_at timestamp with time zone,
    created_by_id bigint,
    section_name character varying(50),
    edited_by_id bigint,
    extra_from_checklist_amount integer NOT NULL,
    image character varying(200)
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
-- Name: Checklists_checklist_inventory_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_inventory_items" ALTER COLUMN id SET DEFAULT nextval('public."Checklists_checklist_inventory_items_id_seq"'::regclass);


--
-- Name: Checklists_checklist_tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_tasks" ALTER COLUMN id SET DEFAULT nextval('public."Checklists_checklist_tasks_id_seq"'::regclass);


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
-- Name: Shifts_checklistitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_checklistitem" ALTER COLUMN id SET DEFAULT nextval('public."Shifts_checklistitem_id_seq"'::regclass);


--
-- Name: Shifts_shift id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift" ALTER COLUMN id SET DEFAULT nextval('public."Shifts_shift_id_seq"'::regclass);


--
-- Name: Shifts_shift_checklist_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift_checklist_items" ALTER COLUMN id SET DEFAULT nextval('public."Shifts_shift_checklist_id_seq"'::regclass);


--
-- Name: Shifts_shift_checklists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift_checklists" ALTER COLUMN id SET DEFAULT nextval('public."Shifts_shift_checklists_id_seq"'::regclass);


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

COPY public."Checklists_checklist" (id, name, description, created_at, edited_at, sales_target, department_id) FROM stdin;
3	Tea	\N	2022-05-12 00:17:45.649209+01	2022-05-12 00:17:45.649209+01	0	\N
2	Lunch	\N	2022-05-12 02:14:28.504735+01	2022-05-12 02:14:28.504735+01	0	1
\.


--
-- Data for Name: Checklists_checklist_inventory_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Checklists_checklist_inventory_items" (id, checklist_id, inventoryitem_id) FROM stdin;
1	2	2
2	3	2
3	2	3
4	2	4
5	3	3
6	3	4
\.


--
-- Data for Name: Checklists_checklist_tasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Checklists_checklist_tasks" (id, checklist_id, task_id) FROM stdin;
1	2	1
4	3	2
\.


--
-- Data for Name: Departments_department; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Departments_department" (id, name, description, image) FROM stdin;
3	Piers	Piers Team	https://www.parkgrandlondon.co.uk/blog/wp-content/uploads/2015/12/24456031.jpg
1	Food and Bevarage	Front of House and Back of House Teams	https://selectionpartners.net/wp-content/uploads/2021/03/FBcontroller.jpg
2	Sight Seeing	sightseeing service	https://www.colliers-thames-boat-hire.co.uk/wp-content/uploads/2011/06/sightseeing.jpg
\.


--
-- Data for Name: Departments_department_workers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Departments_department_workers" (id, department_id, customuser_id) FROM stdin;
4	2	5
5	2	6
10	1	2
11	1	3
12	1	4
13	1	5
14	1	6
15	1	1
16	3	1
\.


--
-- Data for Name: InventoryItems_inventoryitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."InventoryItems_inventoryitem" (id, name, extra_from_checklist_amount, created_at, edited_at, created_by_id, comment, section_name, edited_by_id, image) FROM stdin;
2	main plate	10	2022-05-07 23:37:32.185049+01	2022-05-07 23:37:32.185049+01	1	-	Other	\N	\N
4	saucers	0	2022-05-07 23:39:29.463294+01	2022-05-07 23:39:29.463294+01	1	-	Crockery	\N	\N
3	side plates	10	2022-05-14 00:03:45.652294+01	2022-05-14 00:03:45.652294+01	1	used for bread	Crockery	\N	https://media.nisbets.com/asset/core/prodimage/largezoom/cb481_2olympia-ww-grey.jpg
\.


--
-- Data for Name: Posts_post; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts_post" (id, title, content, "createdAt", "updatedAt", "createdBy_id", department_id, "departmentID") FROM stdin;
1	First Post	randomtext	2022-05-12 01:53:02.12697+01	2022-05-12 01:53:02.12697+01	4	1	\N
17	First Post	randomtext	2022-05-12 21:18:48.8651+01	2022-05-12 21:18:48.8651+01	4	1	1
\.


--
-- Data for Name: Shifts_checklistitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Shifts_checklistitem" (id, name, comment, completed_status, "order", extra_from_checklist_amount, checklist_name, section_name, assigned_to, type) FROM stdin;
1	item name	comment	f	0	0	\N	\N	\N	
2	task name	none	f	0	0	\N	\N	\N	
3	item name	comment	f	0	0	\N	\N	\N	
4	item name	comment	f	0	0	\N	\N	\N	
5	task name	none	f	0	0	\N	\N	\N	
6	task name	none	f	0	0	\N	\N	\N	
7	item name	comment	f	0	0	\N	\N	\N	
8	task name	none	f	0	0	\N	\N	\N	
9	item name	comment	f	0	0	\N	\N	\N	
10	item name	comment	f	0	0	\N	\N	\N	
11	task name	none	f	0	0	\N	\N	\N	
12	task name	none	f	0	0	\N	\N	\N	
13	item name	comment	f	0	0	\N	\N	\N	
14	task name	none	f	0	0	\N	\N	\N	
15	item name	comment	f	0	0	\N	\N	\N	
16	item name	comment	f	0	0	\N	\N	\N	
17	task name	none	f	0	0	\N	\N	\N	
18	task name	none	f	0	0	\N	\N	\N	
19	item name	comment	f	0	0	\N	\N	\N	
20	item name	comment	f	0	0	\N	\N	\N	
21	task name	none	f	0	0	\N	\N	\N	
22	item name	comment	f	0	0	\N	\N	\N	
23	item name	comment	f	0	0	\N	\N	\N	
24	task name	none	f	0	0	\N	\N	\N	
25	task name	none	f	0	0	\N	\N	\N	
26	item name	comment	f	0	0	\N	\N	\N	
27	task name	none	f	0	0	\N	\N	\N	
28	item name	comment	f	0	0	\N	\N	\N	
29	item name	comment	f	0	0	\N	\N	\N	
30	task name	none	f	0	0	\N	\N	\N	
31	task name	none	f	0	0	\N	\N	\N	
32	item name	comment	f	0	0	\N	\N	\N	
33	task name	none	f	0	0	\N	\N	\N	
34	item name	comment	f	0	0	\N	\N	\N	
35	item name	comment	f	0	0	\N	\N	\N	
36	task name	none	f	0	0	\N	\N	\N	
37	task name	none	f	0	0	\N	\N	\N	
38	item name	comment	f	0	0	\N	\N	\N	
39	task name	none	f	0	0	\N	\N	\N	
40	item name	comment	f	0	0	\N	\N	\N	
41	task name	none	f	0	0	\N	\N	\N	
42	item name	comment	f	0	0	\N	\N	\N	
43	item name	comment	f	0	0	\N	\N	\N	
44	task name	none	f	0	0	\N	\N	\N	
45	task name	none	f	0	0	\N	\N	\N	
46	item name	comment	f	0	0	\N	\N	\N	
47	task name	none	f	0	0	\N	\N	\N	
48	item name	comment	f	0	0	\N	\N	\N	
49	item name	comment	f	0	0	\N	\N	\N	
50	task name	none	f	0	0	\N	\N	\N	
51	task name	none	f	0	0	\N	\N	\N	
52	item name	comment	f	0	0	\N	\N	\N	
53	task name	none	f	0	0	\N	\N	\N	
54	wipe bar	\N	f	0	0	Tea	Other	\N	task
55	task name	none	f	0	0	\N	\N	\N	
56	wipe bar	\N	f	0	0	Lunch	Other	\N	task
57	take out linen	\N	f	0	0	Lunch	Other	\N	task
58	main plate	-	f	0	10	Lunch	Other	\N	item
59	side plates	\N	f	0	0	Lunch	Other	\N	item
60	saucers	-	f	0	0	Lunch	Crockery	\N	item
61	wipe bar	\N	f	0	0	Tea	Other	\N	task
62	take out linen	\N	f	0	0	Tea	Other	\N	task
63	main plate	-	f	0	10	Tea	Other	\N	item
64	side plates	\N	f	0	0	Tea	Other	\N	item
65	saucers	-	f	0	0	Tea	Crockery	\N	item
66	wipe bar	\N	f	0	0	Lunch	Other	\N	task
67	take out linen	\N	f	0	0	Lunch	Other	\N	task
68	main plate	-	f	0	10	Lunch	Other	\N	item
69	side plates	\N	f	0	0	Lunch	Other	\N	item
70	saucers	-	f	0	0	Lunch	Crockery	\N	item
71	wipe bar	\N	f	0	0	Tea	Other	\N	task
72	take out linen	\N	f	0	0	Tea	Other	\N	task
73	main plate	-	f	0	10	Tea	Other	\N	item
74	side plates	\N	f	0	0	Tea	Other	\N	item
75	saucers	-	f	0	0	Tea	Crockery	\N	item
76	wipe bar	\N	f	0	0	Lunch	Other	\N	task
77	take out linen	\N	f	0	0	Lunch	Other	\N	task
78	main plate	-	f	0	10	Lunch	Other	\N	item
79	side plates	\N	f	0	0	Lunch	Other	\N	item
80	saucers	-	f	0	0	Lunch	Crockery	\N	item
81	wipe bar	\N	f	0	0	Tea	Other	\N	task
82	take out linen	\N	f	0	0	Tea	Other	\N	task
83	main plate	-	f	0	10	Tea	Other	\N	item
84	side plates	\N	f	0	0	Tea	Other	\N	item
85	saucers	-	f	0	0	Tea	Crockery	\N	item
86	wipe bar	\N	f	0	0	Lunch	Other	\N	task
87	take out linen	\N	f	0	0	Lunch	Other	\N	task
88	main plate	-	f	0	10	Lunch	Other	\N	item
89	side plates	\N	f	0	0	Lunch	Other	\N	item
90	saucers	-	f	0	0	Lunch	Crockery	\N	item
91	wipe bar	\N	f	0	0	Tea	Other	\N	task
92	take out linen	\N	f	0	0	Tea	Other	\N	task
93	main plate	-	f	0	10	Tea	Other	\N	item
94	side plates	\N	f	0	0	Tea	Other	\N	item
95	saucers	-	f	0	0	Tea	Crockery	\N	item
96	wipe bar	\N	f	0	0	Lunch	Other	\N	task
97	take out linen	\N	f	0	0	Lunch	Other	\N	task
98	main plate	-	f	0	10	Lunch	Other	\N	item
99	side plates	\N	f	0	0	Lunch	Other	\N	item
100	saucers	-	f	0	0	Lunch	Crockery	\N	item
101	wipe bar	\N	f	0	0	Tea	Other	\N	task
102	take out linen	\N	f	0	0	Tea	Other	\N	task
103	main plate	-	f	0	10	Tea	Other	\N	item
104	side plates	\N	f	0	0	Tea	Other	\N	item
105	saucers	-	f	0	0	Tea	Crockery	\N	item
106	wipe bar	\N	f	0	0	Lunch	Other	\N	task
107	take out linen	\N	f	0	0	Lunch	Other	\N	task
108	main plate	-	f	0	10	Lunch	Other	\N	item
109	side plates	\N	f	0	0	Lunch	Other	\N	item
110	saucers	-	f	0	0	Lunch	Crockery	\N	item
111	wipe bar	\N	f	0	0	Tea	Other	\N	task
112	take out linen	\N	f	0	0	Tea	Other	\N	task
113	main plate	-	f	0	10	Tea	Other	\N	item
114	side plates	\N	f	0	0	Tea	Other	\N	item
115	saucers	-	f	0	0	Tea	Crockery	\N	item
116	wipe bar	\N	f	0	0	Lunch	Other	\N	task
117	take out linen	\N	f	0	0	Lunch	Other	\N	task
118	main plate	-	f	0	10	Lunch	Other	\N	item
119	side plates	\N	f	0	0	Lunch	Other	\N	item
120	saucers	-	f	0	0	Lunch	Crockery	\N	item
121	wipe bar	\N	f	0	0	Tea	Other	\N	task
122	take out linen	\N	f	0	0	Tea	Other	\N	task
123	main plate	-	f	0	10	Tea	Other	\N	item
124	side plates	\N	f	0	0	Tea	Other	\N	item
125	saucers	-	f	0	0	Tea	Crockery	\N	item
\.


--
-- Data for Name: Shifts_shift; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Shifts_shift" (id, name, description, date, start_time, end_time, created_by_id, department_id, used_as_template, boarding, dropoff, leaving_pier) FROM stdin;
31	new	shift	2022-05-07	10:32:55.494939	10:32:55.494939	1	\N	t	23:07:01	23:07:03	23:07:00
33	new	shift	2022-05-07	10:34:12.449108	10:34:12.449108	1	\N	t	23:07:01	23:07:03	23:07:00
34	new	shift	2022-05-07	10:37:02.340961	10:37:02.340961	1	\N	t	23:07:01	23:07:03	23:07:00
35	new	shift	2022-05-07	12:37:47.370403	12:37:47.370403	1	\N	t	23:07:01	23:07:03	23:07:00
36	new	shift	2022-05-07	20:09:56.405926	20:09:56.406924	1	\N	t	23:07:01	23:07:03	23:07:00
39	getting time	a	2022-05-10	21:43:22.175564	21:43:22.175564	1	1	f	20:42:54	20:42:55	20:42:52
38	new	shift	2022-05-07	20:20:23.564517	20:20:23.564517	1	\N	f	23:07:01	23:07:03	23:07:00
37	new	shift	2022-05-07	20:19:05.138918	20:19:05.138918	1	\N	f	23:07:01	23:07:03	23:07:00
28	new	shift	2022-05-07	00:07:18.546406	00:07:18.546406	1	\N	f	23:07:01	23:07:03	23:07:00
29	name	name	\N	00:08:06.165567	00:08:06.165567	1	\N	f	\N	\N	\N
30	new	shift	2022-05-07	10:30:20.850221	10:30:20.850221	1	\N	f	23:07:01	23:07:03	23:07:00
32	new	shift	2022-05-07	10:33:44.41561	10:33:44.41561	1	\N	f	23:07:01	23:07:03	23:07:00
\.


--
-- Data for Name: Shifts_shift_checklist_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Shifts_shift_checklist_items" (id, shift_id, checklistitem_id) FROM stdin;
55	30	56
56	30	57
57	30	58
58	30	59
59	30	60
60	30	61
61	30	62
62	30	63
63	30	64
64	30	65
65	31	66
66	31	67
67	31	68
68	31	69
69	31	70
70	31	71
71	31	72
72	31	73
73	31	74
74	31	75
75	32	76
76	32	77
77	32	78
78	32	79
79	32	80
80	32	81
81	32	82
82	32	83
83	32	84
84	32	85
85	33	86
86	33	87
87	33	88
88	33	89
89	33	90
90	33	91
91	33	92
92	33	93
93	33	94
94	33	95
95	34	96
96	34	97
97	34	98
98	34	99
99	34	100
100	34	101
101	34	102
102	34	103
103	34	104
104	34	105
105	35	106
106	35	107
107	35	108
108	35	109
109	35	110
110	35	111
111	35	112
112	35	113
113	35	114
114	35	115
115	36	116
116	36	117
117	36	118
118	36	119
119	36	120
120	36	121
121	36	122
122	36	123
123	36	124
124	36	125
\.


--
-- Data for Name: Shifts_shift_checklists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Shifts_shift_checklists" (id, shift_id, checklist_id) FROM stdin;
26	28	2
27	28	3
28	29	2
29	30	2
30	30	3
31	31	2
32	31	3
33	32	2
34	32	3
35	33	2
36	33	3
37	34	2
38	34	3
39	35	2
40	35	3
41	36	2
42	36	3
\.


--
-- Data for Name: Tasks_task; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Tasks_task" (id, name, comment, created_at, edited_at, created_by_id, section_name, edited_by_id, extra_from_checklist_amount, image) FROM stdin;
1	wipe bar	\N	2022-05-07 16:33:35.628767+01	2022-05-07 16:33:35.628767+01	1	Other	\N	0	\N
2	take out linen	something	2022-05-07 17:48:58.40254+01	2022-05-12 00:21:30.34545+01	1	Other	\N	0	\N
\.


--
-- Data for Name: Users_customuser; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users_customuser" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, "DOB", role, postcode) FROM stdin;
1	pbkdf2_sha256$320000$lWm55KZu4Pm5qpysoitVIn$6ErhIhlz0IXHD7DEKd2bQfN5WJsqTOV29Do4WXw1jvo=	2022-05-07 16:29:28.836028+01	t	admin			admin@mail.com	t	t	2022-05-07 16:23:08.12734+01	2022-05-07	Regular Staff	\N
6	pbkdf2_sha256$320000$16ZMTS7gDJLy5b2swYJn7F$nQRdzJqIUyiAvlVvWGFliknByqvFgSE5C3HqIUrUwY4=	\N	f	try.navigate1	try	navigate1	f1@mail.com	f	t	2022-05-11 02:50:16+01	2022-04-03	Supervisor	\N
5	pbkdf2_sha256$320000$UiW18etnrpFW2b4Pd3sYz2$E1Tro/DSqhA2sV45lsjWD94AA2Xa/p73fhir1qLmZPQ=	\N	f	try.register	try	register	try@mail.com	f	t	2022-05-11 02:46:46+01	2022-04-03	Supervisor	\N
4	pbkdf2_sha256$320000$sT5ts3t1g4mZc8wIed58UD$UJoFh5LO9cvGfkE9rMfbEqaZEaU/sMKZUuQeeSOCT9M=	\N	f	online.testing	online	testing	ot@mail.com	f	t	2022-05-10 15:48:49+01	2023-01-04	Manager	\N
2	pbkdf2_sha256$320000$JqRlFddvLILgr0UckRWSZS$R0jlyYCfZza33zUNWCn1agzQUSvlWzgeglAKH2zxCPI=	\N	f	first.second	First	Second	email@mail.com	f	t	2022-05-10 13:25:18+01	2000-01-01	Director	\N
3	pbkdf2_sha256$320000$TzVkJb3Uitkuz5KNlgpvl2$mr+kypBy8Iq1gO7jqjbJz/G6yA1+0IYz/lzMD4bp1+M=	\N	f	firstn.lastn	firstn	lastn	f@mail.com	f	t	2022-05-10 13:39:43+01	2022-04-03	Regular Staff	\N
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
33	Can add post	9	add_post
34	Can change post	9	change_post
35	Can delete post	9	delete_post
36	Can view post	9	view_post
37	Can add shift	10	add_shift
38	Can change shift	10	change_shift
39	Can delete shift	10	delete_shift
40	Can view shift	10	view_shift
41	Can add checklist item	11	add_checklistitem
42	Can change checklist item	11	change_checklistitem
43	Can delete checklist item	11	delete_checklistitem
44	Can view checklist item	11	view_checklistitem
45	Can add checklist	12	add_checklist
46	Can change checklist	12	change_checklist
47	Can delete checklist	12	delete_checklist
48	Can view checklist	12	view_checklist
49	Can add inventory item	13	add_inventoryitem
50	Can change inventory item	13	change_inventoryitem
51	Can delete inventory item	13	delete_inventoryitem
52	Can view inventory item	13	view_inventoryitem
53	Can add task	14	add_task
54	Can change task	14	change_task
55	Can delete task	14	delete_task
56	Can view task	14	view_task
57	Can add user	15	add_customuser
58	Can change user	15	change_customuser
59	Can delete user	15	delete_customuser
60	Can view user	15	view_customuser
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-05-07 16:32:46.310981+01	2	main plate	1	[{"added": {}}]	13	1
2	2022-05-07 16:33:35.632755+01	1	wipe bar	1	[{"added": {}}]	14	1
3	2022-05-07 16:35:13.213142+01	2	Lunch	1	[{"added": {}}]	12	1
4	2022-05-07 16:35:43.495561+01	3	Tea	1	[{"added": {}}]	12	1
5	2022-05-07 17:10:25.176635+01	1	test - testing	1	[{"added": {}}]	10	1
6	2022-05-07 17:18:54.045918+01	2	new shift - none	1	[{"added": {}}]	10	1
7	2022-05-07 17:21:37.546712+01	3	new - checklist	1	[{"added": {}}]	10	1
8	2022-05-07 17:25:25.164721+01	3	new - checklist	3		10	1
9	2022-05-07 17:25:40.215807+01	4	new - shift	1	[{"added": {}}]	10	1
10	2022-05-07 17:26:31.554455+01	4	new - shift	3		10	1
11	2022-05-07 17:26:58.359123+01	5	new - shift	1	[{"added": {}}]	10	1
12	2022-05-07 17:28:40.163273+01	5	new - shift	3		10	1
13	2022-05-07 17:28:54.841343+01	6	new - shift	1	[{"added": {}}]	10	1
14	2022-05-07 17:33:37.986979+01	6	new - shift	3		10	1
15	2022-05-07 17:33:53.104799+01	7	new - checklist	1	[{"added": {}}]	10	1
16	2022-05-07 17:42:32.09613+01	7	new - checklist	3		10	1
17	2022-05-07 17:42:50.730568+01	8	new - shift	1	[{"added": {}}]	10	1
18	2022-05-07 17:48:58.411119+01	2	take out linen	1	[{"added": {}}]	14	1
19	2022-05-07 17:49:22.350713+01	3	side plate	1	[{"added": {}}]	13	1
20	2022-05-07 17:49:37.172375+01	2	Lunch	2	[{"changed": {"fields": ["Inventory items", "Tasks"]}}]	12	1
21	2022-05-07 17:55:20.249655+01	8	new - shift	3		10	1
22	2022-05-07 17:55:35.314517+01	9	new - shift	1	[{"added": {}}]	10	1
23	2022-05-07 19:21:16.827194+01	9	new - shift	3		10	1
24	2022-05-07 21:00:13.042162+01	26	new - shift	3		10	1
25	2022-05-07 21:00:16.348947+01	25	new - shift	3		10	1
26	2022-05-07 21:00:20.325468+01	24	new - shift	3		10	1
27	2022-05-07 21:00:48.605728+01	23	new - shift	3		10	1
28	2022-05-07 21:00:51.613264+01	22	new - shift	3		10	1
29	2022-05-07 21:00:55.318405+01	21	new - shift	3		10	1
30	2022-05-07 21:01:03.908723+01	20	new - shift	3		10	1
31	2022-05-07 21:01:08.279363+01	19	new - shift	3		10	1
32	2022-05-07 21:01:12.588278+01	18	new - shift	3		10	1
33	2022-05-07 21:01:17.166239+01	17	new - shift	3		10	1
34	2022-05-07 21:01:20.973069+01	16	new - shift	3		10	1
35	2022-05-07 21:01:24.589668+01	15	new - shift	3		10	1
36	2022-05-07 21:01:31.06387+01	14	new - shift	3		10	1
37	2022-05-07 21:01:35.469722+01	13	new - shift	3		10	1
38	2022-05-07 21:01:40.005281+01	12	new - shift	3		10	1
39	2022-05-07 21:01:43.875604+01	11	new - shift	3		10	1
40	2022-05-07 23:37:00.712163+01	10	new - shift	3		10	1
41	2022-05-07 23:37:06.75119+01	2	new shift - none	3		10	1
42	2022-05-07 23:37:23.863828+01	3	side plates	2	[{"changed": {"fields": ["Name"]}}]	13	1
43	2022-05-07 23:37:32.185049+01	2	main plate	2	[]	13	1
44	2022-05-07 23:39:29.465289+01	4	saucers	1	[{"added": {}}]	13	1
45	2022-05-07 23:39:49.511545+01	1	test - testing	3		10	1
46	2022-05-08 00:05:21.712499+01	27	new - shift	2	[{"changed": {"fields": ["Checklists"]}}]	10	1
47	2022-05-08 00:06:06.793134+01	2	Lunch	2	[{"changed": {"fields": ["Inventory items"]}}]	12	1
48	2022-05-08 00:06:16.769129+01	3	Tea	2	[{"changed": {"fields": ["Inventory items", "Tasks"]}}]	12	1
49	2022-05-08 00:06:49.067529+01	27	new - shift	3		10	1
50	2022-05-08 00:07:18.557377+01	28	new - shift	1	[{"added": {}}]	10	1
51	2022-05-08 00:08:06.175542+01	29	name - name	1	[{"added": {}}]	10	1
52	2022-05-10 20:21:56.426371+01	1	FB	1	[{"added": {}}]	8	1
53	2022-05-10 20:22:19.321318+01	2	SightSeeing	1	[{"added": {}}]	8	1
54	2022-05-10 21:43:22.198115+01	39	getting time - a	1	[{"added": {}}]	10	1
55	2022-05-11 15:59:24.880197+01	1	FB	2	[{"changed": {"fields": ["Workers"]}}]	8	1
56	2022-05-11 15:59:32.776042+01	2	SightSeeing	2	[{"changed": {"fields": ["Workers"]}}]	8	1
57	2022-05-11 15:59:47.148591+01	1	Food and Bevarage	2	[{"changed": {"fields": ["Name"]}}]	8	1
58	2022-05-11 15:59:54.54397+01	2	Sight Seeing	2	[{"changed": {"fields": ["Name"]}}]	8	1
59	2022-05-11 16:51:12.33135+01	2	first.second	2	[{"changed": {"fields": ["Role"]}}]	15	1
60	2022-05-11 16:51:21.007025+01	3	firstn.lastn	2	[{"changed": {"fields": ["Role"]}}]	15	1
61	2022-05-11 16:51:30.280811+01	4	online.testing	2	[{"changed": {"fields": ["Role"]}}]	15	1
62	2022-05-11 16:52:25.912146+01	1	Food and Bevarage	2	[{"changed": {"fields": ["Workers"]}}]	8	1
63	2022-05-11 17:21:36.810877+01	2	first.second	2	[{"changed": {"fields": ["Role"]}}]	15	1
64	2022-05-11 17:21:45.482718+01	2	first.second	2	[]	15	1
65	2022-05-11 17:22:15.863798+01	4	online.testing	2	[{"changed": {"fields": ["Role"]}}]	15	1
66	2022-05-11 17:22:24.8527+01	4	online.testing	2	[{"changed": {"fields": ["Role"]}}]	15	1
67	2022-05-11 17:22:33.992492+01	5	try.register	2	[{"changed": {"fields": ["Role"]}}]	15	1
68	2022-05-11 17:22:42.572901+01	6	try.navigate1	2	[{"changed": {"fields": ["Role"]}}]	15	1
69	2022-05-11 17:24:00.857956+01	3	firstn.lastn	2	[{"changed": {"fields": ["Role"]}}]	15	1
70	2022-05-11 17:26:05.594069+01	2	first.second	2	[]	15	1
71	2022-05-11 17:26:19.227715+01	6	try.navigate1	2	[]	15	1
72	2022-05-11 17:26:27.215829+01	5	try.register	2	[]	15	1
73	2022-05-11 17:26:35.620026+01	4	online.testing	2	[]	15	1
74	2022-05-11 17:26:48.452895+01	3	firstn.lastn	2	[]	15	1
75	2022-05-11 17:26:56.23049+01	2	first.second	2	[{"changed": {"fields": ["Role"]}}]	15	1
76	2022-05-11 17:27:05.753581+01	1	Food and Bevarage	2	[{"changed": {"fields": ["Workers"]}}]	8	1
77	2022-05-11 17:27:23.37202+01	1	Food and Bevarage	2	[{"changed": {"fields": ["Workers"]}}]	8	1
78	2022-05-11 17:28:06.065605+01	3	firstn.lastn	2	[{"changed": {"fields": ["Role"]}}]	15	1
79	2022-05-11 17:28:16.448699+01	1	Food and Bevarage	2	[{"changed": {"fields": ["Workers"]}}]	8	1
80	2022-05-11 22:05:05.338572+01	39	getting time - a	2	[{"changed": {"fields": ["Used as template"]}}]	10	1
81	2022-05-11 22:06:06.818777+01	38	new - shift	2	[{"changed": {"fields": ["Used as template"]}}]	10	1
82	2022-05-11 22:06:14.150517+01	39	getting time - a	2	[{"changed": {"fields": ["Used as template"]}}]	10	1
83	2022-05-11 22:06:20.834258+01	38	new - shift	2	[]	10	1
84	2022-05-11 22:06:27.019091+01	37	new - shift	2	[{"changed": {"fields": ["Used as template"]}}]	10	1
85	2022-05-11 22:07:05.905251+01	28	new - shift	2	[{"changed": {"fields": ["Used as template"]}}]	10	1
86	2022-05-11 22:07:11.497891+01	29	name - name	2	[]	10	1
87	2022-05-11 22:07:16.810948+01	30	new - shift	2	[{"changed": {"fields": ["Used as template"]}}]	10	1
88	2022-05-11 22:07:22.353946+01	32	new - shift	2	[{"changed": {"fields": ["Used as template"]}}]	10	1
89	2022-05-12 00:17:01.143122+01	2	Lunch	2	[{"changed": {"fields": ["Tasks"]}}]	12	1
90	2022-05-12 00:17:35.495244+01	2	Lunch	2	[]	12	1
91	2022-05-12 00:17:45.654163+01	3	Tea	2	[{"changed": {"fields": ["Tasks"]}}]	12	1
92	2022-05-12 00:21:30.34645+01	2	take out linen	2	[{"changed": {"fields": ["Comment"]}}]	14	1
93	2022-05-12 01:53:02.137941+01	1	online.testing-First Post	1	[{"added": {}}]	9	1
94	2022-05-12 02:14:28.512715+01	2	Lunch	2	[{"changed": {"fields": ["Department"]}}]	12	1
95	2022-05-12 19:23:09.948984+01	7	online.testing-First Post	3		9	1
96	2022-05-12 19:23:16.667898+01	6	online.testing-First Post	3		9	1
97	2022-05-12 19:23:20.586725+01	5	online.testing-First Post	3		9	1
98	2022-05-12 19:23:24.428082+01	4	online.testing-First Post	3		9	1
99	2022-05-12 19:23:29.629584+01	3	None-First Post	3		9	1
100	2022-05-12 19:23:40.912066+01	2	None-First Post	3		9	1
101	2022-05-12 20:17:40.23536+01	11	online.testing-First Post	2	[{"changed": {"fields": ["Department"]}}]	9	1
102	2022-05-12 21:18:06.638026+01	11	online.testing-First Post	3		9	1
103	2022-05-12 21:18:10.663679+01	16	online.testing-First Post	3		9	1
104	2022-05-12 21:18:14.200282+01	15	online.testing-First Post	3		9	1
105	2022-05-12 21:18:18.337019+01	14	online.testing-First Post	3		9	1
106	2022-05-12 21:18:22.375699+01	13	online.testing-First Post	3		9	1
107	2022-05-12 21:18:26.087889+01	12	online.testing-First Post	3		9	1
108	2022-05-12 21:18:30.340152+01	10	online.testing-First Post	3		9	1
109	2022-05-12 21:18:34.259343+01	9	online.testing-First Post	3		9	1
110	2022-05-12 21:18:40.30055+01	8	online.testing-First Post	3		9	1
111	2022-05-13 18:59:03.158348+01	12	None	3		13	1
112	2022-05-13 18:59:03.168322+01	11	new	3		13	1
113	2022-05-13 18:59:03.169319+01	10	new	3		13	1
114	2022-05-13 18:59:03.169319+01	9	None	3		13	1
115	2022-05-13 20:44:05.487025+01	22	None	3		13	1
116	2022-05-13 20:44:05.491554+01	21	None	3		13	1
117	2022-05-13 20:44:05.492545+01	20	None	3		13	1
118	2022-05-13 20:44:05.494015+01	19	None	3		13	1
119	2022-05-13 20:44:05.494015+01	18	None	3		13	1
120	2022-05-13 20:44:05.495014+01	17	None	3		13	1
121	2022-05-13 20:44:05.495014+01	16	None	3		13	1
122	2022-05-13 20:44:05.496398+01	15	None	3		13	1
123	2022-05-13 20:44:05.496869+01	14	None	3		13	1
124	2022-05-13 20:44:05.497333+01	13	None	3		13	1
125	2022-05-13 20:44:05.499028+01	8	new	3		13	1
126	2022-05-13 20:44:05.499958+01	7	None	3		13	1
127	2022-05-13 20:44:05.500961+01	6	None	3		13	1
128	2022-05-13 20:44:05.502405+01	5	test	3		13	1
129	2022-05-13 20:45:08.987556+01	11	None	3		14	1
130	2022-05-13 20:45:08.988175+01	10	None	3		14	1
131	2022-05-13 20:45:08.98891+01	9	None	3		14	1
132	2022-05-13 20:45:08.989915+01	8	None	3		14	1
133	2022-05-13 20:45:08.990911+01	7	None	3		14	1
134	2022-05-13 20:45:08.991909+01	6	None	3		14	1
135	2022-05-13 20:45:08.991909+01	5	new	3		14	1
136	2022-05-13 20:45:08.992906+01	4	None	3		14	1
137	2022-05-13 20:45:08.992906+01	3	None	3		14	1
138	2022-05-13 22:56:06.018372+01	3	Piers	1	[{"added": {}}]	8	1
139	2022-05-13 22:58:38.038989+01	3	Piers	2	[{"changed": {"fields": ["Image"]}}]	8	1
140	2022-05-13 23:01:21.083544+01	1	Food and Bevarage	2	[{"changed": {"fields": ["Description", "Image"]}}]	8	1
141	2022-05-13 23:03:46.301486+01	2	Sight Seeing	2	[{"changed": {"fields": ["Image"]}}]	8	1
142	2022-05-14 00:03:45.653292+01	3	side plates	2	[{"changed": {"fields": ["Section name", "Image", "Comment", "Extra from checklist amount"]}}]	13	1
143	2022-05-14 03:26:16.118662+01	23	None	3		13	1
144	2022-05-14 10:05:03.351782+01	7	horror	3		12	1
145	2022-05-14 10:05:03.357769+01	6	new	3		12	1
146	2022-05-14 10:05:03.35976+01	5	Tea	3		12	1
147	2022-05-14 10:05:03.360757+01	4	somerandomchecklist	3		12	1
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
9	Posts	post
10	Shifts	shift
11	Shifts	checklistitem
12	Checklists	checklist
13	InventoryItems	inventoryitem
14	Tasks	task
15	Users	customuser
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-05-07 16:19:27.797969+01
2	contenttypes	0002_remove_content_type_name	2022-05-07 16:19:27.818887+01
3	auth	0001_initial	2022-05-07 16:19:27.896679+01
4	auth	0002_alter_permission_name_max_length	2022-05-07 16:19:27.901664+01
5	auth	0003_alter_user_email_max_length	2022-05-07 16:19:27.90765+01
6	auth	0004_alter_user_username_opts	2022-05-07 16:19:27.915628+01
7	auth	0005_alter_user_last_login_null	2022-05-07 16:19:27.922609+01
8	auth	0006_require_contenttypes_0002	2022-05-07 16:19:27.926599+01
9	auth	0007_alter_validators_add_error_messages	2022-05-07 16:19:27.936574+01
10	auth	0008_alter_user_username_max_length	2022-05-07 16:19:27.942556+01
11	auth	0009_alter_user_last_name_max_length	2022-05-07 16:19:27.95253+01
12	auth	0010_alter_group_name_max_length	2022-05-07 16:19:27.964496+01
13	auth	0011_update_proxy_permissions	2022-05-07 16:19:27.974472+01
14	auth	0012_alter_user_first_name_max_length	2022-05-07 16:19:27.985443+01
15	Users	0001_initial	2022-05-07 16:19:28.055255+01
16	Tasks	0001_initial	2022-05-07 16:19:28.071216+01
17	Tasks	0002_rename_task_name_task_task_name	2022-05-07 16:19:28.07919+01
18	Tasks	0003_alter_task_created_at	2022-05-07 16:19:28.084178+01
19	Tasks	0004_task_completed_by_task_completed_status_task_order	2022-05-07 16:19:28.116091+01
20	Tasks	0005_alter_task_completed_by	2022-05-07 16:19:28.128065+01
21	Tasks	0006_task_assigned_to_checklist	2022-05-07 16:19:28.143021+01
22	Tasks	0007_remove_task_completed_by_task_created_by	2022-05-07 16:19:28.201374+01
23	Tasks	0008_rename_comments_task_comment_and_more	2022-05-07 16:19:28.228302+01
24	InventoryItems	0001_initial	2022-05-07 16:19:28.239271+01
25	InventoryItems	0002_inventoryitem_order	2022-05-07 16:19:28.250245+01
26	InventoryItems	0003_inventoryitem_assigned_to_checklist_and_more	2022-05-07 16:19:28.272184+01
27	InventoryItems	0004_remove_inventoryitem_completed_by_and_more	2022-05-07 16:19:28.301106+01
28	InventoryItems	0005_rename_item_name_inventoryitem_name_and_more	2022-05-07 16:19:28.343993+01
29	Checklists	0001_initial	2022-05-07 16:19:28.374909+01
30	Checklists	0002_alter_checklist_amount	2022-05-07 16:19:28.379817+01
31	Checklists	0003_rename_extrafromchecklistamount_inventoryitem_extra_from_checklist_amount_and_more	2022-05-07 16:19:28.385794+01
32	Checklists	0004_delete_inventoryitem_delete_subsection_delete_task_and_more	2022-05-07 16:19:28.483533+01
33	Departments	0001_initial	2022-05-07 16:19:28.539384+01
34	Posts	0001_initial	2022-05-07 16:19:28.574292+01
35	Shifts	0001_initial	2022-05-07 16:19:28.635127+01
36	Users	0002_alter_customuser_dob	2022-05-07 16:19:28.649091+01
37	Users	0003_customuser_role	2022-05-07 16:19:28.66405+01
38	Users	0004_customuser_postcode	2022-05-07 16:19:28.681006+01
39	Users	0005_alter_customuser_dob_alter_customuser_postcode	2022-05-07 16:19:28.720901+01
40	Users	0006_alter_customuser_dob	2022-05-07 16:19:28.817639+01
41	admin	0001_initial	2022-05-07 16:19:28.867506+01
42	admin	0002_logentry_remove_auto_add	2022-05-07 16:19:28.895434+01
43	admin	0003_logentry_add_action_flag_choices	2022-05-07 16:19:28.924356+01
44	authtoken	0001_initial	2022-05-07 16:19:29.01312+01
45	authtoken	0002_auto_20160226_1747	2022-05-07 16:19:29.123824+01
46	authtoken	0003_tokenproxy	2022-05-07 16:19:29.131799+01
47	sessions	0001_initial	2022-05-07 16:19:29.15374+01
48	InventoryItems	0006_alter_inventoryitem_comment	2022-05-07 16:33:15.250236+01
49	Tasks	0009_alter_task_comment	2022-05-07 16:33:15.274155+01
50	Checklists	0002_alter_checklist_description	2022-05-07 16:35:06.995634+01
51	Checklists	0003_remove_checklist_amount	2022-05-07 17:06:02.483868+01
52	Shifts	0002_checklistitem_checklist_name_and_more	2022-05-07 17:06:02.611524+01
53	Shifts	0003_remove_shift_checklists_shift_checklists	2022-05-07 17:06:52.175383+01
54	Shifts	0004_alter_shift_checklist	2022-05-07 17:08:50.087881+01
55	Shifts	0005_alter_shift_checklist_alter_shift_checklists	2022-05-07 17:10:21.276122+01
56	InventoryItems	0007_inventoryitem_section_name	2022-05-07 21:42:14.76153+01
57	Shifts	0006_alter_checklistitem_completed_by_and_more	2022-05-07 21:42:14.840324+01
58	Shifts	0007_checklistitem_assigned_to_alter_checklistitem_count	2022-05-07 21:42:14.895193+01
59	Tasks	0010_task_section_name	2022-05-07 21:42:14.926103+01
60	InventoryItems	0008_inventoryitem_edited_by_and_more	2022-05-07 23:35:59.742898+01
61	Shifts	0008_rename_count_checklistitem_extra_from_checklist_amount_and_more	2022-05-07 23:35:59.804734+01
62	Tasks	0011_task_edited_by_task_extra_from_checklist_amount	2022-05-07 23:35:59.852605+01
63	Shifts	0009_remove_checklistitem_completed_by_shift_boarding_and_more	2022-05-08 00:03:48.399148+01
64	Users	0007_alter_customuser_dob	2022-05-08 00:03:48.427072+01
65	Shifts	0010_rename_checklist_shift_checklist_items	2022-05-08 10:26:24.40696+01
66	Shifts	0011_alter_shift_checklist_items_alter_shift_checklists	2022-05-09 20:15:16.484013+01
67	Users	0008_alter_customuser_dob	2022-05-09 20:15:16.519931+01
68	Users	0009_alter_customuser_dob_alter_customuser_role	2022-05-11 17:21:15.946052+01
69	InventoryItems	0009_inventoryitem_image	2022-05-12 01:43:18.038051+01
70	Posts	0002_post_department_alter_post_createdby	2022-05-12 01:43:18.129804+01
71	Tasks	0012_task_image	2022-05-12 01:43:18.146759+01
72	Users	0010_alter_customuser_dob	2022-05-12 01:43:18.163721+01
73	Checklists	0004_checklist_department	2022-05-12 02:11:51.315452+01
74	Posts	0003_alter_post_department	2022-05-12 02:11:51.336397+01
75	Posts	0004_alter_post_createdby	2022-05-12 02:37:43.139788+01
76	Posts	0005_post_departmentid	2022-05-12 21:13:35.055477+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ibsf2qrgq4c72i0nc5034oze584ql3a4	.eJxVjEsOwjAMBe-SNYr6S-OwZN8zVHZs0wJKpKZdIe5OK3UB2zcz721G3NZp3Ios48zmampz-d0I41PSAfiB6Z5tzGldZrKHYk9a7JBZXrfT_TuYsEx7TSrQgoemdt5BG8EBIksIkUBVUTv1oXFak-dY9dpVPWGjxCgcdmg-X_vYOUg:1nnMHI:f_Vxb5L9CYnk7xwvYjpNDvIjvpydf03bEiykB_Ta7DI	2022-05-21 16:23:28.283675+01
1028p0pisboyqs6jgmqjrrs9b73sqvg2	.eJxVjEsOwjAMBe-SNYr6S-OwZN8zVHZs0wJKpKZdIe5OK3UB2zcz721G3NZp3Ios48zmampz-d0I41PSAfiB6Z5tzGldZrKHYk9a7JBZXrfT_TuYsEx7TSrQgoemdt5BG8EBIksIkUBVUTv1oXFak-dY9dpVPWGjxCgcdmg-X_vYOUg:1nnMN6:ncUlzrGdWUdeEFmBUNbT1qCVgHMCbOPEkqM6X-E5qNo	2022-05-21 16:29:28.837025+01
\.


--
-- Name: Checklists_checklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Checklists_checklist_id_seq"', 7, true);


--
-- Name: Checklists_checklist_inventory_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Checklists_checklist_inventory_items_id_seq"', 13, true);


--
-- Name: Checklists_checklist_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Checklists_checklist_tasks_id_seq"', 8, true);


--
-- Name: Departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Departments_department_id_seq"', 3, true);


--
-- Name: Departments_department_workers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Departments_department_workers_id_seq"', 16, true);


--
-- Name: InventoryItems_inventoryitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."InventoryItems_inventoryitem_id_seq"', 23, true);


--
-- Name: Posts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Posts_post_id_seq"', 17, true);


--
-- Name: Shifts_checklistitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Shifts_checklistitem_id_seq"', 125, true);


--
-- Name: Shifts_shift_checklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Shifts_shift_checklist_id_seq"', 124, true);


--
-- Name: Shifts_shift_checklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Shifts_shift_checklists_id_seq"', 42, true);


--
-- Name: Shifts_shift_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Shifts_shift_id_seq"', 39, true);


--
-- Name: Tasks_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Tasks_task_id_seq"', 11, true);


--
-- Name: Users_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Users_customuser_groups_id_seq"', 1, false);


--
-- Name: Users_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Users_customuser_id_seq"', 6, true);


--
-- Name: Users_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Users_customuser_user_permissions_id_seq"', 1, false);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 147, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 76, true);


--
-- Name: Checklists_checklist_inventory_items Checklists_checklist_inv_checklist_id_inventoryit_89df53cb_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_inventory_items"
    ADD CONSTRAINT "Checklists_checklist_inv_checklist_id_inventoryit_89df53cb_uniq" UNIQUE (checklist_id, inventoryitem_id);


--
-- Name: Checklists_checklist_inventory_items Checklists_checklist_inventory_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_inventory_items"
    ADD CONSTRAINT "Checklists_checklist_inventory_items_pkey" PRIMARY KEY (id);


--
-- Name: Checklists_checklist Checklists_checklist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist"
    ADD CONSTRAINT "Checklists_checklist_pkey" PRIMARY KEY (id);


--
-- Name: Checklists_checklist_tasks Checklists_checklist_tasks_checklist_id_task_id_a30109c4_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_tasks"
    ADD CONSTRAINT "Checklists_checklist_tasks_checklist_id_task_id_a30109c4_uniq" UNIQUE (checklist_id, task_id);


--
-- Name: Checklists_checklist_tasks Checklists_checklist_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_tasks"
    ADD CONSTRAINT "Checklists_checklist_tasks_pkey" PRIMARY KEY (id);


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
-- Name: Departments_department_workers Departments_department_w_department_id_customuser_17e884cb_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departments_department_workers"
    ADD CONSTRAINT "Departments_department_w_department_id_customuser_17e884cb_uniq" UNIQUE (department_id, customuser_id);


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
-- Name: Shifts_checklistitem Shifts_checklistitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_checklistitem"
    ADD CONSTRAINT "Shifts_checklistitem_pkey" PRIMARY KEY (id);


--
-- Name: Shifts_shift_checklist_items Shifts_shift_checklist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift_checklist_items"
    ADD CONSTRAINT "Shifts_shift_checklist_pkey" PRIMARY KEY (id);


--
-- Name: Shifts_shift_checklist_items Shifts_shift_checklist_shift_id_checklistitem_id_5991135a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift_checklist_items"
    ADD CONSTRAINT "Shifts_shift_checklist_shift_id_checklistitem_id_5991135a_uniq" UNIQUE (shift_id, checklistitem_id);


--
-- Name: Shifts_shift_checklists Shifts_shift_checklists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift_checklists"
    ADD CONSTRAINT "Shifts_shift_checklists_pkey" PRIMARY KEY (id);


--
-- Name: Shifts_shift_checklists Shifts_shift_checklists_shift_id_checklist_id_9b4c325f_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift_checklists"
    ADD CONSTRAINT "Shifts_shift_checklists_shift_id_checklist_id_9b4c325f_uniq" UNIQUE (shift_id, checklist_id);


--
-- Name: Shifts_shift Shifts_shift_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift"
    ADD CONSTRAINT "Shifts_shift_pkey" PRIMARY KEY (id);


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
-- Name: Checklists_checklist_department_id_9d00b05a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Checklists_checklist_department_id_9d00b05a" ON public."Checklists_checklist" USING btree (department_id);


--
-- Name: Checklists_checklist_inventory_items_checklist_id_64964f5e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Checklists_checklist_inventory_items_checklist_id_64964f5e" ON public."Checklists_checklist_inventory_items" USING btree (checklist_id);


--
-- Name: Checklists_checklist_inventory_items_inventoryitem_id_cc99ac4a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Checklists_checklist_inventory_items_inventoryitem_id_cc99ac4a" ON public."Checklists_checklist_inventory_items" USING btree (inventoryitem_id);


--
-- Name: Checklists_checklist_tasks_checklist_id_60a30259; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Checklists_checklist_tasks_checklist_id_60a30259" ON public."Checklists_checklist_tasks" USING btree (checklist_id);


--
-- Name: Checklists_checklist_tasks_task_id_f53a8a31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Checklists_checklist_tasks_task_id_f53a8a31" ON public."Checklists_checklist_tasks" USING btree (task_id);


--
-- Name: Departments_department_name_7d30f8e8_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Departments_department_name_7d30f8e8_like" ON public."Departments_department" USING btree (name varchar_pattern_ops);


--
-- Name: Departments_department_workers_customuser_id_d690352a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Departments_department_workers_customuser_id_d690352a" ON public."Departments_department_workers" USING btree (customuser_id);


--
-- Name: Departments_department_workers_department_id_803d1a37; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Departments_department_workers_department_id_803d1a37" ON public."Departments_department_workers" USING btree (department_id);


--
-- Name: InventoryItems_inventoryitem_created_by_id_14fa7f7b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "InventoryItems_inventoryitem_created_by_id_14fa7f7b" ON public."InventoryItems_inventoryitem" USING btree (created_by_id);


--
-- Name: InventoryItems_inventoryitem_edited_by_id_5eb5151b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "InventoryItems_inventoryitem_edited_by_id_5eb5151b" ON public."InventoryItems_inventoryitem" USING btree (edited_by_id);


--
-- Name: Posts_post_createdBy_id_0c24779d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Posts_post_createdBy_id_0c24779d" ON public."Posts_post" USING btree ("createdBy_id");


--
-- Name: Posts_post_department_id_0a6f6f73; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Posts_post_department_id_0a6f6f73" ON public."Posts_post" USING btree (department_id);


--
-- Name: Shifts_shift_checklist_checklistitem_id_80d79c79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Shifts_shift_checklist_checklistitem_id_80d79c79" ON public."Shifts_shift_checklist_items" USING btree (checklistitem_id);


--
-- Name: Shifts_shift_checklist_shift_id_a1b2c08a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Shifts_shift_checklist_shift_id_a1b2c08a" ON public."Shifts_shift_checklist_items" USING btree (shift_id);


--
-- Name: Shifts_shift_checklists_checklist_id_f7e3782a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Shifts_shift_checklists_checklist_id_f7e3782a" ON public."Shifts_shift_checklists" USING btree (checklist_id);


--
-- Name: Shifts_shift_checklists_shift_id_15e69941; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Shifts_shift_checklists_shift_id_15e69941" ON public."Shifts_shift_checklists" USING btree (shift_id);


--
-- Name: Shifts_shift_created_by_id_5018bffc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Shifts_shift_created_by_id_5018bffc" ON public."Shifts_shift" USING btree (created_by_id);


--
-- Name: Shifts_shift_department_id_e84070c4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Shifts_shift_department_id_e84070c4" ON public."Shifts_shift" USING btree (department_id);


--
-- Name: Tasks_task_created_by_id_fb4bb3b4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Tasks_task_created_by_id_fb4bb3b4" ON public."Tasks_task" USING btree (created_by_id);


--
-- Name: Tasks_task_edited_by_id_a89bd46f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Tasks_task_edited_by_id_a89bd46f" ON public."Tasks_task" USING btree (edited_by_id);


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
-- Name: Checklists_checklist_tasks Checklists_checklist_checklist_id_60a30259_fk_Checklist; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_tasks"
    ADD CONSTRAINT "Checklists_checklist_checklist_id_60a30259_fk_Checklist" FOREIGN KEY (checklist_id) REFERENCES public."Checklists_checklist"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Checklists_checklist_inventory_items Checklists_checklist_checklist_id_64964f5e_fk_Checklist; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_inventory_items"
    ADD CONSTRAINT "Checklists_checklist_checklist_id_64964f5e_fk_Checklist" FOREIGN KEY (checklist_id) REFERENCES public."Checklists_checklist"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Checklists_checklist Checklists_checklist_department_id_9d00b05a_fk_Departmen; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist"
    ADD CONSTRAINT "Checklists_checklist_department_id_9d00b05a_fk_Departmen" FOREIGN KEY (department_id) REFERENCES public."Departments_department"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Checklists_checklist_inventory_items Checklists_checklist_inventoryitem_id_cc99ac4a_fk_Inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_inventory_items"
    ADD CONSTRAINT "Checklists_checklist_inventoryitem_id_cc99ac4a_fk_Inventory" FOREIGN KEY (inventoryitem_id) REFERENCES public."InventoryItems_inventoryitem"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Checklists_checklist_tasks Checklists_checklist_tasks_task_id_f53a8a31_fk_Tasks_task_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Checklists_checklist_tasks"
    ADD CONSTRAINT "Checklists_checklist_tasks_task_id_f53a8a31_fk_Tasks_task_id" FOREIGN KEY (task_id) REFERENCES public."Tasks_task"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Departments_department_workers Departments_departme_customuser_id_d690352a_fk_Users_cus; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departments_department_workers"
    ADD CONSTRAINT "Departments_departme_customuser_id_d690352a_fk_Users_cus" FOREIGN KEY (customuser_id) REFERENCES public."Users_customuser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Departments_department_workers Departments_departme_department_id_803d1a37_fk_Departmen; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departments_department_workers"
    ADD CONSTRAINT "Departments_departme_department_id_803d1a37_fk_Departmen" FOREIGN KEY (department_id) REFERENCES public."Departments_department"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InventoryItems_inventoryitem InventoryItems_inven_created_by_id_14fa7f7b_fk_Users_cus; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."InventoryItems_inventoryitem"
    ADD CONSTRAINT "InventoryItems_inven_created_by_id_14fa7f7b_fk_Users_cus" FOREIGN KEY (created_by_id) REFERENCES public."Users_customuser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InventoryItems_inventoryitem InventoryItems_inven_edited_by_id_5eb5151b_fk_Users_cus; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."InventoryItems_inventoryitem"
    ADD CONSTRAINT "InventoryItems_inven_edited_by_id_5eb5151b_fk_Users_cus" FOREIGN KEY (edited_by_id) REFERENCES public."Users_customuser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Posts_post Posts_post_createdBy_id_0c24779d_fk_Users_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Posts_post"
    ADD CONSTRAINT "Posts_post_createdBy_id_0c24779d_fk_Users_customuser_id" FOREIGN KEY ("createdBy_id") REFERENCES public."Users_customuser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Posts_post Posts_post_department_id_0a6f6f73_fk_Departments_department_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Posts_post"
    ADD CONSTRAINT "Posts_post_department_id_0a6f6f73_fk_Departments_department_id" FOREIGN KEY (department_id) REFERENCES public."Departments_department"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Shifts_shift_checklists Shifts_shift_checkli_checklist_id_f7e3782a_fk_Checklist; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift_checklists"
    ADD CONSTRAINT "Shifts_shift_checkli_checklist_id_f7e3782a_fk_Checklist" FOREIGN KEY (checklist_id) REFERENCES public."Checklists_checklist"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Shifts_shift_checklist_items Shifts_shift_checkli_checklistitem_id_80d79c79_fk_Shifts_ch; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift_checklist_items"
    ADD CONSTRAINT "Shifts_shift_checkli_checklistitem_id_80d79c79_fk_Shifts_ch" FOREIGN KEY (checklistitem_id) REFERENCES public."Shifts_checklistitem"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Shifts_shift_checklist_items Shifts_shift_checklist_shift_id_a1b2c08a_fk_Shifts_shift_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift_checklist_items"
    ADD CONSTRAINT "Shifts_shift_checklist_shift_id_a1b2c08a_fk_Shifts_shift_id" FOREIGN KEY (shift_id) REFERENCES public."Shifts_shift"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Shifts_shift_checklists Shifts_shift_checklists_shift_id_15e69941_fk_Shifts_shift_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift_checklists"
    ADD CONSTRAINT "Shifts_shift_checklists_shift_id_15e69941_fk_Shifts_shift_id" FOREIGN KEY (shift_id) REFERENCES public."Shifts_shift"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Shifts_shift Shifts_shift_created_by_id_5018bffc_fk_Users_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift"
    ADD CONSTRAINT "Shifts_shift_created_by_id_5018bffc_fk_Users_customuser_id" FOREIGN KEY (created_by_id) REFERENCES public."Users_customuser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Shifts_shift Shifts_shift_department_id_e84070c4_fk_Departmen; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shifts_shift"
    ADD CONSTRAINT "Shifts_shift_department_id_e84070c4_fk_Departmen" FOREIGN KEY (department_id) REFERENCES public."Departments_department"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Tasks_task Tasks_task_created_by_id_fb4bb3b4_fk_Users_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tasks_task"
    ADD CONSTRAINT "Tasks_task_created_by_id_fb4bb3b4_fk_Users_customuser_id" FOREIGN KEY (created_by_id) REFERENCES public."Users_customuser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Tasks_task Tasks_task_edited_by_id_a89bd46f_fk_Users_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tasks_task"
    ADD CONSTRAINT "Tasks_task_edited_by_id_a89bd46f_fk_Users_customuser_id" FOREIGN KEY (edited_by_id) REFERENCES public."Users_customuser"(id) DEFERRABLE INITIALLY DEFERRED;


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

