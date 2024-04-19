--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 15.6

-- Started on 2024-04-19 10:18:44

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
-- TOC entry 214 (class 1259 OID 16815)
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    id_commande integer NOT NULL,
    date_commande date,
    prix_total double precision,
    id_fournisseur integer,
    prix_payer double precision DEFAULT 0.0,
    statut character varying DEFAULT 'En cours'::character varying
);


ALTER TABLE public.commande OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16818)
-- Name: commande_id_commande_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commande_id_commande_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commande_id_commande_seq OWNER TO postgres;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 215
-- Name: commande_id_commande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commande_id_commande_seq OWNED BY public.commande.id_commande;


--
-- TOC entry 216 (class 1259 OID 16819)
-- Name: fournisseur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fournisseur (
    id_fournisseur integer NOT NULL,
    nom_fournisseur character varying,
    adresse_fournisseur character varying,
    tel_fournisseur integer
);


ALTER TABLE public.fournisseur OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16824)
-- Name: fournisseur_id_fournisseur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fournisseur_id_fournisseur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fournisseur_id_fournisseur_seq OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 217
-- Name: fournisseur_id_fournisseur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fournisseur_id_fournisseur_seq OWNED BY public.fournisseur.id_fournisseur;


--
-- TOC entry 218 (class 1259 OID 16825)
-- Name: lignecommande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lignecommande (
    id_medicament integer NOT NULL,
    id_commande integer NOT NULL,
    qt_vente integer,
    qt_recu double precision DEFAULT 0.0
);


ALTER TABLE public.lignecommande OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16828)
-- Name: lignevente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lignevente (
    id_vente integer NOT NULL,
    id_medicament integer NOT NULL,
    qt integer
);


ALTER TABLE public.lignevente OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16831)
-- Name: listeprix; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.listeprix (
    id_fournisseur integer NOT NULL,
    id_medicament integer NOT NULL,
    prix_unitaire double precision,
    qt integer,
    prix_vente double precision
);


ALTER TABLE public.listeprix OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16834)
-- Name: medicament; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicament (
    id_medicament integer NOT NULL,
    nom_medicament character varying,
    famille character varying,
    ordonnance boolean,
    prix_vente double precision,
    qt_stock integer,
    qt_min integer,
    qt_max integer,
    seuil_commande integer,
    unite character varying,
    id_fournisseur integer
);


ALTER TABLE public.medicament OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16839)
-- Name: medicament_id_medicament_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicament_id_medicament_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicament_id_medicament_seq OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 222
-- Name: medicament_id_medicament_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicament_id_medicament_seq OWNED BY public.medicament.id_medicament;


--
-- TOC entry 223 (class 1259 OID 16840)
-- Name: prescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescription (
    id_prescription integer NOT NULL,
    nom_medecin character varying,
    date_prescription date,
    nom_patient character varying
);


ALTER TABLE public.prescription OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16845)
-- Name: prescription_id_prescription_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prescription_id_prescription_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescription_id_prescription_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 224
-- Name: prescription_id_prescription_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prescription_id_prescription_seq OWNED BY public.prescription.id_prescription;


--
-- TOC entry 225 (class 1259 OID 16846)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    id_utilisateur integer NOT NULL,
    nom_utilisateur character varying,
    prenom_utilisateur character varying,
    annif_utilisateur date,
    adresse_utilisateur character varying,
    tel_utilisateur integer,
    identifiant character varying,
    mot_de_passe character varying,
    role character varying,
    actif boolean,
    bloquer boolean
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16851)
-- Name: utilisateur_id_utilisateur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateur_id_utilisateur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilisateur_id_utilisateur_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 226
-- Name: utilisateur_id_utilisateur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilisateur_id_utilisateur_seq OWNED BY public.utilisateur.id_utilisateur;


--
-- TOC entry 227 (class 1259 OID 16852)
-- Name: vente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vente (
    id_vente integer NOT NULL,
    date_vente date,
    prix_total double precision,
    payer boolean,
    id_prescription integer
);


ALTER TABLE public.vente OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16855)
-- Name: vente_id_vente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vente_id_vente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vente_id_vente_seq OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 228
-- Name: vente_id_vente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vente_id_vente_seq OWNED BY public.vente.id_vente;


