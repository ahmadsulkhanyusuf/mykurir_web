--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ref_jenis_jaminan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_jenis_jaminan (
    jns_jam_id integer NOT NULL,
    jns_jam_label character varying
);


ALTER TABLE public.ref_jenis_jaminan OWNER TO postgres;

--
-- Name: jenis_jaminan_jns_jam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jenis_jaminan_jns_jam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jenis_jaminan_jns_jam_id_seq OWNER TO postgres;

--
-- Name: jenis_jaminan_jns_jam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jenis_jaminan_jns_jam_id_seq OWNED BY public.ref_jenis_jaminan.jns_jam_id;


--
-- Name: karyawan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.karyawan (
    kar_id integer NOT NULL,
    kar_nama character varying,
    kar_nip character varying(255),
    kar_pangkat character varying(255),
    kar_jabatan character varying(255),
    kar_created_at timestamp(6) without time zone,
    kar_created_by integer,
    kar_visible boolean
);


ALTER TABLE public.karyawan OWNER TO postgres;

--
-- Name: karyawan_kar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.karyawan_kar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karyawan_kar_id_seq OWNER TO postgres;

--
-- Name: karyawan_kar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.karyawan_kar_id_seq OWNED BY public.karyawan.kar_id;


--
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    member_id integer NOT NULL,
    member_nama_lengkap character varying,
    member_alamat character varying(255),
    member_no_telp character varying(255),
    member_kelurahan integer,
    member_created_at timestamp(6) without time zone,
    member_created_by integer,
    member_updated_by integer,
    member_updated_at timestamp without time zone,
    member_visible boolean DEFAULT true,
    member_no_ktp character varying(255),
    member_pekerjaan character varying(255)
);


ALTER TABLE public.member OWNER TO postgres;

--
-- Name: member_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.member_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_member_id_seq OWNER TO postgres;

--
-- Name: member_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.member_member_id_seq OWNED BY public.member.member_id;


--
-- Name: pembayaran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pembayaran (
    pembayaran_id integer NOT NULL,
    pembayaran_peng_id integer,
    pembayaran_tanggal date,
    pembayaran_cicilan double precision,
    pembayaran_ke integer,
    pembayaran_lunas_is boolean,
    pembayaran_lunas_tanggal date,
    pembayaran_bunga double precision,
    pembayaran_sisa double precision,
    pembayaran_penetapan_no character varying(255)
);


ALTER TABLE public.pembayaran OWNER TO postgres;

--
-- Name: pembayaran_pembayaran_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pembayaran_pembayaran_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pembayaran_pembayaran_id_seq OWNER TO postgres;

--
-- Name: pembayaran_pembayaran_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pembayaran_pembayaran_id_seq OWNED BY public.pembayaran.pembayaran_id;


--
-- Name: pengajuan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pengajuan (
    peng_id integer NOT NULL,
    peng_tanggal date,
    peng_bidang_usaha integer,
    peng_jenis_pengajuan smallint,
    peng_tujuan_penggunaan character varying(255),
    peng_foto_suami character varying(255),
    peng_foto_istri character varying(255),
    peng_fc_ktp character varying(255),
    peng_fc_kk character varying(255),
    peng_fc_surat_nikah character varying(255),
    peng_fc_legalitas_jaminan character varying(255),
    peng_member_id integer,
    peng_nominal double precision,
    peng_prof_nama_usaha character varying(255),
    peng_prof_alamat character varying(255),
    peng_prof_pimpinan character varying(255),
    peng_prof_perizinan character varying(255),
    peng_prof_jumlah_karyawan smallint,
    peng_prof_tahun_mulai smallint,
    peng_prof_jenis_usaha integer,
    peng_prof_komoditi_produk character varying(255),
    peng_prof_omset_per_bulan double precision,
    peng_prof_lokasi_pemasaran character varying(255),
    peng_prof_pola_pemasaran character varying(255),
    peng_prof_pendapatan_penjualan double precision,
    peng_prof_beban_penjualan double precision,
    peng_prof_laba_per_bulan double precision,
    peng_prof_modal_sendiri double precision,
    peng_prof_modal_luar double precision,
    peng_sk_kepala_kelurahan character varying(255),
    peng_sk_kecamatan integer,
    peng_sk_kota character varying(255),
    peng_sk_tanah_luas integer,
    peng_sk_tanah_desa character varying(255),
    peng_sk_tanah_kecamatan character varying(255),
    peng_sk_tanah_no_shm character varying(255),
    peng_sk_tanah_tanggal_shm character varying(255),
    peng_sk_tanah_atas_nama character varying(255),
    peng_sk_tanah_harga_ru double precision,
    peng_sk_tanah_harga_meter double precision,
    peng_sk_tanah_luas_bangunan integer,
    peng_sk_tanah_harga_bangunan double precision,
    peng_sk_tanah_letak_utara character varying(255),
    peng_sk_tanah_letak_selatan character varying(255),
    peng_sk_tanah_letak_timur character varying(255),
    peng_sk_tanah_letak_barat character varying(255),
    peng_sk_tanah_penggunaan character varying(255),
    peng_jam_pemegang_ktp_no character varying,
    peng_jam_pekerjaan character varying,
    peng_jam_tahun_pembuatan integer,
    peng_jam_nopol character varying(255),
    peng_jam_mesin character varying(255),
    peng_jam_rangka character varying(255),
    peng_jam_atas_nama character varying(255),
    peng_jam_alamat character varying(255),
    peng_jam_no_akta character varying(255),
    peng_jam_tempat character varying(255),
    peng_jam_atas_nama_tanah character varying(255),
    peng_jam_alamat_tanah character varying(255),
    peng_jam_jenis_bpkb smallint,
    peng_jam_jenis_tanah smallint,
    peng_lokasi_lat character varying(255),
    peng_lokasi_lon character varying(255),
    peng_lokasi_keterangan character varying(255),
    peng_no_hp character varying(255),
    peng_no_telp character varying(255),
    peng_no_ktp character varying(255),
    peng_srt_nama character varying(255),
    peng_srt_pekerjaan character varying(255),
    peng_srt_nama_usaha character varying(255),
    peng_srt_jenis_usaha integer,
    peng_srt_alamat character varying(255),
    peng_srt_jumlah_pinjaman double precision,
    peng_srt_modal_kerja double precision,
    peng_srt_investasi double precision,
    peng_srt_pengambilan_waktu smallint,
    peng_srt_bunga double precision,
    peng_srt_omset_penjualan_pokok double precision,
    peng_srt_pendapatan_lain double precision,
    peng_srt_harga_pokok_penjualan double precision,
    peng_srt_beban_bunga double precision,
    peng_srt_beban_usaha double precision,
    peng_srt_beban_non_usaha double precision,
    peng_srt_laba double precision,
    peng_lock_is boolean,
    peng_lock_at timestamp(6) without time zone,
    peng_lock_by integer,
    peng_tempat character varying(255),
    peng_susunan_pengurus character varying(255),
    peng_fc_akta_pendirian character varying(255),
    peng_fc_buku_laporan_rapat character varying(255),
    peng_fc_jaminan character varying(255),
    peng_fc_ktp_pengurus character varying(255),
    peng_fc_ktp_pengawas character varying(255),
    peng_fc_siup character varying(255),
    peng_fc_tdp character varying(255),
    peng_fc_npwp character varying(255),
    peng_fc_sertifikat_penilaian character varying(255),
    peng_foto_pengawas character varying(255),
    peng_foto_pengurus character varying(255),
    peng_badan_hukum_no character varying(255),
    peng_badan_hukum_tanggal date,
    peng_kesehatan_usp character varying(255),
    peng_jumlah_anggota integer,
    peng_pelaksanaan_rat character varying(255),
    peng_ketua character varying(255),
    peng_sekretaris character varying(255),
    peng_bendahara character varying(255),
    peng_pengawas_koor character varying(255),
    peng_pengawas_anggota1 character varying(255),
    peng_pengawas_anggota2 character varying(255),
    peng_usaha_dikelola_1 character varying(255),
    peng_usaha_dikelola_2 character varying(255),
    peng_jam_jenis integer,
    peng_usaha_shu double precision,
    peng_permodalan_kewajiban double precision,
    peng_permodalan_modal_kerja double precision,
    peng_permodalan_pinjaman_bank double precision,
    peng_manf_meningkatkan_penjualan double precision,
    peng_manf_menambah_modal double precision,
    peng_manf_peningkatan_omset double precision,
    peng_manf_peningkatan_shu double precision,
    peng_manf_peningkatan_asset double precision,
    peng_verif_is boolean,
    peng_verif_by integer,
    peng_verif_at timestamp(6) without time zone,
    peng_verif_reject_is boolean,
    peng_verif_reject_by integer,
    peng_verif_reject_at timestamp(6) without time zone,
    peng_verif_reject_note text,
    peng_surv_is boolean,
    peng_surv_id integer,
    peng_disetujui_nominal double precision,
    peng_disetujui_tanggal_jatuh_tempo date,
    peng_disetujui_tanggal_penetapan date,
    peng_disetujui_jangka_waktu_bln integer,
    peng_disetujui_jangka_waktu_text text,
    peng_disetujui_cicilan double precision,
    peng_disetujui_created_at timestamp(0) without time zone,
    peng_disetujui_created_by integer,
    peng_uji_kel_no_ktp character varying(255),
    peng_uji_kel_pekerjaan character varying(255),
    peng_disetujui_no_penetapan character varying(255),
    peng_disetujui_bank integer,
    peng_disetujui_kunci_is boolean DEFAULT false,
    peng_disetujui_kunci_at timestamp(6) without time zone,
    peng_disetujui_kunci_by integer,
    peng_cetak_pengajuan_ttd character varying(255),
    peng_disetujui_cetak_sppk character varying(255),
    peng_jam_emas_karat character varying(255),
    peng_jam_emas_gram character varying(255),
    peng_jam_jenis_emas integer,
    peng_kepala_dinas_ttd integer,
    peng_jam_no_bpkb character varying(255),
    peng_jam_su_tanggal date,
    peng_jam_nomor_surat_ukur character varying(255),
    peng_jam_luas_tanah character varying(255),
    peng_jam_harga_perkiraan character varying(255),
    peng_jam_harga_perkiraan_total character varying(255),
    peng_jam_type_bpkb character varying(255)
);


