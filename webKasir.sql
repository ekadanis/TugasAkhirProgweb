--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.3

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
-- Name: barang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.barang (
    id_barang integer NOT NULL,
    namabarang character varying(100) NOT NULL,
    hargabarang character varying(100) NOT NULL,
    jumlah integer NOT NULL,
    foto character varying
);


ALTER TABLE public.barang OWNER TO postgres;

--
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
-- Name: barang_id_barang_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.barang_id_barang_seq OWNED BY public.barang.id_barang;


--
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
-- Name: pengguna_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pengguna_id_user_seq OWNED BY public.pengguna.id_user;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id_role integer NOT NULL,
    namarole character varying(25) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
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
-- Name: role_id_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_role_seq OWNED BY public.role.id_role;


--
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
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksi_id_transaksi_seq OWNED BY public.transaksi.id_transaksi;


--
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
-- Name: transaksidetail_id_transaksidetail_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksidetail_id_transaksidetail_seq OWNED BY public.transaksidetail.id_transaksidetail;


--
-- Name: barang id_barang; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang ALTER COLUMN id_barang SET DEFAULT nextval('public.barang_id_barang_seq'::regclass);


--
-- Name: pengguna id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengguna ALTER COLUMN id_user SET DEFAULT nextval('public.pengguna_id_user_seq'::regclass);


--
-- Name: role id_role; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_role_seq'::regclass);


--
-- Name: transaksi id_transaksi; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi ALTER COLUMN id_transaksi SET DEFAULT nextval('public.transaksi_id_transaksi_seq'::regclass);


--
-- Name: transaksidetail id_transaksidetail; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail ALTER COLUMN id_transaksidetail SET DEFAULT nextval('public.transaksidetail_id_transaksidetail_seq'::regclass);


--
-- Data for Name: barang; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.barang VALUES (4, 'Espresso', '28000', 18, NULL);
INSERT INTO public.barang VALUES (5, 'Vanilla Latte', '35000', 10, NULL);
INSERT INTO public.barang VALUES (7, 'Mocca Latte', '23000', 10, NULL);
INSERT INTO public.barang VALUES (8, 'Milk Grass Jelly', '30000', 123, NULL);
INSERT INTO public.barang VALUES (9, 'lorem ip[sum', '10', 10, NULL);
INSERT INTO public.barang VALUES (1, 'Coffe Latte', '25000', 30, NULL);
INSERT INTO public.barang VALUES (10, 'apaja', '100000', 123, NULL);
INSERT INTO public.barang VALUES (3, 'Macciato', '30000', -82, NULL);
INSERT INTO public.barang VALUES (11, 'lorem', '12', 10, 'foto/Screenshot from 2023-07-18 08-57-40.png');
INSERT INTO public.barang VALUES (2, 'Americano', '15000', 29, 'foto/Screenshot_20230610_104027.png');


--
-- Data for Name: pengguna; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pengguna VALUES ('Eka Danis Saputri', 'ekadanis', 'admin', 1, 1);
INSERT INTO public.pengguna VALUES ('Eka Danis', 'ekadanis', 'kasir', 2, 3);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role VALUES (1, 'Admin');
INSERT INTO public.role VALUES (2, 'Kasir');


