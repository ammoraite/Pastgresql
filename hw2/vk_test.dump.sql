--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: communities; Type: TABLE; Schema: public; Owner: pql_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO pql_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: pql_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO pql_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pql_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: pql_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO pql_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: pql_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO pql_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: pql_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO pql_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pql_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: pql_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO pql_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: pql_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO pql_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pql_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: pql_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO pql_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: pql_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO pql_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pql_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: pql_user
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photo OWNER TO pql_user;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: pql_user
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO pql_user;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pql_user
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: subscribes_on_community; Type: TABLE; Schema: public; Owner: pql_user
--

CREATE TABLE public.subscribes_on_community (
    subscripsi_community_id integer NOT NULL,
    subscriber_id integer NOT NULL,
    subscriptione_date timestamp without time zone NOT NULL,
    unsubscribe_date timestamp without time zone
);


ALTER TABLE public.subscribes_on_community OWNER TO pql_user;

--
-- Name: subscribes_on_user; Type: TABLE; Schema: public; Owner: pql_user
--

CREATE TABLE public.subscribes_on_user (
    subscripsi_user_id integer NOT NULL,
    subscriber_id integer NOT NULL,
    subscriptione_date timestamp without time zone NOT NULL,
    unsubscribe_date timestamp without time zone
);


ALTER TABLE public.subscribes_on_user OWNER TO pql_user;