ALTER TABLE public.pengajuan OWNER TO postgres;

--
-- Name: pengajuan_foto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pengajuan_foto (
    peng_foto_id integer NOT NULL,
    peng_foto_peng_id integer,
    peng_foto_file character varying,
    peng_foto_created_at timestamp(6) without time zone,
    peng_foto_created_by integer,
    peng_foto_jenis smallint DEFAULT 1
);


ALTER TABLE public.pengajuan_foto OWNER TO postgres;

--
-- Name: pengajuan_foto_peng_foto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pengajuan_foto_peng_foto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pengajuan_foto_peng_foto_id_seq OWNER TO postgres;

--
-- Name: pengajuan_foto_peng_foto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pengajuan_foto_peng_foto_id_seq OWNED BY public.pengajuan_foto.peng_foto_id;


--
-- Name: pengajuan_jaminan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pengajuan_jaminan (
    jam_id integer NOT NULL,
    jam_peng_id integer,
    jam_jenis smallint,
    jam_pemegang_ktp_no character varying(255),
    jam_pekerjaan character varying(255),
    jam_tahun_pembuatan integer,
    jam_nopol character varying(255),
    jam_mesin character varying(255),
    jam_rangka character varying(255),
    jam_atas_nama character varying(255),
    jam_alamat character varying(255),
    jam_no_akta character varying(255),
    jam_tempat character varying(255),
    jam_atas_nama_tanah character varying(255),
    jam_alamat_tanah character varying(255),
    jam_jenis_kepemilikan smallint,
    jam_emas_karat character varying(255),
    jam_emas_gram character varying(255),
    jam_no_bpkb character varying(255),
    jam_su_tanggal date,
    jam_nomor_surat_ukur character varying(255),
    jam_luas_tanah character varying(255),
    jam_harga_perkiraan character varying(255),
    jam_harga_perkiraan_total character varying(255),
    jam_type_bpkb character varying(255)
);


ALTER TABLE public.pengajuan_jaminan OWNER TO postgres;

--
-- Name: pengajuan_jaminan_jam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pengajuan_jaminan_jam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pengajuan_jaminan_jam_id_seq OWNER TO postgres;

--
-- Name: pengajuan_jaminan_jam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pengajuan_jaminan_jam_id_seq OWNED BY public.pengajuan_jaminan.jam_id;


--
-- Name: pengajuan_peng_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pengajuan_peng_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pengajuan_peng_id_seq OWNER TO postgres;

--
-- Name: pengajuan_peng_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pengajuan_peng_id_seq OWNED BY public.pengajuan.peng_id;


--
-- Name: ref_approval; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_approval (
    ref_approval_id smallint NOT NULL,
    ref_approval_label character varying(255)
);


ALTER TABLE public.ref_approval OWNER TO postgres;

--
-- Name: ref_approval_ref_approval_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_approval_ref_approval_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_approval_ref_approval_id_seq OWNER TO postgres;

--
-- Name: ref_approval_ref_approval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_approval_ref_approval_id_seq OWNED BY public.ref_approval.ref_approval_id;


--
-- Name: ref_bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_bank (
    ref_bank_id integer NOT NULL,
    ref_bank_label character varying
);


ALTER TABLE public.ref_bank OWNER TO postgres;

--
-- Name: ref_bank_ref_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_bank_ref_bank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_bank_ref_bank_id_seq OWNER TO postgres;

--
-- Name: ref_bank_ref_bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_bank_ref_bank_id_seq OWNED BY public.ref_bank.ref_bank_id;


--
-- Name: ref_bidang_usaha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_bidang_usaha (
    ref_bidang_id integer NOT NULL,
    ref_bidang_label character varying
);


ALTER TABLE public.ref_bidang_usaha OWNER TO postgres;

--
-- Name: ref_bidang_usaha_ref_bidang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_bidang_usaha_ref_bidang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_bidang_usaha_ref_bidang_id_seq OWNER TO postgres;

