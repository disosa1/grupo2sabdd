--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.2

-- Started on 2025-08-08 10:02:40

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
-- TOC entry 254 (class 1259 OID 17349)
-- Name: boucher_cabecera; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.boucher_cabecera (
    ban_aid character varying(14) NOT NULL,
    ban_nombre character varying(64) NOT NULL,
    ban_direccion character varying(64) NOT NULL,
    ban_ruc character varying(13) NOT NULL,
    ban_mensaje character varying(300) NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 17352)
-- Name: boucher_cuerpo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.boucher_cuerpo (
    bouc_id integer NOT NULL,
    rett_imprimir character varying(2) NOT NULL,
    rett_montomax integer NOT NULL,
    tran_id integer NOT NULL,
    ret_id integer NOT NULL,
    cuen_id integer NOT NULL,
    caj_id integer NOT NULL,
    ret_fecha timestamp without time zone NOT NULL,
    ret_monto integer NOT NULL,
    ret_cajero character varying(8) NOT NULL,
    ret_numero_tran character varying(4) NOT NULL,
    ban_aid character varying(14) NOT NULL,
    bouc_costo numeric NOT NULL,
    bouc_totaldebitado numeric NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 17357)
-- Name: cajero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cajero (
    caj_id integer NOT NULL,
    caj_ubicacion character varying(100) NOT NULL,
    caj_estado character varying(20) NOT NULL,
    caj_tipo character varying(30) NOT NULL,
    caj_sucursal character varying(50) NOT NULL
);


--
-- TOC entry 257 (class 1259 OID 17360)
-- Name: cliente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cliente (
    per_id integer NOT NULL,
    cli_id integer NOT NULL,
    per_nombres character varying(300) NOT NULL,
    per_apellidos character varying(300) NOT NULL,
    per_fecha_nacimiento date NOT NULL,
    per_genero character varying(64) NOT NULL,
    per_telefono character varying(10) NOT NULL,
    per_correo character varying(64) NOT NULL,
    per_direccion character varying(124) NOT NULL,
    per_tipo character varying(64) NOT NULL,
    cli_fecha_ingresp date NOT NULL,
    cli_estado character varying(64) NOT NULL
);


--
-- TOC entry 258 (class 1259 OID 17365)
-- Name: condiciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.condiciones (
    cond_id integer NOT NULL,
    cond_descripcion character varying(200) NOT NULL,
    cond_horas integer NOT NULL,
    cond_intentos integer NOT NULL,
    cond_monto integer NOT NULL,
    cond_estado character varying(20) NOT NULL
);


--
-- TOC entry 259 (class 1259 OID 17368)
-- Name: consulta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.consulta (
    tran_id integer NOT NULL,
    cons_id integer NOT NULL,
    cuen_id integer NOT NULL,
    caj_id integer NOT NULL,
    cons_fecha_hora date NOT NULL,
    cons_comision numeric NOT NULL,
    cons_tipo character varying(100) NOT NULL,
    cons_resultados text NOT NULL
);


--
-- TOC entry 260 (class 1259 OID 17373)
-- Name: cuenta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cuenta (
    cuen_id integer NOT NULL,
    per_id integer NOT NULL,
    cli_id integer NOT NULL,
    cuen_usuario character varying(64) NOT NULL,
    cuen_password character varying(64) NOT NULL,
    cuen_tipo character varying(64) NOT NULL,
    cuen_numero_cuenta character varying(10) NOT NULL,
    cuen_saldo numeric NOT NULL,
    cuen_estado character varying(64) NOT NULL
);


--
-- TOC entry 261 (class 1259 OID 17378)
-- Name: cuenta_ahorro; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cuenta_ahorro (
    cuen_id integer NOT NULL,
    per_id integer,
    cli_id integer NOT NULL,
    cuen_usuario character varying(64) NOT NULL,
    cuen_password character varying(64) NOT NULL,
    cuen_tipo character varying(64) NOT NULL,
    cuen_numero_cuenta character varying(10) NOT NULL,
    cuen_saldo numeric NOT NULL,
    cuen_estado character varying(64) NOT NULL,
    ca_interes numeric NOT NULL,
    ca_limite_retiros integer NOT NULL,
    ca_min_saldo_remunerado numeric NOT NULL
);


--
-- TOC entry 262 (class 1259 OID 17383)
-- Name: cuenta_corriente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cuenta_corriente (
    cuen_id integer NOT NULL,
    per_id integer,
    cli_id integer NOT NULL,
    cuen_usuario character varying(64) NOT NULL,
    cuen_password character varying(64) NOT NULL,
    cuen_tipo character varying(64) NOT NULL,
    cuen_numero_cuenta character varying(10) NOT NULL,
    cuen_saldo numeric NOT NULL,
    cuen_estado character varying(64) NOT NULL,
    cc_limite_descubierto numeric NOT NULL,
    cc_comision_mantenimiento numeric NOT NULL,
    cc_num_cheques integer NOT NULL
);


--
-- TOC entry 263 (class 1259 OID 17388)
-- Name: depositos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.depositos (
    tran_id integer NOT NULL,
    dep_id integer NOT NULL,
    cuen_id integer NOT NULL,
    caj_id integer NOT NULL,
    dep_fecha date NOT NULL,
    dep_monto numeric NOT NULL,
    dep_cuenta_dest character varying(20) NOT NULL,
    dep_canal character varying(20) NOT NULL,
    dep_referencia character varying(30) NOT NULL,
    dep_estado character varying(20) NOT NULL
);


--
-- TOC entry 264 (class 1259 OID 17393)
-- Name: pago_servicios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pago_servicios (
    tran_id integer NOT NULL,
    ps_id integer NOT NULL,
    cuen_id integer NOT NULL,
    caj_id integer NOT NULL,
    ps_tipo_servicio character varying(100) NOT NULL,
    ps_proveedor character varying(100) NOT NULL,
    ps_referencia character varying(100) NOT NULL,
    ps_monto numeric NOT NULL,
    ps_fecha_hora date NOT NULL,
    ps_comision numeric NOT NULL,
    ps_resultado_codigo character varying(10) NOT NULL,
    ps_estado character varying(20) NOT NULL,
    ps_comprobante text NOT NULL
);


--
-- TOC entry 265 (class 1259 OID 17398)
-- Name: persona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.persona (
    per_id integer NOT NULL,
    per_nombres character varying(300) NOT NULL,
    per_apellidos character varying(300) NOT NULL,
    per_fecha_nacimiento date NOT NULL,
    per_genero character varying(64) NOT NULL,
    per_telefono character varying(10) NOT NULL,
    per_correo character varying(64) NOT NULL,
    per_direccion character varying(124) NOT NULL,
    per_tipo character varying(64) NOT NULL
);


--
-- TOC entry 266 (class 1259 OID 17403)
-- Name: persona_juridica; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.persona_juridica (
    per_id integer NOT NULL,
    per_nombres character varying(300) NOT NULL,
    per_apellidos character varying(300) NOT NULL,
    per_fecha_nacimiento date NOT NULL,
    per_genero character varying(64) NOT NULL,
    per_telefono character varying(10) NOT NULL,
    per_correo character varying(64) NOT NULL,
    per_direccion character varying(124) NOT NULL,
    per_tipo character varying(64) NOT NULL,
    pj_ruc character varying(13) NOT NULL,
    pj_representante character varying(100) NOT NULL,
    pj_tipo_entidad character varying(50) NOT NULL,
    pj_fecha_constitucion date NOT NULL,
    pj_actividad character varying(200) NOT NULL
);


--
-- TOC entry 267 (class 1259 OID 17408)
-- Name: persona_natural; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.persona_natural (
    per_id integer NOT NULL,
    per_nombres character varying(300) NOT NULL,
    per_apellidos character varying(300) NOT NULL,
    per_fecha_nacimiento date NOT NULL,
    per_genero character varying(64) NOT NULL,
    per_telefono character varying(10) NOT NULL,
    per_correo character varying(64) NOT NULL,
    per_direccion character varying(124) NOT NULL,
    per_tipo character varying(64) NOT NULL,
    pn_identificacion character varying(13) NOT NULL,
    pn_estado_civil character varying(20) NOT NULL,
    pn_profesion character varying(100) NOT NULL
);


--
-- TOC entry 268 (class 1259 OID 17413)
-- Name: retiro; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.retiro (
    tran_id integer NOT NULL,
    ret_id integer NOT NULL,
    cuen_id integer NOT NULL,
    caj_id integer NOT NULL,
    ret_fecha timestamp without time zone NOT NULL,
    ret_monto integer NOT NULL,
    ret_cajero character varying(8) NOT NULL,
    ret_numero_tran character varying(4) NOT NULL
);


--
-- TOC entry 269 (class 1259 OID 17416)
-- Name: retiro_contarjeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.retiro_contarjeta (
    tran_id integer NOT NULL,
    ret_id integer NOT NULL,
    cuen_id integer NOT NULL,
    caj_id integer NOT NULL,
    ret_fecha timestamp without time zone NOT NULL,
    ret_monto integer NOT NULL,
    ret_cajero character varying(8) NOT NULL,
    ret_numero_tran character varying(4) NOT NULL,
    rett_imprimir character varying(2) NOT NULL,
    rett_montomax integer NOT NULL
);


--
-- TOC entry 270 (class 1259 OID 17419)
-- Name: retiro_sintarjeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.retiro_sintarjeta (
    tran_id integer NOT NULL,
    ret_id integer NOT NULL,
    cuen_id integer NOT NULL,
    caj_id integer NOT NULL,
    ret_fecha timestamp without time zone NOT NULL,
    ret_monto integer NOT NULL,
    ret_cajero character varying(8) NOT NULL,
    ret_numero_tran character varying(4) NOT NULL,
    cond_id integer NOT NULL,
    rets_codigo character varying(8) NOT NULL,
    rets_telefono_asociado character varying(10) NOT NULL,
    rets_estado_codigo character varying(64) NOT NULL
);


--
-- TOC entry 271 (class 1259 OID 17422)
-- Name: tarjeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tarjeta (
    tar_id integer NOT NULL,
    cuen_id integer NOT NULL,
    tar_numero_tarjeta character varying(16) NOT NULL,
    tar_fecha_emision date NOT NULL,
    tar_fecha_expiracion date NOT NULL,
    tar_estado_tarjeta character varying(64) NOT NULL,
    tar_cvv character varying(3) NOT NULL,
    tar_tipo character varying(64) NOT NULL,
    tar_pin character varying(4) NOT NULL
);


--
-- TOC entry 272 (class 1259 OID 17425)
-- Name: tarjeta_credito; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tarjeta_credito (
    tar_id integer NOT NULL,
    cuen_id integer NOT NULL,
    tar_numero_tarjeta character varying(16) NOT NULL,
    tar_fecha_emision date NOT NULL,
    tar_fecha_expiracion date NOT NULL,
    tar_estado_tarjeta character varying(64) NOT NULL,
    tar_cvv character varying(3) NOT NULL,
    tar_tipo character varying(64) NOT NULL,
    tar_pin character varying(4) NOT NULL,
    tc_limite_credito numeric NOT NULL,
    tc_tasa_interes numeric NOT NULL,
    tc_cargo_anual numeric NOT NULL,
    tc_fecha_corte date NOT NULL,
    tc_fecha_vencimiento date NOT NULL,
    tc_morosidad boolean NOT NULL
);


--
-- TOC entry 273 (class 1259 OID 17430)
-- Name: tarjeta_debito; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tarjeta_debito (
    tar_id integer NOT NULL,
    cuen_id integer NOT NULL,
    tar_numero_tarjeta character varying(16) NOT NULL,
    tar_fecha_emision date NOT NULL,
    tar_fecha_expiracion date NOT NULL,
    tar_estado_tarjeta character varying(64) NOT NULL,
    tar_cvv character varying(3) NOT NULL,
    tar_tipo character varying(64) NOT NULL,
    tar_pin character varying(4) NOT NULL,
    td_limite_retiro_diario numeric NOT NULL,
    td_comision_sobregiro numeric NOT NULL
);


--
-- TOC entry 274 (class 1259 OID 17435)
-- Name: transaccion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transaccion (
    tran_id integer NOT NULL,
    cuen_id integer NOT NULL,
    caj_id integer NOT NULL
);


--
-- TOC entry 275 (class 1259 OID 17438)
-- Name: transferencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transferencia (
    tran_id integer NOT NULL,
    trans_id integer NOT NULL,
    cuen_id integer NOT NULL,
    caj_id integer NOT NULL,
    trans_fecha date NOT NULL,
    trans_monto numeric NOT NULL,
    trans_origen character varying(20) NOT NULL,
    trans_destino character varying(20) NOT NULL,
    trans_canal character varying(20) NOT NULL,
    trans_estado character varying(20) NOT NULL
);


--
-- TOC entry 3768 (class 0 OID 17349)
-- Dependencies: 254
-- Data for Name: boucher_cabecera; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.boucher_cabecera (ban_aid, ban_nombre, ban_direccion, ban_ruc, ban_mensaje) VALUES ('BP001', 'Banco Pichincha S.A.', 'Av. Amazonas y Naciones Unidas, Quito', '1790010937001', 'Gracias por confiar en Banco Pichincha. Para consultas: 1800-PICHINCHA');