--
-- Data for Name: transaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaksi VALUES (503, '2024-06-01 10:04:14', 25000, 3, 60000, 35000);
INSERT INTO public.transaksi VALUES (507, '2024-06-01 10:19:14', 40000, 3, 60000, 20000);
INSERT INTO public.transaksi VALUES (511, '2024-06-01 10:25:35', 40000, 3, 60000, 20000);
INSERT INTO public.transaksi VALUES (515, '2024-06-01 10:47:00', 28000, 3, 60000, 32000);
INSERT INTO public.transaksi VALUES (519, '2024-06-01 11:16:21', 28000, 3, 60000, 32000);
INSERT INTO public.transaksi VALUES (523, '2024-06-01 11:49:21', 15000, 3, 60000, 45000);
INSERT INTO public.transaksi VALUES (527, '2024-06-01 13:53:48', 150000, 3, 100000, -50000);
INSERT INTO public.transaksi VALUES (531, '2024-06-01 14:03:55', 150000, 3, 100000, -50000);
INSERT INTO public.transaksi VALUES (535, '2024-06-01 14:06:27', 150000, 3, 100000, -50000);
INSERT INTO public.transaksi VALUES (539, '2024-06-01 15:06:43', 730000, 3, 1000000, 270000);
INSERT INTO public.transaksi VALUES (543, '2024-06-02 15:18:58', 75500, 3, 2000000, 1924500);
INSERT INTO public.transaksi VALUES (547, '2024-06-02 15:38:51', 125000, 3, 150000, 25000);
INSERT INTO public.transaksi VALUES (504, '2024-06-01 10:06:31', 25000, 3, 60000, 35000);
INSERT INTO public.transaksi VALUES (508, '2024-06-01 10:19:36', 40000, 3, 60000, 20000);
INSERT INTO public.transaksi VALUES (512, '2024-06-01 10:27:00', 40000, 3, 60000, 20000);
INSERT INTO public.transaksi VALUES (516, '2024-06-01 10:48:32', 28000, 3, 60000, 32000);
INSERT INTO public.transaksi VALUES (520, '2024-06-01 11:37:54', 28000, 3, 60000, 32000);
INSERT INTO public.transaksi VALUES (524, '2024-06-01 11:55:18', 15000, 3, 60000, 45000);
INSERT INTO public.transaksi VALUES (528, '2024-06-01 13:54:01', 150000, 3, 100000, -50000);
INSERT INTO public.transaksi VALUES (532, '2024-06-01 14:04:14', 150000, 3, 100000, -50000);
INSERT INTO public.transaksi VALUES (536, '2024-06-01 14:10:15', 955000, 3, 1000000, 45000);
INSERT INTO public.transaksi VALUES (540, '2024-06-02 14:08:37', 98000, 3, 100000, 2000);
INSERT INTO public.transaksi VALUES (544, '2024-06-02 15:19:54', 9300500, 3, 10000000, 699500);
INSERT INTO public.transaksi VALUES (548, '2024-06-02 15:47:49', 3000000, 3, 10, -2999990);
INSERT INTO public.transaksi VALUES (501, '2024-05-31 18:00:20', 53000, 3, 60000, 7000);
INSERT INTO public.transaksi VALUES (505, '2024-06-01 10:16:51', 25000, 3, 60000, 35000);
INSERT INTO public.transaksi VALUES (509, '2024-06-01 10:20:18', 40000, 3, 60000, 20000);
INSERT INTO public.transaksi VALUES (513, '2024-06-01 10:29:07', 40000, 3, 60000, 20000);
INSERT INTO public.transaksi VALUES (517, '2024-06-01 10:56:13', 28000, 3, 60000, 32000);
INSERT INTO public.transaksi VALUES (521, '2024-06-01 11:44:08', 99000, 3, 100000, 1000);
INSERT INTO public.transaksi VALUES (525, '2024-06-01 11:59:58', 15000, 3, 60000, 45000);
INSERT INTO public.transaksi VALUES (529, '2024-06-01 13:55:32', 150000, 3, 100000, -50000);
INSERT INTO public.transaksi VALUES (533, '2024-06-01 14:04:20', 150000, 3, 100000, -50000);
INSERT INTO public.transaksi VALUES (537, '2024-06-01 14:31:22', 955000, 3, 1000000, 45000);
INSERT INTO public.transaksi VALUES (541, '2024-06-02 14:57:49', 30000, 3, 60000, 30000);
INSERT INTO public.transaksi VALUES (545, '2024-06-02 15:31:58', 250000, 3, 1000000, 750000);
INSERT INTO public.transaksi VALUES (549, '2024-06-02 15:51:56', 15000, 3, 10000, -5000);
INSERT INTO public.transaksi VALUES (502, '2024-06-01 10:01:13', 25000, 3, 60000, 35000);
INSERT INTO public.transaksi VALUES (506, '2024-06-01 10:18:35', 40000, 3, 60000, 20000);
INSERT INTO public.transaksi VALUES (510, '2024-06-01 10:22:31', 40000, 3, 60000, 20000);
INSERT INTO public.transaksi VALUES (514, '2024-06-01 10:30:25', 28000, 3, 60000, 32000);
INSERT INTO public.transaksi VALUES (518, '2024-06-01 11:15:03', 28000, 3, 60000, 32000);
INSERT INTO public.transaksi VALUES (522, '2024-06-01 11:49:03', 15000, 3, 60000, 45000);
INSERT INTO public.transaksi VALUES (526, '2024-06-01 12:12:15', 15000, 3, 60000, 45000);
INSERT INTO public.transaksi VALUES (530, '2024-06-01 14:03:51', 150000, 3, 100000, -50000);
INSERT INTO public.transaksi VALUES (534, '2024-06-01 14:04:48', 150000, 3, 100000, -50000);
INSERT INTO public.transaksi VALUES (538, '2024-06-01 14:39:49', 955000, 3, 1000000, 45000);
INSERT INTO public.transaksi VALUES (542, '2024-06-02 15:14:06', 75500, 3, 100000, 24500);
INSERT INTO public.transaksi VALUES (546, '2024-06-02 15:37:34', 250000, 3, 300000, 50000);