--
-- Name: ref_bidang_usaha_ref_bidang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_bidang_usaha_ref_bidang_id_seq OWNED BY public.ref_bidang_usaha.ref_bidang_id;


--
-- Name: ref_group_akses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_group_akses (
    ref_group_akses_id integer NOT NULL,
    ref_group_akses_label character varying(255)
);


ALTER TABLE public.ref_group_akses OWNER TO postgres;

--
-- Name: ref_group_akses_ref_group_akses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_group_akses_ref_group_akses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.ref_group_akses_ref_group_akses_id_seq OWNER TO postgres;

--
-- Name: ref_group_akses_ref_group_akses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_group_akses_ref_group_akses_id_seq OWNED BY public.ref_group_akses.ref_group_akses_id;


--
-- Name: ref_jaminan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_jaminan (
    ref_jaminan_id integer NOT NULL,
    ref_jaminan_label character varying(255)
);


ALTER TABLE public.ref_jaminan OWNER TO postgres;

--
-- Name: ref_jaminan_ref_jaminan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_jaminan_ref_jaminan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_jaminan_ref_jaminan_id_seq OWNER TO postgres;

--
-- Name: ref_jaminan_ref_jaminan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_jaminan_ref_jaminan_id_seq OWNED BY public.ref_jaminan.ref_jaminan_id;


--
-- Name: ref_jenis_pengajuan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_jenis_pengajuan (
    jns_pengajuan_id integer NOT NULL,
    jns_pengajuan_label character varying
);


ALTER TABLE public.ref_jenis_pengajuan OWNER TO postgres;

--
-- Name: ref_jenis_pengajuan_jns_pengajuan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_jenis_pengajuan_jns_pengajuan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_jenis_pengajuan_jns_pengajuan_id_seq OWNER TO postgres;

--
-- Name: ref_jenis_pengajuan_jns_pengajuan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_jenis_pengajuan_jns_pengajuan_id_seq OWNED BY public.ref_jenis_pengajuan.jns_pengajuan_id;


--
-- Name: ref_kecamatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_kecamatan (
    ref_kec_id integer NOT NULL,
    ref_kec_label character varying
);


ALTER TABLE public.ref_kecamatan OWNER TO postgres;

--
-- Name: ref_kecamatan_ref_kec_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_kecamatan_ref_kec_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_kecamatan_ref_kec_id_seq OWNER TO postgres;

--
-- Name: ref_kecamatan_ref_kec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_kecamatan_ref_kec_id_seq OWNED BY public.ref_kecamatan.ref_kec_id;


--
-- Name: ref_kelurahan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_kelurahan (
    ref_kel_id integer NOT NULL,
    ref_kel_label character varying,
    ref_kel_kec_id integer
);


ALTER TABLE public.ref_kelurahan OWNER TO postgres;

--
-- Name: ref_kelurahan_ref_kel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_kelurahan_ref_kel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_kelurahan_ref_kel_id_seq OWNER TO postgres;

--
-- Name: ref_kelurahan_ref_kel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_kelurahan_ref_kel_id_seq OWNED BY public.ref_kelurahan.ref_kel_id;


--
-- Name: ref_modul_akses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_modul_akses (
    ref_modul_akses_id integer NOT NULL,
    ref_modul_akses_label character varying(255),
    ref_modul_akses_group_id integer
);


ALTER TABLE public.ref_modul_akses OWNER TO postgres;

--
-- Name: ref_modul_akses_ref_modul_akses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_modul_akses_ref_modul_akses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.ref_modul_akses_ref_modul_akses_id_seq OWNER TO postgres;

--
-- Name: ref_modul_akses_ref_modul_akses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_modul_akses_ref_modul_akses_id_seq OWNED BY public.ref_modul_akses.ref_modul_akses_id;


--
-- Name: ref_user_akses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_user_akses (
    ref_user_akses_id integer NOT NULL,
    ref_user_akses_user_id integer,
    ref_user_akses_group_id integer
);


ALTER TABLE public.ref_user_akses OWNER TO postgres;

--
-- Name: ref_user_akses_ref_user_akses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_user_akses_ref_user_akses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.ref_user_akses_ref_user_akses_id_seq OWNER TO postgres;

--
-- Name: ref_user_akses_ref_user_akses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_user_akses_ref_user_akses_id_seq OWNED BY public.ref_user_akses.ref_user_akses_id;


--
-- Name: survey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.survey (
    survey_id integer NOT NULL,
    survey_nomor integer,
    survey_nomor_lengkap character varying(255),
    survey_dasar character varying(255),
    survey_untuk character varying(255),
    survey_keterangan text,
    survey_tanggal date,
    survey_ttd_kar_id integer,
    survey_created_by integer,
    survey_created_at timestamp(6) without time zone,
    survey_surat_tugas_ttd character varying(255),
    survey_cetak_ttd character varying(255),
    survey_kepala_dinas_ttd integer,
    survey_ketua_teknis_ttd integer
);


ALTER TABLE public.survey OWNER TO postgres;

--
-- Name: survey_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.survey_detail (
    survey_det_id integer NOT NULL,
    survey_det_kar_id integer,
    survey_det_created_at timestamp without time zone,
    survey_det_created_by integer,
    survey_det_head_id integer
);


ALTER TABLE public.survey_detail OWNER TO postgres;

--
-- Name: survey_detail_survey_det_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.survey_detail_survey_det_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_detail_survey_det_id_seq OWNER TO postgres;

--
-- Name: survey_detail_survey_det_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.survey_detail_survey_det_id_seq OWNED BY public.survey_detail.survey_det_id;


--
-- Name: survey_hasil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.survey_hasil (
    survey_hasil_id integer NOT NULL,
    survey_hasil_survey_id integer,
    survey_hasil_peng_id integer,
    survey_hasil_1_perijinan character varying(255),
    survey_hasil_1_nilai_kes_usp character varying(255),
    survey_hasil_1_rat character varying(255),
    survey_hasil_1_jml_angg_produktif integer,
    survey_hasil_1_jml_angg integer,
    survey_hasil_2_modal_sendiri bigint,
    survey_hasil_2_modal_luar bigint,
    survey_hasil_3_usaha character varying(255),
    survey_hasil_3_omset_per_tahun bigint,
    survey_hasil_3_pendptn_per_tahun bigint,
    survey_hasil_3_beban_operasional bigint,
    survey_hasil_3_shu bigint,
    survey_hasil_4_kas_per_bulan bigint,
    survey_hasil_4_pengeluaran bigint,
    survey_hasil_4_saldo bigint,
    survey_hasil_5_jaminan character varying(255),
    survey_hasil_5_taksiran_harga bigint,
    survey_hasil_5_status_jaminan character varying(255),
    survey_hasil_6_kelangsungan_hidup character varying(255),
    survey_hasil_permasalahan character varying(255),
    survey_hasil_created_at timestamp(6) without time zone,
    survey_hasil_created_by integer,
    survey_hasil_1_status character varying(255),
    survey_hasil_lock_is boolean DEFAULT false,
    survey_hasil_lock_at timestamp(6) without time zone,
    survey_hasil_lock_by integer,
    survey_hasil_approve_is boolean,
    survey_hasil_approve_at timestamp(6) without time zone,
    survey_hasil_approve_by integer,
    survey_hasil_reject_is boolean,
    survey_hasil_reject_at timestamp(6) without time zone,
    survey_hasil_reject_by integer,
    survey_hasil_file character varying(255)
);


