--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-02 23:15:06

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
-- TOC entry 216 (class 1259 OID 66641)
-- Name: barang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.barang (
    id_barang integer NOT NULL,
    namabarang character varying(100) NOT NULL,
    hargabarang character varying(100) NOT NULL,
    jumlah integer NOT NULL
);


ALTER TABLE public.barang OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 66640)
-- Name: barang_id_barang_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.barang_id_barang_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.barang_id_barang_seq OWNER TO postgres;

--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 215
-- Name: barang_id_barang_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.barang_id_barang_seq OWNED BY public.barang.id_barang;


--
-- TOC entry 222 (class 1259 OID 66676)
-- Name: pengguna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pengguna (
    namapengguna character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    psswd character varying(100) NOT NULL,
    id_role integer NOT NULL,
    id_user integer NOT NULL
);


ALTER TABLE public.pengguna OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 74831)
-- Name: pengguna_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pengguna_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pengguna_id_user_seq OWNER TO postgres;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 223
-- Name: pengguna_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pengguna_id_user_seq OWNED BY public.pengguna.id_user;


--
-- TOC entry 218 (class 1259 OID 66648)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id_role integer NOT NULL,
    namarole character varying(25) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 66647)
-- Name: role_id_role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_role_seq OWNER TO postgres;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 217
-- Name: role_id_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_role_seq OWNED BY public.role.id_role;


--
-- TOC entry 220 (class 1259 OID 66655)
-- Name: transaksi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaksi (
    id_transaksi integer NOT NULL,
    tanggalwaktu timestamp without time zone NOT NULL,
    total bigint NOT NULL,
    id_user bigint NOT NULL,
    bayar bigint,
    kembali bigint
);


ALTER TABLE public.transaksi OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 66654)
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaksi_id_transaksi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaksi_id_transaksi_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 219
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksi_id_transaksi_seq OWNED BY public.transaksi.id_transaksi;


--
-- TOC entry 221 (class 1259 OID 66661)
-- Name: transaksidetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaksidetail (
    id_transaksi integer NOT NULL,
    id_barang integer NOT NULL,
    qty integer NOT NULL,
    total bigint NOT NULL,
    id_transaksidetail integer NOT NULL
);


ALTER TABLE public.transaksidetail OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 74844)
-- Name: transaksidetail_id_transaksidetail_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaksidetail_id_transaksidetail_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaksidetail_id_transaksidetail_seq OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 224
-- Name: transaksidetail_id_transaksidetail_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksidetail_id_transaksidetail_seq OWNED BY public.transaksidetail.id_transaksidetail;


--
-- TOC entry 4708 (class 2604 OID 66644)
-- Name: barang id_barang; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang ALTER COLUMN id_barang SET DEFAULT nextval('public.barang_id_barang_seq'::regclass);


--
-- TOC entry 4712 (class 2604 OID 74832)
-- Name: pengguna id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengguna ALTER COLUMN id_user SET DEFAULT nextval('public.pengguna_id_user_seq'::regclass);


--
-- TOC entry 4709 (class 2604 OID 66651)
-- Name: role id_role; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_role_seq'::regclass);