--
-- TOC entry 3769 (class 0 OID 17352)
-- Dependencies: 255
-- Data for Name: boucher_cuerpo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.boucher_cuerpo (bouc_id, rett_imprimir, rett_montomax, tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, ban_aid, bouc_costo, bouc_totaldebitado) VALUES (1, 'SI', 500, 3, 3, 1, 3001, '2025-08-01 03:59:20.875538', 10, 'ONLINE', '0003', 'BP001', 0.36, 10.36);
INSERT INTO public.boucher_cuerpo (bouc_id, rett_imprimir, rett_montomax, tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, ban_aid, bouc_costo, bouc_totaldebitado) VALUES (2, 'SI', 500, 7, 7, 1, 3008, '2025-08-01 07:21:08.013749', 200, 'ONLINE', '0007', 'BP001', 0.36, 200.36);
INSERT INTO public.boucher_cuerpo (bouc_id, rett_imprimir, rett_montomax, tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, ban_aid, bouc_costo, bouc_totaldebitado) VALUES (3, 'SI', 500, 406, 13, 2, 3003, '2025-08-06 07:48:46.834411', 20, 'ONLINE', '0406', 'BP001', 0.36, 20.36);
INSERT INTO public.boucher_cuerpo (bouc_id, rett_imprimir, rett_montomax, tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, ban_aid, bouc_costo, bouc_totaldebitado) VALUES (4, 'SI', 500, 408, 15, 4, 3006, '2025-08-06 07:51:19.635659', 10, 'ONLINE', '0408', 'BP001', 0.36, 10.36);
INSERT INTO public.boucher_cuerpo (bouc_id, rett_imprimir, rett_montomax, tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, ban_aid, bouc_costo, bouc_totaldebitado) VALUES (5, 'SI', 500, 410, 17, 6, 3001, '2025-08-06 07:53:31.465774', 40, 'ONLINE', '0410', 'BP001', 0.36, 40.36);
INSERT INTO public.boucher_cuerpo (bouc_id, rett_imprimir, rett_montomax, tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, ban_aid, bouc_costo, bouc_totaldebitado) VALUES (6, 'SI', 500, 416, 23, 1, 3001, '2025-08-06 22:33:38.926187', 60, 'ONLINE', '0416', 'BP001', 0.36, 60.36);
INSERT INTO public.boucher_cuerpo (bouc_id, rett_imprimir, rett_montomax, tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, ban_aid, bouc_costo, bouc_totaldebitado) VALUES (7, 'SI', 500, 418, 25, 1, 3001, '2025-08-06 22:41:17.45137', 40, 'ONLINE', '0418', 'BP001', 0.36, 40.36);
INSERT INTO public.boucher_cuerpo (bouc_id, rett_imprimir, rett_montomax, tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, ban_aid, bouc_costo, bouc_totaldebitado) VALUES (8, 'SI', 500, 423, 30, 1, 3004, '2025-08-08 09:37:07.540747', 40, 'ONLINE', '0423', 'BP001', 0.36, 40.36);


--
-- TOC entry 3770 (class 0 OID 17357)
-- Dependencies: 256
-- Data for Name: cajero; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cajero (caj_id, caj_ubicacion, caj_estado, caj_tipo, caj_sucursal) VALUES (3001, 'Av. 6 de Diciembre Esq. Quito Centro', 'Activo', 'ATM', 'Quito Centro');
INSERT INTO public.cajero (caj_id, caj_ubicacion, caj_estado, caj_tipo, caj_sucursal) VALUES (3002, 'Calle García Moreno y 24 de Mayo', 'Activo', 'ATM', 'Quito Centro');
INSERT INTO public.cajero (caj_id, caj_ubicacion, caj_estado, caj_tipo, caj_sucursal) VALUES (3003, 'Av. Amazonas y Naciones Unidas (C.C. Iñaquito)', 'Activo', 'ATM', 'Iñaquito');
INSERT INTO public.cajero (caj_id, caj_ubicacion, caj_estado, caj_tipo, caj_sucursal) VALUES (3004, 'Av. La Prensa y Sucre (C.C. El Condado)', 'Activo', 'ATM', 'El Condado');
INSERT INTO public.cajero (caj_id, caj_ubicacion, caj_estado, caj_tipo, caj_sucursal) VALUES (3005, 'Plaza Cumbayá (Av. Interoceánica Km 7.5)', 'Activo', 'ATM', 'Cumbayá');
INSERT INTO public.cajero (caj_id, caj_ubicacion, caj_estado, caj_tipo, caj_sucursal) VALUES (3006, 'Av. Interoceánica Km 7.5 y Conquistador', 'Activo', 'ATM', 'Cumbayá');
INSERT INTO public.cajero (caj_id, caj_ubicacion, caj_estado, caj_tipo, caj_sucursal) VALUES (3007, 'Av. República y Amazonas (Centro Comercial El Bosque)', 'Activo', 'ATM', 'El Bosque');
INSERT INTO public.cajero (caj_id, caj_ubicacion, caj_estado, caj_tipo, caj_sucursal) VALUES (3008, 'Quitumbe Ñan y Morán Valverde', 'Activo', 'ATM', 'Quicentro Sur');
INSERT INTO public.cajero (caj_id, caj_ubicacion, caj_estado, caj_tipo, caj_sucursal) VALUES (3009, 'Av. 6 de Diciembre y Mal. Sucre (El Inca)', 'Activo', 'ATM', 'El Inca');
INSERT INTO public.cajero (caj_id, caj_ubicacion, caj_estado, caj_tipo, caj_sucursal) VALUES (3010, 'Av. González Suárez y Coruña', 'Activo', 'ATM', 'González Suárez');