--
-- Name: users; Type: TABLE; Schema: public; Owner: pql_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO pql_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: pql_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO pql_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pql_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: pql_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO pql_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: pql_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO pql_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pql_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: pql_user
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
1	Adipiscing Enim Corp.	61	2023-04-29 12:37:42
2	Porttitor Institute	33	2021-11-01 11:44:53
3	Elementum Dui LLP	78	2023-08-03 12:35:50
4	Id Mollis Foundation	84	2021-11-22 02:07:20
5	Ipsum Curabitur Consequat Incorporated	72	2022-06-16 13:30:37
6	Est Mollis Inc.	17	2022-01-25 00:28:43
7	Odio Nam LLC	49	2022-05-06 02:24:22
8	Enim Condimentum Company	31	2022-01-29 07:52:56
9	Et LLP	41	2022-01-31 04:58:49
10	Turpis In Ltd	93	2021-10-11 10:03:05
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: pql_user
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
7	69	2023-05-10 18:50:38
9	51	2021-10-23 02:16:57
9	2	2023-02-04 13:15:12
5	22	2021-09-16 20:48:24
8	79	2022-12-05 13:38:12
5	9	2022-02-17 16:17:09
6	69	2023-02-15 00:57:37
0	79	2023-07-16 18:17:46
6	76	2022-10-29 08:12:21
7	38	2023-04-07 02:51:09
5	67	2023-08-08 15:14:38
5	2	2023-06-23 18:42:43
2	85	2022-10-05 22:54:23
10	98	2022-12-25 05:45:30
5	84	2021-08-23 10:43:56
1	13	2022-06-07 10:54:46
6	53	2022-01-27 11:07:29
7	36	2022-09-16 19:18:35
4	62	2021-12-30 17:28:34
5	49	2023-01-14 19:31:14
8	39	2023-04-06 11:16:24
2	27	2023-07-14 11:45:52
2	15	2021-10-24 05:27:31
5	34	2021-11-30 15:38:22
9	90	2022-04-11 22:47:52
6	55	2022-06-03 00:32:52
5	13	2023-04-19 23:23:09
4	15	2023-08-17 17:19:30
1	35	2021-11-22 16:05:12
8	65	2023-05-01 10:05:41
6	80	2022-11-16 06:07:04
8	36	2023-04-22 03:30:25
2	19	2023-05-15 19:35:15
1	20	2022-08-27 17:51:03
2	35	2022-06-13 20:59:47
1	24	2021-11-11 22:14:12
3	92	2022-09-05 05:28:52
3	30	2022-08-29 06:37:23
1	95	2021-11-08 21:29:12
7	33	2023-06-06 16:42:53
5	92	2023-08-14 19:25:45
10	9	2023-02-21 11:16:19
1	12	2023-02-03 04:30:03
6	82	2022-08-13 01:18:04
4	54	2022-06-27 12:43:02
3	80	2022-05-16 05:53:53
0	0	2022-07-28 14:50:14
7	8	2021-10-06 11:57:17
2	65	2023-04-18 09:46:06
8	82	2022-01-09 01:30:18
6	54	2022-07-22 10:16:39
4	59	2023-02-07 23:02:31
0	55	2023-07-30 03:19:27
6	57	2023-05-02 21:39:04
6	8	2023-01-11 06:45:29
1	80	2023-07-18 04:41:19
4	76	2022-07-30 09:47:40
4	2	2022-12-09 00:17:20
9	97	2023-05-20 07:23:19
2	33	2022-07-25 10:58:06
8	64	2023-02-09 23:33:33
2	38	2022-06-10 18:50:36
5	40	2022-07-08 13:10:39
3	84	2022-11-18 07:48:54
10	96	2022-09-03 02:34:20
3	56	2022-02-12 23:43:42
2	53	2023-06-05 02:51:12
5	23	2021-11-13 14:42:44
3	52	2022-08-10 09:50:00
8	97	2022-05-18 03:12:47
9	80	2021-09-14 15:38:15
1	19	2022-09-10 15:05:38
0	23	2021-08-26 11:46:33
6	70	2022-10-25 05:34:37
3	48	2022-11-12 15:19:31
5	100	2023-07-30 01:51:34
8	72	2023-06-09 21:02:19
3	61	2023-02-09 15:13:45
3	83	2023-03-01 22:51:01
9	44	2023-01-25 14:20:43
7	23	2022-01-13 13:27:23
8	22	2023-02-18 05:45:15
1	11	2022-02-17 21:12:09
0	57	2022-09-17 14:46:24
2	89	2022-02-24 10:01:03
1	27	2022-01-13 22:23:56
9	46	2021-09-13 08:19:06
0	89	2023-06-07 00:47:00
7	4	2022-06-25 00:06:42
10	89	2021-09-08 19:02:45
9	45	2022-11-29 08:35:35
6	28	2022-04-25 13:06:26
4	38	2022-07-31 04:14:43
5	33	2023-06-10 11:14:51
0	99	2022-06-16 00:20:03
9	37	2022-11-16 07:25:28
8	9	2023-04-21 02:29:29
2	76	2023-04-02 04:08:36
0	10	2021-10-26 07:44:47
1	1	2023-03-30 18:56:37
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: pql_user
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	34	31	10	2022-07-24 11:40:42	2022-10-29 12:18:41
2	11	56	0	2023-01-29 12:17:59	2022-11-23 10:30:54
3	18	81	3	2023-07-01 12:10:45	2022-02-18 12:30:17
4	42	4	7	2022-10-09 09:23:42	2023-08-21 21:05:34
5	82	0	0	2022-07-31 19:47:37	2022-03-02 19:26:07
6	54	97	9	2021-11-05 15:20:22	2022-12-28 05:04:04
7	81	86	2	2022-03-26 23:17:52	2023-05-22 01:53:13
8	22	17	7	2023-03-01 20:34:09	2022-07-11 13:07:16
9	79	70	8	2023-02-19 00:06:06	2022-10-23 18:02:42
10	25	21	7	2023-08-10 22:21:40	2022-11-22 01:11:04
11	35	40	7	2023-02-14 03:09:26	2022-11-06 16:51:37
12	79	8	4	2022-08-30 18:04:08	2021-10-14 04:12:37
13	2	61	2	2022-02-06 21:31:24	2022-07-18 00:20:30
14	25	51	0	2021-09-01 03:44:01	2022-07-19 01:14:49
15	60	12	2	2021-12-26 18:36:35	2023-04-29 19:52:39
16	89	36	2	2023-05-26 07:24:16	2021-12-22 13:14:52
17	100	61	7	2022-06-08 05:19:01	2022-08-04 08:16:17
18	68	49	7	2023-02-04 21:07:54	2021-10-07 01:49:49
19	43	92	1	2022-04-13 18:54:40	2023-07-31 21:50:30
20	59	4	4	2022-02-11 22:06:05	2022-05-20 12:30:55
21	24	43	4	2023-03-19 11:20:08	2022-08-24 22:22:54
22	77	65	9	2023-02-20 12:13:15	2022-10-22 14:59:49
23	33	36	6	2023-05-12 00:42:18	2022-03-09 12:57:29
24	20	98	3	2022-01-26 14:08:53	2021-12-26 22:13:53
25	64	59	7	2021-09-25 22:38:05	2022-01-09 14:02:49
26	49	68	4	2023-03-16 01:41:56	2023-03-13 07:50:44
27	46	77	3	2021-12-22 03:49:51	2022-08-12 09:58:28
28	20	67	9	2022-03-23 18:47:11	2022-02-12 19:50:31
29	94	52	7	2022-08-07 06:34:18	2022-05-13 01:11:07
30	10	59	8	2022-12-12 16:41:30	2023-07-23 04:11:46
31	66	62	3	2021-10-04 22:10:24	2022-03-27 00:27:53
32	18	37	4	2022-07-30 13:26:13	2022-09-10 21:05:31
33	12	37	1	2023-04-14 17:44:10	2022-12-20 07:49:55
34	33	51	4	2022-10-01 16:23:42	2022-03-21 06:58:08
35	2	86	8	2021-11-12 13:59:25	2022-05-08 13:41:30
36	68	27	4	2023-01-05 05:00:04	2022-02-06 02:46:22
37	64	10	3	2023-08-20 17:15:48	2022-08-29 16:33:01
38	17	6	0	2023-08-16 02:04:24	2023-03-15 20:12:58
39	41	16	9	2022-01-08 14:38:11	2023-03-20 01:47:07
40	13	61	5	2022-04-24 09:31:23	2022-02-09 16:34:04
41	33	87	9	2023-07-15 14:53:18	2023-07-12 17:36:53
42	55	30	8	2023-03-16 19:46:30	2021-10-02 14:42:27
43	49	21	2	2022-09-07 16:35:07	2023-05-20 20:51:00
44	96	30	7	2023-01-27 08:54:06	2021-11-20 07:40:03
45	61	76	8	2022-03-17 19:24:03	2022-08-05 01:36:00
46	71	69	6	2022-07-14 08:13:25	2023-03-06 19:18:22
47	56	41	7	2021-09-22 14:15:15	2022-05-15 05:39:24
48	57	22	1	2022-01-16 08:56:23	2023-02-18 16:20:24
49	13	52	1	2023-07-01 22:35:52	2023-03-17 17:35:30
50	8	32	2	2022-01-19 19:06:54	2023-08-14 04:35:17
51	69	1	7	2022-10-29 18:52:16	2022-07-31 15:47:16
52	56	64	7	2022-04-14 03:58:52	2022-05-29 00:51:43
53	16	50	0	2022-11-23 23:02:54	2022-03-12 11:52:17
54	43	19	1	2021-10-09 16:22:05	2022-09-20 16:47:50
55	9	58	5	2022-12-05 21:10:36	2022-06-04 14:36:21
56	1	88	3	2023-02-03 03:05:43	2022-08-24 22:01:53
57	40	43	0	2022-07-14 20:00:57	2022-06-21 14:03:10
58	90	12	10	2023-01-01 23:18:17	2023-03-03 07:33:51
59	53	5	1	2022-12-10 03:47:40	2022-03-10 08:40:19
60	78	96	0	2021-12-23 17:28:56	2023-01-18 23:42:43
61	21	77	1	2022-10-27 06:41:05	2022-07-15 17:07:14
62	69	72	9	2022-05-01 05:05:31	2023-05-30 00:45:22
63	19	68	1	2022-03-22 14:56:22	2022-02-07 15:22:12
64	68	93	0	2023-05-01 02:59:12	2022-07-01 14:21:31
65	50	69	5	2022-08-01 22:46:24	2023-05-03 20:26:08
66	40	100	7	2022-01-26 05:21:49	2022-12-05 15:12:12
67	78	89	9	2023-01-28 19:48:14	2021-11-10 01:29:23
68	4	6	0	2021-12-18 18:57:24	2022-06-13 11:40:54
69	40	89	6	2023-06-11 17:56:56	2023-01-03 19:47:45
70	29	93	8	2021-08-29 17:41:49	2022-12-28 00:56:20
71	83	32	3	2022-09-25 12:32:05	2022-01-24 07:08:27
72	5	94	8	2022-07-18 19:01:22	2022-08-16 05:56:12
73	63	7	2	2023-03-03 06:19:31	2021-10-19 21:56:19
74	17	9	2	2022-09-04 17:32:37	2022-08-19 00:04:19
75	93	31	9	2021-12-15 13:53:31	2022-05-27 18:10:22
76	82	74	3	2023-02-02 17:37:44	2022-09-04 06:34:29
77	23	63	8	2022-04-16 12:09:07	2021-10-31 00:18:06
78	84	12	9	2022-10-01 20:45:50	2022-09-09 00:51:18
79	32	59	5	2023-06-19 02:22:31	2021-11-11 20:03:56
80	12	4	6	2022-01-20 20:54:58	2022-07-22 06:21:40
81	82	78	7	2023-03-01 12:18:26	2021-11-19 07:51:08
82	36	42	0	2022-04-07 04:42:33	2022-03-16 16:26:25
83	4	13	8	2022-09-20 09:08:54	2022-09-26 08:18:19
84	39	62	3	2022-01-13 03:18:36	2023-07-05 23:46:40
85	65	73	7	2023-03-05 22:43:49	2022-04-30 06:47:01
86	58	53	6	2023-01-10 03:23:12	2021-12-13 12:21:51
87	81	64	1	2023-05-07 06:57:04	2021-08-24 07:46:04
88	27	58	6	2023-04-19 03:16:54	2022-06-04 13:27:59
89	51	95	4	2022-01-29 02:44:12	2022-07-07 21:35:38
90	13	76	9	2022-11-15 20:08:00	2022-01-19 06:14:04
91	15	34	5	2022-09-29 03:42:38	2021-12-03 13:50:06
92	88	86	1	2021-09-23 22:50:22	2022-11-19 23:24:21
93	90	46	6	2023-01-19 23:49:44	2023-02-27 12:53:15
94	21	40	8	2023-03-03 08:34:28	2022-01-21 03:27:30
95	1	43	3	2022-12-27 21:57:48	2023-01-21 21:12:25
96	83	22	7	2022-04-18 00:58:37	2021-10-16 13:51:52
97	29	81	5	2023-06-24 09:30:38	2021-10-11 04:54:56
98	44	49	5	2023-07-01 17:27:33	2023-03-14 13:07:15
99	9	18	9	2023-06-27 20:42:30	2023-01-23 11:29:34
100	33	97	1	2022-10-16 15:43:30	2022-07-31 04:44:24
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: pql_user
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	Status-0
2	Status-1
3	Status-2
4	Status-3
5	Status-4
6	Status-5
7	Status-6
8	Status-7
9	Status-8
10	Status-9
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: pql_user
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	81	4	elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat.	t	t	2021-11-21 07:23:37
2	54	28	semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque	t	f	2022-07-29 23:12:56
3	42	62	orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus	t	t	2022-07-14 18:58:31
4	81	100	nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla	t	t	2022-08-10 01:14:58
5	59	88	lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue.	f	t	2022-03-11 17:52:56
6	51	86	eu dolor egestas rhoncus. Proin nisl sem, consequat	t	f	2021-11-26 12:11:38
7	10	32	blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus.	f	t	2021-08-29 18:36:06
8	14	3	dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies	t	t	2023-04-18 19:29:13
9	91	15	Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan	t	t	2023-03-31 11:29:21
10	35	10	in, cursus et, eros. Proin	t	t	2022-08-15 19:02:50
11	66	80	eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut,	f	f	2021-11-12 23:15:55
12	84	7	sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer	f	t	2022-11-09 06:20:38
13	53	9	ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc,	f	f	2022-09-04 07:11:47
14	8	67	dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae	t	f	2022-03-07 18:51:58
15	90	99	dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt	t	t	2022-12-12 02:22:20
16	47	6	Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices	t	t	2022-12-03 21:49:30
17	78	92	orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus	f	f	2022-01-16 20:45:45
18	86	47	In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu	t	f	2022-07-28 21:34:42
19	2	80	nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula.	f	t	2021-09-11 03:30:55
20	63	56	Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum	f	f	2021-12-13 15:03:49
21	85	84	cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc	f	t	2021-10-06 21:56:55
22	43	32	Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus	f	t	2022-04-12 23:28:26
23	16	51	at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus	f	f	2022-01-29 11:06:26
24	40	1	ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus,	f	t	2022-02-20 02:03:46
25	57	94	velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc	t	t	2022-08-22 20:12:49
26	53	26	fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget	f	f	2023-05-10 21:36:56
27	25	1	Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus	f	f	2022-02-20 22:22:17
28	35	45	pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum	f	f	2021-09-11 05:46:11
29	79	40	magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat	t	f	2023-08-13 23:28:06
30	52	66	amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id,	t	t	2023-05-25 07:29:11
31	45	12	Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit	f	f	2022-12-13 07:52:18
32	38	78	ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque,	f	t	2021-11-18 23:24:43
33	61	20	sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet,	t	t	2023-07-31 10:58:49
34	63	27	tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing	t	f	2023-02-09 20:51:03
35	33	67	ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod	t	f	2023-06-03 16:59:17
36	95	31	at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,	t	t	2023-08-04 02:36:22
37	55	89	Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam	f	t	2022-10-22 14:31:06
38	19	43	velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla.	t	f	2021-12-19 22:22:14
39	17	95	semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas.	t	t	2022-02-19 15:38:14
40	20	73	Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed	f	t	2021-08-26 18:40:39
41	42	12	nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget	t	t	2023-04-27 18:37:26
42	49	61	orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget	f	t	2022-12-14 11:19:23
43	85	48	luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim,	t	f	2022-11-06 20:59:09
44	68	61	lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem	f	f	2023-05-04 23:07:47
45	13	35	dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu	f	t	2023-04-04 09:11:56
46	71	32	Aliquam nec	f	t	2021-12-30 09:56:09
47	17	40	imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac	t	t	2022-05-23 11:44:34
48	20	40	cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec	f	f	2021-10-29 07:56:45
49	6	18	accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis	t	t	2021-12-02 23:10:15
50	23	72	congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem	f	f	2021-09-04 04:17:07
51	60	59	amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et	t	f	2023-05-18 20:08:47
52	55	84	Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales	f	t	2023-05-23 04:06:01
53	55	31	ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non	f	f	2023-05-11 17:15:48
54	6	22	ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada	f	t	2022-07-15 02:09:22
55	59	70	aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque.	f	t	2022-04-18 08:22:04
74	28	89	mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero.	t	f	2022-01-21 02:24:38
56	99	79	In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis	f	f	2022-05-10 23:29:36
57	2	3	dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique	t	t	2022-11-30 20:11:09
58	82	74	tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam	t	f	2023-04-20 08:42:34
59	7	60	id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in	f	t	2022-11-10 05:07:17
60	24	47	ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend	f	f	2023-02-21 22:43:29
61	72	12	iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem	f	t	2023-06-15 09:08:45
62	39	29	Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi	t	f	2022-01-20 11:28:28
63	57	53	quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium	t	f	2023-03-04 15:12:58
64	31	87	lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra	t	f	2022-03-14 17:07:32
65	80	50	semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus	t	f	2022-08-31 23:42:21
66	96	53	nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt,	f	f	2022-05-06 17:11:59
67	5	75	venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci.	t	f	2022-09-21 16:18:17
68	55	11	sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum	t	t	2021-10-30 19:20:37
69	21	22	ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel	f	f	2022-07-31 08:37:40
70	51	7	at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac	f	f	2022-11-18 23:44:21
71	81	21	tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus,	f	f	2022-09-11 14:22:41
72	18	85	sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus	t	t	2023-07-16 11:58:53
73	82	52	eros	t	f	2022-03-14 01:55:34
75	88	81	nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien.	f	t	2022-08-22 18:48:24
76	63	72	sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi	t	t	2023-03-02 17:25:47
77	73	57	nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu.	f	f	2021-10-27 04:06:37
78	67	54	auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque.	f	f	2023-07-20 19:33:33
79	23	95	mi felis, adipiscing	t	f	2021-09-11 09:20:37
80	36	61	Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est.	t	f	2022-04-30 12:27:39
81	25	82	Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam,	t	t	2021-08-31 20:13:16
82	79	97	turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia.	t	f	2023-04-16 04:38:53
83	21	33	Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi	f	f	2023-07-06 08:19:11
84	63	4	bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu	f	t	2023-05-10 19:51:36
85	98	0	cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper.	t	t	2022-03-20 04:51:59
86	32	79	pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse	t	t	2022-02-05 04:29:23
87	65	95	enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem	t	t	2022-05-29 13:28:58
88	48	22	ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo	t	t	2021-12-21 19:19:51
89	45	23	purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a,	t	f	2023-02-11 15:12:21
90	87	79	dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie	f	f	2022-01-30 10:00:09
91	4	44	Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis	f	f	2022-01-21 09:13:03
92	60	90	rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus.	f	f	2021-09-25 05:18:14
93	15	46	diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis	f	t	2023-06-13 20:33:55
94	76	88	at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas	t	t	2022-10-27 01:21:13
95	69	76	erat, in consectetuer ipsum nunc id enim. Curabitur massa.	f	t	2022-03-17 11:33:33
96	82	89	lorem tristique aliquet. Phasellus fermentum	t	t	2021-12-19 03:26:59
97	61	44	ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui	t	f	2022-03-09 20:28:37
98	69	49	Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec	f	t	2023-07-19 00:11:59
99	63	81	odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla	f	t	2022-08-24 05:32:53
100	11	60	ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate	t	t	2023-01-14 23:50:43
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: pql_user
--

COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1188	http://vk.ru/fotos?qr=4	4	et, lacinia vitae, sodales at,	2022-09-17 04:14:41	6
1189	https://vk.ru/fotos?paghdfge=1&offset=1	5	consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere,	2022-04-19 07:55:26	4
1190	https://vk.ru/fotos?qhrrtyj=4	3	velit egestas lacinia.	2021-09-26 06:59:11	4
1191	https://vk.ru/fosfghmstos?ad=115	3	dui lectus rutrum urna, nec luctus felis purus ac tellus.	2022-07-30 16:49:50	1
1192	http://vk.ru/fotos?searwrtjnch=1&q=dewe arthafg wer	8	per	2023-07-29 18:27:47	10
1193	http://vk.ru/fotos?k=sfgnawrt0	1	sit amet, dapibus id, blandit at, nisi. Cum	2022-05-02 19:38:33	4
1194	https://vk.ru/fotos?str=sqerhe	1	Donec egestas. Duis ac arcu. Nunc	2021-11-04 10:53:41	7
1195	https://vk.ru/fotos?g=1	2	cursus luctus, ipsum leo elementum sem, vitae	2021-10-04 09:34:53	10
1196	https://vk.ru/fotos?ab=441&aad=fe2	3	Donec tincidunt. Donec vitae erat vel pede blandit congue.	2022-08-08 22:22:11	2
1197	https://vk.ru/fotos?ab=441&aad=fefe2	2	amet ante. Vivamus non lorem vitae	2023-02-11 23:47:52	2
1198	http://vk.ru/fotos?gi=1fef00	3	semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim	2023-07-25 20:44:05	10
1199	http://vk.ru/fotos?page=1&offdfgdfgset=1	4	et tristique pellentesque, tellus sem mollis	2023-05-08 03:37:26	6
1200	http://vk.ru/fotos?k=ymnwrtqa0	4	leo. Vivamus nibh dolor,	2021-11-12 17:11:49	10
1201	http://vk.ru/fotos?gi=10dghsy0	2	sit amet luctus	2022-03-10 14:35:30	1
1202	https://vk.ru/fotos?gi=sfgthae100	7	quis diam luctus lobortis. Class aptent taciti	2022-01-25 01:18:05	0
1203	https://vk.ru/fotos?search=ewf1	2	rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem	2022-07-23 10:01:38	5
1204	http://vk.ru/fotos?searchvewevc=1&q=deerhwwefwer	1	lacus vestibulum lorem, sit amet ultricies sem magna	2022-12-15 20:54:20	2
1205	http://vk.ru/fotos?searcwrthnh=1sdfxsdbsd	3	magna. Nam ligula elit, pretium et,	2022-07-21 13:02:14	1
1206	http://vk.ru/fotos?p=8	8	viverra. Donec	2022-10-15 19:53:58	0
1207	http://vk.ru/fotos?rfrwebg=1	10	morbi tristique senectus et netus et malesuada fames ac	2022-10-16 01:24:04	0
1208	https://vk.ru/fotos?page=1&offhjhsedfashset=1	10	condimentum. Donec	2023-03-19 07:43:14	6
1209	https://vk.ru/fotos?q=wrtjh0	4	tempus risus.	2023-08-20 15:34:27	4
1210	https://vk.ru/fotos?page=1&offadfhRset=1	8	amet risus. Donec egestas. Aliquam nec	2022-06-10 16:52:53	5
1211	http://vk.ru/fotos?gwrb=b1wrb	5	pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu,	2021-10-02 15:04:48	9
1212	http://vk.ru/fotos?qafhb=testadf	1	Quisque fringilla euismod enim. Etiam gravida	2023-06-16 11:51:06	4
1213	http://vk.ru/fotos?q=jkqerg0	5	arcu et pede. Nunc sed orci lobortis	2022-08-08 04:19:45	2
1214	http://vk.ru/fotos?gi=100	8	dolor dapibus gravida. Aliquam tincidunt, nunc	2023-04-09 01:38:29	8
1215	http://vk.ru/fotos?pweg=weg	9	auctor ullamcorper, nisl arcu iaculis enim, sit	2023-02-10 07:21:28	7
1216	https://vk.ru/fotos?searwrtch=1sdbbsdf	8	egestas a, dui. Cras pellentesque. Sed dictum.	2023-04-23 05:20:55	1
1217	http://vk.ru/fotos?asgfmd=115	7	Quisque libero lacus, varius	2022-03-19 20:58:38	3
1218	https://vk.ru/fotos?amftgad=115	3	a, enim.	2021-11-25 06:56:35	3
1219	http://vk.ru/fotos?q=terg0	1	ultricies sem magna nec quam. Curabitur vel lectus.	2023-05-26 12:17:11	2
1220	http://vk.ru/fotos?g=1wrbwrbfdfa	2	turpis. In condimentum. Donec at arcu. Vestibulum	2022-05-08 07:40:03	7
1221	http://vk.ru/fotos?clieerhnt=gqer	3	metus. Aliquam	2023-01-19 11:41:02	6
1222	http://vk.ru/fotos?ad=1arfbah15	0	sit amet	2022-12-01 21:50:27	8
1223	https://vk.ru/fotos?q=qjqatj4	1	non, cursus	2022-11-11 23:24:34	8
1224	http://vk.ru/fotos?q=teadfhst	2	elit, dictum eu, eleifend nec, malesuada ut,	2022-03-11 18:56:07	8
1225	http://vk.ru/fotos?str=sqereqerh	2	montes, nascetur ridiculus	2023-06-16 03:14:16	9
1226	http://vk.ru/fotos?str=srqferh	4	Etiam imperdiet	2021-10-15 23:32:57	1
1227	https://vk.ru/fotos?35k56hq=11	9	consectetuer adipiscing	2022-03-26 02:29:13	8
1228	https://vk.ru/fotos?searchfghsga=1	7	quis diam. Pellentesque habitant morbi tristique senectus et	2022-01-05 01:34:37	2
1229	https://vk.ru/fotos?page=1&offsewsergSDFht=1	9	risus, at fringilla purus mauris a	2022-07-02 13:32:18	7
1230	http://vk.ru/fotos?searcnwrthyh=1&q=dewe  werwerthgf	9	eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada	2022-12-13 18:21:23	1
1231	http://vk.ru/fotos?k=we0	2	commodo auctor velit. Aliquam nisl. Nulla eu	2023-08-04 12:22:09	2
1232	https://vk.ru/fotos?qqtbh=tqetjnest	1	eu, ligula. Aenean	2022-01-12 04:43:07	0
1233	http://vk.ru/fotos?ab=441&aad=ef2	3	vitae purus gravida sagittis. Duis gravida. Praesent eu nulla	2021-11-09 08:45:59	1
1234	http://vk.ru/fotos?searcwrtnh=1&q=dewe  artharthwer	5	dolor. Fusce mi	2022-07-21 19:39:03	2
1235	https://vk.ru/fotos?RGHadfnj	2	et, rutrum eu, ultrices	2023-05-08 22:12:44	8
1236	https://vk.ru/fotos?seawrtnrch=1&q=dewe  wwefdver	3	neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis.	2023-05-17 10:12:00	7
1237	https://vk.ru/fotos?qqartjqart=4	9	nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo.	2022-05-26 12:00:07	10
1238	https://vk.ru/fotos?qrjrth=rth0	10	Mauris quis	2022-10-08 11:15:30	8
1239	http://vk.ru/fotos?clienqergqet=qergg	0	vehicula. Pellentesque tincidunt tempus	2022-10-22 06:19:14	3
1240	http://vk.ru/fotos?stqefhefr=se	6	lobortis quis, pede. Suspendisse dui. Fusce	2023-06-24 02:03:27	1
1241	http://vk.ru/fotos?qqartj=rtjhtj4	3	ullamcorper magna. Sed eu eros. Nam	2022-01-27 00:51:34	0
1242	https://vk.ru/fotos?g=1adfaerh	8	sem. Nulla interdum. Curabitur dictum.	2022-07-04 20:13:50	4
1243	http://vk.ru/fotos?k=srjjwrqjhjqaefb0	9	eleifend nec,	2021-11-11 16:37:46	1
1244	http://vk.ru/fotos?qwrthj=test	5	adipiscing ligula. Aenean gravida nunc sed pede. Cum	2023-03-11 14:09:41	2
1245	https://vk.ru/fotos?searcwrtnh=1	0	Duis risus odio, auctor vitae, aliquet	2021-11-02 01:44:30	9
1246	https://vk.ru/fotos?ad=11adf5af	4	ante	2022-10-03 18:08:19	4
1247	https://vk.ru/fotos?wrtn&q=dewe  wwetyg2qe3ger	5	ad litora torquent per conubia nostra, per inceptos hymenaeos.	2023-04-01 03:43:26	3
1248	http://vk.ru/fotos?clientqeqerrg=g	3	semper auctor. Mauris vel turpis.	2023-02-20 16:10:17	4
1249	https://vk.ru/fotos?strqefgqefh=se	8	magna. Cras convallis convallis dolor. Quisque tincidunt pede	2023-03-26 05:58:53	6
1250	http://vk.ru/fotos?strqefh=sqefhe	8	Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris,	2021-11-09 04:32:22	2
1251	https://vk.ru/fotos?k=qerhq\terg0	6	pellentesque, tellus sem mollis	2023-05-26 16:40:55	1
1252	https://vk.ru/fotos?gi=srfymjr100	7	Proin nisl	2023-08-09 05:21:01	8
1253	https://vk.ru/fotos?k=edtghmkmk,uyte0	8	euismod mauris eu elit. Nulla facilisi. Sed neque.	2023-03-04 20:41:40	5
1254	http://vk.ru/fotos?pweg=8	5	quam, elementum at,	2023-02-17 12:53:15	5
1255	https://vk.ru/fotos?k=WERGH\t0	5	hendrerit a, arcu.	2022-07-20 09:24:16	5
1256	https://vk.ru/fotos?searcwtnh=1&q=dewe  wewegsdbwer	8	ac nulla. In tincidunt	2022-04-22 07:30:16	3
1257	https://vk.ru/fotos?strqefh=sqefhe	6	nunc. Quisque ornare tortor at	2023-01-14 03:38:33	3
1258	http://vk.ru/fotos?seawrtnrch=1	6	eu eros. Nam consequat dolor vitae dolor.	2022-05-28 03:46:36	7
1259	http://vk.ru/fotos?g=1adfbadfbadfbadf	0	Nam porttitor scelerisque neque. Nullam nisl.	2023-03-28 20:34:10	7
1260	https://vk.ru/fotos?searchwrtn=1&qwefweb=dewe  wer	2	dolor. Fusce mi	2022-10-04 00:25:52	7
1261	http://vk.ru/fotos?qqartjth=rtj4	10	est, mollis non,	2021-10-25 18:48:53	4
1262	http://vk.ru/fotos?searwrtnch=1	0	sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et	2023-07-06 04:36:31	1
1263	http://vk.ru/fotos?kSDFGJWRJ=0	5	at pretium aliquet, metus urna convallis erat, eget tincidunt dui	2022-04-24 07:41:14	8
1264	https://vk.ru/fotos?k=etykgbmnsrty0	2	lobortis. Class aptent taciti sociosqu ad litora torquent	2022-09-10 02:11:37	7
1265	https://vk.ru/fotos?clieqergetuol.lnt=g	1	eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur	2023-03-07 09:36:25	1
1266	https://vk.ru/fotos?3qh356j=11	5	Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices	2023-08-16 12:32:22	2
1267	https://vk.ru/fotos?qqartjjr=4	6	ullamcorper. Duis at lacus. Quisque purus	2021-12-25 00:45:39	6
1268	http://vk.ru/fotos?weghtp=8	9	sed, fawefwcilisis vitae, orci.	2021-09-05 05:21:57	5
1269	https://vk.ru/fotos?searcwrtnh=1&q=dwefewe wefwe wer	7	Etiam	2021-10-09 05:10:34	9
1270	http://vk.ru/fotoas?aaafd=115	4	eros. Proin ultrices. Duis volutpat	2022-06-07 17:13:25	5
1271	https://vk.ru/fotos?k=yhmksty0	10	adipiscing	2023-06-03 21:05:53	0
1272	http://vk.ru/fotos?g=adfbfn1	5	Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet	2022-04-03 02:37:31	9
1273	http://vk.ru/fotos?aagfnd=115	3	dictum magna.	2022-08-21 03:47:55	2
1274	http://vk.ru/fotos?k=stysmk0	10	ornare lectus	2021-11-22 12:17:53	8
1275	http://vk.ru/fotos?fgg=adf1adfbrb	6	neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris	2022-12-04 17:18:53	7
1276	https://vk.ru/fotos?qwrth=terwthst	7	vel, convallis in, cursus et, eros. Proin ultrices. Duis	2021-10-18 07:15:01	2
1277	https://vk.ru/fotos?q356j3=11	0	risus, at fringilla purus mauris a	2022-12-04 17:30:03	0
1278	https://vk.ru/fotos?qwrt=twtjest	9	in, hendrerit consectetuer, cursus et, magna.	2021-10-14 01:29:17	5
1279	http://vk.ru/fotos?page=1&offseHRAerhsrtdht=1	7	magna tellus faucibus leo, in lobortis	2023-04-10 21:14:10	9
1280	http://vk.ru/fotos?ab=441&aadfeeef=2	6	erat nonummy ultricies ornare, elit elit	2023-08-08 18:16:25	4
1281	http://vk.ru/fotos?searcqergh=1&q=dewgjkrthe  wer	0	sed, est. Nunc laoreet	2022-11-29 21:45:09	8
1282	http://vk.ru/fotos?searcqerh=1	6	sem, vitae aliquam eros turpis	2022-07-25 06:10:46	8
1283	https://vk.ru/fotos?p=s8aaerghre	8	risus. Quisque libero	2022-02-24 22:11:57	8
1284	http://vk.ru/fotos?searchqervh=1	7	posuere at, velit. Cras lorem lorem,	2021-11-30 20:58:27	4
1285	https://vk.ru/fotos?gi=atrhae100	3	aliquam	2023-04-13 20:41:31	2
1286	https://vk.ru/fotos?p=fbh8	1	tincidunt. Donec vitae erat vel pede	2022-04-15 19:49:04	5
1287	http://vk.ru/fotos?qwrth=tewrtst	7	Nunc mauris elit, dictum eu,	2022-05-30 21:07:56	8
\.