ALTER TABLE public.survey_hasil OWNER TO postgres;

--
-- Name: survey_hasil_survey_hasil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.survey_hasil_survey_hasil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_hasil_survey_hasil_id_seq OWNER TO postgres;

--
-- Name: survey_hasil_survey_hasil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.survey_hasil_survey_hasil_id_seq OWNED BY public.survey_hasil.survey_hasil_id;


--
-- Name: survey_survey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.survey_survey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_survey_id_seq OWNER TO postgres;

--
-- Name: survey_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.survey_survey_id_seq OWNED BY public.survey.survey_id;


--
-- Name: survey_tempat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.survey_tempat (
    survey_tem_id integer NOT NULL,
    survey_tem_head_id integer,
    survey_tem_peng_id integer
);


ALTER TABLE public.survey_tempat OWNER TO postgres;

--
-- Name: survey_tempat_survey_tem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.survey_tempat_survey_tem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_tempat_survey_tem_id_seq OWNER TO postgres;

--
-- Name: survey_tempat_survey_tem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.survey_tempat_survey_tem_id_seq OWNED BY public.survey_tempat.survey_tem_id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    user_name character varying,
    user_password character varying(255),
    user_kar_id integer,
    user_disable boolean,
    user_created_at timestamp(6) without time zone,
    user_namalengkap character varying(255),
    user_member_id integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".user_id;


--
-- Name: karyawan kar_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karyawan ALTER COLUMN kar_id SET DEFAULT nextval('public.karyawan_kar_id_seq'::regclass);


--
-- Name: member member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member ALTER COLUMN member_id SET DEFAULT nextval('public.member_member_id_seq'::regclass);


--
-- Name: pembayaran pembayaran_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembayaran ALTER COLUMN pembayaran_id SET DEFAULT nextval('public.pembayaran_pembayaran_id_seq'::regclass);


--
-- Name: pengajuan peng_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengajuan ALTER COLUMN peng_id SET DEFAULT nextval('public.pengajuan_peng_id_seq'::regclass);


--
-- Name: pengajuan_foto peng_foto_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengajuan_foto ALTER COLUMN peng_foto_id SET DEFAULT nextval('public.pengajuan_foto_peng_foto_id_seq'::regclass);


--
-- Name: pengajuan_jaminan jam_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengajuan_jaminan ALTER COLUMN jam_id SET DEFAULT nextval('public.pengajuan_jaminan_jam_id_seq'::regclass);


--
-- Name: ref_approval ref_approval_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_approval ALTER COLUMN ref_approval_id SET DEFAULT nextval('public.ref_approval_ref_approval_id_seq'::regclass);


--
-- Name: ref_bank ref_bank_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_bank ALTER COLUMN ref_bank_id SET DEFAULT nextval('public.ref_bank_ref_bank_id_seq'::regclass);


--
-- Name: ref_bidang_usaha ref_bidang_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_bidang_usaha ALTER COLUMN ref_bidang_id SET DEFAULT nextval('public.ref_bidang_usaha_ref_bidang_id_seq'::regclass);


--
-- Name: ref_group_akses ref_group_akses_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_group_akses ALTER COLUMN ref_group_akses_id SET DEFAULT nextval('public.ref_group_akses_ref_group_akses_id_seq'::regclass);


--
-- Name: ref_jaminan ref_jaminan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_jaminan ALTER COLUMN ref_jaminan_id SET DEFAULT nextval('public.ref_jaminan_ref_jaminan_id_seq'::regclass);


--
-- Name: ref_jenis_jaminan jns_jam_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_jenis_jaminan ALTER COLUMN jns_jam_id SET DEFAULT nextval('public.jenis_jaminan_jns_jam_id_seq'::regclass);


--
-- Name: ref_jenis_pengajuan jns_pengajuan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_jenis_pengajuan ALTER COLUMN jns_pengajuan_id SET DEFAULT nextval('public.ref_jenis_pengajuan_jns_pengajuan_id_seq'::regclass);


--
-- Name: ref_kecamatan ref_kec_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_kecamatan ALTER COLUMN ref_kec_id SET DEFAULT nextval('public.ref_kecamatan_ref_kec_id_seq'::regclass);


--
-- Name: ref_kelurahan ref_kel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_kelurahan ALTER COLUMN ref_kel_id SET DEFAULT nextval('public.ref_kelurahan_ref_kel_id_seq'::regclass);


--
-- Name: ref_modul_akses ref_modul_akses_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_modul_akses ALTER COLUMN ref_modul_akses_id SET DEFAULT nextval('public.ref_modul_akses_ref_modul_akses_id_seq'::regclass);


--
-- Name: ref_user_akses ref_user_akses_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_user_akses ALTER COLUMN ref_user_akses_id SET DEFAULT nextval('public.ref_user_akses_ref_user_akses_id_seq'::regclass);


--
-- Name: survey survey_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey ALTER COLUMN survey_id SET DEFAULT nextval('public.survey_survey_id_seq'::regclass);


--
-- Name: survey_detail survey_det_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey_detail ALTER COLUMN survey_det_id SET DEFAULT nextval('public.survey_detail_survey_det_id_seq'::regclass);


--
-- Name: survey_hasil survey_hasil_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey_hasil ALTER COLUMN survey_hasil_id SET DEFAULT nextval('public.survey_hasil_survey_hasil_id_seq'::regclass);


--
-- Name: survey_tempat survey_tem_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey_tempat ALTER COLUMN survey_tem_id SET DEFAULT nextval('public.survey_tempat_survey_tem_id_seq'::regclass);


--
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Data for Name: karyawan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.karyawan (kar_id, kar_nama, kar_nip, kar_pangkat, kar_jabatan, kar_created_at, kar_created_by, kar_visible) FROM stdin;
2	HUSNAWATI,S.Sos	19751120 199803 2 003	Penata /IIIc	Staf P3KUM	2020-11-20 09:47:41.15766	1	t
1	PATRIA HADI WIJAYA,SH	19820915 200312 1 004	Penata Muda Tk I / III b	kasi Pembiayaan Koperasi Dan Usaha Mikro P3KUM	2020-11-20 09:45:15.042906	1	t
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.member (member_id, member_nama_lengkap, member_alamat, member_no_telp, member_kelurahan, member_created_at, member_created_by, member_updated_by, member_updated_at, member_visible, member_no_ktp, member_pekerjaan) FROM stdin;
18	yusuf	kediri	0988	2	2020-10-24 09:56:41.298859	\N	\N	\N	\N	\N	\N
32	mohammad almi kurniawan	kediri	08765432	3	2020-11-06 15:08:25.827111	\N	\N	\N	t	\N	\N
17	yusuf	kediri	0858585	4	2020-10-23 15:48:26.280736	\N	\N	\N	\N	\N	\N
33	yusuf	kediri	0858585	\N	2020-12-08 14:27:16.844868	\N	\N	\N	t	\N	\N
34	ari	kediri	0858585	\N	2020-12-08 14:32:26.895413	\N	\N	\N	t	\N	\N
35	almi kurniawan	kediri	0875463545	\N	2020-12-09 08:27:33.959045	\N	\N	\N	t	\N	\N
36	almi kurniawan	kediri	0856657647	33	2020-12-09 09:00:58.509572	\N	\N	\N	t	350687857476	Swasta
37	Anis Fahmi	Kediri	0857646546	33	2020-12-10 08:18:37.93483	\N	\N	\N	t	350698682638423	Swasta
\.