--
-- Data for Name: transaksidetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaksidetail VALUES (501, 1, 1, 25000, 4);
INSERT INTO public.transaksidetail VALUES (501, 4, 1, 28000, 5);
INSERT INTO public.transaksidetail VALUES (502, 1, 1, 25000, 6);
INSERT INTO public.transaksidetail VALUES (503, 1, 1, 25000, 7);
INSERT INTO public.transaksidetail VALUES (504, 1, 1, 25000, 8);
INSERT INTO public.transaksidetail VALUES (505, 1, 1, 25000, 9);
INSERT INTO public.transaksidetail VALUES (506, 2, 1, 15000, 10);
INSERT INTO public.transaksidetail VALUES (506, 1, 1, 25000, 11);
INSERT INTO public.transaksidetail VALUES (507, 2, 1, 15000, 12);
INSERT INTO public.transaksidetail VALUES (507, 1, 1, 25000, 13);
INSERT INTO public.transaksidetail VALUES (508, 2, 1, 15000, 14);
INSERT INTO public.transaksidetail VALUES (508, 1, 1, 25000, 15);
INSERT INTO public.transaksidetail VALUES (509, 2, 1, 15000, 16);
INSERT INTO public.transaksidetail VALUES (509, 1, 1, 25000, 17);
INSERT INTO public.transaksidetail VALUES (510, 2, 1, 15000, 18);
INSERT INTO public.transaksidetail VALUES (510, 1, 1, 25000, 19);
INSERT INTO public.transaksidetail VALUES (511, 2, 1, 15000, 20);
INSERT INTO public.transaksidetail VALUES (511, 1, 1, 25000, 21);
INSERT INTO public.transaksidetail VALUES (512, 2, 1, 15000, 22);
INSERT INTO public.transaksidetail VALUES (512, 1, 1, 25000, 23);
INSERT INTO public.transaksidetail VALUES (513, 2, 1, 15000, 24);
INSERT INTO public.transaksidetail VALUES (513, 1, 1, 25000, 25);
INSERT INTO public.transaksidetail VALUES (514, 1, 1, 25000, 26);
INSERT INTO public.transaksidetail VALUES (515, 1, 1, 25000, 27);
INSERT INTO public.transaksidetail VALUES (516, 1, 1, 25000, 28);
INSERT INTO public.transaksidetail VALUES (517, 1, 1, 25000, 29);
INSERT INTO public.transaksidetail VALUES (518, 1, 1, 25000, 30);
INSERT INTO public.transaksidetail VALUES (519, 1, 1, 25000, 31);
INSERT INTO public.transaksidetail VALUES (520, 4, 1, 28000, 32);
INSERT INTO public.transaksidetail VALUES (521, 2, 1, 15000, 33);
INSERT INTO public.transaksidetail VALUES (521, 3, 1, 30000, 34);
INSERT INTO public.transaksidetail VALUES (522, 4, 1, 28000, 35);
INSERT INTO public.transaksidetail VALUES (523, 4, 1, 28000, 36);
INSERT INTO public.transaksidetail VALUES (524, 4, 1, 28000, 37);
INSERT INTO public.transaksidetail VALUES (525, 1, 1, 25000, 38);
INSERT INTO public.transaksidetail VALUES (526, 1, 1, 25000, 39);
INSERT INTO public.transaksidetail VALUES (527, 5, 1, 35000, 40);
INSERT INTO public.transaksidetail VALUES (527, 8, 2, 60000, 41);
INSERT INTO public.transaksidetail VALUES (527, 7, 2, 46000, 42);
INSERT INTO public.transaksidetail VALUES (528, 5, 1, 35000, 43);
INSERT INTO public.transaksidetail VALUES (528, 8, 2, 60000, 44);
INSERT INTO public.transaksidetail VALUES (528, 7, 2, 46000, 45);
INSERT INTO public.transaksidetail VALUES (529, 5, 1, 35000, 46);
INSERT INTO public.transaksidetail VALUES (529, 8, 2, 60000, 47);
INSERT INTO public.transaksidetail VALUES (529, 7, 2, 46000, 48);
INSERT INTO public.transaksidetail VALUES (530, 5, 1, 35000, 49);
INSERT INTO public.transaksidetail VALUES (530, 8, 2, 60000, 50);
INSERT INTO public.transaksidetail VALUES (530, 7, 2, 46000, 51);
INSERT INTO public.transaksidetail VALUES (531, 5, 1, 35000, 52);
INSERT INTO public.transaksidetail VALUES (531, 8, 2, 60000, 53);
INSERT INTO public.transaksidetail VALUES (531, 7, 2, 46000, 54);
INSERT INTO public.transaksidetail VALUES (532, 5, 1, 35000, 55);
INSERT INTO public.transaksidetail VALUES (532, 8, 2, 60000, 56);
INSERT INTO public.transaksidetail VALUES (532, 7, 2, 46000, 57);
INSERT INTO public.transaksidetail VALUES (533, 5, 1, 35000, 58);
INSERT INTO public.transaksidetail VALUES (533, 8, 2, 60000, 59);
INSERT INTO public.transaksidetail VALUES (533, 7, 2, 46000, 60);
INSERT INTO public.transaksidetail VALUES (534, 5, 1, 35000, 61);
INSERT INTO public.transaksidetail VALUES (534, 8, 2, 60000, 62);
INSERT INTO public.transaksidetail VALUES (534, 7, 2, 46000, 63);
INSERT INTO public.transaksidetail VALUES (535, 5, 1, 35000, 64);
INSERT INTO public.transaksidetail VALUES (535, 8, 2, 60000, 65);
INSERT INTO public.transaksidetail VALUES (535, 7, 2, 46000, 66);
INSERT INTO public.transaksidetail VALUES (536, 5, 1, 35000, 67);
INSERT INTO public.transaksidetail VALUES (536, 8, 2, 60000, 68);
INSERT INTO public.transaksidetail VALUES (536, 7, 2, 46000, 69);
INSERT INTO public.transaksidetail VALUES (537, 5, 1, 35000, 70);
INSERT INTO public.transaksidetail VALUES (537, 8, 2, 60000, 71);
INSERT INTO public.transaksidetail VALUES (537, 7, 2, 46000, 72);
INSERT INTO public.transaksidetail VALUES (538, 5, 1, 35000, 73);
INSERT INTO public.transaksidetail VALUES (538, 8, 2, 60000, 74);
INSERT INTO public.transaksidetail VALUES (538, 7, 2, 46000, 75);
INSERT INTO public.transaksidetail VALUES (539, 5, 1, 35000, 76);
INSERT INTO public.transaksidetail VALUES (539, 8, 2, 60000, 77);
INSERT INTO public.transaksidetail VALUES (539, 7, 2, 46000, 78);
INSERT INTO public.transaksidetail VALUES (540, 5, 1, 35000, 79);
INSERT INTO public.transaksidetail VALUES (540, 8, 2, 60000, 80);
INSERT INTO public.transaksidetail VALUES (540, 7, 2, 46000, 81);
INSERT INTO public.transaksidetail VALUES (541, 5, 1, 35000, 82);
INSERT INTO public.transaksidetail VALUES (541, 8, 2, 60000, 83);
INSERT INTO public.transaksidetail VALUES (541, 7, 2, 46000, 84);
INSERT INTO public.transaksidetail VALUES (542, 5, 1, 35000, 85);
INSERT INTO public.transaksidetail VALUES (542, 8, 2, 60000, 86);
INSERT INTO public.transaksidetail VALUES (542, 7, 2, 46000, 87);
INSERT INTO public.transaksidetail VALUES (543, 5, 1, 35000, 88);
INSERT INTO public.transaksidetail VALUES (543, 8, 2, 60000, 89);
INSERT INTO public.transaksidetail VALUES (543, 7, 2, 46000, 90);
INSERT INTO public.transaksidetail VALUES (544, 5, 1, 35000, 91);
INSERT INTO public.transaksidetail VALUES (544, 8, 2, 60000, 92);
INSERT INTO public.transaksidetail VALUES (544, 7, 2, 46000, 93);
INSERT INTO public.transaksidetail VALUES (545, 5, 1, 35000, 94);
INSERT INTO public.transaksidetail VALUES (545, 8, 2, 60000, 95);
INSERT INTO public.transaksidetail VALUES (545, 7, 2, 46000, 96);
INSERT INTO public.transaksidetail VALUES (546, 5, 1, 35000, 97);
INSERT INTO public.transaksidetail VALUES (546, 8, 2, 60000, 98);
INSERT INTO public.transaksidetail VALUES (546, 7, 2, 46000, 99);
INSERT INTO public.transaksidetail VALUES (547, 5, 1, 35000, 100);
INSERT INTO public.transaksidetail VALUES (547, 8, 2, 60000, 101);
INSERT INTO public.transaksidetail VALUES (547, 7, 2, 46000, 102);
INSERT INTO public.transaksidetail VALUES (548, 5, 1, 35000, 103);
INSERT INTO public.transaksidetail VALUES (548, 8, 2, 60000, 104);
INSERT INTO public.transaksidetail VALUES (548, 7, 2, 46000, 105);
INSERT INTO public.transaksidetail VALUES (549, 5, 1, 35000, 106);
INSERT INTO public.transaksidetail VALUES (549, 8, 2, 60000, 107);
INSERT INTO public.transaksidetail VALUES (549, 7, 2, 46000, 108);


