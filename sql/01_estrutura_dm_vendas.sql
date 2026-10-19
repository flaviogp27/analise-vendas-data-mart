--
-- PostgreSQL database dump
--

\restrict FdzymUPboXPcHQvq5aUtTPHT3cJE2xMk9CkJi1niQaysucWybgX0uL0FbWb48TA

-- Dumped from database version 17.10
-- Dumped by pg_dump version 17.10

-- Started on 2026-10-19 17:48:25

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

--
-- TOC entry 6 (class 2615 OID 16846)
-- Name: dm_vendas; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA dm_vendas;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16848)
-- Name: dim_forma_pagamento; Type: TABLE; Schema: dm_vendas; Owner: -
--

CREATE TABLE dm_vendas.dim_forma_pagamento (
    sk_forma_pagamento integer NOT NULL,
    id_forma_pagamento_origem integer NOT NULL,
    descricao text NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16847)
-- Name: dim_forma_pagamento_sk_forma_pagamento_seq; Type: SEQUENCE; Schema: dm_vendas; Owner: -
--

ALTER TABLE dm_vendas.dim_forma_pagamento ALTER COLUMN sk_forma_pagamento ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dm_vendas.dim_forma_pagamento_sk_forma_pagamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16868)
-- Name: dim_produto; Type: TABLE; Schema: dm_vendas; Owner: -
--

CREATE TABLE dm_vendas.dim_produto (
    sk_produto integer NOT NULL,
    id_produto_origem integer NOT NULL,
    nome text NOT NULL,
    id_categoria_origem integer NOT NULL,
    categoria text NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 16867)
-- Name: dim_produto_sk_produto_seq; Type: SEQUENCE; Schema: dm_vendas; Owner: -
--

ALTER TABLE dm_vendas.dim_produto ALTER COLUMN sk_produto ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dm_vendas.dim_produto_sk_produto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16878)
-- Name: dim_tempo; Type: TABLE; Schema: dm_vendas; Owner: -
--

CREATE TABLE dm_vendas.dim_tempo (
    sk_tempo integer NOT NULL,
    data date NOT NULL,
    ano integer NOT NULL,
    trimestre integer NOT NULL,
    mes integer NOT NULL,
    nome_mes text NOT NULL,
    dia integer NOT NULL,
    dia_semana integer NOT NULL,
    nome_dia_semana text NOT NULL,
    ano_mes character varying(7) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 16858)
-- Name: dim_vendedor; Type: TABLE; Schema: dm_vendas; Owner: -
--

CREATE TABLE dm_vendas.dim_vendedor (
    sk_vendedor integer NOT NULL,
    id_vendedor_origem integer NOT NULL,
    nome text NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16857)
-- Name: dim_vendedor_sk_vendedor_seq; Type: SEQUENCE; Schema: dm_vendas; Owner: -
--

ALTER TABLE dm_vendas.dim_vendedor ALTER COLUMN sk_vendedor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dm_vendas.dim_vendedor_sk_vendedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16887)
-- Name: fato_vendas; Type: TABLE; Schema: dm_vendas; Owner: -
--

CREATE TABLE dm_vendas.fato_vendas (
    id_item_origem integer NOT NULL,
    id_nota_fiscal_origem integer NOT NULL,
    sk_tempo integer NOT NULL,
    sk_produto integer NOT NULL,
    sk_vendedor integer NOT NULL,
    sk_forma_pagamento integer NOT NULL,
    quantidade integer NOT NULL,
    valor_unitario numeric NOT NULL,
    valor_total_item numeric NOT NULL
);


--
-- TOC entry 4774 (class 2606 OID 16886)
-- Name: dim_tempo dim_tempo_data_key; Type: CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.dim_tempo
    ADD CONSTRAINT dim_tempo_data_key UNIQUE (data);


--
-- TOC entry 4776 (class 2606 OID 16884)
-- Name: dim_tempo dim_tempo_pkey; Type: CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.dim_tempo
    ADD CONSTRAINT dim_tempo_pkey PRIMARY KEY (sk_tempo);


--
-- TOC entry 4778 (class 2606 OID 16893)
-- Name: fato_vendas fato_vendas_pkey; Type: CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.fato_vendas
    ADD CONSTRAINT fato_vendas_pkey PRIMARY KEY (id_item_origem);


--
-- TOC entry 4762 (class 2606 OID 16854)
-- Name: dim_forma_pagamento pk_dim_forma_pagamento; Type: CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.dim_forma_pagamento
    ADD CONSTRAINT pk_dim_forma_pagamento PRIMARY KEY (sk_forma_pagamento);


--
-- TOC entry 4770 (class 2606 OID 16874)
-- Name: dim_produto pk_dim_produto; Type: CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.dim_produto
    ADD CONSTRAINT pk_dim_produto PRIMARY KEY (sk_produto);


--
-- TOC entry 4766 (class 2606 OID 16864)
-- Name: dim_vendedor pk_dim_vendedor; Type: CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.dim_vendedor
    ADD CONSTRAINT pk_dim_vendedor PRIMARY KEY (sk_vendedor);


--
-- TOC entry 4764 (class 2606 OID 16856)
-- Name: dim_forma_pagamento uq_dim_forma_pagamento_origem; Type: CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.dim_forma_pagamento
    ADD CONSTRAINT uq_dim_forma_pagamento_origem UNIQUE (id_forma_pagamento_origem);


--
-- TOC entry 4772 (class 2606 OID 16876)
-- Name: dim_produto uq_dim_produto_origem; Type: CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.dim_produto
    ADD CONSTRAINT uq_dim_produto_origem UNIQUE (id_produto_origem);


--
-- TOC entry 4768 (class 2606 OID 16866)
-- Name: dim_vendedor uq_dim_vendedor_origem; Type: CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.dim_vendedor
    ADD CONSTRAINT uq_dim_vendedor_origem UNIQUE (id_vendedor_origem);


--
-- TOC entry 4779 (class 2606 OID 16909)
-- Name: fato_vendas fk_fato_forma_pagamento; Type: FK CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.fato_vendas
    ADD CONSTRAINT fk_fato_forma_pagamento FOREIGN KEY (sk_forma_pagamento) REFERENCES dm_vendas.dim_forma_pagamento(sk_forma_pagamento);


--
-- TOC entry 4780 (class 2606 OID 16899)
-- Name: fato_vendas fk_fato_produto; Type: FK CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.fato_vendas
    ADD CONSTRAINT fk_fato_produto FOREIGN KEY (sk_produto) REFERENCES dm_vendas.dim_produto(sk_produto);


--
-- TOC entry 4781 (class 2606 OID 16894)
-- Name: fato_vendas fk_fato_tempo; Type: FK CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.fato_vendas
    ADD CONSTRAINT fk_fato_tempo FOREIGN KEY (sk_tempo) REFERENCES dm_vendas.dim_tempo(sk_tempo);


--
-- TOC entry 4782 (class 2606 OID 16904)
-- Name: fato_vendas fk_fato_vendedor; Type: FK CONSTRAINT; Schema: dm_vendas; Owner: -
--

ALTER TABLE ONLY dm_vendas.fato_vendas
    ADD CONSTRAINT fk_fato_vendedor FOREIGN KEY (sk_vendedor) REFERENCES dm_vendas.dim_vendedor(sk_vendedor);


-- Completed on 2026-10-19 17:48:25

--
-- PostgreSQL database dump complete
--

\unrestrict FdzymUPboXPcHQvq5aUtTPHT3cJE2xMk9CkJi1niQaysucWybgX0uL0FbWb48TA