--
-- Data for Name: subscribes_on_community; Type: TABLE DATA; Schema: public; Owner: pql_user
--

COPY public.subscribes_on_community (subscripsi_community_id, subscriber_id, subscriptione_date, unsubscribe_date) FROM stdin;
4	7	2022-01-30 16:54:50	\N
2	55	2022-09-02 06:21:18	\N
8	100	2022-04-27 08:30:48	\N
4	5	2022-02-01 17:50:17	\N
2	54	2023-04-06 18:33:02	\N
3	87	2023-03-21 00:27:46	\N
6	34	2023-03-24 14:01:01	\N
4	45	2022-12-09 00:41:05	\N
6	38	2022-05-02 17:47:42	\N
9	92	2023-07-31 21:40:01	\N
9	74	2023-06-06 20:46:13	\N
2	72	2022-09-07 09:53:17	\N
3	66	2022-01-18 08:44:32	\N
3	56	2022-12-09 16:55:19	\N
10	39	2022-12-28 11:32:35	\N
7	70	2023-03-21 11:21:50	\N
2	63	2021-09-02 07:09:30	\N
8	53	2022-10-22 07:26:39	\N
7	90	2023-02-25 10:06:12	\N
5	4	2022-05-16 12:25:19	\N
4	55	2022-10-07 21:07:29	\N
8	50	2022-11-06 19:06:26	\N
9	24	2022-09-01 14:33:40	\N
3	41	2022-01-19 04:09:33	\N
2	61	2023-07-21 06:32:58	\N
5	5	2023-03-14 11:19:27	\N
4	15	2022-07-18 17:23:03	\N
6	83	2022-02-19 10:03:09	\N
0	33	2022-07-09 06:31:49	\N
0	1	2022-10-13 07:21:58	\N
5	20	2022-03-29 01:15:04	\N
9	4	2022-04-15 08:02:48	\N
7	55	2023-04-16 08:02:18	\N
9	60	2022-04-10 13:47:13	\N
7	96	2023-05-18 16:13:07	\N
8	72	2021-10-29 15:54:06	\N
5	82	2022-01-14 05:27:52	\N
9	62	2021-11-16 19:18:53	\N
4	76	2023-06-12 23:51:03	\N
2	3	2022-05-31 08:05:17	\N
6	80	2022-03-27 11:19:24	\N
9	53	2023-04-01 02:39:43	\N
5	25	2022-04-26 06:56:50	\N
1	7	2023-08-08 22:35:27	\N
9	71	2023-02-08 19:42:00	\N
7	83	2022-05-03 10:41:43	\N
10	77	2022-09-08 05:50:45	\N
4	36	2022-11-28 18:00:14	\N
2	89	2022-04-27 09:16:59	\N
2	64	2021-12-25 04:55:00	\N
5	95	2022-05-30 10:45:54	\N
5	21	2022-10-01 13:00:03	\N
10	4	2022-08-20 02:03:02	\N
7	53	2022-03-30 04:54:35	\N
7	64	2022-08-28 00:25:19	\N
1	26	2023-04-22 18:08:55	\N
6	89	2023-06-27 18:45:42	\N
3	63	2023-03-01 04:53:00	\N
7	34	2023-06-25 13:59:33	\N
1	35	2023-07-29 13:54:31	\N
4	23	2023-02-09 07:34:28	\N
2	26	2022-07-18 23:41:14	\N
8	87	2022-05-26 20:52:44	\N
1	27	2022-10-18 19:06:47	\N
7	75	2022-06-24 22:09:56	\N
3	49	2022-09-30 21:24:29	\N
9	33	2022-01-05 19:19:49	\N
7	14	2022-07-25 22:04:59	\N
8	15	2023-02-07 07:48:58	\N
2	95	2021-09-07 07:59:32	\N
7	2	2022-03-27 17:17:34	\N
10	31	2022-04-18 14:34:53	\N
1	58	2022-05-27 11:05:06	\N
8	10	2022-04-04 11:53:35	\N
3	65	2022-06-15 02:27:57	\N
6	45	2023-03-24 10:03:04	\N
0	14	2021-10-28 10:49:38	\N
3	72	2022-01-19 11:51:32	\N
1	77	2022-05-26 10:51:41	\N
3	10	2021-11-11 11:15:36	\N
0	47	2023-03-07 06:25:31	\N
6	15	2022-03-17 00:57:45	\N
9	30	2022-05-14 22:25:06	\N
4	4	2021-10-27 05:14:07	\N
3	14	2022-10-08 14:17:09	\N
6	64	2022-09-23 13:01:27	\N
9	94	2023-02-25 09:34:26	\N
2	12	2023-07-07 00:07:13	\N
5	16	2023-02-23 23:24:12	\N
3	4	2023-02-28 18:48:37	\N
6	36	2022-11-19 05:40:03	\N
1	11	2023-06-05 12:38:20	\N
1	84	2022-10-27 16:07:07	\N
9	54	2021-12-17 02:57:01	\N
3	24	2022-01-20 00:25:45	\N
7	12	2022-03-21 23:53:02	\N
8	79	2021-10-21 22:06:00	\N
1	92	2022-01-01 13:01:35	\N
10	54	2022-07-01 23:39:01	\N
5	87	2022-08-31 11:17:36	\N
\.