--
-- TOC entry 4710 (class 2604 OID 66658)
-- Name: transaksi id_transaksi; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi ALTER COLUMN id_transaksi SET DEFAULT nextval('public.transaksi_id_transaksi_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 74845)
-- Name: transaksidetail id_transaksidetail; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail ALTER COLUMN id_transaksidetail SET DEFAULT nextval('public.transaksidetail_id_transaksidetail_seq'::regclass);


--
-- TOC entry 4871 (class 0 OID 66641)
-- Dependencies: 216
-- Data for Name: barang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.barang (id_barang, namabarang, hargabarang, jumlah) FROM stdin;
4	Espresso	28000	18
5	Vanilla Latte	35000	10
7	Mocca Latte	23000	10
8	Milk Grass Jelly	30000	123
9	lorem ip[sum	10	10
1	Coffe Latte	25000	30
10	apaja	100000	123
3	Macciato	30000	-82
2	Americano	15000	29
\.


--
-- TOC entry 4877 (class 0 OID 66676)
-- Dependencies: 222
-- Data for Name: pengguna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengguna (namapengguna, username, psswd, id_role, id_user) FROM stdin;
Eka Danis Saputri	ekadanis	admin	1	1
Eka Danis	ekadanis	kasir	2	3
\.


--
-- TOC entry 4873 (class 0 OID 66648)
-- Dependencies: 218
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id_role, namarole) FROM stdin;
1	Admin
2	Kasir
\.


--
-- TOC entry 4875 (class 0 OID 66655)
-- Dependencies: 220
-- Data for Name: transaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaksi (id_transaksi, tanggalwaktu, total, id_user, bayar, kembali) FROM stdin;
503	2024-06-01 10:04:14	25000	3	60000	35000
507	2024-06-01 10:19:14	40000	3	60000	20000
511	2024-06-01 10:25:35	40000	3	60000	20000
515	2024-06-01 10:47:00	28000	3	60000	32000
519	2024-06-01 11:16:21	28000	3	60000	32000
523	2024-06-01 11:49:21	15000	3	60000	45000
527	2024-06-01 13:53:48	150000	3	100000	-50000
531	2024-06-01 14:03:55	150000	3	100000	-50000
535	2024-06-01 14:06:27	150000	3	100000	-50000
539	2024-06-01 15:06:43	730000	3	1000000	270000
543	2024-06-02 15:18:58	75500	3	2000000	1924500
547	2024-06-02 15:38:51	125000	3	150000	25000
504	2024-06-01 10:06:31	25000	3	60000	35000
508	2024-06-01 10:19:36	40000	3	60000	20000
512	2024-06-01 10:27:00	40000	3	60000	20000
516	2024-06-01 10:48:32	28000	3	60000	32000
520	2024-06-01 11:37:54	28000	3	60000	32000
524	2024-06-01 11:55:18	15000	3	60000	45000
528	2024-06-01 13:54:01	150000	3	100000	-50000
532	2024-06-01 14:04:14	150000	3	100000	-50000
536	2024-06-01 14:10:15	955000	3	1000000	45000
540	2024-06-02 14:08:37	98000	3	100000	2000
544	2024-06-02 15:19:54	9300500	3	10000000	699500
548	2024-06-02 15:47:49	3000000	3	10	-2999990
501	2024-05-31 18:00:20	53000	3	60000	7000
505	2024-06-01 10:16:51	25000	3	60000	35000
509	2024-06-01 10:20:18	40000	3	60000	20000
513	2024-06-01 10:29:07	40000	3	60000	20000
517	2024-06-01 10:56:13	28000	3	60000	32000
521	2024-06-01 11:44:08	99000	3	100000	1000
525	2024-06-01 11:59:58	15000	3	60000	45000
529	2024-06-01 13:55:32	150000	3	100000	-50000
533	2024-06-01 14:04:20	150000	3	100000	-50000
537	2024-06-01 14:31:22	955000	3	1000000	45000
541	2024-06-02 14:57:49	30000	3	60000	30000
545	2024-06-02 15:31:58	250000	3	1000000	750000
549	2024-06-02 15:51:56	15000	3	10000	-5000
502	2024-06-01 10:01:13	25000	3	60000	35000
506	2024-06-01 10:18:35	40000	3	60000	20000
510	2024-06-01 10:22:31	40000	3	60000	20000
514	2024-06-01 10:30:25	28000	3	60000	32000
518	2024-06-01 11:15:03	28000	3	60000	32000
522	2024-06-01 11:49:03	15000	3	60000	45000
526	2024-06-01 12:12:15	15000	3	60000	45000
530	2024-06-01 14:03:51	150000	3	100000	-50000
534	2024-06-01 14:04:48	150000	3	100000	-50000
538	2024-06-01 14:39:49	955000	3	1000000	45000
542	2024-06-02 15:14:06	75500	3	100000	24500
546	2024-06-02 15:37:34	250000	3	300000	50000
\.


--
-- TOC entry 4876 (class 0 OID 66661)
-- Dependencies: 221
-- Data for Name: transaksidetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaksidetail (id_transaksi, id_barang, qty, total, id_transaksidetail) FROM stdin;
501	1	1	25000	4
501	4	1	28000	5
502	1	1	25000	6
503	1	1	25000	7
504	1	1	25000	8
505	1	1	25000	9
506	2	1	15000	10
506	1	1	25000	11
507	2	1	15000	12
507	1	1	25000	13
508	2	1	15000	14
508	1	1	25000	15
509	2	1	15000	16
509	1	1	25000	17
510	2	1	15000	18
510	1	1	25000	19
511	2	1	15000	20
511	1	1	25000	21
512	2	1	15000	22
512	1	1	25000	23
513	2	1	15000	24
513	1	1	25000	25
514	4	1	28000	26
515	4	1	28000	27
516	4	1	28000	28
517	4	1	28000	29
518	4	1	28000	30
519	4	1	28000	31
520	4	1	28000	32
521	2	1	15000	33
521	4	3	84000	34
522	2	1	15000	35
523	2	1	15000	36
524	2	1	15000	37
525	2	1	15000	38
526	2	1	15000	39
527	2	10	150000	40
528	2	10	150000	41
529	2	10	150000	42
530	2	10	150000	43
531	2	10	150000	44
535	2	10	150000	45
536	4	10	280000	46
536	2	45	675000	47
537	4	10	280000	48
537	2	45	675000	49
538	4	10	280000	50
538	2	45	675000	51
539	4	10	280000	52
539	2	30	450000	53
540	5	2	70000	54
540	4	1	28000	55
541	8	1	30000	56
542	9	50	500	57
542	3	2	60000	58
542	2	1	15000	59
543	9	50	500	60
543	3	2	60000	61
543	2	1	15000	62
544	9	50	500	63
544	7	100	2300000	64
544	5	200	7000000	65
545	1	10	250000	66
546	1	10	250000	67
547	1	5	125000	68
548	3	100	3000000	69
549	2	1	15000	70
\.


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 215
-- Name: barang_id_barang_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.barang_id_barang_seq', 10, true);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 223
-- Name: pengguna_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengguna_id_user_seq', 4, true);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 217
-- Name: role_id_role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_role_seq', 3, true);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 219
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaksi_id_transaksi_seq', 549, true);


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 224
-- Name: transaksidetail_id_transaksidetail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaksidetail_id_transaksidetail_seq', 70, true);


--
-- TOC entry 4714 (class 2606 OID 66646)
-- Name: barang barang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang
    ADD CONSTRAINT barang_pkey PRIMARY KEY (id_barang);


--
-- TOC entry 4722 (class 2606 OID 74834)
-- Name: pengguna pengguna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengguna
    ADD CONSTRAINT pengguna_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4716 (class 2606 OID 66653)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);


