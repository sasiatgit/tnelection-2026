--
-- PostgreSQL database dump
--

\restrict 1ZkDlCG7sra6sJz342ZfwpigZw6me1k6zJcGrDlKHvJKQEJfTX2eC1wAjmDIUXx

-- Dumped from database version 18.3 (Homebrew)
-- Dumped by pg_dump version 18.3 (Homebrew)

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
-- Name: constituencies; Type: TABLE; Schema: public; Owner: sasikumarkarikalan
--

CREATE TABLE public.constituencies (
    no integer NOT NULL,
    constituency text NOT NULL,
    district text NOT NULL
);


ALTER TABLE public.constituencies OWNER TO sasikumarkarikalan;

--
-- Name: survey_results; Type: TABLE; Schema: public; Owner: sasikumarkarikalan
--

CREATE TABLE public.survey_results (
    constituency_no integer NOT NULL,
    source_id integer NOT NULL,
    dmk numeric(5,2) NOT NULL,
    admk numeric(5,2) NOT NULL,
    tvk numeric(5,2) NOT NULL,
    ntk numeric(5,2) NOT NULL,
    others numeric(5,2) DEFAULT 0 NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.survey_results OWNER TO sasikumarkarikalan;

--
-- Name: survey_sources; Type: TABLE; Schema: public; Owner: sasikumarkarikalan
--

CREATE TABLE public.survey_sources (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.survey_sources OWNER TO sasikumarkarikalan;

--
-- Name: survey_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: sasikumarkarikalan
--

CREATE SEQUENCE public.survey_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.survey_sources_id_seq OWNER TO sasikumarkarikalan;

--
-- Name: survey_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sasikumarkarikalan
--

ALTER SEQUENCE public.survey_sources_id_seq OWNED BY public.survey_sources.id;


--
-- Name: survey_winner_predictions; Type: TABLE; Schema: public; Owner: sasikumarkarikalan
--

CREATE TABLE public.survey_winner_predictions (
    constituency_no integer NOT NULL,
    source_id integer NOT NULL,
    winner_label text NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.survey_winner_predictions OWNER TO sasikumarkarikalan;

--
-- Name: survey_sources id; Type: DEFAULT; Schema: public; Owner: sasikumarkarikalan
--

ALTER TABLE ONLY public.survey_sources ALTER COLUMN id SET DEFAULT nextval('public.survey_sources_id_seq'::regclass);


--
-- Data for Name: constituencies; Type: TABLE DATA; Schema: public; Owner: sasikumarkarikalan
--

COPY public.constituencies (no, constituency, district) FROM stdin;
52	Bargur	Krishnagiri
53	Krishnagiri	Krishnagiri
54	Veppanahalli	Krishnagiri
55	Hosur	Krishnagiri
56	Thalli	Krishnagiri
57	Palacode	Dharmapuri
58	Pennagaram	Dharmapuri
59	Dharmapuri	Dharmapuri
60	Pappireddippatti	Dharmapuri
61	Harur	Dharmapuri
62	Chengam	Tiruvannamalai
63	Tiruvannamalai	Tiruvannamalai
64	Kilpennathur	Tiruvannamalai
65	Kalasapakkam	Tiruvannamalai
66	Polur	Tiruvannamalai
67	Arani	Tiruvannamalai
68	Cheyyar	Tiruvannamalai
69	Vandavasi	Tiruvannamalai
70	Gingee	Viluppuram
71	Mailam	Viluppuram
72	Tindivanam	Viluppuram
73	Vanur	Viluppuram
74	Villupuram	Viluppuram
75	Vikravandi	Viluppuram
76	Tirukkoyilur	Viluppuram
77	Ulundurpettai	Kallakurichi
78	Rishivandiyam	Kallakurichi
79	Sankarapuram	Kallakurichi
80	Kallakurichi	Kallakurichi
81	Gangavalli	Salem
83	Yercaud	Salem
84	Omalur	Salem
85	Mettur	Salem
86	Edappadi	Salem
87	Sankari	Salem
88	Salem (West)	Salem
89	Salem (North)	Salem
90	Salem (South)	Salem
91	Veerapandi	Salem
92	Rasipuram	Namakkal
93	Senthamangalam	Namakkal
94	Namakkal	Namakkal
95	Paramathi Velur	Namakkal
96	Tiruchengodu	Namakkal
97	Kumarapalayam	Namakkal
98	Erode (East)	Erode
99	Erode (West)	Erode
100	Modakkurichi	Erode
101	Dharapuram	Tiruppur
102	Kangayam	Tiruppur
103	Perundurai	Erode
104	Bhavani	Erode
105	Anthiyur	Erode
106	Gobichettipalayam	Erode
107	Bhavanisagar	Erode
108	Udhagamandalam	The Nilgiris
109	Gudalur	The Nilgiris
110	Coonoor	The Nilgiris
111	Mettupalayam	Coimbatore
112	Avanashi	Tiruppur
113	Tiruppur (North)	Tiruppur
114	Tiruppur (South)	Tiruppur
115	Palladam	Tiruppur
116	Sulur	Coimbatore
117	Kavundampalayam	Coimbatore
118	Coimbatore (North)	Coimbatore
119	Thondamuthur	Coimbatore
120	Coimbatore (South)	Coimbatore
121	Singanallur	Coimbatore
122	Kinathukadavu	Coimbatore
123	Pollachi	Coimbatore
124	Valparai	Coimbatore
125	Udumalaipettai	Tiruppur
126	Madathukulam	Tiruppur
127	Palani	Dindigul
128	Oddanchatram	Dindigul
129	Athoor	Dindigul
130	Nilakottai	Dindigul
131	Natham	Dindigul
132	Dindigul	Dindigul
133	Vedasandur	Dindigul
134	Aravakurichi	Karur
135	Karur	Karur
136	Krishnarayapuram	Karur
137	Kulithalai	Karur
138	Manapaarai	Tiruchirappalli
139	Srirangam	Tiruchirappalli
140	Tiruchirappalli (West)	Tiruchirappalli
141	Tiruchirappalli (East)	Tiruchirappalli
142	Thiruverumbur	Tiruchirappalli
143	Lalgudi	Tiruchirappalli
144	Manachanallur	Tiruchirappalli
145	Musiri	Tiruchirappalli
146	Thuraiyur	Tiruchirappalli
147	Perambalur	Perambalur
148	Kunnam	Perambalur
149	Ariyalur	Ariyalur
150	Jayankondam	Ariyalur
151	Tittakudi	Cuddalore
152	Virudhachalam	Cuddalore
153	Neyveli	Cuddalore
154	Panruti	Cuddalore
155	Cuddalore	Cuddalore
156	Kurinjipadi	Cuddalore
157	Bhuvanagiri	Cuddalore
158	Chidambaram	Cuddalore
159	Kattumannarkoil	Cuddalore
160	Sirkazhi	Mayiladuthurai
161	Mayiladuthurai	Mayiladuthurai
162	Poompuhar	Mayiladuthurai
163	Nagapattinam	Nagapattinam
164	Kilvelur	Nagapattinam
165	Vedaranyam	Nagapattinam
166	Thiruthuraipoondi	Tiruvarur
167	Mannargudi	Tiruvarur
168	Thiruvarur	Tiruvarur
169	Nannilam	Tiruvarur
170	Thiruvidaimarudur	Thanjavur
171	Kumbakonam	Thanjavur
172	Papanasam	Thanjavur
173	Thiruvaiyaru	Thanjavur
174	Thanjavur	Thanjavur
175	Orathanadu	Thanjavur
176	Pattukkottai	Thanjavur
177	Peravurani	Thanjavur
178	Gandarvakottai	Pudukkottai
179	Viralimalai	Pudukkottai
180	Pudukkottai	Pudukkottai
181	Thirumayam	Pudukkottai
182	Alangudi	Pudukkottai
183	Aranthangi	Pudukkottai
184	Karaikudi	Sivaganga
185	Tiruppattur	Sivaganga
186	Sivaganga	Sivaganga
187	Manamadurai	Sivaganga
188	Melur	Madurai
189	Madurai East	Madurai
190	Sholavandan	Madurai
191	Madurai North	Madurai
192	Madurai South	Madurai
193	Madurai Central	Madurai
1	Gummidipoondi	Tiruvallur
2	Ponneri	Tiruvallur
3	Tiruttani	Tiruvallur
4	Thiruvallur	Tiruvallur
5	Poonamallee	Tiruvallur
6	Avadi	Tiruvallur
7	Maduravoyal	Tiruvallur
8	Ambattur	Tiruvallur
9	Madavaram	Tiruvallur
10	Thiruvottiyur	Tiruvallur
11	Dr. Radhakrishnan Nagar	Chennai
12	Perambur	Chennai
13	Kolathur	Chennai
14	Villivakkam	Chennai
15	Thiru-Vi-Ka-Nagar	Chennai
16	Egmore	Chennai
17	Royapuram	Chennai
18	Harbour	Chennai
19	Chepauk-Thiruvallikeni	Chennai
20	Thousand Lights	Chennai
21	Anna Nagar	Chennai
22	Virugampakkam	Chennai
23	Saidapet	Chennai
24	Thiyagarayanagar	Chennai
25	Mylapore	Chennai
26	Velachery	Chennai
27	Sholinganallur	Chengalpattu
28	Alandur	Kancheepuram
29	Sriperumbudur	Kancheepuram
30	Pallavaram	Chengalpattu
31	Tambaram	Chengalpattu
32	Chengalpattu	Chengalpattu
33	Thiruporur	Chengalpattu
34	Cheyyur	Chengalpattu
35	Madurantakam	Chengalpattu
36	Uthiramerur	Kancheepuram
37	Kancheepuram	Kancheepuram
38	Arakkonam	Ranipet
39	Sholingur	Ranipet
40	Katpadi	Vellore
41	Ranipet	Ranipet
42	Arcot	Ranipet
43	Vellore	Vellore
44	Anaikattu	Vellore
45	Kilvaithinankuppam	Vellore
46	Gudiyatham	Vellore
47	Vaniyambadi	Thirupathur
48	Ambur	Thirupathur
49	Jolarpet	Thirupathur
50	Tiruppattur	Thirupathur
51	Uthangarai	Krishnagiri
82	Attur	Salem
194	Madurai West	Madurai
195	Thiruparankundram	Madurai
196	Thirumangalam	Madurai
197	Usilampatti	Madurai
198	Andipatti	Theni
199	Periyakulam	Theni
200	Bodinayakanur	Theni
201	Cumbum	Theni
202	Rajapalayam	Virudhunagar
203	Srivilliputhur	Virudhunagar
204	Sattur	Virudhunagar
205	Sivakasi	Virudhunagar
206	Virudhunagar	Virudhunagar
207	Aruppukkottai	Virudhunagar
208	Tiruchuli	Virudhunagar
209	Paramakudi	Ramanathapuram
210	Tiruvadanai	Ramanathapuram
211	Ramanathapuram	Ramanathapuram
212	Mudhukulathur	Ramanathapuram
213	Vilathikulam	Thoothukkudi
214	Thoothukkudi	Thoothukkudi
215	Tiruchendur	Thoothukkudi
216	Srivaikuntam	Thoothukkudi
217	Ottapidaram	Thoothukkudi
218	Kovilpatti	Thoothukkudi
219	Sankarankovil	Tenkasi
220	Vasudevanallur	Tenkasi
221	Kadayanallur	Tenkasi
222	Tenkasi	Tenkasi
223	Alangulam	Tenkasi
224	Tirunelveli	Tirunelveli
225	Ambasamudram	Tirunelveli
226	Palayamkottai	Tirunelveli
227	Nanguneri	Tirunelveli
228	Radhapuram	Tirunelveli
229	Kanniyakumari	Kanniyakumari
230	Nagercoil	Kanniyakumari
231	Colachal	Kanniyakumari
232	Padmanabhapuram	Kanniyakumari
233	Vilavancode	Kanniyakumari
234	Killiyoor	Kanniyakumari
\.


--
-- Data for Name: survey_results; Type: TABLE DATA; Schema: public; Owner: sasikumarkarikalan
--

COPY public.survey_results (constituency_no, source_id, dmk, admk, tvk, ntk, others, updated_at) FROM stdin;
1	1	35.00	34.00	25.00	3.00	3.00	2026-04-20 22:10:21.847625+05:30
1	2	35.00	34.00	25.00	3.00	3.00	2026-04-20 22:10:21.847625+05:30
1	3	35.00	34.00	25.00	3.00	3.00	2026-04-20 22:10:21.847625+05:30
1	4	35.00	34.00	25.00	3.00	3.00	2026-04-20 22:10:21.847625+05:30
1	5	35.00	34.00	25.00	3.00	3.00	2026-04-20 22:10:21.847625+05:30
1	6	35.00	34.00	25.00	3.00	3.00	2026-04-20 22:10:21.847625+05:30
1	7	35.00	34.00	25.00	3.00	3.00	2026-04-20 22:10:21.847625+05:30
1	8	35.00	34.00	25.00	3.00	3.00	2026-04-20 22:10:21.847625+05:30
\.


--
-- Data for Name: survey_sources; Type: TABLE DATA; Schema: public; Owner: sasikumarkarikalan
--

COPY public.survey_sources (id, name) FROM stdin;
1	ThanthiTV
2	SathiyamTV
3	VikatanTV
4	News7
5	Puthiyathalamurai
6	News18
7	News24*7
8	Chanakya
\.


--
-- Data for Name: survey_winner_predictions; Type: TABLE DATA; Schema: public; Owner: sasikumarkarikalan
--

COPY public.survey_winner_predictions (constituency_no, source_id, winner_label, updated_at) FROM stdin;
1	3	Tough	2026-04-20 22:10:21.847625+05:30
1	4	Tough	2026-04-20 22:10:21.847625+05:30
1	5	DMK+	2026-04-20 22:10:21.847625+05:30
1	6	ADMK+	2026-04-20 22:10:21.847625+05:30
1	7	TVK	2026-04-20 22:10:21.847625+05:30
27	1	DMK+	2026-04-21 10:26:03.180178+05:30
13	1	DMK+	2026-04-21 10:26:03.180178+05:30
23	1	DMK+	2026-04-21 10:26:03.180178+05:30
19	1	DMK+	2026-04-21 10:26:03.180178+05:30
21	1	DMK+	2026-04-21 10:26:03.180178+05:30
152	1	DMK+	2026-04-21 10:26:03.180178+05:30
18	1	DMK+	2026-04-21 10:26:03.180178+05:30
206	1	DMK+	2026-04-21 10:26:03.180178+05:30
20	1	DMK+	2026-04-21 10:26:03.180178+05:30
16	1	DMK+	2026-04-21 10:26:03.180178+05:30
33	1	DMK+	2026-04-21 10:26:03.180178+05:30
204	1	DMK+	2026-04-21 10:26:03.180178+05:30
14	1	DMK+	2026-04-21 10:26:03.180178+05:30
86	1	ADMK+	2026-04-21 10:26:03.180178+05:30
26	1	ADMK+	2026-04-21 10:26:03.180178+05:30
155	1	ADMK+	2026-04-21 10:26:03.180178+05:30
30	1	ADMK+	2026-04-21 10:26:03.180178+05:30
110	1	ADMK+	2026-04-21 10:26:03.180178+05:30
113	1	ADMK+	2026-04-21 10:26:03.180178+05:30
24	1	ADMK+	2026-04-21 10:26:03.180178+05:30
102	1	ADMK+	2026-04-21 10:26:03.180178+05:30
118	1	ADMK+	2026-04-21 10:26:03.180178+05:30
112	1	ADMK+	2026-04-21 10:26:03.180178+05:30
12	1	TVK	2026-04-21 10:26:03.180178+05:30
55	1	Tough	2026-04-21 10:26:03.180178+05:30
54	1	Tough	2026-04-21 10:26:03.180178+05:30
52	1	Tough	2026-04-21 10:26:03.180178+05:30
48	1	Tough	2026-04-21 10:26:03.180178+05:30
205	1	Tough	2026-04-21 10:26:03.180178+05:30
184	1	Tough	2026-04-21 10:26:03.180178+05:30
25	1	Tough	2026-04-21 10:26:03.180178+05:30
141	1	Tough	2026-04-21 10:26:03.180178+05:30
106	1	Tough	2026-04-21 10:26:03.180178+05:30
96	1	Tough	2026-04-21 10:26:03.180178+05:30
120	1	Tough	2026-04-21 10:26:03.180178+05:30
129	1	DMK+	2026-04-21 10:39:38.465038+05:30
128	1	DMK+	2026-04-21 10:39:38.465038+05:30
200	1	DMK+	2026-04-21 10:39:38.465038+05:30
190	1	DMK+	2026-04-21 10:39:38.465038+05:30
189	1	DMK+	2026-04-21 10:39:38.465038+05:30
193	1	DMK+	2026-04-21 10:39:38.465038+05:30
208	1	DMK+	2026-04-21 10:39:38.465038+05:30
207	1	DMK+	2026-04-21 10:39:38.465038+05:30
202	1	DMK+	2026-04-21 10:39:38.465038+05:30
211	1	DMK+	2026-04-21 10:39:38.465038+05:30
210	1	DMK+	2026-04-21 10:39:38.465038+05:30
212	1	DMK+	2026-04-21 10:39:38.465038+05:30
187	1	DMK+	2026-04-21 10:39:38.465038+05:30
185	1	DMK+	2026-04-21 10:39:38.465038+05:30
41	1	DMK+	2026-04-21 10:39:38.465038+05:30
42	1	DMK+	2026-04-21 10:39:38.465038+05:30
39	1	DMK+	2026-04-21 10:39:38.465038+05:30
140	1	DMK+	2026-04-21 10:39:38.465038+05:30
145	1	DMK+	2026-04-21 10:39:38.465038+05:30
148	1	DMK+	2026-04-21 10:39:38.465038+05:30
142	1	DMK+	2026-04-21 10:39:38.465038+05:30
180	1	DMK+	2026-04-21 10:39:38.465038+05:30
182	1	DMK+	2026-04-21 10:39:38.465038+05:30
101	1	DMK+	2026-04-21 10:39:38.465038+05:30
130	1	ADMK+	2026-04-21 10:39:38.465038+05:30
199	1	ADMK+	2026-04-21 10:39:38.465038+05:30
195	1	ADMK+	2026-04-21 10:39:38.465038+05:30
188	1	ADMK+	2026-04-21 10:39:38.465038+05:30
131	1	ADMK+	2026-04-21 10:39:38.465038+05:30
197	1	ADMK+	2026-04-21 10:39:38.465038+05:30
194	1	ADMK+	2026-04-21 10:39:38.465038+05:30
203	1	ADMK+	2026-04-21 10:39:38.465038+05:30
186	1	ADMK+	2026-04-21 10:39:38.465038+05:30
38	1	ADMK+	2026-04-21 10:39:38.465038+05:30
147	1	ADMK+	2026-04-21 10:39:38.465038+05:30
139	1	ADMK+	2026-04-21 10:39:38.465038+05:30
138	1	ADMK+	2026-04-21 10:39:38.465038+05:30
133	1	Tough	2026-04-21 10:39:38.465038+05:30
132	1	Tough	2026-04-21 10:39:38.465038+05:30
198	1	Tough	2026-04-21 10:39:38.465038+05:30
192	1	Tough	2026-04-21 10:39:38.465038+05:30
127	1	Tough	2026-04-21 10:39:38.465038+05:30
201	1	Tough	2026-04-21 10:39:38.465038+05:30
196	1	Tough	2026-04-21 10:39:38.465038+05:30
191	1	Tough	2026-04-21 10:39:38.465038+05:30
209	1	Tough	2026-04-21 10:39:38.465038+05:30
149	1	Tough	2026-04-21 10:39:38.465038+05:30
150	1	Tough	2026-04-21 10:39:38.465038+05:30
143	1	Tough	2026-04-21 10:39:38.465038+05:30
146	1	Tough	2026-04-21 10:39:38.465038+05:30
144	1	Tough	2026-04-21 10:39:38.465038+05:30
178	1	DMK+	2026-04-21 10:46:53.622692+05:30
92	1	DMK+	2026-04-21 10:46:53.622692+05:30
174	1	DMK+	2026-04-21 10:46:53.622692+05:30
166	1	DMK+	2026-04-21 10:46:53.622692+05:30
167	1	DMK+	2026-04-21 10:46:53.622692+05:30
159	1	DMK+	2026-04-21 10:46:53.622692+05:30
168	1	DMK+	2026-04-21 10:46:53.622692+05:30
156	1	DMK+	2026-04-21 10:46:53.622692+05:30
111	1	ADMK+	2026-04-21 10:46:53.622692+05:30
121	1	ADMK+	2026-04-21 10:46:53.622692+05:30
124	1	ADMK+	2026-04-21 10:46:53.622692+05:30
117	1	ADMK+	2026-04-21 10:46:53.622692+05:30
116	1	ADMK+	2026-04-21 10:46:53.622692+05:30
123	1	ADMK+	2026-04-21 10:46:53.622692+05:30
179	1	ADMK+	2026-04-21 10:46:53.622692+05:30
125	1	ADMK+	2026-04-21 10:46:53.622692+05:30
87	1	ADMK+	2026-04-21 10:46:53.622692+05:30
165	1	ADMK+	2026-04-21 10:46:53.622692+05:30
97	1	ADMK+	2026-04-21 10:46:53.622692+05:30
107	1	ADMK+	2026-04-21 10:46:53.622692+05:30
93	1	ADMK+	2026-04-21 10:46:53.622692+05:30
183	1	Tough	2026-04-21 10:46:53.622692+05:30
126	1	Tough	2026-04-21 10:46:53.622692+05:30
94	1	Tough	2026-04-21 10:46:53.622692+05:30
172	1	Tough	2026-04-21 10:46:53.622692+05:30
181	1	Tough	2026-04-21 10:46:53.622692+05:30
104	1	Tough	2026-04-21 10:46:53.622692+05:30
95	1	Tough	2026-04-21 10:46:53.622692+05:30
176	1	Tough	2026-04-21 10:46:53.622692+05:30
76	1	DMK+	2026-04-21 11:12:04.128112+05:30
70	1	DMK+	2026-04-21 11:12:04.128112+05:30
78	1	DMK+	2026-04-21 11:12:04.128112+05:30
40	1	DMK+	2026-04-21 11:12:04.128112+05:30
74	1	DMK+	2026-04-21 11:12:04.128112+05:30
79	1	DMK+	2026-04-21 11:12:04.128112+05:30
44	1	DMK+	2026-04-21 11:12:04.128112+05:30
60	1	DMK+	2026-04-21 11:12:04.128112+05:30
56	1	DMK+	2026-04-21 11:12:04.128112+05:30
63	1	DMK+	2026-04-21 11:12:04.128112+05:30
61	1	DMK+	2026-04-21 11:12:04.128112+05:30
50	1	DMK+	2026-04-21 11:12:04.128112+05:30
69	1	DMK+	2026-04-21 11:12:04.128112+05:30
1	2	DMK+	2026-04-21 12:49:24.606726+05:30
1	8	Tough	2026-04-21 13:07:02.069066+05:30
66	1	DMK+	2026-04-21 11:12:04.128112+05:30
64	1	DMK+	2026-04-21 11:12:04.128112+05:30
215	1	DMK+	2026-04-21 11:12:04.128112+05:30
68	1	DMK+	2026-04-21 11:12:04.128112+05:30
214	1	DMK+	2026-04-21 11:12:04.128112+05:30
213	1	DMK+	2026-04-21 11:12:04.128112+05:30
228	1	DMK+	2026-04-21 11:12:04.128112+05:30
226	1	DMK+	2026-04-21 11:12:04.128112+05:30
232	1	DMK+	2026-04-21 11:12:04.128112+05:30
137	1	DMK+	2026-04-21 11:12:04.128112+05:30
224	1	DMK+	2026-04-21 11:12:04.128112+05:30
234	1	DMK+	2026-04-21 11:12:04.128112+05:30
134	1	DMK+	2026-04-21 11:12:04.128112+05:30
36	1	DMK+	2026-04-21 11:12:04.128112+05:30
28	1	DMK+	2026-04-21 11:12:04.128112+05:30
6	1	DMK+	2026-04-21 11:12:04.128112+05:30
8	1	DMK+	2026-04-21 11:12:04.128112+05:30
5	1	DMK+	2026-04-21 11:12:04.128112+05:30
1	1	DMK+	2026-04-21 11:12:04.128112+05:30
99	1	DMK+	2026-04-21 11:12:04.128112+05:30
47	1	ADMK+	2026-04-21 11:12:04.128112+05:30
67	1	ADMK+	2026-04-21 11:12:04.128112+05:30
221	1	ADMK+	2026-04-21 11:12:04.128112+05:30
49	1	ADMK+	2026-04-21 11:12:04.128112+05:30
223	1	ADMK+	2026-04-21 11:12:04.128112+05:30
219	1	ADMK+	2026-04-21 11:12:04.128112+05:30
71	1	ADMK+	2026-04-21 11:12:04.128112+05:30
80	1	ADMK+	2026-04-21 11:12:04.128112+05:30
59	1	ADMK+	2026-04-21 11:12:04.128112+05:30
51	1	ADMK+	2026-04-21 11:12:04.128112+05:30
72	1	ADMK+	2026-04-21 11:12:04.128112+05:30
46	1	ADMK+	2026-04-21 11:12:04.128112+05:30
58	1	ADMK+	2026-04-21 11:12:04.128112+05:30
53	1	ADMK+	2026-04-21 11:12:04.128112+05:30
225	1	ADMK+	2026-04-21 11:12:04.128112+05:30
84	1	ADMK+	2026-04-21 11:12:04.128112+05:30
90	1	ADMK+	2026-04-21 11:12:04.128112+05:30
82	1	ADMK+	2026-04-21 11:12:04.128112+05:30
229	1	ADMK+	2026-04-21 11:12:04.128112+05:30
85	1	ADMK+	2026-04-21 11:12:04.128112+05:30
91	1	ADMK+	2026-04-21 11:12:04.128112+05:30
81	1	ADMK+	2026-04-21 11:12:04.128112+05:30
177	1	Tough	2026-04-21 11:12:04.128112+05:30
163	1	Tough	2026-04-21 11:12:04.128112+05:30
153	1	Tough	2026-04-21 11:12:04.128112+05:30
115	1	Tough	2026-04-21 11:12:04.128112+05:30
162	1	Tough	2026-04-21 11:12:04.128112+05:30
151	1	Tough	2026-04-21 11:12:04.128112+05:30
157	1	Tough	2026-04-21 11:12:04.128112+05:30
122	1	Tough	2026-04-21 11:12:04.128112+05:30
75	1	Tough	2026-04-21 11:12:04.128112+05:30
77	1	Tough	2026-04-21 11:12:04.128112+05:30
43	1	Tough	2026-04-21 11:12:04.128112+05:30
73	1	Tough	2026-04-21 11:12:04.128112+05:30
45	1	Tough	2026-04-21 11:12:04.128112+05:30
57	1	Tough	2026-04-21 11:12:04.128112+05:30
216	1	Tough	2026-04-21 11:12:04.128112+05:30
218	1	Tough	2026-04-21 11:12:04.128112+05:30
220	1	Tough	2026-04-21 11:12:04.128112+05:30
217	1	Tough	2026-04-21 11:12:04.128112+05:30
222	1	Tough	2026-04-21 11:12:04.128112+05:30
227	1	Tough	2026-04-21 11:12:04.128112+05:30
231	1	Tough	2026-04-21 11:12:04.128112+05:30
88	1	Tough	2026-04-21 11:12:04.128112+05:30
135	1	Tough	2026-04-21 11:12:04.128112+05:30
233	1	Tough	2026-04-21 11:12:04.128112+05:30
230	1	Tough	2026-04-21 11:12:04.128112+05:30
89	1	Tough	2026-04-21 11:12:04.128112+05:30
136	1	Tough	2026-04-21 11:12:04.128112+05:30
29	1	Tough	2026-04-21 11:12:04.128112+05:30
9	1	Tough	2026-04-21 11:12:04.128112+05:30
2	1	Tough	2026-04-21 11:12:04.128112+05:30
98	1	Tough	2026-04-21 11:12:04.128112+05:30
32	1	Tough	2026-04-21 11:12:04.128112+05:30
7	1	Tough	2026-04-21 11:12:04.128112+05:30
4	1	Tough	2026-04-21 11:12:04.128112+05:30
105	2	DMK+	2026-04-21 12:49:24.606726+05:30
107	2	DMK+	2026-04-21 12:49:24.606726+05:30
99	2	DMK+	2026-04-21 12:49:24.606726+05:30
103	2	DMK+	2026-04-21 12:49:24.606726+05:30
64	2	DMK+	2026-04-21 12:49:24.606726+05:30
63	2	DMK+	2026-04-21 12:49:24.606726+05:30
69	2	DMK+	2026-04-21 12:49:24.606726+05:30
207	2	DMK+	2026-04-21 12:49:24.606726+05:30
202	2	DMK+	2026-04-21 12:49:24.606726+05:30
208	2	DMK+	2026-04-21 12:49:24.606726+05:30
206	2	DMK+	2026-04-21 12:49:24.606726+05:30
129	2	DMK+	2026-04-21 12:49:24.606726+05:30
130	2	DMK+	2026-04-21 12:49:24.606726+05:30
128	2	DMK+	2026-04-21 12:49:24.606726+05:30
133	2	DMK+	2026-04-21 12:49:24.606726+05:30
60	2	DMK+	2026-04-21 12:49:24.606726+05:30
58	2	DMK+	2026-04-21 12:49:24.606726+05:30
214	2	DMK+	2026-04-21 12:49:24.606726+05:30
215	2	DMK+	2026-04-21 12:49:24.606726+05:30
213	2	DMK+	2026-04-21 12:49:24.606726+05:30
216	2	DMK+	2026-04-21 12:49:24.606726+05:30
144	2	DMK+	2026-04-21 12:49:24.606726+05:30
145	2	DMK+	2026-04-21 12:49:24.606726+05:30
142	2	DMK+	2026-04-21 12:49:24.606726+05:30
140	2	DMK+	2026-04-21 12:49:24.606726+05:30
159	2	DMK+	2026-04-21 12:49:24.606726+05:30
156	2	DMK+	2026-04-21 12:49:24.606726+05:30
153	2	DMK+	2026-04-21 12:49:24.606726+05:30
151	2	DMK+	2026-04-21 12:49:24.606726+05:30
152	2	DMK+	2026-04-21 12:49:24.606726+05:30
200	2	DMK+	2026-04-21 12:49:24.606726+05:30
199	2	DMK+	2026-04-21 12:49:24.606726+05:30
48	2	DMK+	2026-04-21 12:49:24.606726+05:30
227	2	DMK+	2026-04-21 12:49:24.606726+05:30
226	2	DMK+	2026-04-21 12:49:24.606726+05:30
224	2	DMK+	2026-04-21 12:49:24.606726+05:30
189	2	DMK+	2026-04-21 12:49:24.606726+05:30
191	2	DMK+	2026-04-21 12:49:24.606726+05:30
192	2	DMK+	2026-04-21 12:49:24.606726+05:30
190	2	DMK+	2026-04-21 12:49:24.606726+05:30
120	2	DMK+	2026-04-21 12:49:24.606726+05:30
27	2	DMK+	2026-04-21 12:49:24.606726+05:30
87	2	DMK+	2026-04-21 12:49:24.606726+05:30
91	2	DMK+	2026-04-21 12:49:24.606726+05:30
171	2	DMK+	2026-04-21 12:49:24.606726+05:30
177	2	DMK+	2026-04-21 12:49:24.606726+05:30
174	2	DMK+	2026-04-21 12:49:24.606726+05:30
173	2	DMK+	2026-04-21 12:49:24.606726+05:30
170	2	DMK+	2026-04-21 12:49:24.606726+05:30
187	2	DMK+	2026-04-21 12:49:24.606726+05:30
185	2	TVK	2026-04-21 12:49:24.606726+05:30
6	2	DMK+	2026-04-21 12:49:24.606726+05:30
3	2	DMK+	2026-04-21 12:49:24.606726+05:30
222	2	DMK+	2026-04-21 12:49:24.606726+05:30
163	2	DMK+	2026-04-21 12:49:24.606726+05:30
164	2	DMK+	2026-04-21 12:49:24.606726+05:30
41	2	DMK+	2026-04-21 12:49:24.606726+05:30
39	2	DMK+	2026-04-21 12:49:24.606726+05:30
231	2	DMK+	2026-04-21 12:49:24.606726+05:30
234	2	DMK+	2026-04-21 12:49:24.606726+05:30
230	2	DMK+	2026-04-21 12:49:24.606726+05:30
167	2	DMK+	2026-04-21 12:49:24.606726+05:30
166	2	DMK+	2026-04-21 12:49:24.606726+05:30
168	2	DMK+	2026-04-21 12:49:24.606726+05:30
94	2	DMK+	2026-04-21 12:49:24.606726+05:30
95	2	DMK+	2026-04-21 12:49:24.606726+05:30
92	2	DMK+	2026-04-21 12:49:24.606726+05:30
93	2	DMK+	2026-04-21 12:49:24.606726+05:30
96	2	DMK+	2026-04-21 12:49:24.606726+05:30
182	2	DMK+	2026-04-21 12:49:24.606726+05:30
183	2	DMK+	2026-04-21 12:49:24.606726+05:30
70	2	DMK+	2026-04-21 12:49:24.606726+05:30
76	2	DMK+	2026-04-21 12:49:24.606726+05:30
75	2	DMK+	2026-04-21 12:49:24.606726+05:30
74	2	DMK+	2026-04-21 12:49:24.606726+05:30
161	2	DMK+	2026-04-21 12:49:24.606726+05:30
44	2	DMK+	2026-04-21 12:49:24.606726+05:30
40	2	DMK+	2026-04-21 12:49:24.606726+05:30
108	2	DMK+	2026-04-21 12:49:24.606726+05:30
52	2	DMK+	2026-04-21 12:49:24.606726+05:30
51	2	DMK+	2026-04-21 12:49:24.606726+05:30
112	2	DMK+	2026-04-21 12:49:24.606726+05:30
126	2	DMK+	2026-04-21 12:49:24.606726+05:30
114	2	DMK+	2026-04-21 12:49:24.606726+05:30
21	2	DMK+	2026-04-21 12:49:24.606726+05:30
19	2	DMK+	2026-04-21 12:49:24.606726+05:30
18	2	DMK+	2026-04-21 12:49:24.606726+05:30
13	2	DMK+	2026-04-21 12:49:24.606726+05:30
23	2	DMK+	2026-04-21 12:49:24.606726+05:30
14	2	DMK+	2026-04-21 12:49:24.606726+05:30
20	2	DMK+	2026-04-21 12:49:24.606726+05:30
134	2	DMK+	2026-04-21 12:49:24.606726+05:30
135	2	DMK+	2026-04-21 12:49:24.606726+05:30
137	2	DMK+	2026-04-21 12:49:24.606726+05:30
78	2	DMK+	2026-04-21 12:49:24.606726+05:30
79	2	DMK+	2026-04-21 12:49:24.606726+05:30
148	2	DMK+	2026-04-21 12:49:24.606726+05:30
28	2	DMK+	2026-04-21 12:49:24.606726+05:30
37	2	DMK+	2026-04-21 12:49:24.606726+05:30
36	2	DMK+	2026-04-21 12:49:24.606726+05:30
104	2	ADMK+	2026-04-21 12:49:24.606726+05:30
98	2	ADMK+	2026-04-21 12:49:24.606726+05:30
100	2	ADMK+	2026-04-21 12:49:24.606726+05:30
66	2	ADMK+	2026-04-21 12:49:24.606726+05:30
68	2	ADMK+	2026-04-21 12:49:24.606726+05:30
65	2	ADMK+	2026-04-21 12:49:24.606726+05:30
209	2	ADMK+	2026-04-21 12:49:24.606726+05:30
210	2	ADMK+	2026-04-21 12:49:24.606726+05:30
205	2	ADMK+	2026-04-21 12:49:24.606726+05:30
203	2	ADMK+	2026-04-21 12:49:24.606726+05:30
131	2	ADMK+	2026-04-21 12:49:24.606726+05:30
61	2	ADMK+	2026-04-21 12:49:24.606726+05:30
57	2	ADMK+	2026-04-21 12:49:24.606726+05:30
59	2	ADMK+	2026-04-21 12:49:24.606726+05:30
218	2	ADMK+	2026-04-21 12:49:24.606726+05:30
146	2	ADMK+	2026-04-21 12:49:24.606726+05:30
157	2	ADMK+	2026-04-21 12:49:24.606726+05:30
155	2	ADMK+	2026-04-21 12:49:24.606726+05:30
154	2	ADMK+	2026-04-21 12:49:24.606726+05:30
47	2	ADMK+	2026-04-21 12:49:24.606726+05:30
225	2	ADMK+	2026-04-21 12:49:24.606726+05:30
194	2	ADMK+	2026-04-21 12:49:24.606726+05:30
188	2	ADMK+	2026-04-21 12:49:24.606726+05:30
195	2	ADMK+	2026-04-21 12:49:24.606726+05:30
196	2	ADMK+	2026-04-21 12:49:24.606726+05:30
197	2	ADMK+	2026-04-21 12:49:24.606726+05:30
117	2	ADMK+	2026-04-21 12:49:24.606726+05:30
122	2	ADMK+	2026-04-21 12:49:24.606726+05:30
123	2	ADMK+	2026-04-21 12:49:24.606726+05:30
121	2	ADMK+	2026-04-21 12:49:24.606726+05:30
119	2	ADMK+	2026-04-21 12:49:24.606726+05:30
34	2	ADMK+	2026-04-21 12:49:24.606726+05:30
30	2	ADMK+	2026-04-21 12:49:24.606726+05:30
82	2	ADMK+	2026-04-21 12:49:24.606726+05:30
86	2	ADMK+	2026-04-21 12:49:24.606726+05:30
81	2	ADMK+	2026-04-21 12:49:24.606726+05:30
85	2	ADMK+	2026-04-21 12:49:24.606726+05:30
84	2	ADMK+	2026-04-21 12:49:24.606726+05:30
83	2	ADMK+	2026-04-21 12:49:24.606726+05:30
172	2	ADMK+	2026-04-21 12:49:24.606726+05:30
2	2	ADMK+	2026-04-21 12:49:24.606726+05:30
5	2	ADMK+	2026-04-21 12:49:24.606726+05:30
219	2	ADMK+	2026-04-21 12:49:24.606726+05:30
220	2	ADMK+	2026-04-21 12:49:24.606726+05:30
165	2	ADMK+	2026-04-21 12:49:24.606726+05:30
38	2	ADMK+	2026-04-21 12:49:24.606726+05:30
233	2	ADMK+	2026-04-21 12:49:24.606726+05:30
229	2	ADMK+	2026-04-21 12:49:24.606726+05:30
169	2	ADMK+	2026-04-21 12:49:24.606726+05:30
97	2	ADMK+	2026-04-21 12:49:24.606726+05:30
71	2	ADMK+	2026-04-21 12:49:24.606726+05:30
73	2	ADMK+	2026-04-21 12:49:24.606726+05:30
162	2	ADMK+	2026-04-21 12:49:24.606726+05:30
160	2	ADMK+	2026-04-21 12:49:24.606726+05:30
46	2	ADMK+	2026-04-21 12:49:24.606726+05:30
45	2	ADMK+	2026-04-21 12:49:24.606726+05:30
43	2	ADMK+	2026-04-21 12:49:24.606726+05:30
55	2	ADMK+	2026-04-21 12:49:24.606726+05:30
53	2	ADMK+	2026-04-21 12:49:24.606726+05:30
54	2	ADMK+	2026-04-21 12:49:24.606726+05:30
115	2	ADMK+	2026-04-21 12:49:24.606726+05:30
113	2	ADMK+	2026-04-21 12:49:24.606726+05:30
125	2	ADMK+	2026-04-21 12:49:24.606726+05:30
11	2	ADMK+	2026-04-21 12:49:24.606726+05:30
17	2	ADMK+	2026-04-21 12:49:24.606726+05:30
15	2	ADMK+	2026-04-21 12:49:24.606726+05:30
22	2	ADMK+	2026-04-21 12:49:24.606726+05:30
26	2	ADMK+	2026-04-21 12:49:24.606726+05:30
24	2	ADMK+	2026-04-21 12:49:24.606726+05:30
77	2	ADMK+	2026-04-21 12:49:24.606726+05:30
106	2	Tough	2026-04-21 12:49:24.606726+05:30
67	2	Tough	2026-04-21 12:49:24.606726+05:30
62	2	Tough	2026-04-21 12:49:24.606726+05:30
212	2	Tough	2026-04-21 12:49:24.606726+05:30
211	2	Tough	2026-04-21 12:49:24.606726+05:30
204	2	Tough	2026-04-21 12:49:24.606726+05:30
132	2	Tough	2026-04-21 12:49:24.606726+05:30
127	2	Tough	2026-04-21 12:49:24.606726+05:30
217	2	Tough	2026-04-21 12:49:24.606726+05:30
143	2	Tough	2026-04-21 12:49:24.606726+05:30
138	2	Tough	2026-04-21 12:49:24.606726+05:30
139	2	Tough	2026-04-21 12:49:24.606726+05:30
141	2	Tough	2026-04-21 12:49:24.606726+05:30
158	2	Tough	2026-04-21 12:49:24.606726+05:30
198	2	Tough	2026-04-21 12:49:24.606726+05:30
201	2	Tough	2026-04-21 12:49:24.606726+05:30
49	2	Tough	2026-04-21 12:49:24.606726+05:30
228	2	Tough	2026-04-21 12:49:24.606726+05:30
193	2	Tough	2026-04-21 12:49:24.606726+05:30
118	2	Tough	2026-04-21 12:49:24.606726+05:30
111	2	Tough	2026-04-21 12:49:24.606726+05:30
116	2	Tough	2026-04-21 12:49:24.606726+05:30
124	2	Tough	2026-04-21 12:49:24.606726+05:30
32	2	Tough	2026-04-21 12:49:24.606726+05:30
35	2	Tough	2026-04-21 12:49:24.606726+05:30
31	2	Tough	2026-04-21 12:49:24.606726+05:30
33	2	Tough	2026-04-21 12:49:24.606726+05:30
89	2	Tough	2026-04-21 12:49:24.606726+05:30
90	2	Tough	2026-04-21 12:49:24.606726+05:30
88	2	Tough	2026-04-21 12:49:24.606726+05:30
175	2	Tough	2026-04-21 12:49:24.606726+05:30
176	2	Tough	2026-04-21 12:49:24.606726+05:30
186	2	Tough	2026-04-21 12:49:24.606726+05:30
8	2	Tough	2026-04-21 12:49:24.606726+05:30
9	2	Tough	2026-04-21 12:49:24.606726+05:30
7	2	Tough	2026-04-21 12:49:24.606726+05:30
4	2	Tough	2026-04-21 12:49:24.606726+05:30
10	2	Tough	2026-04-21 12:49:24.606726+05:30
223	2	Tough	2026-04-21 12:49:24.606726+05:30
221	2	Tough	2026-04-21 12:49:24.606726+05:30
42	2	Tough	2026-04-21 12:49:24.606726+05:30
232	2	Tough	2026-04-21 12:49:24.606726+05:30
178	2	Tough	2026-04-21 12:49:24.606726+05:30
180	2	Tough	2026-04-21 12:49:24.606726+05:30
181	2	Tough	2026-04-21 12:49:24.606726+05:30
179	2	Tough	2026-04-21 12:49:24.606726+05:30
72	2	Tough	2026-04-21 12:49:24.606726+05:30
110	2	Tough	2026-04-21 12:49:24.606726+05:30
109	2	Tough	2026-04-21 12:49:24.606726+05:30
56	2	Tough	2026-04-21 12:49:24.606726+05:30
101	2	Tough	2026-04-21 12:49:24.606726+05:30
102	2	Tough	2026-04-21 12:49:24.606726+05:30
16	2	Tough	2026-04-21 12:49:24.606726+05:30
12	2	Tough	2026-04-21 12:49:24.606726+05:30
25	2	Tough	2026-04-21 12:49:24.606726+05:30
136	2	Tough	2026-04-21 12:49:24.606726+05:30
80	2	Tough	2026-04-21 12:49:24.606726+05:30
147	2	Tough	2026-04-21 12:49:24.606726+05:30
29	2	Tough	2026-04-21 12:49:24.606726+05:30
184	2	TVK	2026-04-21 12:49:24.606726+05:30
\.


--
-- Name: survey_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sasikumarkarikalan
--

SELECT pg_catalog.setval('public.survey_sources_id_seq', 16, true);


--
-- Name: constituencies constituencies_pkey; Type: CONSTRAINT; Schema: public; Owner: sasikumarkarikalan
--

ALTER TABLE ONLY public.constituencies
    ADD CONSTRAINT constituencies_pkey PRIMARY KEY (no);


--
-- Name: survey_results survey_results_pkey; Type: CONSTRAINT; Schema: public; Owner: sasikumarkarikalan
--

ALTER TABLE ONLY public.survey_results
    ADD CONSTRAINT survey_results_pkey PRIMARY KEY (constituency_no, source_id);


--
-- Name: survey_sources survey_sources_name_key; Type: CONSTRAINT; Schema: public; Owner: sasikumarkarikalan
--

ALTER TABLE ONLY public.survey_sources
    ADD CONSTRAINT survey_sources_name_key UNIQUE (name);


--
-- Name: survey_sources survey_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: sasikumarkarikalan
--

ALTER TABLE ONLY public.survey_sources
    ADD CONSTRAINT survey_sources_pkey PRIMARY KEY (id);


--
-- Name: survey_winner_predictions survey_winner_predictions_pkey; Type: CONSTRAINT; Schema: public; Owner: sasikumarkarikalan
--

ALTER TABLE ONLY public.survey_winner_predictions
    ADD CONSTRAINT survey_winner_predictions_pkey PRIMARY KEY (constituency_no, source_id);


--
-- Name: survey_results survey_results_constituency_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sasikumarkarikalan
--

ALTER TABLE ONLY public.survey_results
    ADD CONSTRAINT survey_results_constituency_no_fkey FOREIGN KEY (constituency_no) REFERENCES public.constituencies(no) ON DELETE CASCADE;


--
-- Name: survey_results survey_results_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sasikumarkarikalan
--

ALTER TABLE ONLY public.survey_results
    ADD CONSTRAINT survey_results_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.survey_sources(id) ON DELETE CASCADE;


--
-- Name: survey_winner_predictions survey_winner_predictions_constituency_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sasikumarkarikalan
--

ALTER TABLE ONLY public.survey_winner_predictions
    ADD CONSTRAINT survey_winner_predictions_constituency_no_fkey FOREIGN KEY (constituency_no) REFERENCES public.constituencies(no) ON DELETE CASCADE;


--
-- Name: survey_winner_predictions survey_winner_predictions_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sasikumarkarikalan
--

ALTER TABLE ONLY public.survey_winner_predictions
    ADD CONSTRAINT survey_winner_predictions_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.survey_sources(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 1ZkDlCG7sra6sJz342ZfwpigZw6me1k6zJcGrDlKHvJKQEJfTX2eC1wAjmDIUXx