--
-- Data for Name: pembayaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pembayaran (pembayaran_id, pembayaran_peng_id, pembayaran_tanggal, pembayaran_cicilan, pembayaran_ke, pembayaran_lunas_is, pembayaran_lunas_tanggal, pembayaran_bunga, pembayaran_sisa, pembayaran_penetapan_no) FROM stdin;
1685	23	2020-12-10	\N	1	\N	\N	2000000	100000000	nomor123
1686	23	2021-01-10	3030303.030303	2	\N	\N	\N	100000000	nomor123
1687	23	2021-02-10	3030303.030303	3	\N	\N	\N	96969696.969696999	nomor123
1688	23	2021-03-10	3030303.030303	4	\N	\N	\N	93939393.939393997	nomor123
1689	23	2021-04-10	3030303.030303	5	\N	\N	\N	90909090.909090996	nomor123
1690	23	2021-05-10	3030303.030303	6	\N	\N	\N	87878787.878787994	nomor123
1691	23	2021-06-10	3030303.030303	7	\N	\N	\N	84848484.848484993	nomor123
1692	23	2021-07-10	3030303.030303	8	\N	\N	\N	81818181.818182006	nomor123
1693	23	2021-08-10	3030303.030303	9	\N	\N	\N	78787878.787879005	nomor123
1694	23	2021-09-10	3030303.030303	10	\N	\N	\N	75757575.757576004	nomor123
1695	23	2021-10-10	3030303.030303	11	\N	\N	\N	72727272.727273002	nomor123
1696	23	2021-11-10	3030303.030303	12	\N	\N	\N	69696969.696970001	nomor123
1697	23	2021-12-10	\N	13	\N	\N	1333333.3333333	100000000	nomor123
1698	23	2022-01-10	3030303.030303	14	\N	\N	\N	66666666.666666999	nomor123
1699	23	2022-02-10	3030303.030303	15	\N	\N	\N	63636363.636363998	nomor123
1700	23	2022-03-10	3030303.030303	16	\N	\N	\N	60606060.606060997	nomor123
1701	23	2022-04-10	3030303.030303	17	\N	\N	\N	57575757.575758003	nomor123
1702	23	2022-05-10	3030303.030303	18	\N	\N	\N	54545454.545455001	nomor123
1703	23	2022-06-10	3030303.030303	19	\N	\N	\N	51515151.515152	nomor123
1704	23	2022-07-10	3030303.030303	20	\N	\N	\N	48484848.484848	nomor123
1705	23	2022-08-10	3030303.030303	21	\N	\N	\N	45454545.454544999	nomor123
1706	23	2022-09-10	3030303.030303	22	\N	\N	\N	42424242.424241997	nomor123
1707	23	2022-10-10	3030303.030303	23	\N	\N	\N	39393939.393939003	nomor123
1708	23	2022-11-10	3030303.030303	24	\N	\N	\N	36363636.363636002	nomor123
1709	23	2022-12-10	\N	25	\N	\N	666666.66666667	100000000	nomor123
1710	23	2023-01-10	3030303.030303	26	\N	\N	\N	33333333.333333001	nomor123
1711	23	2023-02-10	3030303.030303	27	\N	\N	\N	30303030.303029999	nomor123
1712	23	2023-03-10	3030303.030303	28	\N	\N	\N	27272727.272727001	nomor123
1713	23	2023-04-10	3030303.030303	29	\N	\N	\N	24242424.242424	nomor123
1714	23	2023-05-10	3030303.030303	30	\N	\N	\N	21212121.212120999	nomor123
1715	23	2023-06-10	3030303.030303	31	\N	\N	\N	18181818.181818001	nomor123
1716	23	2023-07-10	3030303.030303	32	\N	\N	\N	15151515.151515	nomor123
1717	23	2023-08-10	3030303.030303	33	\N	\N	\N	12121212.121212	nomor123
1718	23	2023-09-10	3030303.030303	34	\N	\N	\N	9090909.0909090992	nomor123
1719	23	2023-10-10	3030303.030303	35	\N	\N	\N	6060606.060606	nomor123
1720	23	2023-11-10	3030303.030303	36	\N	\N	\N	3030303.030303	nomor123
\.