--
-- Name: barang_id_barang_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.barang_id_barang_seq', 11, true);


--
-- Name: pengguna_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengguna_id_user_seq', 4, true);


--
-- Name: role_id_role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_role_seq', 3, true);


--
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaksi_id_transaksi_seq', 549, true);


--
-- Name: transaksidetail_id_transaksidetail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaksidetail_id_transaksidetail_seq', 70, true);


--
-- Name: barang barang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang
    ADD CONSTRAINT barang_pkey PRIMARY KEY (id_barang);


--
-- Name: pengguna pengguna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengguna
    ADD CONSTRAINT pengguna_pkey PRIMARY KEY (id_user);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);


--
-- Name: transaksi transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_pkey PRIMARY KEY (id_transaksi);


--
-- Name: transaksidetail transaksidetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail
    ADD CONSTRAINT transaksidetail_pkey PRIMARY KEY (id_transaksidetail);


--
-- Name: transaksidetail fk_barang; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail
    ADD CONSTRAINT fk_barang FOREIGN KEY (id_barang) REFERENCES public.barang(id_barang);


--
-- Name: pengguna fk_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengguna
    ADD CONSTRAINT fk_role FOREIGN KEY (id_role) REFERENCES public.role(id_role);


--
-- Name: transaksidetail fk_transaksi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksidetail
    ADD CONSTRAINT fk_transaksi FOREIGN KEY (id_transaksi) REFERENCES public.transaksi(id_transaksi);


--
-- Name: transaksi fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES public.pengguna(id_user);


--
-- PostgreSQL database dump complete
--