--
-- Data for Name: subscribes_on_user; Type: TABLE DATA; Schema: public; Owner: pql_user
--

COPY public.subscribes_on_user (subscripsi_user_id, subscriber_id, subscriptione_date, unsubscribe_date) FROM stdin;
75	16	2022-12-19 14:13:16	\N
15	65	2022-11-13 05:17:44	\N
3	45	2022-08-01 09:57:23	\N
14	12	2023-08-02 14:06:50	\N
32	100	2023-07-06 22:49:45	\N
51	99	2023-07-27 11:28:50	\N
32	47	2023-06-28 09:29:49	\N
44	22	2022-07-05 02:20:43	\N
93	79	2022-11-19 14:49:14	\N
12	2	2023-05-09 03:39:52	\N
57	5	2022-05-04 14:19:51	\N
56	78	2021-12-05 20:47:50	\N
88	83	2023-01-18 22:24:00	\N
88	40	2022-08-21 20:14:54	\N
12	4	2022-05-28 01:03:12	\N
89	86	2022-07-04 03:32:48	\N
24	51	2022-12-23 05:19:58	\N
28	26	2021-09-06 07:09:11	\N
96	15	2022-10-06 18:00:42	\N
83	61	2021-10-06 02:50:21	\N
20	68	2022-03-02 02:31:36	\N
78	43	2022-03-02 03:35:40	\N
7	49	2023-01-29 04:11:11	\N
1	92	2023-04-14 11:40:42	\N
26	93	2023-01-17 17:22:03	\N
63	36	2022-01-01 06:18:18	\N
86	27	2023-01-24 01:27:22	\N
35	95	2023-05-30 17:46:45	\N
39	20	2023-06-11 00:34:28	\N
80	10	2022-05-13 12:05:17	\N
54	26	2023-02-27 21:55:26	\N
72	80	2022-04-24 08:01:48	\N
78	9	2022-09-01 13:59:16	\N
70	0	2022-07-05 07:38:55	\N
39	48	2021-12-10 09:45:11	\N
52	24	2023-03-21 10:31:56	\N
42	9	2021-11-05 20:35:08	\N
67	39	2021-11-12 23:10:55	\N
54	67	2023-04-09 19:00:55	\N
48	91	2023-02-10 01:33:16	\N
31	41	2022-05-24 00:40:27	\N
13	19	2022-05-18 14:14:05	\N
5	10	2021-10-10 13:11:21	\N
71	48	2022-05-11 20:03:45	\N
2	95	2023-04-04 10:51:33	\N
22	56	2021-10-31 02:34:25	\N
3	1	2022-02-08 17:06:35	\N
77	90	2023-02-06 23:24:56	\N
30	92	2023-03-27 21:50:25	\N
53	99	2022-01-21 19:39:26	\N
98	82	2022-11-08 20:23:04	\N
81	75	2022-11-09 01:35:27	\N
17	24	2023-08-01 03:50:33	\N
44	4	2022-09-02 14:25:02	\N
74	78	2021-10-06 04:27:04	\N
79	34	2022-10-10 11:02:01	\N
83	70	2022-04-27 03:51:05	\N
94	85	2023-05-24 22:43:01	\N
56	69	2022-10-21 15:47:54	\N
30	87	2022-09-24 02:35:59	\N
44	72	2022-04-15 11:16:15	\N
46	92	2022-02-26 22:59:38	\N
25	94	2022-06-04 19:18:57	\N
7	76	2022-11-06 10:21:03	\N
73	31	2021-11-10 08:30:38	\N
73	27	2022-04-10 00:47:40	\N
33	41	2022-01-30 01:38:44	\N
41	72	2022-06-17 09:20:08	\N
69	84	2022-04-10 08:01:38	\N
39	80	2022-02-08 22:46:04	\N
35	59	2023-04-22 06:09:20	\N
9	100	2023-08-07 11:09:14	\N
56	61	2023-05-09 07:01:43	\N
78	62	2022-10-30 21:54:37	\N
49	40	2023-02-23 05:45:30	\N
56	3	2023-08-08 19:42:33	\N
92	50	2022-09-07 22:41:36	\N
81	38	2022-07-05 18:34:21	\N
1	35	2021-11-05 20:58:57	\N
96	37	2021-09-21 20:51:07	\N
74	50	2021-11-29 12:21:05	\N
71	15	2023-06-08 23:11:35	\N
56	33	2023-06-30 18:41:17	\N
26	8	2022-01-18 10:09:21	\N
80	83	2022-01-15 15:13:32	\N
39	45	2021-12-02 15:38:36	\N
82	62	2023-04-20 07:18:49	\N
13	27	2022-12-10 02:35:33	\N
10	4	2021-09-25 15:01:52	\N
47	22	2023-03-03 02:29:38	\N
65	98	2022-12-13 06:54:29	\N
22	10	2022-09-18 18:15:07	\N
72	96	2023-05-02 04:57:45	\N
34	82	2022-06-22 04:53:05	\N
8	78	2021-08-22 15:39:02	\N
41	89	2023-04-27 16:39:07	\N
60	27	2022-03-29 05:56:16	\N
48	28	2022-09-09 18:41:22	\N
24	3	2023-05-31 21:11:57	\N
76	78	2022-05-19 17:06:50	\N
87	65	2021-09-03 10:05:57	\N
34	72	2023-04-28 05:12:29	\N
3	73	2022-01-27 01:13:27	\N
20	89	2022-11-27 21:42:40	\N
77	15	2021-10-19 20:14:48	\N
97	10	2022-06-27 21:41:54	\N
92	6	2023-06-16 14:04:34	\N
54	72	2021-11-18 10:19:47	\N
75	8	2021-11-06 01:05:33	\N
62	42	2023-01-15 00:11:16	\N
23	31	2022-05-10 06:41:31	\N
11	41	2022-10-25 07:41:21	\N
67	92	2021-11-26 10:46:01	\N
66	61	2022-07-08 22:06:22	\N
12	40	2021-09-24 03:34:40	\N
28	42	2022-01-07 18:45:52	\N
1	34	2022-02-16 05:41:16	\N
72	44	2023-07-18 01:49:41	\N
28	82	2023-01-15 22:13:32	\N
18	52	2023-06-08 02:02:08	\N
60	96	2021-12-25 13:49:25	\N
39	11	2022-02-27 18:20:09	\N
85	56	2022-12-07 14:18:57	\N
32	19	2022-02-14 14:21:14	\N
35	1	2022-08-10 20:31:39	\N
21	42	2022-03-28 19:12:27	\N
29	98	2022-01-10 03:24:26	\N
79	58	2023-02-24 00:59:55	\N
45	83	2022-07-21 12:34:16	\N
95	47	2022-11-28 20:16:43	\N
91	13	2021-12-05 09:19:47	\N
32	1	2022-08-02 04:36:39	\N
50	99	2023-05-05 22:44:01	\N
78	82	2022-09-14 17:22:46	\N
89	88	2023-08-14 05:39:16	\N
13	65	2023-02-05 01:36:28	\N
27	98	2023-02-28 02:26:37	\N
15	63	2022-09-19 13:15:58	\N
95	54	2022-07-15 01:01:41	\N
46	96	2023-03-16 21:27:33	\N
27	28	2023-04-01 10:34:43	\N
46	59	2023-07-28 08:21:06	\N
9	80	2022-02-27 05:56:24	\N
59	43	2022-12-29 19:35:52	\N
6	46	2023-07-24 12:08:04	\N
63	21	2022-05-03 00:20:39	\N
83	14	2022-03-06 14:55:06	\N
42	8	2022-11-08 01:35:46	\N
100	0	2022-06-09 12:06:23	\N
48	12	2023-06-05 00:34:12	\N
15	38	2022-01-05 13:50:14	\N
67	19	2023-03-05 07:44:12	\N
96	14	2023-05-08 02:50:39	\N
16	22	2021-08-31 10:36:25	\N
12	42	2022-03-31 15:14:43	\N
54	15	2023-04-25 02:57:14	\N
31	91	2023-07-07 01:25:54	\N
44	3	2022-08-25 15:49:05	\N
81	90	2022-04-07 09:48:24	\N
53	65	2022-09-04 11:18:34	\N
87	32	2021-11-11 07:28:28	\N
50	18	2022-10-20 18:52:53	\N
97	84	2021-11-09 11:13:04	\N
19	100	2022-07-11 06:26:28	\N
34	2	2022-06-14 07:39:59	\N
1	72	2023-03-06 04:22:30	\N
15	85	2023-02-10 19:53:36	\N
51	8	2021-12-20 05:28:33	\N
25	51	2021-10-23 03:58:29	\N
94	40	2023-05-09 10:02:25	\N
16	43	2022-12-23 07:00:49	\N
34	22	2022-03-05 09:51:47	\N
80	81	2022-07-15 12:23:49	\N
33	53	2023-01-16 23:21:33	\N
84	42	2022-08-02 00:56:19	\N
70	4	2022-07-11 14:26:23	\N
2	64	2023-02-12 06:23:43	\N
64	11	2022-12-25 12:56:46	\N
70	39	2023-05-31 16:46:53	\N
49	44	2023-08-17 21:46:28	\N
87	76	2022-02-05 22:29:24	\N
100	63	2023-02-27 21:10:38	\N
94	96	2023-02-08 03:05:47	\N
68	1	2021-11-24 19:35:12	\N
35	36	2022-10-03 21:36:41	\N
29	1	2022-01-07 02:11:25	\N
55	28	2022-08-31 15:09:37	\N
67	58	2022-01-12 03:30:12	\N
61	51	2021-10-17 02:15:11	\N
45	63	2022-04-09 11:26:36	\N
42	17	2021-09-29 11:01:15	\N
25	99	2023-02-13 13:44:56	\N
60	80	2021-12-10 23:27:26	\N
9	3	2022-01-08 12:43:21	\N
10	68	2022-01-22 10:57:05	\N
33	50	2022-11-17 17:10:13	\N
80	47	2022-05-19 09:38:18	\N
28	28	2023-05-06 17:22:23	\N
40	12	2021-12-20 15:43:08	\N
84	49	2021-12-29 17:03:50	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pql_user
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
3	Patrick	Pratt	erat.vitae.risus@google.couk	(257) 524-7618	25	2023-04-20 01:57:15
4	Julian	Aguirre	pede.suspendisse.dui@outlook.com	(770) 635-3847	17	2022-09-30 11:59:03
5	Neil	Alford	nunc.quisque@outlook.com	1-673-810-6310	98	2023-05-15 02:10:38
6	Brielle	Walters	montes.nascetur@google.com	1-386-697-6759	78	2023-08-01 04:43:16
7	Thane	Moses	pellentesque.massa@icloud.com	1-315-774-4107	89	2023-01-03 11:56:03
8	Seth	Floyd	vivamus.nisi@icloud.ca	1-388-953-1832	93	2022-09-28 05:00:34
9	Kermit	Compton	varius.et@aol.com	1-626-954-1843	82	2023-07-29 09:55:40
10	Ishmael	Joyner	non.magna.nam@outlook.com	(265) 217-5760	21	2022-12-08 03:33:45
11	Brenden	Valenzuela	proin.nisl@aol.net	1-774-966-7250	4	2023-05-05 01:49:04
12	Quinn	Byrd	nunc.commodo@yahoo.couk	(624) 583-5947	91	2022-10-08 09:30:01
13	Amir	Griffith	imperdiet.ullamcorper@aol.ca	(273) 656-6313	6	2022-10-19 22:12:27
14	Alexandra	Graham	integer@outlook.com	(395) 609-7335	86	2023-06-02 23:21:33
15	Kylee	Humphrey	morbi.sit@google.com	1-264-658-7152	99	2023-04-22 02:30:54
16	Yael	Owens	mollis.duis@protonmail.couk	1-465-477-2767	1	2023-07-12 20:40:44
17	Desirae	Stephenson	donec.est@google.org	1-755-584-7831	100	2022-10-10 09:43:05
18	Jakeem	Collins	lorem.eu@protonmail.couk	1-552-619-7864	26	2023-02-05 05:29:03
19	Lawrence	Quinn	metus@aol.com	1-464-726-5461	77	2023-07-18 17:34:35
20	Oleg	Dorsey	sed.dictum@icloud.edu	1-712-240-7382	62	2023-06-13 08:17:56
21	Nora	Salazar	aliquam.arcu.aliquam@outlook.ca	1-261-506-0686	49	2022-09-12 20:43:04
22	Basia	Michael	aliquet.magna.a@outlook.org	(468) 921-4257	80	2022-12-23 06:37:41
23	Martha	Velazquez	eu@aol.com	1-667-654-6733	13	2023-01-21 19:33:39
24	Jermaine	Patel	sollicitudin.adipiscing.ligula@google.com	1-341-332-5748	26	2023-07-08 01:46:51
25	Sean	Ramsey	placerat.cras@yahoo.org	1-828-455-0601	74	2022-08-24 10:07:24
26	Vielka	Britt	phasellus.nulla@outlook.ca	(275) 148-2224	16	2022-10-28 08:22:44
27	India	Odom	semper.dui.lectus@protonmail.edu	1-878-966-2132	58	2022-12-17 12:25:33
28	Kasper	Mcdonald	rutrum.non@protonmail.edu	(486) 336-9874	6	2023-05-15 02:14:03
29	Caesar	Woodard	nulla@hotmail.org	1-353-587-8364	88	2022-11-19 02:07:15
30	Jennifer	Riddle	natoque@outlook.edu	(641) 920-1167	13	2023-04-09 09:49:34
31	Yolanda	Alston	at.fringilla@hotmail.edu	(511) 462-9835	93	2023-03-29 14:42:45
32	Madeson	Torres	tincidunt.donec@hotmail.com	(856) 994-7138	73	2022-09-09 00:52:30
33	Holmes	Sharp	ridiculus.mus.proin@google.edu	(830) 876-4165	73	2022-12-23 08:58:44
34	Colin	Francis	et.netus@outlook.com	(458) 534-8952	95	2023-03-23 07:59:28
35	Bryar	Norris	fusce.diam@aol.org	1-658-276-8353	80	2023-01-19 17:27:11
36	Pearl	Hale	aliquet.phasellus@protonmail.net	1-411-217-2910	67	2023-08-17 16:32:21
37	Brett	Harrell	lectus.nullam.suscipit@yahoo.couk	(605) 536-6767	51	2022-09-09 11:39:16
38	Noble	Combs	mauris.ut.mi@aol.net	(688) 252-1573	25	2022-10-25 22:05:00
39	Marny	Cook	ultricies.dignissim.lacus@aol.com	1-868-541-6617	94	2023-05-26 04:51:52
40	Prescott	Parrish	nascetur.ridiculus.mus@icloud.edu	(804) 992-2102	89	2023-03-04 23:05:29
41	Raven	Hines	sed.nulla@protonmail.org	1-858-719-3043	53	2022-09-05 16:12:10
42	Cassidy	Chen	tempor.erat@google.edu	(864) 705-9886	30	2023-07-07 17:59:32
43	Moana	Nichols	dui@aol.edu	(369) 845-5132	87	2023-04-14 19:57:04
44	Kim	Crosby	aenean.massa@yahoo.couk	1-719-232-5198	34	2023-07-28 01:35:08
45	Breanna	Tyler	ac.metus.vitae@protonmail.net	1-542-568-8221	100	2023-08-16 14:12:12
46	Courtney	Odom	donec.egestas@aol.org	(753) 271-4406	48	2022-09-26 04:32:31
47	Whitney	Randolph	aliquam.rutrum@outlook.net	1-789-733-1655	20	2022-11-24 17:17:52
48	Palmer	Barron	primis.in.faucibus@google.edu	(741) 552-5459	78	2022-11-06 18:59:47
49	September	Smith	scelerisque.sed@yahoo.net	(960) 819-6707	35	2023-02-10 14:31:54
50	Chancellor	Joseph	vitae@outlook.edu	1-521-442-2238	18	2023-06-23 01:20:06
51	Yardley	Morales	natoque.penatibus@hotmail.org	(733) 172-5211	90	2022-10-16 15:03:16
52	Jenna	Leon	in.sodales@yahoo.edu	1-148-382-4691	91	2023-02-25 11:40:48
53	Martin	Glenn	eu.euismod.ac@aol.com	1-885-148-8517	36	2022-11-30 01:54:53
54	Jana	Schultz	nullam@google.edu	(352) 624-1291	1	2023-05-16 02:55:18
55	Karyn	Hogan	aliquam.vulputate.ullamcorper@aol.edu	(315) 856-3485	69	2023-04-30 19:14:02
56	Kyle	Lang	non.leo.vivamus@google.ca	1-379-842-2864	5	2023-02-03 15:05:03
57	Ursa	Barnes	phasellus.dapibus@protonmail.ca	(325) 616-6537	72	2023-04-22 09:55:53
58	Preston	Jacobson	in@protonmail.edu	1-264-385-3489	64	2022-12-06 00:06:36
59	Susan	Lancaster	et.euismod@yahoo.couk	1-594-181-8659	67	2023-05-12 09:53:35
60	Faith	English	curae.donec@hotmail.ca	1-541-320-0736	32	2023-05-24 20:41:42
61	Theodore	Pate	eu@icloud.edu	(155) 380-8626	43	2023-05-18 09:19:54
62	Yen	Foster	accumsan@protonmail.com	1-840-616-7737	56	2023-05-04 23:07:43
63	Brody	Merritt	integer.sem.elit@yahoo.com	(822) 695-4618	54	2022-10-31 10:10:56
64	Ray	Bird	scelerisque.neque@icloud.org	1-661-723-9777	20	2023-01-24 15:26:41
65	Britanni	Battle	convallis@google.edu	(945) 221-7475	88	2023-01-03 13:57:14
66	Lars	Owens	fermentum@hotmail.ca	1-473-722-4751	68	2022-09-06 12:03:39
67	Aiko	O'donnell	dapibus.gravida@yahoo.net	(627) 572-2190	23	2022-10-17 03:39:59
68	Eagan	Allison	cubilia@protonmail.org	(344) 733-8205	36	2023-04-02 01:01:20
69	Blaze	Davis	arcu.vivamus@hotmail.ca	1-641-277-2575	24	2023-02-15 07:11:16
70	Xander	Owen	in.faucibus@icloud.edu	1-552-841-1775	88	2023-02-02 18:15:03
71	Damian	Rose	mauris.vel@protonmail.com	1-784-985-4308	46	2023-02-04 04:17:46
72	Cadman	Fry	ante.maecenas.mi@icloud.couk	(793) 165-5038	32	2023-07-20 01:04:38
73	Preston	Byrd	tellus@yahoo.com	(731) 863-0758	68	2023-04-24 11:53:18
74	Adria	Caldwell	velit.eu.sem@google.ca	(664) 739-9078	26	2022-12-30 07:55:23
75	Gray	Foley	aliquam@aol.edu	(834) 839-6312	100	2023-07-10 06:17:40
76	Caryn	Barnes	sed.congue@protonmail.ca	(251) 964-6617	36	2022-09-27 23:16:54
77	Aiko	Boyle	magna@yahoo.couk	(753) 344-1433	16	2023-03-29 05:36:17
78	Yuri	Nixon	neque.venenatis.lacus@aol.couk	1-528-115-5631	82	2023-04-26 15:09:36
79	Whitney	Levine	sem@outlook.net	(528) 897-0542	53	2023-08-21 21:20:45
80	Cynthia	Boyd	sit.amet.consectetuer@protonmail.ca	1-347-321-7573	78	2022-12-08 07:05:30
81	Quentin	Kaufman	congue@aol.ca	(858) 746-6831	99	2022-12-11 10:23:42
82	Jared	Mercado	libero.proin@google.edu	1-311-975-3352	15	2023-06-14 01:58:55
83	Silas	Tillman	neque.venenatis@icloud.couk	1-324-108-6131	74	2023-04-20 21:54:47
84	Tallulah	Pena	sollicitudin.adipiscing@outlook.edu	(221) 327-7737	1	2023-01-17 08:22:58
85	Fulton	Lott	dictum.phasellus.in@hotmail.couk	(236) 773-8151	68	2023-06-18 16:24:59
86	Daphne	Hunt	tincidunt.vehicula@yahoo.edu	1-686-764-6418	1	2022-08-22 12:35:50
87	Dora	Maddox	nec@aol.edu	1-289-467-4230	99	2023-04-29 03:09:59
88	Kieran	Velazquez	ornare.lectus.ante@protonmail.couk	1-273-373-9447	23	2023-05-08 18:24:01
89	Guinevere	Gilbert	integer@yahoo.couk	1-384-358-8602	17	2023-03-07 17:57:41
90	Cally	Valentine	mollis@google.couk	(831) 621-8086	35	2022-11-20 09:12:36
91	Sierra	Clark	pharetra.nam@icloud.com	(202) 658-1445	63	2022-12-06 11:57:28
92	Kyra	Hicks	lacinia.at@hotmail.edu	(596) 725-8312	93	2022-09-24 14:13:37
93	Noelle	Durham	dui.cum.sociis@aol.edu	1-688-362-4522	25	2023-03-22 07:57:11
94	Laura	Caldwell	sagittis.felis@hotmail.com	1-127-615-2161	61	2023-03-24 03:37:30
95	Neville	Garcia	risus.at@yahoo.com	(417) 970-7624	29	2023-08-13 08:15:02
96	Judith	Hutchinson	amet.luctus.vulputate@icloud.edu	1-756-514-0867	93	2022-11-22 06:37:51
97	Lacy	Moody	ut@aol.com	1-139-838-7568	24	2023-02-26 05:37:09
98	Deborah	Leblanc	eu.eleifend.nec@yahoo.com	(729) 266-7754	81	2022-09-24 10:41:45
99	Stuart	Stout	ac.arcu@google.edu	1-755-718-2351	45	2023-07-25 09:40:56
100	Samuel	Rice	suspendisse.tristique.neque@icloud.couk	1-643-123-0078	65	2022-10-27 13:45:12
101	Ivory	Sheppard	vestibulum@outlook.com	1-713-788-1739	44	2023-02-17 22:14:20
102	Georgia	Clark	malesuada@aol.edu	1-321-685-7854	89	2023-05-20 20:19:15
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: pql_user
--

COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1018	http://vk.ru/video?jwrtjj5jge	0	placerat, augue. Sed molestie. Sed	2022-06-21 08:29:26	3
1019	http://vk.ru/video?4	2	dolor. Donec	2021-11-04 21:43:00	9
1020	http://vk.ru/video?rt	8	eu dui. Cum sociis natoque	2021-10-23 01:14:34	0
1021	http://vk.ru/video?r	0	a,	2021-09-28 07:33:21	6
1022	http://vk.com/video?rehh	3	urna suscipit nonummy. Fusce fermentum	2023-06-09 22:57:47	7
1023	https://vk.com/video?we5qerhhh546j	4	Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat	2021-10-13 11:08:41	9
1024	http://vk.com/video?5j	6	Phasellus dapibus quam quis diam.	2022-01-12 07:29:12	4
1025	http://vk.ru/video?wqrth	8	venenatis a, magna.	2022-09-17 08:39:56	9
1026	http://vk.com/video?wqrth	8	ipsum nunc id	2022-12-04 06:33:55	0
1027	http://vk.ru/video?5w	9	diam eu dolor egestas rhoncus. Proin nisl sem,	2021-09-10 12:39:56	2
1028	http://vk.com/video?hwwrth5r	5	pellentesque a, facilisis non, bibendum	2022-09-18 06:42:33	10
1029	http://vk.ru/video?qe	2	dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero	2023-02-26 08:14:08	3
1030	https://vk.ru/videgqoeq	2	semper. Nam tempor diam dictum sapien. Aenean	2021-10-21 00:57:20	8
1031	https://vk.ru/video?4	8	convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum	2022-01-05 23:43:22	2
1032	https://vk.ru/video?rtgj5je	10	ipsum cursus vestibulum. Mauris	2023-07-07 17:20:19	5
1033	https://vk.ru/video?ui	2	Duis dignissim tempor arcu. Vestibulum ut eros	2022-02-09 08:18:07	3
1034	https://vk.com/video?w356	7	dictum eu, placerat eget, venenatis	2022-10-31 10:26:41	0
1035	http://vk.com/video?qqergterg	6	lacinia vitae, sodales at, velit. Pellentesque	2021-12-23 19:49:38	4
1036	https://vk.ru/video?u	2	eleifend nec, malesuada ut, sem. Nulla interdum.	2022-11-20 21:27:28	4
1037	https://vk.ru/video?j	4	placerat eget, venenatis a,	2023-01-18 02:31:33	6
1038	http://vk.com/video?rqergjq455h	3	erat volutpat. Nulla	2022-07-10 12:01:15	1
1039	https://vk.com/video?w54uy6	9	Donec nibh.	2022-06-21 15:15:21	6
1040	http://vk.com/video?g	2	scelerisque dui. Suspendisse ac metus vitae velit	2022-05-23 13:15:32	4
1041	http://vk.ru/video?q	9	Nam nulla magna, malesuada vel, convallis in,	2023-01-25 15:12:43	3
1042	http://vk.com/video?w54uy6	6	ante dictum	2021-09-06 21:20:56	3
1043	https://vk.ru/video?th	3	vel lectus.	2021-08-31 03:36:12	3
1044	http://vk.ru/video?th	4	euismod enim.	2021-09-03 21:22:48	7
1045	https://vk.ru/video?aerg	10	ut erat. Sed nunc	2021-12-10 14:52:44	0
1046	https://vk.ru/video?h	2	Phasellus ornare. Fusce mollis.	2022-08-30 08:17:40	6
1047	http://vk.ru/video?67i	6	Duis risus odio, auctor vitae, aliquet nec, imperdiet nec,	2022-05-24 04:13:04	9
1048	http://vk.ru/video?wef5	6	non ante bibendum	2023-07-09 03:56:02	2
1049	http://vk.ru/video?e	10	Donec nibh enim, gravida sit amet, dapibus id, blandit at,	2023-05-09 00:27:32	1
1050	https://vk.ru/video?qdghkdtyjer	9	magna et ipsum cursus vestibulum. Mauris magna. Duis	2023-05-07 23:31:45	2
1051	https://vk.com/video?gqerhqerggq	9	purus ac tellus. Suspendisse	2023-03-27 03:28:29	4
1052	https://vk.com/video?tjh	0	risus. Donec	2023-01-08 04:32:37	8
1053	http://vk.com/video?56uy	3	euismod et, commodo at, libero.	2021-12-12 22:59:18	9
1054	https://vk.ru/video?a	2	tempus mauris erat	2021-09-17 04:10:30	5
1055	http://vk.ru/video?35w67	2	neque et nunc. Quisque ornare tortor at risus. Nunc	2021-08-26 02:35:16	7
1056	https://vk.ru/video?e	4	quam vel sapien imperdiet ornare. In faucibus. Morbi	2023-06-22 18:58:24	5
1057	http://vk.ru/video?hw5y6k5q	4	vulputate, posuere vulputate, lacus.	2022-12-28 04:05:05	8
1058	https://vk.com/video?h	9	nec orci. Donec nibh. Quisque nonummy	2023-01-28 21:34:29	8
1059	http://vk.com/video?dtykqer	8	primis in faucibus orci luctus et	2022-09-03 07:36:34	9
1060	https://vk.ru/video?q	5	adipiscing, enim	2023-07-06 12:27:07	6
1061	http://vk.com/video?qdtykserdhergtgq	9	tortor nibh sit amet	2022-03-16 16:01:52	5
1062	http://vk.com/video?w5	7	Phasellus at augue id ante	2023-06-07 17:49:44	3
1063	http://vk.com/video?q	8	euismod mauris eu elit. Nulla facilisi. Sed neque. Sed	2023-04-19 21:39:05	6
1064	http://vk.ru/videowef?5	9	nulla	2023-01-03 16:44:43	5
1065	http://vk.ru/video?w	7	feugiat non, lobortis quis,	2021-12-01 10:35:31	6
1066	http://vk.com/video?6	3	at pretium aliquet, metus	2023-04-14 05:33:41	9
1067	https://vk.ru/video?q44	2	interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh	2022-01-26 16:13:58	1
1068	https://vk.com/video?qaer	9	tristique senectus et netus et malesuada fames ac turpis	2022-05-31 14:18:05	8
1069	http://vk.com/video?q245jheh	3	enim consequat purus. Maecenas libero est, congue a, aliquet	2021-09-29 09:48:04	3
1070	https://vk.ru/video?w	1	hendrerit consectetuer, cursus et, magna. Praesent interdum	2022-08-16 20:45:09	3
1071	http://vk.ru/video?w56	0	non,	2022-09-15 16:44:00	1
1072	https://vk.com/video?qsykksyjer	6	lectus	2021-12-08 00:59:41	2
1073	https://vk.ru/video?67i	7	magna. Praesent interdum ligula eu enim.	2022-03-16 12:52:44	2
1074	https://vk.com/videoqergqerg	8	neque. Sed eget lacus. Mauris non dui nec	2023-07-30 03:04:05	8
1075	http://vk.ru/video?qesyyjshr	3	dis parturient montes, nascetur ridiculus mus. Aenean	2022-10-26 17:00:48	4
1076	https://vk.com/video?56uy	7	aptent taciti sociosqu ad litora	2022-12-28 12:13:30	7
1077	http://vk.com/video?jqaej5e	4	diam lorem, auctor	2022-02-18 02:29:52	7
1078	https://vk.com/video?rg	3	Sed neque. Sed eget lacus. Mauris non dui	2023-02-06 11:31:36	5
1079	https://vk.ru/video?q45yhjeh	9	adipiscing ligula. Aenean gravida nunc sed	2022-02-10 00:17:37	4
1080	https://vk.ru/video?q3	1	amet, dapibus	2022-01-19 09:39:11	9
1081	https://vk.ru/video?5wef6uy	5	vulputate mauris sagittis placerat. Cras dictum ultricies	2023-04-08 15:59:14	1
1082	https://vk.com/video?qeshjsyjr	9	turpis	2022-03-23 12:03:54	7
1083	http://vk.com/video?67i	2	accumsan neque	2023-03-27 19:26:42	2
1084	http://vk.ru/video?qe24jhth456h	6	non, egestas a,	2022-10-09 05:11:48	1
1085	http://vk.com/video?rq45tgh5h	1	enim, gravida sit amet,	2022-10-24 23:39:57	4
1086	https://vk.com/video?w56	8	dolor, nonummy ac, feugiat non,	2022-12-30 15:38:34	4
1087	https://vk.com/video?we545j456j	10	sit amet luctus vulputate, nisi	2022-09-09 19:44:21	2
1088	http://vk.com/video?gh	2	odio. Nam	2021-09-25 00:03:20	1
1089	http://vk.com/video?aetj5je	2	Donec feugiat metus sit amet ante. Vivamus non lorem	2022-04-22 11:37:32	4
1090	https://vk.com/video?t	8	enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque	2022-03-09 23:52:14	9
1091	http://vk.com/video?hwyfgn45r	8	lorem eu metus. In	2023-02-12 12:17:05	8
1092	https://vk.ru/video?qesjsyjr	6	tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare,	2022-07-24 14:15:56	6
1093	http://vk.com/video?er	3	odio. Nam interdum enim non nisi.	2021-11-09 20:15:12	8
1094	http://vk.ru/video?wr	5	mi pede, nonummy ut, molestie in, tempus	2021-12-10 23:41:12	9
1095	http://vk.ru/video?rgw56jkw56h	8	lacus pede sagittis augue, eu	2022-07-27 17:23:32	8
1096	https://vk.ru/video?5eft	3	penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin	2022-02-13 23:27:50	7
1097	http://vk.ru/video?w356	5	dapibus gravida. Aliquam tincidunt, nunc ac	2022-12-09 16:38:00	8
1098	http://vk.ru/video?rg	9	velit. Sed	2023-02-11 11:30:56	1
1099	http://vk.ru/video?hw256ujwrgjq	0	nibh. Aliquam ornare, libero at auctor ullamcorper, nisl	2022-11-24 05:35:47	2
1100	https://vk.com/video?56feu	9	metus vitae velit egestas lacinia. Sed congue, elit sed	2021-09-02 16:12:19	3
1101	https://vk.ru/video?v1/	4	mauris ut mi. Duis risus odio, auctor vitae, aliquet nec,	2021-09-27 02:38:21	8
1102	http://vk.ru/video?rgh	8	vulputate, nisi sem semper erat,	2022-03-17 21:00:13	5
1103	https://vk.com/video?6	5	metus. In nec orci. Donec	2022-07-02 05:11:12	8
1104	http://vk.ru/video?j	3	Curabitur massa.	2022-02-11 21:15:24	1
1105	https://vk.ru/videoeeg?5we6ffwegewfu	5	dui. Cum sociis natoque penatibus et magnis dis	2022-06-16 06:56:57	2
1106	https://vk.com/video?jw	10	convallis ligula. Donec luctus aliquet odio.	2021-10-28 10:25:31	4
1107	http://vk.com/video?qesyjhgtyr	2	interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh	2022-11-29 20:05:34	1
1108	https://vk.ru/video?qe24tjh	4	neque sed dictum eleifend, nunc risus varius orci,	2022-10-02 04:50:36	7
1109	https://vk.ru/video?wr	9	quam.	2023-02-01 02:09:39	10
1110	https://vk.ru/video?qe	4	Nam ligula elit,	2022-04-06 08:48:26	4
1111	http://vk.ru/video?356u	3	volutpat.	2023-02-10 15:39:37	7
1112	http://vk.ru/video?jw	8	dignissim magna	2023-04-16 14:29:48	3
1113	http://vk.ru/video?q4	9	in faucibus orci luctus et ultrices	2022-11-05 18:51:23	3
1114	http://vk.com/video?aerg	5	ut, molestie in,	2022-12-15 08:35:29	8
1115	http://vk.ru/video?35	1	Aliquam auctor, velit eget laoreet posuere, enim nisl elementum	2023-07-22 21:10:41	5
1116	https://vk.com/video?jw5	7	euismod est arcu ac orci. Ut	2021-10-27 15:08:16	4
1117	https://vk.com/video?aerg	3	per inceptos hymenaeos.	2023-07-28 13:13:06	2
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pql_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 10, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pql_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 100, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pql_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 10, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pql_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pql_user
--

SELECT pg_catalog.setval('public.photo_id_seq', 1287, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pql_user
--

SELECT pg_catalog.setval('public.users_id_seq', 102, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pql_user
--

SELECT pg_catalog.setval('public.video_id_seq', 1117, true);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: subscribes_on_community subscribes_on_community_pkey; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.subscribes_on_community
    ADD CONSTRAINT subscribes_on_community_pkey PRIMARY KEY (subscripsi_community_id, subscriber_id);


--
-- Name: subscribes_on_user subscribes_on_user_pkey; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.subscribes_on_user
    ADD CONSTRAINT subscribes_on_user_pkey PRIMARY KEY (subscripsi_user_id, subscriber_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: pql_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