--
-- Data for Name: pengajuan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengajuan (peng_id, peng_tanggal, peng_bidang_usaha, peng_jenis_pengajuan, peng_tujuan_penggunaan, peng_foto_suami, peng_foto_istri, peng_fc_ktp, peng_fc_kk, peng_fc_surat_nikah, peng_fc_legalitas_jaminan, peng_member_id, peng_nominal, peng_prof_nama_usaha, peng_prof_alamat, peng_prof_pimpinan, peng_prof_perizinan, peng_prof_jumlah_karyawan, peng_prof_tahun_mulai, peng_prof_jenis_usaha, peng_prof_komoditi_produk, peng_prof_omset_per_bulan, peng_prof_lokasi_pemasaran, peng_prof_pola_pemasaran, peng_prof_pendapatan_penjualan, peng_prof_beban_penjualan, peng_prof_laba_per_bulan, peng_prof_modal_sendiri, peng_prof_modal_luar, peng_sk_kepala_kelurahan, peng_sk_kecamatan, peng_sk_kota, peng_sk_tanah_luas, peng_sk_tanah_desa, peng_sk_tanah_kecamatan, peng_sk_tanah_no_shm, peng_sk_tanah_tanggal_shm, peng_sk_tanah_atas_nama, peng_sk_tanah_harga_ru, peng_sk_tanah_harga_meter, peng_sk_tanah_luas_bangunan, peng_sk_tanah_harga_bangunan, peng_sk_tanah_letak_utara, peng_sk_tanah_letak_selatan, peng_sk_tanah_letak_timur, peng_sk_tanah_letak_barat, peng_sk_tanah_penggunaan, peng_jam_pemegang_ktp_no, peng_jam_pekerjaan, peng_jam_tahun_pembuatan, peng_jam_nopol, peng_jam_mesin, peng_jam_rangka, peng_jam_atas_nama, peng_jam_alamat, peng_jam_no_akta, peng_jam_tempat, peng_jam_atas_nama_tanah, peng_jam_alamat_tanah, peng_jam_jenis_bpkb, peng_jam_jenis_tanah, peng_lokasi_lat, peng_lokasi_lon, peng_lokasi_keterangan, peng_no_hp, peng_no_telp, peng_no_ktp, peng_srt_nama, peng_srt_pekerjaan, peng_srt_nama_usaha, peng_srt_jenis_usaha, peng_srt_alamat, peng_srt_jumlah_pinjaman, peng_srt_modal_kerja, peng_srt_investasi, peng_srt_pengambilan_waktu, peng_srt_bunga, peng_srt_omset_penjualan_pokok, peng_srt_pendapatan_lain, peng_srt_harga_pokok_penjualan, peng_srt_beban_bunga, peng_srt_beban_usaha, peng_srt_beban_non_usaha, peng_srt_laba, peng_lock_is, peng_lock_at, peng_lock_by, peng_tempat, peng_susunan_pengurus, peng_fc_akta_pendirian, peng_fc_buku_laporan_rapat, peng_fc_jaminan, peng_fc_ktp_pengurus, peng_fc_ktp_pengawas, peng_fc_siup, peng_fc_tdp, peng_fc_npwp, peng_fc_sertifikat_penilaian, peng_foto_pengawas, peng_foto_pengurus, peng_badan_hukum_no, peng_badan_hukum_tanggal, peng_kesehatan_usp, peng_jumlah_anggota, peng_pelaksanaan_rat, peng_ketua, peng_sekretaris, peng_bendahara, peng_pengawas_koor, peng_pengawas_anggota1, peng_pengawas_anggota2, peng_usaha_dikelola_1, peng_usaha_dikelola_2, peng_jam_jenis, peng_usaha_shu, peng_permodalan_kewajiban, peng_permodalan_modal_kerja, peng_permodalan_pinjaman_bank, peng_manf_meningkatkan_penjualan, peng_manf_menambah_modal, peng_manf_peningkatan_omset, peng_manf_peningkatan_shu, peng_manf_peningkatan_asset, peng_verif_is, peng_verif_by, peng_verif_at, peng_verif_reject_is, peng_verif_reject_by, peng_verif_reject_at, peng_verif_reject_note, peng_surv_is, peng_surv_id, peng_disetujui_nominal, peng_disetujui_tanggal_jatuh_tempo, peng_disetujui_tanggal_penetapan, peng_disetujui_jangka_waktu_bln, peng_disetujui_jangka_waktu_text, peng_disetujui_cicilan, peng_disetujui_created_at, peng_disetujui_created_by, peng_uji_kel_no_ktp, peng_uji_kel_pekerjaan, peng_disetujui_no_penetapan, peng_disetujui_bank, peng_disetujui_kunci_is, peng_disetujui_kunci_at, peng_disetujui_kunci_by, peng_cetak_pengajuan_ttd, peng_disetujui_cetak_sppk, peng_jam_emas_karat, peng_jam_emas_gram, peng_jam_jenis_emas, peng_kepala_dinas_ttd, peng_jam_no_bpkb, peng_jam_su_tanggal, peng_jam_nomor_surat_ukur, peng_jam_luas_tanah, peng_jam_harga_perkiraan, peng_jam_harga_perkiraan_total, peng_jam_type_bpkb) FROM stdin;
24	2020-12-09	\N	3	\N	\N	\N	\N	\N	\N	\N	37	10000000	Koperasi Makmur	Kediri	\N	\N	10	\N	\N	\N	10000000	\N	\N	100000000	100000000	\N	1000000000	10000000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35069868587	Swasta	2020	pol123	mes123	rang123	Almi Kurniawan	\N	\N	\N	\N	\N	1	\N	-7.793486510327649	112.11034304625542		\N	\N	\N	\N	\N	\N	\N	\N	10000000	100000	1000000	36	4	100000000	100000000	\N	\N	\N	\N	\N	\N	\N	\N	Kediri	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	nomor321	2020-12-10	Ujicoba	10	Ujicoba	Ujicoba	Ujicoba	Ujicoba	Ujicoba	Ujicoba	Ujicoba	Ujicoba	Ujicoba	1	10000000	10000000	10000000000	1000000000	\N	\N	\N	\N	\N	t	1	2020-12-09 19:50:16	\N	\N	\N	\N	t	32	25000000	2020-12-10	2020-12-10	36	Dua Belas Bulan	100000	2020-12-15 14:50:23	1	\N	\N	nomor321	1	f	2020-12-12 14:03:23.983224	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	2020-12-09	1	2	Modal	1607563827_181bca03c25400ba69b6.jpg.jpg	1607563827_181bca03c25400ba69b6.jpg.jpg	\N	\N	\N	\N	32	100000000	Mie Ayam Makmur	Kediri	almi kurniawan	nomor123	10	2020	1	Mie	10000000	Kediri	Online	1000000	1000000	10000000	100000000	10000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	350612323423	Swasta	2020	23758	mes123	rang123	almi kurniawan	kediri	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	Mohammad Almi Kurniawan	Swasta	Mie Ayam Makmur	1	Kediri	100000000	100000	100000	1	2	10000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	1	2020-12-09 19:44:02	\N	\N	\N	\N	t	31	100000000	2020-12-10	2020-12-10	36	10 Bulan	10000000	2020-12-28 14:45:00	1	\N	\N	nomor123	2	f	2020-12-28 14:33:17.432321	1	\N	1608088577_da65a0d22b6efb08e215.png.png	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
27	2020-12-09	\N	3	\N	\N	\N	\N	\N	\N	\N	37	10000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7.802670501982031	112.04733412069507	dfsdf	\N	\N	\N	\N	\N	\N	\N	\N	10000000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kediri	1609734632_316f5daab7eeea63716c.pdf.pdf	1609734632_72f4b9bea852f4ec6ce4.pdf.pdf	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	2020-12-12	4	1	\N	1608109555_a4a8614a376bb2920c48.png.png	\N	\N	\N	\N	\N	32	500000	\N	\N	\N	\N	\N	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2324534	swasta	\N	\N	\N	\N	\N	\N	34ewr	kediri	almi	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	500000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3506123462834	Swasta	\N	\N	f	\N	\N	1608007919_fc9bd600ed8aeac3568a.png.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: pengajuan_foto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengajuan_foto (peng_foto_id, peng_foto_peng_id, peng_foto_file, peng_foto_created_at, peng_foto_created_by, peng_foto_jenis) FROM stdin;
17	23	1607564220_718ebe6e391a113ffce4.jpg	2020-12-09 19:37:00	1	1
19	24	1607564914_81635da19ee6b874b3e1.jpg	2020-12-09 19:48:34	1	2
\.


--
-- Data for Name: pengajuan_jaminan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengajuan_jaminan (jam_id, jam_peng_id, jam_jenis, jam_pemegang_ktp_no, jam_pekerjaan, jam_tahun_pembuatan, jam_nopol, jam_mesin, jam_rangka, jam_atas_nama, jam_alamat, jam_no_akta, jam_tempat, jam_atas_nama_tanah, jam_alamat_tanah, jam_jenis_kepemilikan, jam_emas_karat, jam_emas_gram, jam_no_bpkb, jam_su_tanggal, jam_nomor_surat_ukur, jam_luas_tanah, jam_harga_perkiraan, jam_harga_perkiraan_total, jam_type_bpkb) FROM stdin;
3	27	1	350682345723541	Swasta	2020	 afd au	 asdfa	adfau	asfaufAFGALISF	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	auydauos
\.


--
-- Data for Name: ref_approval; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_approval (ref_approval_id, ref_approval_label) FROM stdin;
\.


--
-- Data for Name: ref_bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_bank (ref_bank_id, ref_bank_label) FROM stdin;
1	BRI
2	BANK JATIM
3	MANDIRI
\.