--
-- TOC entry 3210 (class 2604 OID 16856)
-- Name: commande id_commande; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande ALTER COLUMN id_commande SET DEFAULT nextval('public.commande_id_commande_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 16857)
-- Name: fournisseur id_fournisseur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fournisseur ALTER COLUMN id_fournisseur SET DEFAULT nextval('public.fournisseur_id_fournisseur_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 16858)
-- Name: medicament id_medicament; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicament ALTER COLUMN id_medicament SET DEFAULT nextval('public.medicament_id_medicament_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 16859)
-- Name: prescription id_prescription; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescription ALTER COLUMN id_prescription SET DEFAULT nextval('public.prescription_id_prescription_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 16860)
-- Name: utilisateur id_utilisateur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id_utilisateur SET DEFAULT nextval('public.utilisateur_id_utilisateur_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 16861)
-- Name: vente id_vente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vente ALTER COLUMN id_vente SET DEFAULT nextval('public.vente_id_vente_seq'::regclass);


--
-- TOC entry 3388 (class 0 OID 16815)
-- Dependencies: 214
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commande (id_commande, date_commande, prix_total, id_fournisseur, prix_payer, statut) FROM stdin;
1	2024-02-10	45.5	1	0	En cours
2	2024-02-11	30.99	2	0	En cours
4	\N	1000	8	0	En cours
3	\N	1000	8	1000	Terminée
\.


--
-- TOC entry 3390 (class 0 OID 16819)
-- Dependencies: 216
-- Data for Name: fournisseur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fournisseur (id_fournisseur, nom_fournisseur, adresse_fournisseur, tel_fournisseur) FROM stdin;
1	Fournisseur A	789 Rue du Commerce	555666777
2	Fournisseur B	987 Avenue des Affaires	111222333
3	Fitia	36 Avenu Trianon	123456
8	Nandrian	Quatre Bornes	55123456
\.


--
-- TOC entry 3392 (class 0 OID 16825)
-- Dependencies: 218
-- Data for Name: lignecommande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lignecommande (id_medicament, id_commande, qt_vente, qt_recu) FROM stdin;
1	1	20	0
2	1	30	0
2	2	10	0
4	4	100	0
4	3	100	100
\.


--
-- TOC entry 3393 (class 0 OID 16828)
-- Dependencies: 219
-- Data for Name: lignevente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lignevente (id_vente, id_medicament, qt) FROM stdin;
1	1	2
1	2	1
2	2	3
4	4	5
5	4	1
8	4	1
9	1	10
9	4	1
\.


--
-- TOC entry 3394 (class 0 OID 16831)
-- Dependencies: 220
-- Data for Name: listeprix; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.listeprix (id_fournisseur, id_medicament, prix_unitaire, qt, prix_vente) FROM stdin;
1	1	4.5	50	6.99
2	2	2.99	30	3.49
8	4	10	40	50
3	3	20	40	50
2	4	5	40	50
\.


--
-- TOC entry 3395 (class 0 OID 16834)
-- Dependencies: 221
-- Data for Name: medicament; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicament (id_medicament, nom_medicament, famille, ordonnance, prix_vente, qt_stock, qt_min, qt_max, seuil_commande, unite, id_fournisseur) FROM stdin;
1	Paracétamol	Antalgique	f	5.99	100	20	150	30	boîte	1
3	Vitamine C	Vitamine	f	50	10	11	100	20	comprime	3
2	Aspirine	Anticoagulant	f	3.49	70	15	120	25	boîte	2
5	Doliprane	Antalgique	f	5	90	40	150	30	boite	1
4	Smecta	Anti douleur	t	50	7	10	120	10	Sachet	2
\.


--
-- TOC entry 3397 (class 0 OID 16840)
-- Dependencies: 223
-- Data for Name: prescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prescription (id_prescription, nom_medecin, date_prescription, nom_patient) FROM stdin;
1	Dr. Smith	2024-02-07	Alice Johnson
2	Dr. Johnson	2024-02-08	Bob
3	DR. HP	2024-04-11	DELL
4	DR. DELL	2024-04-11	HP
5	DR. PHILIP	2024-04-05	TOM
6	DR. F	2024-04-18	T
\.


--
-- TOC entry 3399 (class 0 OID 16846)
-- Dependencies: 225
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateur (id_utilisateur, nom_utilisateur, prenom_utilisateur, annif_utilisateur, adresse_utilisateur, tel_utilisateur, identifiant, mot_de_passe, role, actif, bloquer) FROM stdin;
2	Smith	Jane	1985-05-15	456 Avenue des Fleurs	987654321	jane.smith	pass	caissier	t	f
3	Adam	Snow	1985-05-15	567 Avenue des Saint Jeans	987654321	adam.snow	pass	caissier	t	f
4	Pharmacien	doc	1990-01-01	Adresse	123456789	Pharmacien	admin	pharmacien	f	f
5	Vendeur	doc	1990-01-01	Adresse	123456789	Vendeur	vente	vendeur	f	f
\.


--
-- TOC entry 3401 (class 0 OID 16852)
-- Dependencies: 227
-- Data for Name: vente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vente (id_vente, date_vente, prix_total, payer, id_prescription) FROM stdin;
1	2024-02-08	15.99	t	1
2	2024-02-09	28.5	f	2
3	2024-04-10	10	f	\N
4	2024-04-11	250	f	3
5	2024-04-11	50	t	4
9	2024-04-18	109.9	f	6
8	2024-04-12	50	t	5
\.


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 215
-- Name: commande_id_commande_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commande_id_commande_seq', 2, true);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 217
-- Name: fournisseur_id_fournisseur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fournisseur_id_fournisseur_seq', 8, true);


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 222
-- Name: medicament_id_medicament_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicament_id_medicament_seq', 5, true);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 224
-- Name: prescription_id_prescription_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prescription_id_prescription_seq', 10, true);


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 226
-- Name: utilisateur_id_utilisateur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateur_id_utilisateur_seq', 5, true);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 228
-- Name: vente_id_vente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vente_id_vente_seq', 6, true);


--
-- TOC entry 3220 (class 2606 OID 16863)
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (id_commande);


--
-- TOC entry 3222 (class 2606 OID 16865)
-- Name: fournisseur fournisseur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fournisseur
    ADD CONSTRAINT fournisseur_pkey PRIMARY KEY (id_fournisseur);


--
-- TOC entry 3224 (class 2606 OID 16867)
-- Name: lignecommande lignecommande_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lignecommande
    ADD CONSTRAINT lignecommande_pkey PRIMARY KEY (id_medicament, id_commande);


--
-- TOC entry 3226 (class 2606 OID 16869)
-- Name: lignevente lignevente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lignevente
    ADD CONSTRAINT lignevente_pkey PRIMARY KEY (id_vente, id_medicament);


--
-- TOC entry 3228 (class 2606 OID 16871)
-- Name: listeprix listeprix_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listeprix
    ADD CONSTRAINT listeprix_pkey PRIMARY KEY (id_fournisseur, id_medicament);


--
-- TOC entry 3230 (class 2606 OID 16873)
-- Name: medicament medicament_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicament
    ADD CONSTRAINT medicament_pkey PRIMARY KEY (id_medicament);


--
-- TOC entry 3232 (class 2606 OID 16875)
-- Name: prescription prescription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescription
    ADD CONSTRAINT prescription_pkey PRIMARY KEY (id_prescription);


--
-- TOC entry 3234 (class 2606 OID 16877)
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id_utilisateur);


--
-- TOC entry 3236 (class 2606 OID 16879)
-- Name: vente vente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vente
    ADD CONSTRAINT vente_pkey PRIMARY KEY (id_vente);


--
-- TOC entry 3237 (class 2606 OID 16880)
-- Name: commande commande_id_fournisseur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_id_fournisseur_fkey FOREIGN KEY (id_fournisseur) REFERENCES public.fournisseur(id_fournisseur);


--
-- TOC entry 3238 (class 2606 OID 16885)
-- Name: lignecommande lignecommande_id_commande_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lignecommande
    ADD CONSTRAINT lignecommande_id_commande_fkey FOREIGN KEY (id_commande) REFERENCES public.commande(id_commande);


--
-- TOC entry 3239 (class 2606 OID 16890)
-- Name: lignecommande lignecommande_id_medicament_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lignecommande
    ADD CONSTRAINT lignecommande_id_medicament_fkey FOREIGN KEY (id_medicament) REFERENCES public.medicament(id_medicament);


--
-- TOC entry 3240 (class 2606 OID 16895)
-- Name: lignevente lignevente_id_medicament_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lignevente
    ADD CONSTRAINT lignevente_id_medicament_fkey FOREIGN KEY (id_medicament) REFERENCES public.medicament(id_medicament);


--
-- TOC entry 3241 (class 2606 OID 16900)
-- Name: lignevente lignevente_id_vente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lignevente
    ADD CONSTRAINT lignevente_id_vente_fkey FOREIGN KEY (id_vente) REFERENCES public.vente(id_vente);


--
-- TOC entry 3242 (class 2606 OID 16905)
-- Name: listeprix listeprix_id_fournisseur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listeprix
    ADD CONSTRAINT listeprix_id_fournisseur_fkey FOREIGN KEY (id_fournisseur) REFERENCES public.fournisseur(id_fournisseur);


--
-- TOC entry 3243 (class 2606 OID 16910)
-- Name: listeprix listeprix_id_medicament_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listeprix
    ADD CONSTRAINT listeprix_id_medicament_fkey FOREIGN KEY (id_medicament) REFERENCES public.medicament(id_medicament);


--
-- TOC entry 3244 (class 2606 OID 16915)
-- Name: medicament medicament_id_fournisseur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicament
    ADD CONSTRAINT medicament_id_fournisseur_fkey FOREIGN KEY (id_fournisseur) REFERENCES public.fournisseur(id_fournisseur);


--
-- TOC entry 3245 (class 2606 OID 16920)
-- Name: vente vente_id_prescription_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vente
    ADD CONSTRAINT vente_id_prescription_fkey FOREIGN KEY (id_prescription) REFERENCES public.prescription(id_prescription);


-- Completed on 2024-04-19 10:18:44

--
-- PostgreSQL database dump complete
--