--
-- TOC entry 3771 (class 0 OID 17360)
-- Dependencies: 257
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (1, 1, 'Darwin Javier', 'Panchez Jacome', '2002-08-01', 'Masculino', '0962804958', 'darwin@gmail.com', 'Av. Los Volcanes', 'NATURAL', '2025-08-01', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (2, 2, 'María Fernanda', 'Gómez Castillo', '1984-03-14', 'Femenino', '0991234567', 'mf.gomez@correo.com', 'Calle Shyris 456, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (3, 3, 'Juan Pablo', 'Mendoza Suárez', '1990-07-22', 'Masculino', '0987654321', 'jp.mendoza@correo.com', 'Av. Amazonas 890, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (4, 4, 'Ana Lucía', 'Rodríguez Pérez', '1978-05-11', 'Femenino', '0993344556', 'al.rodriguez@correo.com', 'Calle Shyris 456, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (5, 5, 'Luis Alberto', 'Vásquez Molina', '1982-02-18', 'Masculino', '0981122334', 'la.vasquez@correo.com', 'Pasaje Oriente 12, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (6, 6, 'Carolina Andrea', 'Salazar Rivera', '1995-09-30', 'Femenino', '0992233445', 'ca.salazar@correo.com', 'Av. 6 de Diciembre 2100, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (7, 7, 'Diego Fernando', 'Martínez López', '1988-06-12', 'Masculino', '0989988776', 'df.martinez@correo.com', 'Calle México 300, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (8, 8, 'Paola Andrea', 'Torres Jiménez', '1992-04-27', 'Femenino', '0995566778', 'pa.torres@correo.com', 'Av. González Suárez 345, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (9, 9, 'Carlos Andrés', 'Chávez Herrera', '1975-12-19', 'Masculino', '0987766554', 'ca.chavez@correo.com', 'Calle Princesa 50, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (10, 10, 'Verónica', 'Ríos García', '1987-08-08', 'Femenino', '0994455667', 'v.rios@correo.com', 'Av. Colón 780, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (11, 11, 'Ricardo Esteban', 'Gutiérrez Pacheco', '1983-01-15', 'Masculino', '0989988112', 're.gutierrez@correo.com', 'Calle la Pradera 25, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (12, 12, 'Lorena Isabel', 'Castillo Vega', '1994-05-10', 'Femenino', '0998877665', 'li.castillo@correo.com', 'Av. Eloy Alfaro 1500, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (13, 13, 'Jorge Enrique', 'Mora Bravo', '1979-10-23', 'Masculino', '0986677889', 'je.mora@correo.com', 'Calle La República 400, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (14, 14, 'María Belén', 'Morales Estrada', '1993-03-02', 'Femenino', '0993344557', 'mb.morales@correo.com', 'Av. Naciones Unidas 2200, Quito', 'NATURAL', '2025-08-05', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (15, 15, 'Fernando José', 'Prieto Silva', '1981-11-29', 'Masculino', '0982233445', 'fj.prieto@correo.com', 'Calle 10 de Agosto 600, Quito', 'NATURAL', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (16, 16, 'Natalia', 'Peralta Cuevas', '1996-07-17', 'Femenino', '0995566443', 'n.peralta@correo.com', 'Av. Guayacanes 1200, Quito', 'NATURAL', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (17, 17, 'Sebastián', 'Salinas Zambrano', '1989-09-09', 'Masculino', '0983344556', 's.salinas@correo.com', 'Calle Venezuela 100, Quito', 'NATURAL', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (18, 18, 'Paúl Andrés', 'Villavicencio Rojas', '1991-02-05', 'Masculino', '0992233446', 'pa.villavicencio@correo.com', 'Av. República del Salvador 950, Quito', 'NATURAL', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (19, 19, 'Camila', 'Ortiz León', '1997-06-21', 'Femenino', '0984455661', 'c.ortiz@correo.com', 'Calle Juan de Dios 300, Quito', 'NATURAL', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (20, 20, 'David Felipe', 'Nieto Durán', '1984-12-12', 'Masculino', '0996677882', 'df.nieto@correo.com', 'Av. América 1800, Quito', 'NATURAL', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (21, 21, 'Andrea', 'Palacios Castro', '1998-04-04', 'Femenino', '0987766332', 'a.palacios@correo.com', 'Calle Los Libertadores 90, Quito', 'NATURAL', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (22, 22, 'Empresas Andinas S.A.', 'Empresas Andinas', '1978-05-11', 'Masculino', '0922345678', 'contacto@andinas.com', 'Av. Universitaria, Quito', 'JURIDICA', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (23, 23, 'Tecnobright S.A.', 'Tecnobright', '1982-02-18', 'Femenino', '0922334455', 'info@tecnobright.com', 'Calle Guayaquil 123, Quito', 'JURIDICA', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (24, 24, 'Distribuidora La Selva S.A.', 'Distribuidora La Selva', '1985-03-14', 'Masculino', '0922445566', 'ventas@laselva.com', 'Av. La Prensa 456, Quito', 'JURIDICA', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (25, 25, 'Agroexport Ecuador S.A.', 'Agroexport Ecuador', '1984-12-12', 'Femenino', '0922556677', 'contacto@agroexport.com', 'Calle República 78, Quito', 'JURIDICA', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (26, 26, 'Consultores del Norte S.A.', 'Consultores del Norte', '1975-12-19', 'Masculino', '0922667788', 'info@consultoresnorte.com', 'Av. 12 de Octubre 890, Quito', 'JURIDICA', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (27, 27, 'Constructora Andes S.A.', 'Constructora Andes', '1972-04-27', 'Masculino', '0922778899', 'ventas@andesconstruye.com', 'Calle Loja 234, Quito', 'JURIDICA', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (28, 28, 'Farmacias Salud S.A.', 'Farmacias Salud', '1992-04-27', 'Femenino', '0922889900', 'contacto@farmaciasalud.com', 'Av. Naciones Unidas 345, Quito', 'JURIDICA', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (29, 29, 'Logística Global S.A.', 'Logística Global', '1975-05-19', 'Masculino', '0922990011', 'info@logisticaglobal.com', 'Calle Venezuela 567, Quito', 'JURIDICA', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (30, 30, 'Educación Avanzada S.A.', 'Educación Avanzada', '1981-11-29', 'Femenino', '0922101112', 'contacto@eduavanzada.com', 'Av. Amazonas 890, Quito', 'JURIDICA', '2025-08-06', 'ACTIVO');
INSERT INTO public.cliente (per_id, cli_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, cli_fecha_ingresp, cli_estado) VALUES (31, 31, 'Tecnologías Quito S.A.', 'Tecnologías Quito', '1987-08-08', 'Masculino', '0922121314', 'info@techquito.com', 'Calle Guápulo 321, Quito', 'JURIDICA', '2025-08-06', 'ACTIVO');


--
-- TOC entry 3772 (class 0 OID 17365)
-- Dependencies: 258
-- Data for Name: condiciones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.condiciones (cond_id, cond_descripcion, cond_horas, cond_intentos, cond_monto, cond_estado) VALUES (1, 'Retiro sin Tarjeta', 5, 5, 300, 'ACTIVO');


--
-- TOC entry 3773 (class 0 OID 17368)
-- Dependencies: 259
-- Data for Name: consulta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.consulta (tran_id, cons_id, cuen_id, caj_id, cons_fecha_hora, cons_comision, cons_tipo, cons_resultados) VALUES (401, 1, 25, 3001, '2025-08-06', 0.10, 'Saldo', 'Saldo disponible: $3,400.00');
INSERT INTO public.consulta (tran_id, cons_id, cuen_id, caj_id, cons_fecha_hora, cons_comision, cons_tipo, cons_resultados) VALUES (402, 2, 26, 3002, '2025-08-06', 0.10, 'Saldo', 'Saldo disponible: $1,050.00');
INSERT INTO public.consulta (tran_id, cons_id, cuen_id, caj_id, cons_fecha_hora, cons_comision, cons_tipo, cons_resultados) VALUES (403, 3, 27, 3003, '2025-08-06', 0.10, 'Saldo', 'Saldo disponible: $5,450.00');
INSERT INTO public.consulta (tran_id, cons_id, cuen_id, caj_id, cons_fecha_hora, cons_comision, cons_tipo, cons_resultados) VALUES (404, 4, 28, 3004, '2025-08-06', 0.10, 'Saldo', 'Saldo disponible: $720.00');
INSERT INTO public.consulta (tran_id, cons_id, cuen_id, caj_id, cons_fecha_hora, cons_comision, cons_tipo, cons_resultados) VALUES (405, 5, 29, 3005, '2025-08-06', 0.10, 'Saldo', 'Saldo disponible: $14,850.00');


--
-- TOC entry 3774 (class 0 OID 17373)
-- Dependencies: 260
-- Data for Name: cuenta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (12, 12, 12, 'licastillo', '$2b$12$dUlbj0ErifQP9eSsbCDgb.xrqzGp2DiI/.4GDXsN5n5TAZn8lABaC', 'AHORRO', '5270065709', 5400, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (13, 13, 13, 'jemora', '$2b$12$dlviWbAinOyOIHCTXSRDyebcANJIqrap5aJO6hkJNf0wwGj9FCMl.', 'AHORRO', '6781930257', 2500, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (14, 14, 14, 'mbmorales', '$2b$12$Dhof3qRfWl.MXK3r9MFMXOCaxi0fK.5Gq7nFZakODIFHINQFOgdfi', 'AHORRO', '5397185801', 6700, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (15, 15, 15, 'fjprieto', '$2b$12$EJEMqgd9SioTltB2AqXrGOc1WPBDRMes3z.atw/nAhOnBh4Uk.vQi', 'AHORRO', '2783328350', 980, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (16, 16, 16, 'nperalta', '$2b$12$7y5yla5DIMR2cTDgbuwi0uMXmlsR1x45dhipExeDFoFq3mBa5vJ6m', 'AHORRO', '9623708081', 11300, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (17, 17, 17, 'sebsalinas', '$2b$12$CBFYcRRsuiAraqBua6FcmOkDkruyKyN/zuxRLWO63TMEYEc55hEQ.', 'AHORRO', '2158367177', 4600, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (18, 18, 18, 'pavillavicencio', '$2b$12$iXv9NzG6v44n0nPU0uZ3EevxsNtsg8dXtq3Q0lvoXZQKtnC12DdDC', 'AHORRO', '6098211283', 8800, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (19, 19, 19, 'cortiz', '$2b$12$fx5qJI1JNSNw2XCsoJkoF.DbvXjFppmpxhzKnFMgGV0BWqsKFxFdS', 'AHORRO', '1420713127', 1300, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (20, 20, 20, 'dfnieto', '$2b$12$6.RfoGC8d6DvlQp1g4XryuWiEO6UjHFe8Gew8919pCiJQRjSvml8i', 'AHORRO', '1852149842', 7200, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (21, 21, 21, 'apalacios', '$2b$12$ESkq/z2V1lHKgQGfgGmDPeUEiGFub7MEXvD3KPAbJOnVZFk/W9gBm', 'AHORRO', '0488388928', 4100, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (22, 22, 22, 'emprandinas', '$2b$12$UaTTchQCeEEMJghNvhbtDuaSSqCKVqQjIRGX899VY4pmlSPQirgF.', 'CORRIENTE', '3447194183', 25000, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (23, 23, 23, 'tecnobright', '$2b$12$VpadoVZ14x.hqqlvbtFRAujhBNStPnJSG4kUlCslsITlVIZk4OxHK', 'CORRIENTE', '8949867058', 17999.98, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (24, 24, 24, 'distlaselva', '$2b$12$ZziE0UbJ.SEaY7JaEJla/.wWFYE4OB2LYym89iVN7Nv/1jfV9uf6W', 'CORRIENTE', '5653625362', 9500, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (25, 25, 25, 'agroexportecu', '$2b$12$5q3iYZ7CIP/8s60231l6COa4nv9gIrUqVcT4gol/mct48THeOIoK2', 'CORRIENTE', '5562191091', 12000, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (26, 26, 26, 'consultnor', '$2b$12$xbtgRa5zo3ccW.fHoV92w.6lmkz4uD/NMp4RGICKZ.e.SgF4q/mOS', 'CORRIENTE', '2756120905', 5000, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (27, 27, 27, 'constrandes', '$2b$12$ZV6Tfruo7EjmzfbVOD2Zx.Jz.0R2mCliqEQWRwQte80Q1feZFlPWS', 'CORRIENTE', '9108065766', 22000, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (28, 28, 28, 'farmasalud', '$2b$12$zasgDFp50X5iyO1.2hSIVuRyklrgIzP8uqbSNJEBZ3ssyuaIFfD1u', 'CORRIENTE', '1836819200', 16000, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (29, 29, 29, 'logistglobal', '$2b$12$xEAGjD5icP973gg0r4TWwOgMWRxeAmJbe8nMtBuRXd5FfNwH6g8ue', 'CORRIENTE', '7616653928', 30000, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (30, 30, 30, 'educavan', '$2b$12$nQ9Gk0sGjZaGralfixhabuhvdXwpO7FUa.xrfVTh5RyVCUZqh5iXy', 'CORRIENTE', '3565278773', 8000, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (31, 31, 31, 'tecnoquito', '$2b$12$rpupwpIKXQwi6sKg2Yrc.u5g/j6OqlPnLOPTn27C8bmZ9nCrHQxUq', 'CORRIENTE', '0878219314', 14000, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (2, 2, 2, 'mfergomez', '$2b$12$8d2bRoUFjaoDHXT7UK0Nx.hP5BryDZoGQwqehLXlqN2a2j.DZ9zIe', 'AHORRO', '8445864503', 3479.64, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (3, 3, 3, 'jpmendoza', '$2b$12$8mmQrVtz1vJVbjJGtCLlm.uecEzj8UqvYJlUXCH4yNHlq6kulSYBC', 'AHORRO', '6251636393', 1160.0, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (4, 4, 4, 'alrodriguez', '$2b$12$TAguTpg0vcmeeSJGGtlIh.Pi38UzsUKS70xSETMnrEZ0kryLXWN62', 'AHORRO', '4454327666', 5589.64, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (5, 5, 5, 'lavasquez', '$2b$12$3sauXPEcan5OofHNsxD0AOdSYH1e5KQaXHJnZKKCyaxEyxqtdhX/a', 'AHORRO', '6622928432', 800.0, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (6, 6, 6, 'casalazar', '$2b$12$itDlHEAHLJAxEXvJA1lAJeasmtf1hYvgHjco1AI4cInEoaOQHVoxK', 'AHORRO', '0669747369', 14959.64, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (7, 7, 7, 'dfmartinez', '$2b$12$6AiT9gHTrHVcaGSsOPm3F.2e87VEYyqMvrZJmZvYcgnDyMQQo0chK', 'AHORRO', '1849926757', 380, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (8, 8, 8, 'patorres', '$2b$12$lP3Af1XXqeHPnd0gXYU4W.6Ot4Pz5XZrA16ycP1jbvEDkFbYgsnOe', 'AHORRO', '4929137911', 7550, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (9, 9, 9, 'cachavez', '$2b$12$MjDNYpM2m3C4awLhSNgU1eD737UcjyLhPuRyEd5I9fSa.QmxQAqt2', 'AHORRO', '6565296014', 2000, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (10, 10, 10, 'vrios', '$2b$12$VLeL55iiPYf/7pj9iPtQT.fYyN8.Zm5IUmlv3wOhsxZ2Fu1.Vbe1O', 'AHORRO', '6676198002', 9900, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (11, 11, 11, 'regutierrez', '$2b$12$gz4uYc8ejC0EspIYH7wsfOJfGw.uynjtfxEYZc2itIo4hkEmo5tSu', 'AHORRO', '2350423807', 270, 'ACTIVA');
INSERT INTO public.cuenta (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado) VALUES (1, 1, 1, 'darwin', '$2b$12$a9Ge0AEz6ZWUHdG9bUZexeOicC8P5ALA9tCljg7BNT4BzT7t3HlaW', 'AHORRO', '2483407470', 129.20, 'ACTIVA');


--
-- TOC entry 3775 (class 0 OID 17378)
-- Dependencies: 261
-- Data for Name: cuenta_ahorro; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (1, 1, 1, 'darwin', '$2b$12$jihPWf9paZto2rnHFeDhaObU7Qjq4LfRfNpWXpVQDhYOgik9tNDeC', 'AHORRO', '2483407470', 600.00, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (2, 2, 2, 'mfergomez', '$2b$12$9QUvG8VrHCA0mqg7fg6I8ewfU2FVY5fmTkhPwTqFM1g.An7EAfHLS', 'AHORRO', '8445864503', 3500, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (3, 3, 3, 'jpmendoza', '$2b$12$1thUcZh/TJ8LcLOkPKZs.uB..zk8UTslhB3ykxyKdg8DPbaIlUmZe', 'AHORRO', '6251636393', 1200, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (4, 4, 4, 'alrodriguez', '$2b$12$BA1VPteylsfYUlgKyAfEvuW17rVQiNYmCuPWhsnb5CZw8nsH1E4s6', 'AHORRO', '4454327666', 5600, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (5, 5, 5, 'lavasquez', '$2b$12$Soock5EK6rlhzqkNlcgYBeBehng18/L0OF4FDlMkpNIURJgzn/G2G', 'AHORRO', '6622928432', 820, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (6, 6, 6, 'casalazar', '$2b$12$oixVrEuH7Zm.MNtdvouzZ.H0tocfQIlVSpJqdJBMQH8Ut3MrnPob2', 'AHORRO', '0669747369', 15000, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (7, 7, 7, 'dfmartinez', '$2b$12$OFv6LtmtioDb4Q0/h1f4CetwApIjxiX1YatiCOSN262uXCjnZeui6', 'AHORRO', '1849926757', 480, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (8, 8, 8, 'patorres', '$2b$12$QfsrpGv5hjDmhHnbd7SIFuiSEKp8sMAutBMLfJfyLetmgIxm6Aew6', 'AHORRO', '4929137911', 7600, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (9, 9, 9, 'cachavez', '$2b$12$68SwIHS/AQs1evegh5xnb.6/PC2IXunve9sslw0xBBYvb3M3/2ABC', 'AHORRO', '6565296014', 2300, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (10, 10, 10, 'vrios', '$2b$12$V0ouxitcSgDnRjD..QDe.OfKD.zVb2u5VYIQIxNCPCVPxXyK9T1MC', 'AHORRO', '6676198002', 10200, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (11, 11, 11, 'regutierrez', '$2b$12$5KyvUcJPECb9QnmFW4tXYeN/Wge.ovVrXtDfchZlxy4zozHbYP70i', 'AHORRO', '2350423807', 300, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (12, 12, 12, 'licastillo', '$2b$12$77W.NN3VtOapdXtDfV4VyuF6kzVwAmPQSjvglFn63.xf1YIL7QqQO', 'AHORRO', '5270065709', 5400, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (13, 13, 13, 'jemora', '$2b$12$QOoCTksdxEcV0DdhMjJROObFI5qUqQ/4qeesyko/BLu6fNc2OaNb6', 'AHORRO', '6781930257', 2500, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (14, 14, 14, 'mbmorales', '$2b$12$WfuD6Z.cs.rP9NUSYLx3gOn6SXVameQc26Lbdz69DtY9w9ls0GDtO', 'AHORRO', '5397185801', 6700, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (15, 15, 15, 'fjprieto', '$2b$12$S5zTtfUWXwrHi1cnBFq2sex6pOPu/U1bDsAl3TmKSbU.0GoHUCIMi', 'AHORRO', '2783328350', 980, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (16, 16, 16, 'nperalta', '$2b$12$j8gSDo8aK69/Pp7dHESADOz.pwD/XMpReFP3T.olnsbqsIFj4DHQC', 'AHORRO', '9623708081', 11300, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (17, 17, 17, 'sebsalinas', '$2b$12$fME0d5mze0ntb7boMrRssel2BPJPkT0XefgxFOeZclDZ0tRLbfCHq', 'AHORRO', '2158367177', 4600, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (18, 18, 18, 'pavillavicencio', '$2b$12$/9qajy6p5.QyGU9dRCchEe2scs50mERC/.CkXT0dLsMAPMfTnEvnS', 'AHORRO', '6098211283', 8800, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (19, 19, 19, 'cortiz', '$2b$12$iLy78CH61IOzC/K/xNTQPOPdegssbENxz/cgymVAism.o9NVQF70a', 'AHORRO', '1420713127', 1300, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (20, 20, 20, 'dfnieto', '$2b$12$O6otXWx5yQabUNovjoD.UOt26JXuj63HvXxF11w0Ia31QPh02zr5u', 'AHORRO', '1852149842', 7200, 'ACTIVA', 2.5, 3, 100.00);
INSERT INTO public.cuenta_ahorro (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, ca_interes, ca_limite_retiros, ca_min_saldo_remunerado) VALUES (21, 21, 21, 'apalacios', '$2b$12$pNzHqjc4lMDQikxn8evU8ecS5ZHbHItDuEAPInXxpCbr6DT2qOl6u', 'AHORRO', '0488388928', 4100, 'ACTIVA', 2.5, 3, 100.00);


--
-- TOC entry 3776 (class 0 OID 17383)
-- Dependencies: 262
-- Data for Name: cuenta_corriente; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cuenta_corriente (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, cc_limite_descubierto, cc_comision_mantenimiento, cc_num_cheques) VALUES (22, 22, 22, 'emprandinas', '$2b$12$LAdhULvPzJzRGp15gw7hhOXciG8LNOa3loAe9ebFNjPvFJ1WPmBY.', 'CORRIENTE', '3447194183', 25000, 'ACTIVA', 500.00, 5.00, 20);
INSERT INTO public.cuenta_corriente (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, cc_limite_descubierto, cc_comision_mantenimiento, cc_num_cheques) VALUES (23, 23, 23, 'tecnobright', '$2b$12$qROyVYSFxmVSr.4o023wdumAXAgt8JLK5qHH/7i7.EWk1/aEWcpPS', 'CORRIENTE', '8949867058', 17999.98, 'ACTIVA', 500.00, 5.00, 20);
INSERT INTO public.cuenta_corriente (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, cc_limite_descubierto, cc_comision_mantenimiento, cc_num_cheques) VALUES (24, 24, 24, 'distlaselva', '$2b$12$zexBAQdaamlUS3FhNPcUmOSWsF3lkD4UB2Bjob2cHMc6FrFNxoF06', 'CORRIENTE', '5653625362', 9500, 'ACTIVA', 500.00, 5.00, 20);
INSERT INTO public.cuenta_corriente (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, cc_limite_descubierto, cc_comision_mantenimiento, cc_num_cheques) VALUES (25, 25, 25, 'agroexportecu', '$2b$12$lqZ7VyApQm1e0xGfTpWmges3pkbkcSoURg1KHFc1qCUmo7h6Z6Xjy', 'CORRIENTE', '5562191091', 12000, 'ACTIVA', 500.00, 5.00, 20);
INSERT INTO public.cuenta_corriente (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, cc_limite_descubierto, cc_comision_mantenimiento, cc_num_cheques) VALUES (26, 26, 26, 'consultnor', '$2b$12$uHwJFsjS6mMJvS59bSxkP.k.zcdVPsdgzg/s2/guKPmW2PI6AQKDC', 'CORRIENTE', '2756120905', 5000, 'ACTIVA', 500.00, 5.00, 20);
INSERT INTO public.cuenta_corriente (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, cc_limite_descubierto, cc_comision_mantenimiento, cc_num_cheques) VALUES (27, 27, 27, 'constrandes', '$2b$12$p06D8KpR/DEicQZYXIVedeuyVwk5sOgOIm6R6zmovAE5eCWx.FzyW', 'CORRIENTE', '9108065766', 22000, 'ACTIVA', 500.00, 5.00, 20);
INSERT INTO public.cuenta_corriente (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, cc_limite_descubierto, cc_comision_mantenimiento, cc_num_cheques) VALUES (28, 28, 28, 'farmasalud', '$2b$12$/PfhS7Vssrgjp.01oZ7z8upip7OEeIY/RSzshZcac28yTrKS.BQ/S', 'CORRIENTE', '1836819200', 16000, 'ACTIVA', 500.00, 5.00, 20);
INSERT INTO public.cuenta_corriente (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, cc_limite_descubierto, cc_comision_mantenimiento, cc_num_cheques) VALUES (29, 29, 29, 'logistglobal', '$2b$12$KiGSc6Dz/0xEyBrLlEK6BOqJMYZjFm6jgCDn90jWSzeiJ5n76y6ZO', 'CORRIENTE', '7616653928', 30000, 'ACTIVA', 500.00, 5.00, 20);
INSERT INTO public.cuenta_corriente (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, cc_limite_descubierto, cc_comision_mantenimiento, cc_num_cheques) VALUES (30, 30, 30, 'educavan', '$2b$12$n4MwWgui14lXkBIr5GApY.oPxs5uP0IpNO/eSVv538M58izwldUNy', 'CORRIENTE', '3565278773', 8000, 'ACTIVA', 500.00, 5.00, 20);
INSERT INTO public.cuenta_corriente (cuen_id, per_id, cli_id, cuen_usuario, cuen_password, cuen_tipo, cuen_numero_cuenta, cuen_saldo, cuen_estado, cc_limite_descubierto, cc_comision_mantenimiento, cc_num_cheques) VALUES (31, 31, 31, 'tecnoquito', '$2b$12$kGBXBrif6VA/IQ1x9TyS1OWTXEIuKVMYqHWeZu8UNhVd3NcBKFa7u', 'CORRIENTE', '0878219314', 14000, 'ACTIVA', 500.00, 5.00, 20);


--
-- TOC entry 3777 (class 0 OID 17388)
-- Dependencies: 263
-- Data for Name: depositos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.depositos (tran_id, dep_id, cuen_id, caj_id, dep_fecha, dep_monto, dep_cuenta_dest, dep_canal, dep_referencia, dep_estado) VALUES (101, 1, 10, 3010, '2025-08-05', 500.00, '0102030410', 'Ventana', 'REF7201', 'Completado');
INSERT INTO public.depositos (tran_id, dep_id, cuen_id, caj_id, dep_fecha, dep_monto, dep_cuenta_dest, dep_canal, dep_referencia, dep_estado) VALUES (102, 2, 11, 3001, '2025-08-04', 1000.00, '0102030411', 'Buzón', 'REF7202', 'Completado');
INSERT INTO public.depositos (tran_id, dep_id, cuen_id, caj_id, dep_fecha, dep_monto, dep_cuenta_dest, dep_canal, dep_referencia, dep_estado) VALUES (103, 3, 12, 3002, '2025-08-03', 250.00, '0102030412', 'Ventana', 'REF7203', 'Completado');
INSERT INTO public.depositos (tran_id, dep_id, cuen_id, caj_id, dep_fecha, dep_monto, dep_cuenta_dest, dep_canal, dep_referencia, dep_estado) VALUES (104, 4, 13, 3003, '2025-08-02', 150.00, '0102030413', 'ATM', 'REF7204', 'Completado');
INSERT INTO public.depositos (tran_id, dep_id, cuen_id, caj_id, dep_fecha, dep_monto, dep_cuenta_dest, dep_canal, dep_referencia, dep_estado) VALUES (105, 5, 14, 3004, '2025-08-01', 600.00, '0102030414', 'Ventana', 'REF7205', 'Completado');


--
-- TOC entry 3778 (class 0 OID 17393)
-- Dependencies: 264
-- Data for Name: pago_servicios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pago_servicios (tran_id, ps_id, cuen_id, caj_id, ps_tipo_servicio, ps_proveedor, ps_referencia, ps_monto, ps_fecha_hora, ps_comision, ps_resultado_codigo, ps_estado, ps_comprobante) VALUES (201, 1, 15, 3005, 'Agua', 'EMAQ', 'FAC7301', 45.00, '2025-08-05', 0.75, '200', 'Exitoso', 'Pago agua mes anterior');
INSERT INTO public.pago_servicios (tran_id, ps_id, cuen_id, caj_id, ps_tipo_servicio, ps_proveedor, ps_referencia, ps_monto, ps_fecha_hora, ps_comision, ps_resultado_codigo, ps_estado, ps_comprobante) VALUES (202, 2, 16, 3006, 'Luz', 'EEGEP', 'FAC7302', 65.00, '2025-08-04', 0.80, '200', 'Exitoso', 'Pago luz mes anterior');
INSERT INTO public.pago_servicios (tran_id, ps_id, cuen_id, caj_id, ps_tipo_servicio, ps_proveedor, ps_referencia, ps_monto, ps_fecha_hora, ps_comision, ps_resultado_codigo, ps_estado, ps_comprobante) VALUES (203, 3, 17, 3007, 'Internet', 'CNT', 'FAC7303', 55.00, '2025-08-03', 0.60, '200', 'Exitoso', 'Pago internet');
INSERT INTO public.pago_servicios (tran_id, ps_id, cuen_id, caj_id, ps_tipo_servicio, ps_proveedor, ps_referencia, ps_monto, ps_fecha_hora, ps_comision, ps_resultado_codigo, ps_estado, ps_comprobante) VALUES (204, 4, 18, 3008, 'Telefonía', 'CLARO', 'FAC7304', 30.00, '2025-08-02', 0.50, '200', 'Exitoso', 'Pago celular');
INSERT INTO public.pago_servicios (tran_id, ps_id, cuen_id, caj_id, ps_tipo_servicio, ps_proveedor, ps_referencia, ps_monto, ps_fecha_hora, ps_comision, ps_resultado_codigo, ps_estado, ps_comprobante) VALUES (205, 5, 19, 3009, 'Televisión', 'DIRECTV', 'FAC7305', 80.00, '2025-08-01', 0.90, '200', 'Exitoso', 'Pago TV');


--
-- TOC entry 3779 (class 0 OID 17398)
-- Dependencies: 265
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (1, 'Darwin Javier', 'Panchez Jacome', '2002-08-01', 'Masculino', '0962804958', 'darwin@gmail.com', 'Av. Los Volcanes', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (2, 'María Fernanda', 'Gómez Castillo', '1984-03-14', 'Femenino', '0991234567', 'mf.gomez@correo.com', 'Calle Shyris 456, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (3, 'Juan Pablo', 'Mendoza Suárez', '1990-07-22', 'Masculino', '0987654321', 'jp.mendoza@correo.com', 'Av. Amazonas 890, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (4, 'Ana Lucía', 'Rodríguez Pérez', '1978-05-11', 'Femenino', '0993344556', 'al.rodriguez@correo.com', 'Calle Shyris 456, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (5, 'Luis Alberto', 'Vásquez Molina', '1982-02-18', 'Masculino', '0981122334', 'la.vasquez@correo.com', 'Pasaje Oriente 12, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (6, 'Carolina Andrea', 'Salazar Rivera', '1995-09-30', 'Femenino', '0992233445', 'ca.salazar@correo.com', 'Av. 6 de Diciembre 2100, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (7, 'Diego Fernando', 'Martínez López', '1988-06-12', 'Masculino', '0989988776', 'df.martinez@correo.com', 'Calle México 300, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (8, 'Paola Andrea', 'Torres Jiménez', '1992-04-27', 'Femenino', '0995566778', 'pa.torres@correo.com', 'Av. González Suárez 345, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (9, 'Carlos Andrés', 'Chávez Herrera', '1975-12-19', 'Masculino', '0987766554', 'ca.chavez@correo.com', 'Calle Princesa 50, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (10, 'Verónica', 'Ríos García', '1987-08-08', 'Femenino', '0994455667', 'v.rios@correo.com', 'Av. Colón 780, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (11, 'Ricardo Esteban', 'Gutiérrez Pacheco', '1983-01-15', 'Masculino', '0989988112', 're.gutierrez@correo.com', 'Calle la Pradera 25, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (12, 'Lorena Isabel', 'Castillo Vega', '1994-05-10', 'Femenino', '0998877665', 'li.castillo@correo.com', 'Av. Eloy Alfaro 1500, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (13, 'Jorge Enrique', 'Mora Bravo', '1979-10-23', 'Masculino', '0986677889', 'je.mora@correo.com', 'Calle La República 400, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (14, 'María Belén', 'Morales Estrada', '1993-03-02', 'Femenino', '0993344557', 'mb.morales@correo.com', 'Av. Naciones Unidas 2200, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (15, 'Fernando José', 'Prieto Silva', '1981-11-29', 'Masculino', '0982233445', 'fj.prieto@correo.com', 'Calle 10 de Agosto 600, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (16, 'Natalia', 'Peralta Cuevas', '1996-07-17', 'Femenino', '0995566443', 'n.peralta@correo.com', 'Av. Guayacanes 1200, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (17, 'Sebastián', 'Salinas Zambrano', '1989-09-09', 'Masculino', '0983344556', 's.salinas@correo.com', 'Calle Venezuela 100, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (18, 'Paúl Andrés', 'Villavicencio Rojas', '1991-02-05', 'Masculino', '0992233446', 'pa.villavicencio@correo.com', 'Av. República del Salvador 950, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (19, 'Camila', 'Ortiz León', '1997-06-21', 'Femenino', '0984455661', 'c.ortiz@correo.com', 'Calle Juan de Dios 300, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (20, 'David Felipe', 'Nieto Durán', '1984-12-12', 'Masculino', '0996677882', 'df.nieto@correo.com', 'Av. América 1800, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (21, 'Andrea', 'Palacios Castro', '1998-04-04', 'Femenino', '0987766332', 'a.palacios@correo.com', 'Calle Los Libertadores 90, Quito', 'NATURAL');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (22, 'Empresas Andinas S.A.', 'Empresas Andinas', '1978-05-11', 'Masculino', '0922345678', 'contacto@andinas.com', 'Av. Universitaria, Quito', 'JURIDICA');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (23, 'Tecnobright S.A.', 'Tecnobright', '1982-02-18', 'Femenino', '0922334455', 'info@tecnobright.com', 'Calle Guayaquil 123, Quito', 'JURIDICA');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (24, 'Distribuidora La Selva S.A.', 'Distribuidora La Selva', '1985-03-14', 'Masculino', '0922445566', 'ventas@laselva.com', 'Av. La Prensa 456, Quito', 'JURIDICA');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (25, 'Agroexport Ecuador S.A.', 'Agroexport Ecuador', '1984-12-12', 'Femenino', '0922556677', 'contacto@agroexport.com', 'Calle República 78, Quito', 'JURIDICA');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (26, 'Consultores del Norte S.A.', 'Consultores del Norte', '1975-12-19', 'Masculino', '0922667788', 'info@consultoresnorte.com', 'Av. 12 de Octubre 890, Quito', 'JURIDICA');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (27, 'Constructora Andes S.A.', 'Constructora Andes', '1972-04-27', 'Masculino', '0922778899', 'ventas@andesconstruye.com', 'Calle Loja 234, Quito', 'JURIDICA');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (28, 'Farmacias Salud S.A.', 'Farmacias Salud', '1992-04-27', 'Femenino', '0922889900', 'contacto@farmaciasalud.com', 'Av. Naciones Unidas 345, Quito', 'JURIDICA');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (29, 'Logística Global S.A.', 'Logística Global', '1975-05-19', 'Masculino', '0922990011', 'info@logisticaglobal.com', 'Calle Venezuela 567, Quito', 'JURIDICA');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (30, 'Educación Avanzada S.A.', 'Educación Avanzada', '1981-11-29', 'Femenino', '0922101112', 'contacto@eduavanzada.com', 'Av. Amazonas 890, Quito', 'JURIDICA');
INSERT INTO public.persona (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo) VALUES (31, 'Tecnologías Quito S.A.', 'Tecnologías Quito', '1987-08-08', 'Masculino', '0922121314', 'info@techquito.com', 'Calle Guápulo 321, Quito', 'JURIDICA');


--
-- TOC entry 3780 (class 0 OID 17403)
-- Dependencies: 266
-- Data for Name: persona_juridica; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.persona_juridica (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pj_ruc, pj_representante, pj_tipo_entidad, pj_fecha_constitucion, pj_actividad) VALUES (22, 'Empresas Andinas S.A.', 'Empresas Andinas', '1978-05-11', 'Masculino', '0922345678', 'contacto@andinas.com', 'Av. Universitaria, Quito', 'JURIDICA', '0998765432001', 'Carlos Pérez', 'SA', '2005-06-01', 'Comercial');
INSERT INTO public.persona_juridica (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pj_ruc, pj_representante, pj_tipo_entidad, pj_fecha_constitucion, pj_actividad) VALUES (23, 'Tecnobright S.A.', 'Tecnobright', '1982-02-18', 'Femenino', '0922334455', 'info@tecnobright.com', 'Calle Guayaquil 123, Quito', 'JURIDICA', '0998765432002', 'María Torres', 'SA', '2010-03-15', 'Tecnología');
INSERT INTO public.persona_juridica (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pj_ruc, pj_representante, pj_tipo_entidad, pj_fecha_constitucion, pj_actividad) VALUES (24, 'Distribuidora La Selva S.A.', 'Distribuidora La Selva', '1985-03-14', 'Masculino', '0922445566', 'ventas@laselva.com', 'Av. La Prensa 456, Quito', 'JURIDICA', '0998765432003', 'José Vargas', 'SA', '2012-07-22', 'Distribución');
INSERT INTO public.persona_juridica (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pj_ruc, pj_representante, pj_tipo_entidad, pj_fecha_constitucion, pj_actividad) VALUES (25, 'Agroexport Ecuador S.A.', 'Agroexport Ecuador', '1984-12-12', 'Femenino', '0922556677', 'contacto@agroexport.com', 'Calle República 78, Quito', 'JURIDICA', '0998765432004', 'Ana López', 'SA', '2008-05-30', 'Agroexportación');
INSERT INTO public.persona_juridica (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pj_ruc, pj_representante, pj_tipo_entidad, pj_fecha_constitucion, pj_actividad) VALUES (26, 'Consultores del Norte S.A.', 'Consultores del Norte', '1975-12-19', 'Masculino', '0922667788', 'info@consultoresnorte.com', 'Av. 12 de Octubre 890, Quito', 'JURIDICA', '0998765432005', 'Miguel Rivera', 'SA', '2015-11-10', 'Consultoría');
INSERT INTO public.persona_juridica (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pj_ruc, pj_representante, pj_tipo_entidad, pj_fecha_constitucion, pj_actividad) VALUES (27, 'Constructora Andes S.A.', 'Constructora Andes', '1972-04-27', 'Masculino', '0922778899', 'ventas@andesconstruye.com', 'Calle Loja 234, Quito', 'JURIDICA', '0998765432006', 'Ricardo Castillo', 'SA', '2000-02-20', 'Construcción');
INSERT INTO public.persona_juridica (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pj_ruc, pj_representante, pj_tipo_entidad, pj_fecha_constitucion, pj_actividad) VALUES (28, 'Farmacias Salud S.A.', 'Farmacias Salud', '1992-04-27', 'Femenino', '0922889900', 'contacto@farmaciasalud.com', 'Av. Naciones Unidas 345, Quito', 'JURIDICA', '0998765432007', 'Laura Sánchez', 'SA', '2018-09-01', 'Salud');
INSERT INTO public.persona_juridica (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pj_ruc, pj_representante, pj_tipo_entidad, pj_fecha_constitucion, pj_actividad) VALUES (29, 'Logística Global S.A.', 'Logística Global', '1975-05-19', 'Masculino', '0922990011', 'info@logisticaglobal.com', 'Calle Venezuela 567, Quito', 'JURIDICA', '0998765432008', 'Andrés Pérez', 'SA', '2013-01-25', 'Logística');
INSERT INTO public.persona_juridica (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pj_ruc, pj_representante, pj_tipo_entidad, pj_fecha_constitucion, pj_actividad) VALUES (30, 'Educación Avanzada S.A.', 'Educación Avanzada', '1981-11-29', 'Femenino', '0922101112', 'contacto@eduavanzada.com', 'Av. Amazonas 890, Quito', 'JURIDICA', '0998765432009', 'Patricia Jiménez', 'SA', '2016-06-05', 'Educación');
INSERT INTO public.persona_juridica (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pj_ruc, pj_representante, pj_tipo_entidad, pj_fecha_constitucion, pj_actividad) VALUES (31, 'Tecnologías Quito S.A.', 'Tecnologías Quito', '1987-08-08', 'Masculino', '0922121314', 'info@techquito.com', 'Calle Guápulo 321, Quito', 'JURIDICA', '0998765432010', 'David Herrera', 'SA', '2019-04-18', 'Tecnología');


--
-- TOC entry 3781 (class 0 OID 17408)
-- Dependencies: 267
-- Data for Name: persona_natural; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (1, 'Darwin Javier', 'Panchez Jacome', '2002-08-01', 'Masculino', '0962804958', 'darwin@gmail.com', 'Av. Los Volcanes', 'NATURAL', '1755897285', 'SOLTERO', 'Estudiante');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (2, 'María Fernanda', 'Gómez Castillo', '1984-03-14', 'Femenino', '0991234567', 'mf.gomez@correo.com', 'Calle Shyris 456, Quito', 'NATURAL', '1712345678', 'CASADO', 'Arquitecta');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (3, 'Juan Pablo', 'Mendoza Suárez', '1990-07-22', 'Masculino', '0987654321', 'jp.mendoza@correo.com', 'Av. Amazonas 890, Quito', 'NATURAL', '1712345673', 'SOLTERO', 'Ingeniero');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (4, 'Ana Lucía', 'Rodríguez Pérez', '1978-05-11', 'Femenino', '0993344556', 'al.rodriguez@correo.com', 'Calle Shyris 456, Quito', 'NATURAL', '1712345674', 'CASADO', 'Abogada');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (5, 'Luis Alberto', 'Vásquez Molina', '1982-02-18', 'Masculino', '0981122334', 'la.vasquez@correo.com', 'Pasaje Oriente 12, Quito', 'NATURAL', '1712345675', 'SOLTERO', 'Contador');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (6, 'Carolina Andrea', 'Salazar Rivera', '1995-09-30', 'Femenino', '0992233445', 'ca.salazar@correo.com', 'Av. 6 de Diciembre 2100, Quito', 'NATURAL', '1712345676', 'SOLTERO', 'Diseñadora');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (7, 'Diego Fernando', 'Martínez López', '1988-06-12', 'Masculino', '0989988776', 'df.martinez@correo.com', 'Calle México 300, Quito', 'NATURAL', '1712345677', 'CASADO', 'Docente');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (8, 'Paola Andrea', 'Torres Jiménez', '1992-04-27', 'Femenino', '0995566778', 'pa.torres@correo.com', 'Av. González Suárez 345, Quito', 'NATURAL', '1712345679', 'SOLTERO', 'Médica');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (9, 'Carlos Andrés', 'Chávez Herrera', '1975-12-19', 'Masculino', '0987766554', 'ca.chavez@correo.com', 'Calle Princesa 50, Quito', 'NATURAL', '1712345680', 'CASADO', 'Empresario');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (10, 'Verónica', 'Ríos García', '1987-08-08', 'Femenino', '0994455667', 'v.rios@correo.com', 'Av. Colón 780, Quito', 'NATURAL', '1712345681', 'SOLTERO', 'Periodista');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (11, 'Ricardo Esteban', 'Gutiérrez Pacheco', '1983-01-15', 'Masculino', '0989988112', 're.gutierrez@correo.com', 'Calle la Pradera 25, Quito', 'NATURAL', '1712345682', 'CASADO', 'Ingeniero');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (12, 'Lorena Isabel', 'Castillo Vega', '1994-05-10', 'Femenino', '0998877665', 'li.castillo@correo.com', 'Av. Eloy Alfaro 1500, Quito', 'NATURAL', '1712345683', 'SOLTERO', 'Administradora');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (13, 'Jorge Enrique', 'Mora Bravo', '1979-10-23', 'Masculino', '0986677889', 'je.mora@correo.com', 'Calle La República 400, Quito', 'NATURAL', '1712345684', 'CASADO', 'Abogado');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (14, 'María Belén', 'Morales Estrada', '1993-03-02', 'Femenino', '0993344557', 'mb.morales@correo.com', 'Av. Naciones Unidas 2200, Quito', 'NATURAL', '1712345685', 'SOLTERO', 'Psicóloga');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (15, 'Fernando José', 'Prieto Silva', '1981-11-29', 'Masculino', '0982233445', 'fj.prieto@correo.com', 'Calle 10 de Agosto 600, Quito', 'NATURAL', '1712345686', 'CASADO', 'Contador');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (16, 'Natalia', 'Peralta Cuevas', '1996-07-17', 'Femenino', '0995566443', 'n.peralta@correo.com', 'Av. Guayacanes 1200, Quito', 'NATURAL', '1712345687', 'SOLTERO', 'Ingeniera');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (17, 'Sebastián', 'Salinas Zambrano', '1989-09-09', 'Masculino', '0983344556', 's.salinas@correo.com', 'Calle Venezuela 100, Quito', 'NATURAL', '1712345688', 'CASADO', 'Docente');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (18, 'Paúl Andrés', 'Villavicencio Rojas', '1991-02-05', 'Masculino', '0992233446', 'pa.villavicencio@correo.com', 'Av. República del Salvador 950, Quito', 'NATURAL', '1712345689', 'SOLTERO', 'Publicista');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (19, 'Camila', 'Ortiz León', '1997-06-21', 'Femenino', '0984455661', 'c.ortiz@correo.com', 'Calle Juan de Dios 300, Quito', 'NATURAL', '1712345690', 'SOLTERO', 'Estudiante');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (20, 'David Felipe', 'Nieto Durán', '1984-12-12', 'Masculino', '0996677882', 'df.nieto@correo.com', 'Av. América 1800, Quito', 'NATURAL', '1712345691', 'CASADO', 'Empresario');
INSERT INTO public.persona_natural (per_id, per_nombres, per_apellidos, per_fecha_nacimiento, per_genero, per_telefono, per_correo, per_direccion, per_tipo, pn_identificacion, pn_estado_civil, pn_profesion) VALUES (21, 'Andrea', 'Palacios Castro', '1998-04-04', 'Femenino', '0987766332', 'a.palacios@correo.com', 'Calle Los Libertadores 90, Quito', 'NATURAL', '1712345692', 'SOLTERO', 'Nutricionista');


--
-- TOC entry 3782 (class 0 OID 17413)
-- Dependencies: 268
-- Data for Name: retiro; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (1, 1, 1, 3001, '2025-08-01 00:00:00', 100, 'ONLINE', '0001');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (2, 2, 1, 3009, '2025-08-01 03:31:12.517214', 100, 'ONLINE', '0002');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (3, 3, 1, 3001, '2025-08-01 03:59:20.225275', 10, 'ONLINE', '0003');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (4, 4, 1, 3008, '2025-08-01 04:02:48.722263', 10, 'ONLINE', '0004');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (5, 5, 1, 3007, '2025-08-01 04:05:03.546342', 200, 'ONLINE', '0005');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (6, 6, 1, 3009, '2025-07-31 23:47:42.289453', 20, 'ONLINE', '0006');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (7, 7, 1, 3008, '2025-08-01 07:21:07.451269', 200, 'ONLINE', '0007');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (8, 8, 1, 3002, '2025-08-01 07:25:31.484403', 150, 'ONLINE', '0008');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (9, 9, 1, 3004, '2025-08-01 07:28:08.218851', 10, 'ONLINE', '0009');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (10, 10, 1, 3006, '2025-08-01 07:29:32.218472', 10, 'ONLINE', '0010');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (11, 11, 1, 3007, '2025-08-01 07:30:32.938095', 20, 'ONLINE', '0011');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (12, 12, 1, 3001, '2025-08-05 08:42:03.466117', 300, 'ONLINE', '0012');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (406, 13, 2, 3003, '2025-08-06 07:48:46.346077', 20, 'ONLINE', '0406');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (407, 14, 3, 3002, '2025-08-06 07:50:12.46174', 40, 'ONLINE', '0407');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (408, 15, 4, 3006, '2025-08-06 07:51:19.172982', 10, 'ONLINE', '0408');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (409, 16, 5, 3004, '2025-08-06 07:52:26.656136', 20, 'ONLINE', '0409');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (410, 17, 6, 3001, '2025-08-06 07:53:30.991024', 40, 'ONLINE', '0410');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (411, 18, 7, 3008, '2025-08-06 07:55:34.915369', 100, 'ONLINE', '0411');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (412, 19, 8, 3007, '2025-08-06 07:57:13.960025', 50, 'ONLINE', '0412');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (413, 20, 9, 3006, '2025-08-06 07:58:42.359927', 300, 'ONLINE', '0413');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (414, 21, 10, 3002, '2025-08-06 08:00:03.232224', 300, 'ONLINE', '0414');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (415, 22, 11, 3010, '2025-08-06 08:01:12.901499', 30, 'ONLINE', '0415');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (416, 23, 1, 3001, '2025-08-06 22:33:38.444253', 60, 'ONLINE', '0416');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (417, 24, 1, 3003, '2025-08-06 22:37:38.546371', 20, 'ONLINE', '0417');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (418, 25, 1, 3001, '2025-08-06 22:41:16.999195', 40, 'ONLINE', '0418');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (419, 26, 1, 3002, '2025-08-08 09:25:17.487064', 10, 'ONLINE', '0419');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (420, 27, 1, 3006, '2025-08-08 09:26:36.94241', 20, 'ONLINE', '0420');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (421, 28, 1, 3003, '2025-08-08 09:29:14.576589', 30, 'ONLINE', '0421');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (422, 29, 1, 3005, '2025-08-08 09:30:58.706368', 10, 'ONLINE', '0422');
INSERT INTO public.retiro (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran) VALUES (423, 30, 1, 3004, '2025-08-08 09:37:07.043036', 40, 'ONLINE', '0423');


--
-- TOC entry 3783 (class 0 OID 17416)
-- Dependencies: 269
-- Data for Name: retiro_contarjeta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.retiro_contarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, rett_imprimir, rett_montomax) VALUES (3, 3, 1, 3001, '2025-08-01 03:59:20.348549', 10, 'ONLINE', '0003', 'SI', 500);
INSERT INTO public.retiro_contarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, rett_imprimir, rett_montomax) VALUES (7, 7, 1, 3008, '2025-08-01 07:21:07.56787', 200, 'ONLINE', '0007', 'SI', 500);
INSERT INTO public.retiro_contarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, rett_imprimir, rett_montomax) VALUES (406, 13, 2, 3003, '2025-08-06 07:48:46.468976', 20, 'ONLINE', '0406', 'SI', 500);
INSERT INTO public.retiro_contarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, rett_imprimir, rett_montomax) VALUES (407, 14, 3, 3002, '2025-08-06 07:50:12.579715', 40, 'ONLINE', '0407', 'NO', 500);
INSERT INTO public.retiro_contarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, rett_imprimir, rett_montomax) VALUES (408, 15, 4, 3006, '2025-08-06 07:51:19.288381', 10, 'ONLINE', '0408', 'SI', 500);
INSERT INTO public.retiro_contarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, rett_imprimir, rett_montomax) VALUES (409, 16, 5, 3004, '2025-08-06 07:52:26.772374', 20, 'ONLINE', '0409', 'NO', 500);
INSERT INTO public.retiro_contarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, rett_imprimir, rett_montomax) VALUES (410, 17, 6, 3001, '2025-08-06 07:53:31.108877', 40, 'ONLINE', '0410', 'SI', 500);
INSERT INTO public.retiro_contarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, rett_imprimir, rett_montomax) VALUES (416, 23, 1, 3001, '2025-08-06 22:33:38.565581', 60, 'ONLINE', '0416', 'SI', 500);
INSERT INTO public.retiro_contarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, rett_imprimir, rett_montomax) VALUES (418, 25, 1, 3001, '2025-08-06 22:41:17.112048', 40, 'ONLINE', '0418', 'SI', 500);
INSERT INTO public.retiro_contarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, rett_imprimir, rett_montomax) VALUES (423, 30, 1, 3004, '2025-08-08 09:37:07.161588', 40, 'ONLINE', '0423', 'SI', 500);


--
-- TOC entry 3784 (class 0 OID 17419)
-- Dependencies: 270
-- Data for Name: retiro_sintarjeta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (1, 1, 1, 3001, '2025-08-01 00:00:00', 100, 'ONLINE', '0001', 1, '581547', '0962804958', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (6, 6, 1, 3009, '2025-07-31 23:47:42.404144', 20, 'ONLINE', '0006', 1, '710387', '0962804958', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (2, 2, 1, 3009, '2025-07-01 03:31:12.635287', 200, 'ONLINE', '0002', 1, '673087', '0962804958', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (4, 4, 1, 3008, '2025-07-01 04:02:48.837987', 10, 'ONLINE', '0004', 1, '049427', '0962804958', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (5, 5, 1, 3007, '2025-07-01 04:05:03.660914', 200, 'ONLINE', '0005', 1, '800531', '0962804958', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (8, 8, 1, 3002, '2025-08-01 07:25:31.599295', 150, 'ONLINE', '0008', 1, '104784', '0987995244', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (9, 9, 1, 3004, '2025-08-01 07:28:08.338406', 10, 'ONLINE', '0009', 1, '094524', '0987995244', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (10, 10, 1, 3006, '2025-08-01 07:29:32.334277', 10, 'ONLINE', '0010', 1, '081140', '0987995244', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (11, 11, 1, 3007, '2025-07-01 07:30:33.054795', 20, 'ONLINE', '0011', 1, '754133', '0987995244', 'NO USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (12, 12, 1, 3001, '2025-08-05 08:42:03.588756', 300, 'ONLINE', '0012', 1, '423565', '0996172996', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (411, 18, 7, 3008, '2025-08-06 07:55:35.033902', 100, 'ONLINE', '0411', 1, '479976', '0989988776', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (412, 19, 8, 3007, '2025-08-06 07:57:14.07521', 50, 'ONLINE', '0412', 1, '036083', '0995566778', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (413, 20, 9, 3006, '2025-08-06 07:58:42.474889', 300, 'ONLINE', '0413', 1, '540622', '0987766554', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (414, 21, 10, 3002, '2025-08-06 08:00:03.348968', 300, 'ONLINE', '0414', 1, '726521', '0994455667', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (415, 22, 11, 3010, '2025-08-06 08:01:13.018198', 30, 'ONLINE', '0415', 1, '760184', '0989988112', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (417, 24, 1, 3003, '2025-08-06 22:37:38.660099', 20, 'ONLINE', '0417', 1, '212370', '0912345678', 'ACTIVO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (419, 26, 1, 3002, '2025-08-08 09:25:17.608165', 10, 'ONLINE', '0419', 1, '181379', '0987995244', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (420, 27, 1, 3006, '2025-08-08 09:26:37.05932', 20, 'ONLINE', '0420', 1, '923441', '0987995244', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (421, 28, 1, 3003, '2025-08-08 09:29:14.691471', 30, 'ONLINE', '0421', 1, '436599', '0987995244', 'USADO');
INSERT INTO public.retiro_sintarjeta (tran_id, ret_id, cuen_id, caj_id, ret_fecha, ret_monto, ret_cajero, ret_numero_tran, cond_id, rets_codigo, rets_telefono_asociado, rets_estado_codigo) VALUES (422, 29, 1, 3005, '2025-08-08 09:30:58.820411', 10, 'ONLINE', '0422', 1, '691582', '0962804958', 'ACTIVO');


--
-- TOC entry 3785 (class 0 OID 17422)
-- Dependencies: 271
-- Data for Name: tarjeta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (1, 1, '3163148462201607', '2025-08-01', '2029-07-31', 'ACTIVA', '198', 'DEBITO', '1234');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (2, 1, '6659959733909121', '2025-08-01', '2029-07-31', 'ACTIVA', '646', 'DEBITO', '1234');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (3, 2, '5192057714210261', '2025-08-05', '2029-08-04', 'ACTIVA', '134', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (4, 3, '1502165201813492', '2025-08-05', '2029-08-04', 'ACTIVA', '616', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (5, 4, '4538164868305399', '2025-08-05', '2029-08-04', 'ACTIVA', '606', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (6, 5, '0931460239611687', '2025-08-05', '2029-08-04', 'ACTIVA', '150', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (7, 6, '1641438403792939', '2025-08-05', '2029-08-04', 'ACTIVA', '061', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (8, 7, '7705360388319460', '2025-08-05', '2029-08-04', 'ACTIVA', '997', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (9, 8, '3052434828357292', '2025-08-05', '2029-08-04', 'ACTIVA', '429', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (10, 9, '2568703954243113', '2025-08-05', '2029-08-04', 'ACTIVA', '127', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (11, 10, '6566619565847532', '2025-08-05', '2029-08-04', 'ACTIVA', '198', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (12, 11, '0276399543458431', '2025-08-05', '2029-08-04', 'ACTIVA', '023', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (13, 12, '2577611484654414', '2025-08-05', '2029-08-04', 'ACTIVA', '770', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (14, 13, '7447175203188109', '2025-08-05', '2029-08-04', 'ACTIVA', '070', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (15, 14, '1311293499211900', '2025-08-05', '2029-08-04', 'ACTIVA', '832', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (16, 15, '1565443393698748', '2025-08-06', '2029-08-05', 'ACTIVA', '416', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (17, 16, '4552305157442019', '2025-08-06', '2029-08-05', 'ACTIVA', '111', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (18, 17, '5521033972438111', '2025-08-06', '2029-08-05', 'ACTIVA', '351', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (19, 18, '6608052235132183', '2025-08-06', '2029-08-05', 'ACTIVA', '605', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (20, 19, '2102690824596179', '2025-08-06', '2029-08-05', 'ACTIVA', '777', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (21, 20, '5542103202683125', '2025-08-06', '2029-08-05', 'ACTIVA', '675', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (22, 21, '4471553060649959', '2025-08-06', '2029-08-05', 'ACTIVA', '770', 'DEBITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (23, 22, '0921286757709344', '2025-08-06', '2029-08-05', 'ACTIVA', '225', 'CREDITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (24, 23, '7683547918914840', '2025-08-06', '2029-08-05', 'ACTIVA', '494', 'CREDITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (25, 24, '7874910644948124', '2025-08-06', '2029-08-05', 'ACTIVA', '992', 'CREDITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (26, 25, '4910146833007666', '2025-08-06', '2029-08-05', 'ACTIVA', '152', 'CREDITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (27, 26, '0907036628111987', '2025-08-06', '2029-08-05', 'ACTIVA', '872', 'CREDITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (28, 27, '6762127755738073', '2025-08-06', '2029-08-05', 'ACTIVA', '412', 'CREDITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (29, 28, '0863402539481998', '2025-08-06', '2029-08-05', 'ACTIVA', '728', 'CREDITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (30, 29, '4874917696727780', '2025-08-06', '2029-08-05', 'ACTIVA', '829', 'CREDITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (31, 30, '8054509667862220', '2025-08-06', '2029-08-05', 'ACTIVA', '294', 'CREDITO', '5846');
INSERT INTO public.tarjeta (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin) VALUES (32, 31, '4293597274179153', '2025-08-06', '2029-08-05', 'ACTIVA', '827', 'CREDITO', '5846');


--
-- TOC entry 3786 (class 0 OID 17425)
-- Dependencies: 272
-- Data for Name: tarjeta_credito; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tarjeta_credito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, tc_limite_credito, tc_tasa_interes, tc_cargo_anual, tc_fecha_corte, tc_fecha_vencimiento, tc_morosidad) VALUES (23, 22, '0921286757709344', '2025-08-06', '2029-08-05', 'ACTIVA', '225', 'CREDITO', '5846', 1000.00, 24.50, 50.00, '2025-09-05', '2025-09-20', false);
INSERT INTO public.tarjeta_credito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, tc_limite_credito, tc_tasa_interes, tc_cargo_anual, tc_fecha_corte, tc_fecha_vencimiento, tc_morosidad) VALUES (24, 23, '7683547918914840', '2025-08-06', '2029-08-05', 'ACTIVA', '494', 'CREDITO', '5846', 1000.00, 24.50, 50.00, '2025-09-05', '2025-09-20', false);
INSERT INTO public.tarjeta_credito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, tc_limite_credito, tc_tasa_interes, tc_cargo_anual, tc_fecha_corte, tc_fecha_vencimiento, tc_morosidad) VALUES (25, 24, '7874910644948124', '2025-08-06', '2029-08-05', 'ACTIVA', '992', 'CREDITO', '5846', 1000.00, 24.50, 50.00, '2025-09-05', '2025-09-20', false);
INSERT INTO public.tarjeta_credito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, tc_limite_credito, tc_tasa_interes, tc_cargo_anual, tc_fecha_corte, tc_fecha_vencimiento, tc_morosidad) VALUES (26, 25, '4910146833007666', '2025-08-06', '2029-08-05', 'ACTIVA', '152', 'CREDITO', '5846', 1000.00, 24.50, 50.00, '2025-09-05', '2025-09-20', false);
INSERT INTO public.tarjeta_credito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, tc_limite_credito, tc_tasa_interes, tc_cargo_anual, tc_fecha_corte, tc_fecha_vencimiento, tc_morosidad) VALUES (27, 26, '0907036628111987', '2025-08-06', '2029-08-05', 'ACTIVA', '872', 'CREDITO', '5846', 1000.00, 24.50, 50.00, '2025-09-05', '2025-09-20', false);
INSERT INTO public.tarjeta_credito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, tc_limite_credito, tc_tasa_interes, tc_cargo_anual, tc_fecha_corte, tc_fecha_vencimiento, tc_morosidad) VALUES (28, 27, '6762127755738073', '2025-08-06', '2029-08-05', 'ACTIVA', '412', 'CREDITO', '5846', 1000.00, 24.50, 50.00, '2025-09-05', '2025-09-20', false);
INSERT INTO public.tarjeta_credito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, tc_limite_credito, tc_tasa_interes, tc_cargo_anual, tc_fecha_corte, tc_fecha_vencimiento, tc_morosidad) VALUES (29, 28, '0863402539481998', '2025-08-06', '2029-08-05', 'ACTIVA', '728', 'CREDITO', '5846', 1000.00, 24.50, 50.00, '2025-09-05', '2025-09-20', false);
INSERT INTO public.tarjeta_credito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, tc_limite_credito, tc_tasa_interes, tc_cargo_anual, tc_fecha_corte, tc_fecha_vencimiento, tc_morosidad) VALUES (30, 29, '4874917696727780', '2025-08-06', '2029-08-05', 'ACTIVA', '829', 'CREDITO', '5846', 1000.00, 24.50, 50.00, '2025-09-05', '2025-09-20', false);
INSERT INTO public.tarjeta_credito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, tc_limite_credito, tc_tasa_interes, tc_cargo_anual, tc_fecha_corte, tc_fecha_vencimiento, tc_morosidad) VALUES (31, 30, '8054509667862220', '2025-08-06', '2029-08-05', 'ACTIVA', '294', 'CREDITO', '5846', 1000.00, 24.50, 50.00, '2025-09-05', '2025-09-20', false);
INSERT INTO public.tarjeta_credito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, tc_limite_credito, tc_tasa_interes, tc_cargo_anual, tc_fecha_corte, tc_fecha_vencimiento, tc_morosidad) VALUES (32, 31, '4293597274179153', '2025-08-06', '2029-08-05', 'ACTIVA', '827', 'CREDITO', '5846', 1000.00, 24.50, 50.00, '2025-09-05', '2025-09-20', false);


--
-- TOC entry 3787 (class 0 OID 17430)
-- Dependencies: 273
-- Data for Name: tarjeta_debito; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (1, 1, '3163148462201607', '2025-08-01', '2029-07-31', 'ACTIVA', '198', 'DEBITO', '1234', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (2, 1, '6659959733909121', '2025-08-01', '2029-07-31', 'ACTIVA', '646', 'DEBITO', '1234', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (3, 2, '5192057714210261', '2025-08-05', '2029-08-04', 'ACTIVA', '134', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (4, 3, '1502165201813492', '2025-08-05', '2029-08-04', 'ACTIVA', '616', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (5, 4, '4538164868305399', '2025-08-05', '2029-08-04', 'ACTIVA', '606', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (6, 5, '0931460239611687', '2025-08-05', '2029-08-04', 'ACTIVA', '150', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (7, 6, '1641438403792939', '2025-08-05', '2029-08-04', 'ACTIVA', '061', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (8, 7, '7705360388319460', '2025-08-05', '2029-08-04', 'ACTIVA', '997', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (9, 8, '3052434828357292', '2025-08-05', '2029-08-04', 'ACTIVA', '429', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (10, 9, '2568703954243113', '2025-08-05', '2029-08-04', 'ACTIVA', '127', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (11, 10, '6566619565847532', '2025-08-05', '2029-08-04', 'ACTIVA', '198', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (12, 11, '0276399543458431', '2025-08-05', '2029-08-04', 'ACTIVA', '023', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (13, 12, '2577611484654414', '2025-08-05', '2029-08-04', 'ACTIVA', '770', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (14, 13, '7447175203188109', '2025-08-05', '2029-08-04', 'ACTIVA', '070', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (15, 14, '1311293499211900', '2025-08-05', '2029-08-04', 'ACTIVA', '832', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (16, 15, '1565443393698748', '2025-08-06', '2029-08-05', 'ACTIVA', '416', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (17, 16, '4552305157442019', '2025-08-06', '2029-08-05', 'ACTIVA', '111', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (18, 17, '5521033972438111', '2025-08-06', '2029-08-05', 'ACTIVA', '351', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (19, 18, '6608052235132183', '2025-08-06', '2029-08-05', 'ACTIVA', '605', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (20, 19, '2102690824596179', '2025-08-06', '2029-08-05', 'ACTIVA', '777', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (21, 20, '5542103202683125', '2025-08-06', '2029-08-05', 'ACTIVA', '675', 'DEBITO', '5846', 500.00, 5.00);
INSERT INTO public.tarjeta_debito (tar_id, cuen_id, tar_numero_tarjeta, tar_fecha_emision, tar_fecha_expiracion, tar_estado_tarjeta, tar_cvv, tar_tipo, tar_pin, td_limite_retiro_diario, td_comision_sobregiro) VALUES (22, 21, '4471553060649959', '2025-08-06', '2029-08-05', 'ACTIVA', '770', 'DEBITO', '5846', 500.00, 5.00);


--
-- TOC entry 3788 (class 0 OID 17435)
-- Dependencies: 274
-- Data for Name: transaccion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (1, 1, 3001);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (2, 1, 3009);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (3, 1, 3001);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (4, 1, 3008);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (5, 1, 3007);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (6, 1, 3009);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (7, 1, 3008);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (8, 1, 3002);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (9, 1, 3004);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (10, 1, 3006);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (11, 1, 3007);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (12, 1, 3001);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (101, 10, 3010);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (102, 11, 3001);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (103, 12, 3002);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (104, 13, 3003);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (105, 14, 3004);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (201, 15, 3005);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (202, 16, 3006);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (203, 17, 3007);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (204, 18, 3008);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (205, 19, 3009);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (301, 20, 3010);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (302, 21, 3001);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (303, 22, 3002);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (304, 23, 3003);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (305, 24, 3004);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (401, 25, 3001);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (402, 26, 3002);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (403, 27, 3003);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (404, 28, 3004);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (405, 29, 3005);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (406, 2, 3003);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (407, 3, 3002);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (408, 4, 3006);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (409, 5, 3004);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (410, 6, 3001);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (411, 7, 3008);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (412, 8, 3007);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (413, 9, 3006);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (414, 10, 3002);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (415, 11, 3010);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (416, 1, 3001);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (417, 1, 3003);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (418, 1, 3001);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (419, 1, 3002);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (420, 1, 3006);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (421, 1, 3003);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (422, 1, 3005);
INSERT INTO public.transaccion (tran_id, cuen_id, caj_id) VALUES (423, 1, 3004);


--
-- TOC entry 3789 (class 0 OID 17438)
-- Dependencies: 275
-- Data for Name: transferencia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.transferencia (tran_id, trans_id, cuen_id, caj_id, trans_fecha, trans_monto, trans_origen, trans_destino, trans_canal, trans_estado) VALUES (301, 1, 20, 3010, '2025-08-05', 350.00, '0102030420', '0202030501', 'App Móvil', 'Completada');
INSERT INTO public.transferencia (tran_id, trans_id, cuen_id, caj_id, trans_fecha, trans_monto, trans_origen, trans_destino, trans_canal, trans_estado) VALUES (302, 2, 21, 3001, '2025-08-04', 500.00, '0202030501', '0102030401', 'App Web', 'Completada');
INSERT INTO public.transferencia (tran_id, trans_id, cuen_id, caj_id, trans_fecha, trans_monto, trans_origen, trans_destino, trans_canal, trans_estado) VALUES (303, 3, 22, 3002, '2025-08-03', 450.00, '0202030502', '0102030402', 'App Web', 'Completada');
INSERT INTO public.transferencia (tran_id, trans_id, cuen_id, caj_id, trans_fecha, trans_monto, trans_origen, trans_destino, trans_canal, trans_estado) VALUES (304, 4, 23, 3003, '2025-08-02', 600.00, '0202030503', '0102030403', 'Sucursal', 'Completada');
INSERT INTO public.transferencia (tran_id, trans_id, cuen_id, caj_id, trans_fecha, trans_monto, trans_origen, trans_destino, trans_canal, trans_estado) VALUES (305, 5, 24, 3004, '2025-08-01', 700.00, '0202030504', '0102030404', 'App Móvil', 'Completada');


--
-- TOC entry 3521 (class 2606 OID 17546)
-- Name: boucher_cabecera pk_boucher_cabecera; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boucher_cabecera
    ADD CONSTRAINT pk_boucher_cabecera PRIMARY KEY (ban_aid);


--
-- TOC entry 3526 (class 2606 OID 17548)
-- Name: boucher_cuerpo pk_boucher_cuerpo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boucher_cuerpo
    ADD CONSTRAINT pk_boucher_cuerpo PRIMARY KEY (bouc_id, tran_id, ret_id);


--
-- TOC entry 3529 (class 2606 OID 17550)
-- Name: cajero pk_cajero; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cajero
    ADD CONSTRAINT pk_cajero PRIMARY KEY (caj_id);


--
-- TOC entry 3533 (class 2606 OID 17552)
-- Name: cliente pk_cliente; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (per_id, cli_id);


--
-- TOC entry 3536 (class 2606 OID 17554)
-- Name: condiciones pk_condiciones; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.condiciones
    ADD CONSTRAINT pk_condiciones PRIMARY KEY (cond_id);


--
-- TOC entry 3540 (class 2606 OID 17556)
-- Name: consulta pk_consulta; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT pk_consulta PRIMARY KEY (tran_id, cons_id);


--
-- TOC entry 3544 (class 2606 OID 17558)
-- Name: cuenta pk_cuenta; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT pk_cuenta PRIMARY KEY (cuen_id);


--
-- TOC entry 3547 (class 2606 OID 17560)
-- Name: cuenta_ahorro pk_cuenta_ahorro; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuenta_ahorro
    ADD CONSTRAINT pk_cuenta_ahorro PRIMARY KEY (cuen_id);


--
-- TOC entry 3550 (class 2606 OID 17562)
-- Name: cuenta_corriente pk_cuenta_corriente; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuenta_corriente
    ADD CONSTRAINT pk_cuenta_corriente PRIMARY KEY (cuen_id);


--
-- TOC entry 3554 (class 2606 OID 17564)
-- Name: depositos pk_depositos; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depositos
    ADD CONSTRAINT pk_depositos PRIMARY KEY (tran_id, dep_id);


--
-- TOC entry 3558 (class 2606 OID 17566)
-- Name: pago_servicios pk_pago_servicios; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pago_servicios
    ADD CONSTRAINT pk_pago_servicios PRIMARY KEY (tran_id, ps_id);


--
-- TOC entry 3561 (class 2606 OID 17568)
-- Name: persona pk_persona; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (per_id);


--
-- TOC entry 3564 (class 2606 OID 17570)
-- Name: persona_juridica pk_persona_juridica; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_juridica
    ADD CONSTRAINT pk_persona_juridica PRIMARY KEY (per_id);


--
-- TOC entry 3567 (class 2606 OID 17572)
-- Name: persona_natural pk_persona_natural; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_natural
    ADD CONSTRAINT pk_persona_natural PRIMARY KEY (per_id);


--
-- TOC entry 3570 (class 2606 OID 17574)
-- Name: retiro pk_retiro; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.retiro
    ADD CONSTRAINT pk_retiro PRIMARY KEY (tran_id, ret_id);


--
-- TOC entry 3573 (class 2606 OID 17576)
-- Name: retiro_contarjeta pk_retiro_contarjeta; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.retiro_contarjeta
    ADD CONSTRAINT pk_retiro_contarjeta PRIMARY KEY (tran_id, ret_id);


--
-- TOC entry 3577 (class 2606 OID 17578)
-- Name: retiro_sintarjeta pk_retiro_sintarjeta; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.retiro_sintarjeta
    ADD CONSTRAINT pk_retiro_sintarjeta PRIMARY KEY (tran_id, ret_id);


--
-- TOC entry 3581 (class 2606 OID 17580)
-- Name: tarjeta pk_tarjeta; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT pk_tarjeta PRIMARY KEY (tar_id);


--
-- TOC entry 3584 (class 2606 OID 17582)
-- Name: tarjeta_credito pk_tarjeta_credito; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tarjeta_credito
    ADD CONSTRAINT pk_tarjeta_credito PRIMARY KEY (tar_id);


--
-- TOC entry 3587 (class 2606 OID 17584)
-- Name: tarjeta_debito pk_tarjeta_debito; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tarjeta_debito
    ADD CONSTRAINT pk_tarjeta_debito PRIMARY KEY (tar_id);


--
-- TOC entry 3591 (class 2606 OID 17586)
-- Name: transaccion pk_transaccion; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT pk_transaccion PRIMARY KEY (tran_id);


--
-- TOC entry 3596 (class 2606 OID 17588)
-- Name: transferencia pk_transferencia; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transferencia
    ADD CONSTRAINT pk_transferencia PRIMARY KEY (tran_id, trans_id);


--
-- TOC entry 3519 (class 1259 OID 17645)
-- Name: boucher_cabecera_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX boucher_cabecera_pk ON public.boucher_cabecera USING btree (ban_aid);


--
-- TOC entry 3522 (class 1259 OID 17646)
-- Name: boucher_cuerpo_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX boucher_cuerpo_pk ON public.boucher_cuerpo USING btree (bouc_id, tran_id, ret_id);


--
-- TOC entry 3523 (class 1259 OID 17647)
-- Name: cabecera_cuerpo_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cabecera_cuerpo_fk ON public.boucher_cuerpo USING btree (ban_aid);


--
-- TOC entry 3527 (class 1259 OID 17648)
-- Name: cajero_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX cajero_pk ON public.cajero USING btree (caj_id);


--
-- TOC entry 3530 (class 1259 OID 17649)
-- Name: cliente_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX cliente_pk ON public.cliente USING btree (per_id, cli_id);


--
-- TOC entry 3534 (class 1259 OID 17650)
-- Name: condiciones_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX condiciones_pk ON public.condiciones USING btree (cond_id);


--
-- TOC entry 3575 (class 1259 OID 17651)
-- Name: condiciones_tarjeta_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX condiciones_tarjeta_fk ON public.retiro_sintarjeta USING btree (cond_id);


--
-- TOC entry 3537 (class 1259 OID 17652)
-- Name: consulta_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX consulta_pk ON public.consulta USING btree (tran_id, cons_id);


--
-- TOC entry 3545 (class 1259 OID 17653)
-- Name: cuenta_ahorro_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX cuenta_ahorro_pk ON public.cuenta_ahorro USING btree (cuen_id);


--
-- TOC entry 3541 (class 1259 OID 17654)
-- Name: cuenta_cliente_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cuenta_cliente_fk ON public.cuenta USING btree (per_id, cli_id);


--
-- TOC entry 3548 (class 1259 OID 17655)
-- Name: cuenta_corriente_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX cuenta_corriente_pk ON public.cuenta_corriente USING btree (cuen_id);


--
-- TOC entry 3542 (class 1259 OID 17656)
-- Name: cuenta_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX cuenta_pk ON public.cuenta USING btree (cuen_id);


--
-- TOC entry 3579 (class 1259 OID 17657)
-- Name: cuenta_tarjeta_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cuenta_tarjeta_fk ON public.tarjeta USING btree (cuen_id);


--
-- TOC entry 3589 (class 1259 OID 17658)
-- Name: cuenta_transaccion_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cuenta_transaccion_fk ON public.transaccion USING btree (cuen_id);


--
-- TOC entry 3551 (class 1259 OID 17659)
-- Name: depositos_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX depositos_pk ON public.depositos USING btree (tran_id, dep_id);


--
-- TOC entry 3524 (class 1259 OID 17660)
-- Name: herenciaboucher_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX herenciaboucher_fk ON public.boucher_cuerpo USING btree (tran_id, ret_id);


--
-- TOC entry 3531 (class 1259 OID 17661)
-- Name: herenciacliente_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX herenciacliente_fk ON public.cliente USING btree (per_id);


--
-- TOC entry 3555 (class 1259 OID 17662)
-- Name: herenciatransaccion2_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX herenciatransaccion2_fk ON public.pago_servicios USING btree (tran_id);


--
-- TOC entry 3552 (class 1259 OID 17663)
-- Name: herenciatransaccion3_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX herenciatransaccion3_fk ON public.depositos USING btree (tran_id);


--
-- TOC entry 3594 (class 1259 OID 17664)
-- Name: herenciatransaccion4_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX herenciatransaccion4_fk ON public.transferencia USING btree (tran_id);


--
-- TOC entry 3568 (class 1259 OID 17665)
-- Name: herenciatransaccion5_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX herenciatransaccion5_fk ON public.retiro USING btree (tran_id);


--
-- TOC entry 3538 (class 1259 OID 17666)
-- Name: herenciatransaccion_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX herenciatransaccion_fk ON public.consulta USING btree (tran_id);


--
-- TOC entry 3556 (class 1259 OID 17667)
-- Name: pago_servicios_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX pago_servicios_pk ON public.pago_servicios USING btree (tran_id, ps_id);


--
-- TOC entry 3562 (class 1259 OID 17668)
-- Name: persona_juridica_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX persona_juridica_pk ON public.persona_juridica USING btree (per_id);


--
-- TOC entry 3565 (class 1259 OID 17669)
-- Name: persona_natural_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX persona_natural_pk ON public.persona_natural USING btree (per_id);


--
-- TOC entry 3559 (class 1259 OID 17670)
-- Name: persona_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX persona_pk ON public.persona USING btree (per_id);


--
-- TOC entry 3574 (class 1259 OID 17671)
-- Name: retiro_contarjeta_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX retiro_contarjeta_pk ON public.retiro_contarjeta USING btree (tran_id, ret_id);


--
-- TOC entry 3571 (class 1259 OID 17672)
-- Name: retiro_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX retiro_pk ON public.retiro USING btree (tran_id, ret_id);


--
-- TOC entry 3578 (class 1259 OID 17673)
-- Name: retiro_sintarjeta_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX retiro_sintarjeta_pk ON public.retiro_sintarjeta USING btree (tran_id, ret_id);


--
-- TOC entry 3585 (class 1259 OID 17674)
-- Name: tarjeta_credito_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX tarjeta_credito_pk ON public.tarjeta_credito USING btree (tar_id);


--
-- TOC entry 3588 (class 1259 OID 17675)
-- Name: tarjeta_debito_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX tarjeta_debito_pk ON public.tarjeta_debito USING btree (tar_id);


--
-- TOC entry 3582 (class 1259 OID 17676)
-- Name: tarjeta_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX tarjeta_pk ON public.tarjeta USING btree (tar_id);


--
-- TOC entry 3592 (class 1259 OID 17677)
-- Name: transaccion_cajero_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX transaccion_cajero_fk ON public.transaccion USING btree (caj_id);


--
-- TOC entry 3593 (class 1259 OID 17678)
-- Name: transaccion_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX transaccion_pk ON public.transaccion USING btree (tran_id);


--
-- TOC entry 3597 (class 1259 OID 17679)
-- Name: transferencia_pk; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX transferencia_pk ON public.transferencia USING btree (tran_id, trans_id);


--
-- TOC entry 3598 (class 2606 OID 17744)
-- Name: boucher_cuerpo fk_boucher__cabecera__boucher_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boucher_cuerpo
    ADD CONSTRAINT fk_boucher__cabecera__boucher_ FOREIGN KEY (ban_aid) REFERENCES public.boucher_cabecera(ban_aid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3599 (class 2606 OID 17749)
-- Name: boucher_cuerpo fk_boucher__herenciab_retiro_c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boucher_cuerpo
    ADD CONSTRAINT fk_boucher__herenciab_retiro_c FOREIGN KEY (tran_id, ret_id) REFERENCES public.retiro_contarjeta(tran_id, ret_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3600 (class 2606 OID 17754)
-- Name: cliente fk_cliente_herenciac_persona; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cliente_herenciac_persona FOREIGN KEY (per_id) REFERENCES public.persona(per_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3601 (class 2606 OID 17759)
-- Name: consulta fk_consulta_herenciat_transacc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT fk_consulta_herenciat_transacc FOREIGN KEY (tran_id) REFERENCES public.transaccion(tran_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3603 (class 2606 OID 17764)
-- Name: cuenta_ahorro fk_cuenta_a_herenciac_cuenta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuenta_ahorro
    ADD CONSTRAINT fk_cuenta_a_herenciac_cuenta FOREIGN KEY (cuen_id) REFERENCES public.cuenta(cuen_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3604 (class 2606 OID 17769)
-- Name: cuenta_corriente fk_cuenta_c_herenciac_cuenta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuenta_corriente
    ADD CONSTRAINT fk_cuenta_c_herenciac_cuenta FOREIGN KEY (cuen_id) REFERENCES public.cuenta(cuen_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3602 (class 2606 OID 17774)
-- Name: cuenta fk_cuenta_cuenta_cl_cliente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT fk_cuenta_cuenta_cl_cliente FOREIGN KEY (per_id, cli_id) REFERENCES public.cliente(per_id, cli_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3605 (class 2606 OID 17779)
-- Name: depositos fk_deposito_herenciat_transacc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depositos
    ADD CONSTRAINT fk_deposito_herenciat_transacc FOREIGN KEY (tran_id) REFERENCES public.transaccion(tran_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3606 (class 2606 OID 17784)
-- Name: pago_servicios fk_pago_ser_herenciat_transacc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pago_servicios
    ADD CONSTRAINT fk_pago_ser_herenciat_transacc FOREIGN KEY (tran_id) REFERENCES public.transaccion(tran_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3608 (class 2606 OID 17789)
-- Name: persona_natural fk_persona__herencia3_persona; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_natural
    ADD CONSTRAINT fk_persona__herencia3_persona FOREIGN KEY (per_id) REFERENCES public.persona(per_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3607 (class 2606 OID 17794)
-- Name: persona_juridica fk_persona__herencia4_persona; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.persona_juridica
    ADD CONSTRAINT fk_persona__herencia4_persona FOREIGN KEY (per_id) REFERENCES public.persona(per_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3610 (class 2606 OID 17799)
-- Name: retiro_contarjeta fk_retiro_c_inheritan_retiro; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.retiro_contarjeta
    ADD CONSTRAINT fk_retiro_c_inheritan_retiro FOREIGN KEY (tran_id, ret_id) REFERENCES public.retiro(tran_id, ret_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3609 (class 2606 OID 17804)
-- Name: retiro fk_retiro_herenciat_transacc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.retiro
    ADD CONSTRAINT fk_retiro_herenciat_transacc FOREIGN KEY (tran_id) REFERENCES public.transaccion(tran_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3611 (class 2606 OID 17809)
-- Name: retiro_sintarjeta fk_retiro_s_condicion_condicio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.retiro_sintarjeta
    ADD CONSTRAINT fk_retiro_s_condicion_condicio FOREIGN KEY (cond_id) REFERENCES public.condiciones(cond_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3612 (class 2606 OID 17814)
-- Name: retiro_sintarjeta fk_retiro_s_inheritan_retiro; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.retiro_sintarjeta
    ADD CONSTRAINT fk_retiro_s_inheritan_retiro FOREIGN KEY (tran_id, ret_id) REFERENCES public.retiro(tran_id, ret_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3615 (class 2606 OID 17819)
-- Name: tarjeta_debito fk_tarjeta__herencia2_tarjeta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tarjeta_debito
    ADD CONSTRAINT fk_tarjeta__herencia2_tarjeta FOREIGN KEY (tar_id) REFERENCES public.tarjeta(tar_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3614 (class 2606 OID 17824)
-- Name: tarjeta_credito fk_tarjeta__herencia_tarjeta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tarjeta_credito
    ADD CONSTRAINT fk_tarjeta__herencia_tarjeta FOREIGN KEY (tar_id) REFERENCES public.tarjeta(tar_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3613 (class 2606 OID 17829)
-- Name: tarjeta fk_tarjeta_cuenta_ta_cuenta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT fk_tarjeta_cuenta_ta_cuenta FOREIGN KEY (cuen_id) REFERENCES public.cuenta(cuen_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3616 (class 2606 OID 17834)
-- Name: transaccion fk_transacc_cuenta_tr_cuenta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT fk_transacc_cuenta_tr_cuenta FOREIGN KEY (cuen_id) REFERENCES public.cuenta(cuen_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3617 (class 2606 OID 17839)
-- Name: transaccion fk_transacc_transacci_cajero; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaccion
    ADD CONSTRAINT fk_transacc_transacci_cajero FOREIGN KEY (caj_id) REFERENCES public.cajero(caj_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3618 (class 2606 OID 17844)
-- Name: transferencia fk_transfer_herenciat_transacc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transferencia
    ADD CONSTRAINT fk_transfer_herenciat_transacc FOREIGN KEY (tran_id) REFERENCES public.transaccion(tran_id) ON UPDATE RESTRICT ON DELETE RESTRICT;