--
-- Data for Name: ref_bidang_usaha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_bidang_usaha (ref_bidang_id, ref_bidang_label) FROM stdin;
1	Kuliner
4	Jasa
3	Pertanian
5	Kuliner
6	Peracangan
8	Hiburan
\.


--
-- Data for Name: ref_group_akses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_group_akses (ref_group_akses_id, ref_group_akses_label) FROM stdin;
5	Pengaju
6	Verifikator
7	Surveyor
8	Appoval Survey
9	Persetujuan
10	Pembayaran
12	Super User
13	Rekap
\.


--
-- Data for Name: ref_jaminan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_jaminan (ref_jaminan_id, ref_jaminan_label) FROM stdin;
3	Emas
2	Sertifikat
1	BPKB
\.


--
-- Data for Name: ref_jenis_jaminan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_jenis_jaminan (jns_jam_id, jns_jam_label) FROM stdin;
1	Pribadi
2	Orang Lain
\.


--
-- Data for Name: ref_jenis_pengajuan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_jenis_pengajuan (jns_pengajuan_id, jns_pengajuan_label) FROM stdin;
1	Dibawah 10jt
2	Diatas 10jt
3	Dana Bergulir
\.


--
-- Data for Name: ref_kecamatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_kecamatan (ref_kec_id, ref_kec_label) FROM stdin;
3	PESANTREN
2	MOJOROTO
1	KOTA
\.


--
-- Data for Name: ref_kelurahan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_kelurahan (ref_kel_id, ref_kel_label, ref_kel_kec_id) FROM stdin;
2	 Semampir	1
3	 Dandangan	1
4	 Ngadirejo	1
5	 Pakelan	1
6	 Pocanan	1
7	 Banjaran	1
8	 Jagalan	1
9	 Kemasan	1
10	 Kaliombo	1
11	 Kampung Dalem	1
12	 Ngronggo	1
13	 Manisrenggo	1
14	 Balowerti	1
15	 Rejomulyo	1
16	 Ringin Anom	1
17	 Setono Gedong	1
18	 Setono Pande	1
19	Lirboyo	2
20	 Campurejo	2
21	 Bandar Lor	2
22	 Dermo	2
23	 Mrican	2
24	 Mojoroto	2
25	 Ngampel	2
26	 Gayam	2
27	 Sukorame	2
28	 Pojok	2
29	 Tamanan	2
30	 Bandar Kidul	2
31	 Banjarmelati	2
32	 Bujel	2
33	Jamsaren	3
34	 Bangsal	3
35	 Burengan	3
36	 Pesantren	3
37	 Pakunden	3
38	 Singonegaran	3
39	 Tinalan	3
40	 Banaran	3
41	 Tosaren	3
42	 Betet	3
43	 Blabak	3
44	 Bawang	3
45	 Ngletih	3
46	 Tempurejo	3
47	 Ketami	3
\.


--
-- Data for Name: ref_modul_akses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_modul_akses (ref_modul_akses_id, ref_modul_akses_label, ref_modul_akses_group_id) FROM stdin;
20	admin/verifikasi	6
21	admin/survey	7
22	admin/addSurvey	8
24	admin/pembayaran	10
23	admin/persetujuan	9
26	admin/verifikasi	12
27	admin/survey	12
28	admin/accSurvey	12
29	admin/persetujuan	12
30	admin/pembayaran	12
31	#data_master	12
32	admin/bidangUsaha	12
33	admin/refBank	12
34	admin/member	12
35	admin/karyawan	12
36	#hak_akses	12
37	admin/aksesGroup	12
38	admin/aksesModul	12
39	admin/aksesUser	12
40	admin/rekap	13
41	admin/rekap	12
\.


--
-- Data for Name: ref_user_akses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_user_akses (ref_user_akses_id, ref_user_akses_user_id, ref_user_akses_group_id) FROM stdin;
33	1	12
\.


--
-- Data for Name: survey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.survey (survey_id, survey_nomor, survey_nomor_lengkap, survey_dasar, survey_untuk, survey_keterangan, survey_tanggal, survey_ttd_kar_id, survey_created_by, survey_created_at, survey_surat_tugas_ttd, survey_cetak_ttd, survey_kepala_dinas_ttd, survey_ketua_teknis_ttd) FROM stdin;
31	\N	nomor123	Ujicoba	Ujicoba	Ujicoba	2020-12-10	\N	1	2020-12-09 19:44:21	\N	\N	\N	\N
32	\N	nomor321	ujicoba	ujicoba	ujicoba	2020-12-10	\N	1	2020-12-09 19:50:23	1608019453_f9163bfca6fe1585acde.png.png	1608019453_6e9b9aceacfe742521c1.png.png	1	2
\.


--
-- Data for Name: survey_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.survey_detail (survey_det_id, survey_det_kar_id, survey_det_created_at, survey_det_created_by, survey_det_head_id) FROM stdin;
18	2	\N	\N	31
19	1	\N	\N	31
20	2	\N	\N	32
21	1	\N	\N	32
\.


--
-- Data for Name: survey_hasil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.survey_hasil (survey_hasil_id, survey_hasil_survey_id, survey_hasil_peng_id, survey_hasil_1_perijinan, survey_hasil_1_nilai_kes_usp, survey_hasil_1_rat, survey_hasil_1_jml_angg_produktif, survey_hasil_1_jml_angg, survey_hasil_2_modal_sendiri, survey_hasil_2_modal_luar, survey_hasil_3_usaha, survey_hasil_3_omset_per_tahun, survey_hasil_3_pendptn_per_tahun, survey_hasil_3_beban_operasional, survey_hasil_3_shu, survey_hasil_4_kas_per_bulan, survey_hasil_4_pengeluaran, survey_hasil_4_saldo, survey_hasil_5_jaminan, survey_hasil_5_taksiran_harga, survey_hasil_5_status_jaminan, survey_hasil_6_kelangsungan_hidup, survey_hasil_permasalahan, survey_hasil_created_at, survey_hasil_created_by, survey_hasil_1_status, survey_hasil_lock_is, survey_hasil_lock_at, survey_hasil_lock_by, survey_hasil_approve_is, survey_hasil_approve_at, survey_hasil_approve_by, survey_hasil_reject_is, survey_hasil_reject_at, survey_hasil_reject_by, survey_hasil_file) FROM stdin;
11	31	23	Legal	Ujicoba	Ujicoba	10	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020-12-10 08:45:21.564029	\N	Ujicoba	t	2020-12-10 08:45:26.595193	1	t	2020-12-15 15:00:07.198602	1	f	2020-12-12 10:28:11.015998	1	\N
12	32	24	Legal	ujicoba	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-01-08 11:10:13.490722	\N	\N	f	2020-12-15 14:41:23.219944	1	t	2020-12-12 11:07:29.897836	1	f	2020-12-12 10:29:11.429378	1	1608018347_0ced3ef79cd506caee4f.pdf.pdf
\.