--
-- TOC entry 4718 (class 2606 OID 66660)
-- Name: transaksi transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_pkey PRIMARY KEY (id_transaksi);


--
-- TOC entry 4720 (class 2606 OID 74847)
-- Name: transaksidetail transaksidetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail
    ADD CONSTRAINT transaksidetail_pkey PRIMARY KEY (id_transaksidetail);


--
-- TOC entry 4724 (class 2606 OID 66671)
-- Name: transaksidetail fk_barang; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail
    ADD CONSTRAINT fk_barang FOREIGN KEY (id_barang) REFERENCES public.barang(id_barang);


--
-- TOC entry 4726 (class 2606 OID 66681)
-- Name: pengguna fk_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengguna
    ADD CONSTRAINT fk_role FOREIGN KEY (id_role) REFERENCES public.role(id_role);


--
-- TOC entry 4725 (class 2606 OID 66666)
-- Name: transaksidetail fk_transaksi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail
    ADD CONSTRAINT fk_transaksi FOREIGN KEY (id_transaksi) REFERENCES public.transaksi(id_transaksi);


--
-- TOC entry 4723 (class 2606 OID 74839)
-- Name: transaksi fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES public.pengguna(id_user);


-- Completed on 2024-06-02 23:15:06

--
-- PostgreSQL database dump complete
--