--
-- Data for Name: survey_tempat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.survey_tempat (survey_tem_id, survey_tem_head_id, survey_tem_peng_id) FROM stdin;
19	31	23
20	32	24
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (user_id, user_name, user_password, user_kar_id, user_disable, user_created_at, user_namalengkap, user_member_id) FROM stdin;
15	yus	36c3eaa0e1e290f41e2810bae8d9502c785e92d9	0	\N	2020-10-23 15:39:55.106223	yusuf	18
19	almikurniawan	40bd001563085fc35165329ea1ff5c5ecbdbbeef	\N	\N	2020-11-06 15:08:25.874301	mohammad almi kurniawan	32
20	patria	40bd001563085fc35165329ea1ff5c5ecbdbbeef	1	\N	2020-11-20 09:45:15.074359	PATRIA HADI WIJAYA,SH	\N
21	husna	40bd001563085fc35165329ea1ff5c5ecbdbbeef	2	\N	2020-11-20 09:47:41.181877	HUSNAWATI,S.Sos	\N
6	yus	40bd001563085fc35165329ea1ff5c5ecbdbbeef	0	\N	\N	yusuf	17
3	wina	2fee5e53252cce3b7146551b6459fc99c3e28041	0	\N	\N	wina	\N
2	surveyor	d033e22ae348aeb5660fc2140aec35850c4da997	0	f	2020-09-16 10:34:30.089515	Almi	\N
22	ari	7158a9e0f8e84a0a74ed148e0f652dfbd4913a18	\N	\N	2020-12-08 14:32:26.902357	ari	34
23	almikur	a9e0378601ec4a08f949292d349f0c9abe8f82e8	\N	\N	2020-12-09 08:27:34.243121	almi kurniawan	35
24	ucup	36c3eaa0e1e290f41e2810bae8d9502c785e92d9	\N	\N	2020-12-09 09:00:04.940915	almi kurniawan	36
25	anis	36c3eaa0e1e290f41e2810bae8d9502c785e92d9	\N	\N	2020-12-10 08:18:38.105918	Anis Fahmi	37
1	admin	d033e22ae348aeb5660fc2140aec35850c4da997	0	f	2020-09-16 10:34:30.089515	Yusuf	\N
\.


--
-- Name: jenis_jaminan_jns_jam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jenis_jaminan_jns_jam_id_seq', 2, true);


--
-- Name: karyawan_kar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.karyawan_kar_id_seq', 2, true);


--
-- Name: member_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.member_member_id_seq', 37, true);


--
-- Name: pembayaran_pembayaran_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pembayaran_pembayaran_id_seq', 1720, true);


--
-- Name: pengajuan_foto_peng_foto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengajuan_foto_peng_foto_id_seq', 19, true);


--
-- Name: pengajuan_jaminan_jam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengajuan_jaminan_jam_id_seq', 3, true);


--
-- Name: pengajuan_peng_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengajuan_peng_id_seq', 27, true);


--
-- Name: ref_approval_ref_approval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_approval_ref_approval_id_seq', 1, false);


--
-- Name: ref_bank_ref_bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_bank_ref_bank_id_seq', 3, true);


--
-- Name: ref_bidang_usaha_ref_bidang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_bidang_usaha_ref_bidang_id_seq', 8, true);


--
-- Name: ref_group_akses_ref_group_akses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_group_akses_ref_group_akses_id_seq', 13, true);


--
-- Name: ref_jaminan_ref_jaminan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_jaminan_ref_jaminan_id_seq', 3, true);


--
-- Name: ref_jenis_pengajuan_jns_pengajuan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_jenis_pengajuan_jns_pengajuan_id_seq', 3, true);


--
-- Name: ref_kecamatan_ref_kec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_kecamatan_ref_kec_id_seq', 3, true);


--
-- Name: ref_kelurahan_ref_kel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_kelurahan_ref_kel_id_seq', 47, true);


--
-- Name: ref_modul_akses_ref_modul_akses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_modul_akses_ref_modul_akses_id_seq', 41, true);


--
-- Name: ref_user_akses_ref_user_akses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_user_akses_ref_user_akses_id_seq', 33, true);


--
-- Name: survey_detail_survey_det_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.survey_detail_survey_det_id_seq', 21, true);


--
-- Name: survey_hasil_survey_hasil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.survey_hasil_survey_hasil_id_seq', 12, true);


--
-- Name: survey_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.survey_survey_id_seq', 32, true);


--
-- Name: survey_tempat_survey_tem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.survey_tempat_survey_tem_id_seq', 20, true);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_id_seq', 25, true);


--
-- Name: ref_jenis_jaminan jenis_jaminan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_jenis_jaminan
    ADD CONSTRAINT jenis_jaminan_pkey PRIMARY KEY (jns_jam_id);


--
-- Name: karyawan karyawan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karyawan
    ADD CONSTRAINT karyawan_pkey PRIMARY KEY (kar_id);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (member_id);


--
-- Name: pembayaran pembayaran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembayaran
    ADD CONSTRAINT pembayaran_pkey PRIMARY KEY (pembayaran_id);


--
-- Name: pengajuan_foto pengajuan_foto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengajuan_foto
    ADD CONSTRAINT pengajuan_foto_pkey PRIMARY KEY (peng_foto_id);


--
-- Name: pengajuan_jaminan pengajuan_jaminan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengajuan_jaminan
    ADD CONSTRAINT pengajuan_jaminan_pkey PRIMARY KEY (jam_id);


--
-- Name: pengajuan pengajuan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengajuan
    ADD CONSTRAINT pengajuan_pkey PRIMARY KEY (peng_id);


--
-- Name: ref_bank ref_bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_bank
    ADD CONSTRAINT ref_bank_pkey PRIMARY KEY (ref_bank_id);


--
-- Name: ref_bidang_usaha ref_bidang_usaha_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_bidang_usaha
    ADD CONSTRAINT ref_bidang_usaha_pkey PRIMARY KEY (ref_bidang_id);


--
-- Name: ref_group_akses ref_group_akses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_group_akses
    ADD CONSTRAINT ref_group_akses_pkey PRIMARY KEY (ref_group_akses_id);


--
-- Name: ref_jenis_pengajuan ref_jenis_pengajuan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_jenis_pengajuan
    ADD CONSTRAINT ref_jenis_pengajuan_pkey PRIMARY KEY (jns_pengajuan_id);


--
-- Name: ref_kecamatan ref_kecamatan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_kecamatan
    ADD CONSTRAINT ref_kecamatan_pkey PRIMARY KEY (ref_kec_id);


--
-- Name: ref_kelurahan ref_kelurahan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_kelurahan
    ADD CONSTRAINT ref_kelurahan_pkey PRIMARY KEY (ref_kel_id);


--
-- Name: ref_modul_akses ref_modul_akses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_modul_akses
    ADD CONSTRAINT ref_modul_akses_pkey PRIMARY KEY (ref_modul_akses_id);


--
-- Name: ref_user_akses ref_user_akses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_user_akses
    ADD CONSTRAINT ref_user_akses_pkey PRIMARY KEY (ref_user_akses_id);


--
-- Name: survey_detail survey_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey_detail
    ADD CONSTRAINT survey_detail_pkey PRIMARY KEY (survey_det_id);


--
-- Name: survey_hasil survey_hasil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey_hasil
    ADD CONSTRAINT survey_hasil_pkey PRIMARY KEY (survey_hasil_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

