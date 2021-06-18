/*
 Navicat Premium Data Transfer

 Source Server         : localhost postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 100005
 Source Host           : localhost:5432
 Source Catalog        : dinkop
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100005
 File Encoding         : 65001

 Date: 19/01/2021 10:39:07
*/


-- ----------------------------
-- Sequence structure for jenis_jaminan_jns_jam_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."jenis_jaminan_jns_jam_id_seq";
CREATE SEQUENCE "public"."jenis_jaminan_jns_jam_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for karyawan_kar_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."karyawan_kar_id_seq";
CREATE SEQUENCE "public"."karyawan_kar_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for member_member_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."member_member_id_seq";
CREATE SEQUENCE "public"."member_member_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pembayaran_pembayaran_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pembayaran_pembayaran_id_seq";
CREATE SEQUENCE "public"."pembayaran_pembayaran_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pengajuan_foto_peng_foto_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pengajuan_foto_peng_foto_id_seq";
CREATE SEQUENCE "public"."pengajuan_foto_peng_foto_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pengajuan_jaminan_jam_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pengajuan_jaminan_jam_id_seq";
CREATE SEQUENCE "public"."pengajuan_jaminan_jam_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pengajuan_peng_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pengajuan_peng_id_seq";
CREATE SEQUENCE "public"."pengajuan_peng_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_approval_ref_approval_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_approval_ref_approval_id_seq";
CREATE SEQUENCE "public"."ref_approval_ref_approval_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_bank_ref_bank_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_bank_ref_bank_id_seq";
CREATE SEQUENCE "public"."ref_bank_ref_bank_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_bidang_usaha_ref_bidang_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_bidang_usaha_ref_bidang_id_seq";
CREATE SEQUENCE "public"."ref_bidang_usaha_ref_bidang_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_group_akses_ref_group_akses_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_group_akses_ref_group_akses_id_seq";
CREATE SEQUENCE "public"."ref_group_akses_ref_group_akses_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_jaminan_ref_jaminan_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_jaminan_ref_jaminan_id_seq";
CREATE SEQUENCE "public"."ref_jaminan_ref_jaminan_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_jenis_pengajuan_jns_pengajuan_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_jenis_pengajuan_jns_pengajuan_id_seq";
CREATE SEQUENCE "public"."ref_jenis_pengajuan_jns_pengajuan_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_kecamatan_ref_kec_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_kecamatan_ref_kec_id_seq";
CREATE SEQUENCE "public"."ref_kecamatan_ref_kec_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_kelurahan_ref_kel_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_kelurahan_ref_kel_id_seq";
CREATE SEQUENCE "public"."ref_kelurahan_ref_kel_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_modul_akses_ref_modul_akses_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_modul_akses_ref_modul_akses_id_seq";
CREATE SEQUENCE "public"."ref_modul_akses_ref_modul_akses_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_user_akses_ref_user_akses_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_user_akses_ref_user_akses_id_seq";
CREATE SEQUENCE "public"."ref_user_akses_ref_user_akses_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for survey_detail_survey_det_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."survey_detail_survey_det_id_seq";
CREATE SEQUENCE "public"."survey_detail_survey_det_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for survey_hasil_survey_hasil_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."survey_hasil_survey_hasil_id_seq";
CREATE SEQUENCE "public"."survey_hasil_survey_hasil_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for survey_survey_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."survey_survey_id_seq";
CREATE SEQUENCE "public"."survey_survey_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for survey_tempat_survey_tem_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."survey_tempat_survey_tem_id_seq";
CREATE SEQUENCE "public"."survey_tempat_survey_tem_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_user_id_seq";
CREATE SEQUENCE "public"."user_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS "public"."karyawan";
CREATE TABLE "public"."karyawan" (
  "kar_id" int4 NOT NULL DEFAULT nextval('karyawan_kar_id_seq'::regclass),
  "kar_nama" varchar COLLATE "pg_catalog"."default",
  "kar_nip" varchar(255) COLLATE "pg_catalog"."default",
  "kar_pangkat" varchar(255) COLLATE "pg_catalog"."default",
  "kar_jabatan" varchar(255) COLLATE "pg_catalog"."default",
  "kar_created_at" timestamp(6),
  "kar_created_by" int4,
  "kar_visible" bool
)
;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
INSERT INTO "public"."karyawan" VALUES (2, 'HUSNAWATI,S.Sos', '19751120 199803 2 003', 'Penata /IIIc', 'Staf P3KUM', '2020-11-20 09:47:41.15766', 1, 't');
INSERT INTO "public"."karyawan" VALUES (1, 'PATRIA HADI WIJAYA,SH', '19820915 200312 1 004', 'Penata Muda Tk I / III b', 'kasi Pembiayaan Koperasi Dan Usaha Mikro P3KUM', '2020-11-20 09:45:15.042906', 1, 't');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS "public"."member";
CREATE TABLE "public"."member" (
  "member_id" int4 NOT NULL DEFAULT nextval('member_member_id_seq'::regclass),
  "member_nama_lengkap" varchar COLLATE "pg_catalog"."default",
  "member_alamat" varchar(255) COLLATE "pg_catalog"."default",
  "member_no_telp" varchar(255) COLLATE "pg_catalog"."default",
  "member_kelurahan" int4,
  "member_created_at" timestamp(6),
  "member_created_by" int4,
  "member_updated_by" int4,
  "member_updated_at" timestamp(6),
  "member_visible" bool DEFAULT true,
  "member_no_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "member_pekerjaan" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO "public"."member" VALUES (18, 'yusuf', 'kediri', '0988', 2, '2020-10-24 09:56:41.298859', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."member" VALUES (32, 'mohammad almi kurniawan', 'kediri', '08765432', 3, '2020-11-06 15:08:25.827111', NULL, NULL, NULL, 't', NULL, NULL);
INSERT INTO "public"."member" VALUES (17, 'yusuf', 'kediri', '0858585', 4, '2020-10-23 15:48:26.280736', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."member" VALUES (33, 'yusuf', 'kediri', '0858585', NULL, '2020-12-08 14:27:16.844868', NULL, NULL, NULL, 't', NULL, NULL);
INSERT INTO "public"."member" VALUES (34, 'ari', 'kediri', '0858585', NULL, '2020-12-08 14:32:26.895413', NULL, NULL, NULL, 't', NULL, NULL);
INSERT INTO "public"."member" VALUES (35, 'almi kurniawan', 'kediri', '0875463545', NULL, '2020-12-09 08:27:33.959045', NULL, NULL, NULL, 't', NULL, NULL);
INSERT INTO "public"."member" VALUES (36, 'almi kurniawan', 'kediri', '0856657647', 33, '2020-12-09 09:00:58.509572', NULL, NULL, NULL, 't', '350687857476', 'Swasta');
INSERT INTO "public"."member" VALUES (37, 'Anis Fahmi', 'Kediri', '0857646546', 33, '2020-12-10 08:18:37.93483', NULL, NULL, NULL, 't', '350698682638423', 'Swasta');

-- ----------------------------
-- Table structure for pembayaran
-- ----------------------------
DROP TABLE IF EXISTS "public"."pembayaran";
CREATE TABLE "public"."pembayaran" (
  "pembayaran_id" int4 NOT NULL DEFAULT nextval('pembayaran_pembayaran_id_seq'::regclass),
  "pembayaran_peng_id" int4,
  "pembayaran_tanggal" date,
  "pembayaran_cicilan" float8,
  "pembayaran_ke" int4,
  "pembayaran_lunas_is" bool,
  "pembayaran_lunas_tanggal" date,
  "pembayaran_bunga" float8,
  "pembayaran_sisa" float8,
  "pembayaran_penetapan_no" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of pembayaran
-- ----------------------------
INSERT INTO "public"."pembayaran" VALUES (1685, 23, '2020-12-10', NULL, 1, NULL, NULL, 2000000, 100000000, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1686, 23, '2021-01-10', 3030303.030303, 2, NULL, NULL, NULL, 100000000, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1687, 23, '2021-02-10', 3030303.030303, 3, NULL, NULL, NULL, 96969696.969697, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1688, 23, '2021-03-10', 3030303.030303, 4, NULL, NULL, NULL, 93939393.939394, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1689, 23, '2021-04-10', 3030303.030303, 5, NULL, NULL, NULL, 90909090.909091, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1690, 23, '2021-05-10', 3030303.030303, 6, NULL, NULL, NULL, 87878787.878788, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1691, 23, '2021-06-10', 3030303.030303, 7, NULL, NULL, NULL, 84848484.848485, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1692, 23, '2021-07-10', 3030303.030303, 8, NULL, NULL, NULL, 81818181.818182, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1693, 23, '2021-08-10', 3030303.030303, 9, NULL, NULL, NULL, 78787878.787879, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1694, 23, '2021-09-10', 3030303.030303, 10, NULL, NULL, NULL, 75757575.757576, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1695, 23, '2021-10-10', 3030303.030303, 11, NULL, NULL, NULL, 72727272.727273, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1696, 23, '2021-11-10', 3030303.030303, 12, NULL, NULL, NULL, 69696969.69697, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1697, 23, '2021-12-10', NULL, 13, NULL, NULL, 1333333.3333333, 100000000, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1698, 23, '2022-01-10', 3030303.030303, 14, NULL, NULL, NULL, 66666666.666667, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1699, 23, '2022-02-10', 3030303.030303, 15, NULL, NULL, NULL, 63636363.636364, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1700, 23, '2022-03-10', 3030303.030303, 16, NULL, NULL, NULL, 60606060.606061, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1701, 23, '2022-04-10', 3030303.030303, 17, NULL, NULL, NULL, 57575757.575758, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1702, 23, '2022-05-10', 3030303.030303, 18, NULL, NULL, NULL, 54545454.545455, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1703, 23, '2022-06-10', 3030303.030303, 19, NULL, NULL, NULL, 51515151.515152, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1704, 23, '2022-07-10', 3030303.030303, 20, NULL, NULL, NULL, 48484848.484848, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1705, 23, '2022-08-10', 3030303.030303, 21, NULL, NULL, NULL, 45454545.454545, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1706, 23, '2022-09-10', 3030303.030303, 22, NULL, NULL, NULL, 42424242.424242, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1707, 23, '2022-10-10', 3030303.030303, 23, NULL, NULL, NULL, 39393939.393939, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1708, 23, '2022-11-10', 3030303.030303, 24, NULL, NULL, NULL, 36363636.363636, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1709, 23, '2022-12-10', NULL, 25, NULL, NULL, 666666.66666667, 100000000, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1710, 23, '2023-01-10', 3030303.030303, 26, NULL, NULL, NULL, 33333333.333333, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1711, 23, '2023-02-10', 3030303.030303, 27, NULL, NULL, NULL, 30303030.30303, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1712, 23, '2023-03-10', 3030303.030303, 28, NULL, NULL, NULL, 27272727.272727, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1713, 23, '2023-04-10', 3030303.030303, 29, NULL, NULL, NULL, 24242424.242424, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1714, 23, '2023-05-10', 3030303.030303, 30, NULL, NULL, NULL, 21212121.212121, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1715, 23, '2023-06-10', 3030303.030303, 31, NULL, NULL, NULL, 18181818.181818, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1716, 23, '2023-07-10', 3030303.030303, 32, NULL, NULL, NULL, 15151515.151515, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1717, 23, '2023-08-10', 3030303.030303, 33, NULL, NULL, NULL, 12121212.121212, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1718, 23, '2023-09-10', 3030303.030303, 34, NULL, NULL, NULL, 9090909.0909091, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1719, 23, '2023-10-10', 3030303.030303, 35, NULL, NULL, NULL, 6060606.060606, 'nomor123');
INSERT INTO "public"."pembayaran" VALUES (1720, 23, '2023-11-10', 3030303.030303, 36, NULL, NULL, NULL, 3030303.030303, 'nomor123');

-- ----------------------------
-- Table structure for pengajuan
-- ----------------------------
DROP TABLE IF EXISTS "public"."pengajuan";
CREATE TABLE "public"."pengajuan" (
  "peng_id" int4 NOT NULL DEFAULT nextval('pengajuan_peng_id_seq'::regclass),
  "peng_tanggal" date,
  "peng_bidang_usaha" int4,
  "peng_jenis_pengajuan" int2,
  "peng_tujuan_penggunaan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_foto_suami" varchar(255) COLLATE "pg_catalog"."default",
  "peng_foto_istri" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_kk" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_surat_nikah" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_legalitas_jaminan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_member_id" int4,
  "peng_nominal" float8,
  "peng_prof_nama_usaha" varchar(255) COLLATE "pg_catalog"."default",
  "peng_prof_alamat" varchar(255) COLLATE "pg_catalog"."default",
  "peng_prof_pimpinan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_prof_perizinan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_prof_jumlah_karyawan" int2,
  "peng_prof_tahun_mulai" int2,
  "peng_prof_jenis_usaha" int4,
  "peng_prof_komoditi_produk" varchar(255) COLLATE "pg_catalog"."default",
  "peng_prof_omset_per_bulan" float8,
  "peng_prof_lokasi_pemasaran" varchar(255) COLLATE "pg_catalog"."default",
  "peng_prof_pola_pemasaran" varchar(255) COLLATE "pg_catalog"."default",
  "peng_prof_pendapatan_penjualan" float8,
  "peng_prof_beban_penjualan" float8,
  "peng_prof_laba_per_bulan" float8,
  "peng_prof_modal_sendiri" float8,
  "peng_prof_modal_luar" float8,
  "peng_sk_kepala_kelurahan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sk_kecamatan" int4,
  "peng_sk_kota" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sk_tanah_luas" int4,
  "peng_sk_tanah_desa" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sk_tanah_kecamatan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sk_tanah_no_shm" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sk_tanah_tanggal_shm" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sk_tanah_atas_nama" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sk_tanah_harga_ru" float8,
  "peng_sk_tanah_harga_meter" float8,
  "peng_sk_tanah_luas_bangunan" int4,
  "peng_sk_tanah_harga_bangunan" float8,
  "peng_sk_tanah_letak_utara" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sk_tanah_letak_selatan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sk_tanah_letak_timur" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sk_tanah_letak_barat" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sk_tanah_penggunaan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_pemegang_ktp_no" varchar COLLATE "pg_catalog"."default",
  "peng_jam_pekerjaan" varchar COLLATE "pg_catalog"."default",
  "peng_jam_tahun_pembuatan" int4,
  "peng_jam_nopol" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_mesin" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_rangka" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_atas_nama" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_alamat" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_no_akta" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_tempat" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_atas_nama_tanah" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_alamat_tanah" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_jenis_bpkb" int2,
  "peng_jam_jenis_tanah" int2,
  "peng_lokasi_lat" varchar(255) COLLATE "pg_catalog"."default",
  "peng_lokasi_lon" varchar(255) COLLATE "pg_catalog"."default",
  "peng_lokasi_keterangan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_no_hp" varchar(255) COLLATE "pg_catalog"."default",
  "peng_no_telp" varchar(255) COLLATE "pg_catalog"."default",
  "peng_no_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "peng_srt_nama" varchar(255) COLLATE "pg_catalog"."default",
  "peng_srt_pekerjaan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_srt_nama_usaha" varchar(255) COLLATE "pg_catalog"."default",
  "peng_srt_jenis_usaha" int4,
  "peng_srt_alamat" varchar(255) COLLATE "pg_catalog"."default",
  "peng_srt_jumlah_pinjaman" float8,
  "peng_srt_modal_kerja" float8,
  "peng_srt_investasi" float8,
  "peng_srt_pengambilan_waktu" int2,
  "peng_srt_bunga" float8,
  "peng_srt_omset_penjualan_pokok" float8,
  "peng_srt_pendapatan_lain" float8,
  "peng_srt_harga_pokok_penjualan" float8,
  "peng_srt_beban_bunga" float8,
  "peng_srt_beban_usaha" float8,
  "peng_srt_beban_non_usaha" float8,
  "peng_srt_laba" float8,
  "peng_lock_is" bool,
  "peng_lock_at" timestamp(6),
  "peng_lock_by" int4,
  "peng_tempat" varchar(255) COLLATE "pg_catalog"."default",
  "peng_susunan_pengurus" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_akta_pendirian" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_buku_laporan_rapat" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_jaminan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_ktp_pengurus" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_ktp_pengawas" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_siup" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_tdp" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_npwp" varchar(255) COLLATE "pg_catalog"."default",
  "peng_fc_sertifikat_penilaian" varchar(255) COLLATE "pg_catalog"."default",
  "peng_foto_pengawas" varchar(255) COLLATE "pg_catalog"."default",
  "peng_foto_pengurus" varchar(255) COLLATE "pg_catalog"."default",
  "peng_badan_hukum_no" varchar(255) COLLATE "pg_catalog"."default",
  "peng_badan_hukum_tanggal" date,
  "peng_kesehatan_usp" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jumlah_anggota" int4,
  "peng_pelaksanaan_rat" varchar(255) COLLATE "pg_catalog"."default",
  "peng_ketua" varchar(255) COLLATE "pg_catalog"."default",
  "peng_sekretaris" varchar(255) COLLATE "pg_catalog"."default",
  "peng_bendahara" varchar(255) COLLATE "pg_catalog"."default",
  "peng_pengawas_koor" varchar(255) COLLATE "pg_catalog"."default",
  "peng_pengawas_anggota1" varchar(255) COLLATE "pg_catalog"."default",
  "peng_pengawas_anggota2" varchar(255) COLLATE "pg_catalog"."default",
  "peng_usaha_dikelola_1" varchar(255) COLLATE "pg_catalog"."default",
  "peng_usaha_dikelola_2" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_jenis" int4,
  "peng_usaha_shu" float8,
  "peng_permodalan_kewajiban" float8,
  "peng_permodalan_modal_kerja" float8,
  "peng_permodalan_pinjaman_bank" float8,
  "peng_manf_meningkatkan_penjualan" float8,
  "peng_manf_menambah_modal" float8,
  "peng_manf_peningkatan_omset" float8,
  "peng_manf_peningkatan_shu" float8,
  "peng_manf_peningkatan_asset" float8,
  "peng_verif_is" bool,
  "peng_verif_by" int4,
  "peng_verif_at" timestamp(6),
  "peng_verif_reject_is" bool,
  "peng_verif_reject_by" int4,
  "peng_verif_reject_at" timestamp(6),
  "peng_verif_reject_note" text COLLATE "pg_catalog"."default",
  "peng_surv_is" bool,
  "peng_surv_id" int4,
  "peng_disetujui_nominal" float8,
  "peng_disetujui_tanggal_jatuh_tempo" date,
  "peng_disetujui_tanggal_penetapan" date,
  "peng_disetujui_jangka_waktu_bln" int4,
  "peng_disetujui_jangka_waktu_text" text COLLATE "pg_catalog"."default",
  "peng_disetujui_cicilan" float8,
  "peng_disetujui_created_at" timestamp(0),
  "peng_disetujui_created_by" int4,
  "peng_uji_kel_no_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "peng_uji_kel_pekerjaan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_disetujui_no_penetapan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_disetujui_bank" int4,
  "peng_disetujui_kunci_is" bool DEFAULT false,
  "peng_disetujui_kunci_at" timestamp(6),
  "peng_disetujui_kunci_by" int4,
  "peng_cetak_pengajuan_ttd" varchar(255) COLLATE "pg_catalog"."default",
  "peng_disetujui_cetak_sppk" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_emas_karat" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_emas_gram" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_jenis_emas" int4,
  "peng_kepala_dinas_ttd" int4,
  "peng_jam_no_bpkb" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_su_tanggal" date,
  "peng_jam_nomor_surat_ukur" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_luas_tanah" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_harga_perkiraan" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_harga_perkiraan_total" varchar(255) COLLATE "pg_catalog"."default",
  "peng_jam_type_bpkb" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of pengajuan
-- ----------------------------
INSERT INTO "public"."pengajuan" VALUES (24, '2020-12-09', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 10000000, 'Koperasi Makmur', 'Kediri', NULL, NULL, 10, NULL, NULL, NULL, 10000000, NULL, NULL, 100000000, 100000000, NULL, 1000000000, 10000000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '35069868587', 'Swasta', 2020, 'pol123', 'mes123', 'rang123', 'Almi Kurniawan', NULL, NULL, NULL, NULL, NULL, 1, NULL, '-7.793486510327649', '112.11034304625542', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10000000, 100000, 1000000, 36, 4, 100000000, 100000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kediri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nomor321', '2020-12-10', 'Ujicoba', 10, 'Ujicoba', 'Ujicoba', 'Ujicoba', 'Ujicoba', 'Ujicoba', 'Ujicoba', 'Ujicoba', 'Ujicoba', 'Ujicoba', 1, 10000000, 10000000, 10000000000, 1000000000, NULL, NULL, NULL, NULL, NULL, 't', 1, '2020-12-09 19:50:16', NULL, NULL, NULL, NULL, 't', 32, 25000000, '2020-12-10', '2020-12-10', 36, 'Dua Belas Bulan', 100000, '2020-12-15 14:50:23', 1, NULL, NULL, 'nomor321', 1, 'f', '2020-12-12 14:03:23.983224', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."pengajuan" VALUES (23, '2020-12-09', 1, 2, 'Modal', '1607563827_181bca03c25400ba69b6.jpg.jpg', '1607563827_181bca03c25400ba69b6.jpg.jpg', NULL, NULL, NULL, NULL, 32, 100000000, 'Mie Ayam Makmur', 'Kediri', 'almi kurniawan', 'nomor123', 10, 2020, 1, 'Mie', 10000000, 'Kediri', 'Online', 1000000, 1000000, 10000000, 100000000, 10000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '350612323423', 'Swasta', 2020, '23758', 'mes123', 'rang123', 'almi kurniawan', 'kediri', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mohammad Almi Kurniawan', 'Swasta', 'Mie Ayam Makmur', 1, 'Kediri', 100000000, 100000, 100000, 1, 2, 10000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 1, '2020-12-09 19:44:02', NULL, NULL, NULL, NULL, 't', 31, 100000000, '2020-12-10', '2020-12-10', 36, '10 Bulan', 10000000, '2020-12-28 14:45:00', 1, NULL, NULL, 'nomor123', 2, 'f', '2020-12-28 14:33:17.432321', 1, NULL, '1608088577_da65a0d22b6efb08e215.png.png', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."pengajuan" VALUES (27, '2020-12-09', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 10000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-7.802670501982031', '112.04733412069507', 'dfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kediri', '1609734632_316f5daab7eeea63716c.pdf.pdf', '1609734632_72f4b9bea852f4ec6ce4.pdf.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."pengajuan" VALUES (25, '2020-12-12', 4, 1, NULL, '1608109555_a4a8614a376bb2920c48.png.png', NULL, NULL, NULL, NULL, NULL, 32, 500000, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2324534', 'swasta', NULL, NULL, NULL, NULL, NULL, NULL, '34ewr', 'kediri', 'almi', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 500000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3506123462834', 'Swasta', NULL, NULL, 'f', NULL, NULL, '1608007919_fc9bd600ed8aeac3568a.png.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pengajuan_foto
-- ----------------------------
DROP TABLE IF EXISTS "public"."pengajuan_foto";
CREATE TABLE "public"."pengajuan_foto" (
  "peng_foto_id" int4 NOT NULL DEFAULT nextval('pengajuan_foto_peng_foto_id_seq'::regclass),
  "peng_foto_peng_id" int4,
  "peng_foto_file" varchar COLLATE "pg_catalog"."default",
  "peng_foto_created_at" timestamp(6),
  "peng_foto_created_by" int4,
  "peng_foto_jenis" int2 DEFAULT 1
)
;

-- ----------------------------
-- Records of pengajuan_foto
-- ----------------------------
INSERT INTO "public"."pengajuan_foto" VALUES (17, 23, '1607564220_718ebe6e391a113ffce4.jpg', '2020-12-09 19:37:00', 1, 1);
INSERT INTO "public"."pengajuan_foto" VALUES (19, 24, '1607564914_81635da19ee6b874b3e1.jpg', '2020-12-09 19:48:34', 1, 2);

-- ----------------------------
-- Table structure for pengajuan_jaminan
-- ----------------------------
DROP TABLE IF EXISTS "public"."pengajuan_jaminan";
CREATE TABLE "public"."pengajuan_jaminan" (
  "jam_id" int4 NOT NULL DEFAULT nextval('pengajuan_jaminan_jam_id_seq'::regclass),
  "jam_peng_id" int4,
  "jam_jenis" int2,
  "jam_pemegang_ktp_no" varchar(255) COLLATE "pg_catalog"."default",
  "jam_pekerjaan" varchar(255) COLLATE "pg_catalog"."default",
  "jam_tahun_pembuatan" int4,
  "jam_nopol" varchar(255) COLLATE "pg_catalog"."default",
  "jam_mesin" varchar(255) COLLATE "pg_catalog"."default",
  "jam_rangka" varchar(255) COLLATE "pg_catalog"."default",
  "jam_atas_nama" varchar(255) COLLATE "pg_catalog"."default",
  "jam_alamat" varchar(255) COLLATE "pg_catalog"."default",
  "jam_no_akta" varchar(255) COLLATE "pg_catalog"."default",
  "jam_tempat" varchar(255) COLLATE "pg_catalog"."default",
  "jam_atas_nama_tanah" varchar(255) COLLATE "pg_catalog"."default",
  "jam_alamat_tanah" varchar(255) COLLATE "pg_catalog"."default",
  "jam_jenis_kepemilikan" int2,
  "jam_emas_karat" varchar(255) COLLATE "pg_catalog"."default",
  "jam_emas_gram" varchar(255) COLLATE "pg_catalog"."default",
  "jam_no_bpkb" varchar(255) COLLATE "pg_catalog"."default",
  "jam_su_tanggal" date,
  "jam_nomor_surat_ukur" varchar(255) COLLATE "pg_catalog"."default",
  "jam_luas_tanah" varchar(255) COLLATE "pg_catalog"."default",
  "jam_harga_perkiraan" varchar(255) COLLATE "pg_catalog"."default",
  "jam_harga_perkiraan_total" varchar(255) COLLATE "pg_catalog"."default",
  "jam_type_bpkb" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of pengajuan_jaminan
-- ----------------------------
INSERT INTO "public"."pengajuan_jaminan" VALUES (3, 27, 1, '350682345723541', 'Swasta', 2020, ' afd au', ' asdfa', 'adfau', 'asfaufAFGALISF', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auydauos');

-- ----------------------------
-- Table structure for ref_approval
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_approval";
CREATE TABLE "public"."ref_approval" (
  "ref_approval_id" int2 NOT NULL DEFAULT nextval('ref_approval_ref_approval_id_seq'::regclass),
  "ref_approval_label" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ref_approval
-- ----------------------------

-- ----------------------------
-- Table structure for ref_bank
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_bank";
CREATE TABLE "public"."ref_bank" (
  "ref_bank_id" int4 NOT NULL DEFAULT nextval('ref_bank_ref_bank_id_seq'::regclass),
  "ref_bank_label" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ref_bank
-- ----------------------------
INSERT INTO "public"."ref_bank" VALUES (1, 'BRI');
INSERT INTO "public"."ref_bank" VALUES (2, 'BANK JATIM');
INSERT INTO "public"."ref_bank" VALUES (3, 'MANDIRI');

-- ----------------------------
-- Table structure for ref_bidang_usaha
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_bidang_usaha";
CREATE TABLE "public"."ref_bidang_usaha" (
  "ref_bidang_id" int4 NOT NULL DEFAULT nextval('ref_bidang_usaha_ref_bidang_id_seq'::regclass),
  "ref_bidang_label" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ref_bidang_usaha
-- ----------------------------
INSERT INTO "public"."ref_bidang_usaha" VALUES (1, 'Kuliner');
INSERT INTO "public"."ref_bidang_usaha" VALUES (4, 'Jasa');
INSERT INTO "public"."ref_bidang_usaha" VALUES (3, 'Pertanian');
INSERT INTO "public"."ref_bidang_usaha" VALUES (5, 'Kuliner');
INSERT INTO "public"."ref_bidang_usaha" VALUES (6, 'Peracangan');
INSERT INTO "public"."ref_bidang_usaha" VALUES (8, 'Hiburan');

-- ----------------------------
-- Table structure for ref_group_akses
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_group_akses";
CREATE TABLE "public"."ref_group_akses" (
  "ref_group_akses_id" int4 NOT NULL DEFAULT nextval('ref_group_akses_ref_group_akses_id_seq'::regclass),
  "ref_group_akses_label" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ref_group_akses
-- ----------------------------
INSERT INTO "public"."ref_group_akses" VALUES (5, 'Pengaju');
INSERT INTO "public"."ref_group_akses" VALUES (6, 'Verifikator');
INSERT INTO "public"."ref_group_akses" VALUES (7, 'Surveyor');
INSERT INTO "public"."ref_group_akses" VALUES (8, 'Appoval Survey');
INSERT INTO "public"."ref_group_akses" VALUES (9, 'Persetujuan');
INSERT INTO "public"."ref_group_akses" VALUES (10, 'Pembayaran');
INSERT INTO "public"."ref_group_akses" VALUES (12, 'Super User');
INSERT INTO "public"."ref_group_akses" VALUES (13, 'Rekap');

-- ----------------------------
-- Table structure for ref_jaminan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jaminan";
CREATE TABLE "public"."ref_jaminan" (
  "ref_jaminan_id" int4 NOT NULL DEFAULT nextval('ref_jaminan_ref_jaminan_id_seq'::regclass),
  "ref_jaminan_label" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ref_jaminan
-- ----------------------------
INSERT INTO "public"."ref_jaminan" VALUES (3, 'Emas');
INSERT INTO "public"."ref_jaminan" VALUES (2, 'Sertifikat');
INSERT INTO "public"."ref_jaminan" VALUES (1, 'BPKB');

-- ----------------------------
-- Table structure for ref_jenis_jaminan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jenis_jaminan";
CREATE TABLE "public"."ref_jenis_jaminan" (
  "jns_jam_id" int4 NOT NULL DEFAULT nextval('jenis_jaminan_jns_jam_id_seq'::regclass),
  "jns_jam_label" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ref_jenis_jaminan
-- ----------------------------
INSERT INTO "public"."ref_jenis_jaminan" VALUES (1, 'Pribadi');
INSERT INTO "public"."ref_jenis_jaminan" VALUES (2, 'Orang Lain');

-- ----------------------------
-- Table structure for ref_jenis_pengajuan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jenis_pengajuan";
CREATE TABLE "public"."ref_jenis_pengajuan" (
  "jns_pengajuan_id" int4 NOT NULL DEFAULT nextval('ref_jenis_pengajuan_jns_pengajuan_id_seq'::regclass),
  "jns_pengajuan_label" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ref_jenis_pengajuan
-- ----------------------------
INSERT INTO "public"."ref_jenis_pengajuan" VALUES (1, 'Dibawah 10jt');
INSERT INTO "public"."ref_jenis_pengajuan" VALUES (2, 'Diatas 10jt');
INSERT INTO "public"."ref_jenis_pengajuan" VALUES (3, 'Dana Bergulir');

-- ----------------------------
-- Table structure for ref_kecamatan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kecamatan";
CREATE TABLE "public"."ref_kecamatan" (
  "ref_kec_id" int4 NOT NULL DEFAULT nextval('ref_kecamatan_ref_kec_id_seq'::regclass),
  "ref_kec_label" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ref_kecamatan
-- ----------------------------
INSERT INTO "public"."ref_kecamatan" VALUES (3, 'PESANTREN');
INSERT INTO "public"."ref_kecamatan" VALUES (2, 'MOJOROTO');
INSERT INTO "public"."ref_kecamatan" VALUES (1, 'KOTA');

-- ----------------------------
-- Table structure for ref_kelurahan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kelurahan";
CREATE TABLE "public"."ref_kelurahan" (
  "ref_kel_id" int4 NOT NULL DEFAULT nextval('ref_kelurahan_ref_kel_id_seq'::regclass),
  "ref_kel_label" varchar COLLATE "pg_catalog"."default",
  "ref_kel_kec_id" int4
)
;

-- ----------------------------
-- Records of ref_kelurahan
-- ----------------------------
INSERT INTO "public"."ref_kelurahan" VALUES (2, ' Semampir', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (3, ' Dandangan', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (4, ' Ngadirejo', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (5, ' Pakelan', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (6, ' Pocanan', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (7, ' Banjaran', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (8, ' Jagalan', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (9, ' Kemasan', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (10, ' Kaliombo', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (11, ' Kampung Dalem', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (12, ' Ngronggo', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (13, ' Manisrenggo', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (14, ' Balowerti', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (15, ' Rejomulyo', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (16, ' Ringin Anom', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (17, ' Setono Gedong', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (18, ' Setono Pande', 1);
INSERT INTO "public"."ref_kelurahan" VALUES (19, 'Lirboyo', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (20, ' Campurejo', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (21, ' Bandar Lor', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (22, ' Dermo', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (23, ' Mrican', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (24, ' Mojoroto', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (25, ' Ngampel', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (26, ' Gayam', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (27, ' Sukorame', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (28, ' Pojok', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (29, ' Tamanan', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (30, ' Bandar Kidul', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (31, ' Banjarmelati', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (32, ' Bujel', 2);
INSERT INTO "public"."ref_kelurahan" VALUES (33, 'Jamsaren', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (34, ' Bangsal', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (35, ' Burengan', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (36, ' Pesantren', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (37, ' Pakunden', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (38, ' Singonegaran', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (39, ' Tinalan', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (40, ' Banaran', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (41, ' Tosaren', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (42, ' Betet', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (43, ' Blabak', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (44, ' Bawang', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (45, ' Ngletih', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (46, ' Tempurejo', 3);
INSERT INTO "public"."ref_kelurahan" VALUES (47, ' Ketami', 3);

-- ----------------------------
-- Table structure for ref_modul_akses
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_modul_akses";
CREATE TABLE "public"."ref_modul_akses" (
  "ref_modul_akses_id" int4 NOT NULL DEFAULT nextval('ref_modul_akses_ref_modul_akses_id_seq'::regclass),
  "ref_modul_akses_label" varchar(255) COLLATE "pg_catalog"."default",
  "ref_modul_akses_group_id" int4
)
;

-- ----------------------------
-- Records of ref_modul_akses
-- ----------------------------
INSERT INTO "public"."ref_modul_akses" VALUES (20, 'admin/verifikasi', 6);
INSERT INTO "public"."ref_modul_akses" VALUES (21, 'admin/survey', 7);
INSERT INTO "public"."ref_modul_akses" VALUES (22, 'admin/addSurvey', 8);
INSERT INTO "public"."ref_modul_akses" VALUES (24, 'admin/pembayaran', 10);
INSERT INTO "public"."ref_modul_akses" VALUES (23, 'admin/persetujuan', 9);
INSERT INTO "public"."ref_modul_akses" VALUES (26, 'admin/verifikasi', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (27, 'admin/survey', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (28, 'admin/accSurvey', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (29, 'admin/persetujuan', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (30, 'admin/pembayaran', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (31, '#data_master', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (32, 'admin/bidangUsaha', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (33, 'admin/refBank', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (34, 'admin/member', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (35, 'admin/karyawan', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (36, '#hak_akses', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (37, 'admin/aksesGroup', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (38, 'admin/aksesModul', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (39, 'admin/aksesUser', 12);
INSERT INTO "public"."ref_modul_akses" VALUES (40, 'admin/rekap', 13);
INSERT INTO "public"."ref_modul_akses" VALUES (41, 'admin/rekap', 12);

-- ----------------------------
-- Table structure for ref_user_akses
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_user_akses";
CREATE TABLE "public"."ref_user_akses" (
  "ref_user_akses_id" int4 NOT NULL DEFAULT nextval('ref_user_akses_ref_user_akses_id_seq'::regclass),
  "ref_user_akses_user_id" int4,
  "ref_user_akses_group_id" int4
)
;

-- ----------------------------
-- Records of ref_user_akses
-- ----------------------------
INSERT INTO "public"."ref_user_akses" VALUES (33, 1, 12);

-- ----------------------------
-- Table structure for survey
-- ----------------------------
DROP TABLE IF EXISTS "public"."survey";
CREATE TABLE "public"."survey" (
  "survey_id" int4 NOT NULL DEFAULT nextval('survey_survey_id_seq'::regclass),
  "survey_nomor" int4,
  "survey_nomor_lengkap" varchar(255) COLLATE "pg_catalog"."default",
  "survey_dasar" varchar(255) COLLATE "pg_catalog"."default",
  "survey_untuk" varchar(255) COLLATE "pg_catalog"."default",
  "survey_keterangan" text COLLATE "pg_catalog"."default",
  "survey_tanggal" date,
  "survey_ttd_kar_id" int4,
  "survey_created_by" int4,
  "survey_created_at" timestamp(6),
  "survey_surat_tugas_ttd" varchar(255) COLLATE "pg_catalog"."default",
  "survey_cetak_ttd" varchar(255) COLLATE "pg_catalog"."default",
  "survey_kepala_dinas_ttd" int4,
  "survey_ketua_teknis_ttd" int4
)
;

-- ----------------------------
-- Records of survey
-- ----------------------------
INSERT INTO "public"."survey" VALUES (31, NULL, 'nomor123', 'Ujicoba', 'Ujicoba', 'Ujicoba', '2020-12-10', NULL, 1, '2020-12-09 19:44:21', NULL, NULL, NULL, NULL);
INSERT INTO "public"."survey" VALUES (32, NULL, 'nomor321', 'ujicoba', 'ujicoba', 'ujicoba', '2020-12-10', NULL, 1, '2020-12-09 19:50:23', '1608019453_f9163bfca6fe1585acde.png.png', '1608019453_6e9b9aceacfe742521c1.png.png', 1, 2);

-- ----------------------------
-- Table structure for survey_detail
-- ----------------------------
DROP TABLE IF EXISTS "public"."survey_detail";
CREATE TABLE "public"."survey_detail" (
  "survey_det_id" int4 NOT NULL DEFAULT nextval('survey_detail_survey_det_id_seq'::regclass),
  "survey_det_kar_id" int4,
  "survey_det_created_at" timestamp(6),
  "survey_det_created_by" int4,
  "survey_det_head_id" int4
)
;

-- ----------------------------
-- Records of survey_detail
-- ----------------------------
INSERT INTO "public"."survey_detail" VALUES (18, 2, NULL, NULL, 31);
INSERT INTO "public"."survey_detail" VALUES (19, 1, NULL, NULL, 31);
INSERT INTO "public"."survey_detail" VALUES (20, 2, NULL, NULL, 32);
INSERT INTO "public"."survey_detail" VALUES (21, 1, NULL, NULL, 32);

-- ----------------------------
-- Table structure for survey_hasil
-- ----------------------------
DROP TABLE IF EXISTS "public"."survey_hasil";
CREATE TABLE "public"."survey_hasil" (
  "survey_hasil_id" int4 NOT NULL DEFAULT nextval('survey_hasil_survey_hasil_id_seq'::regclass),
  "survey_hasil_survey_id" int4,
  "survey_hasil_peng_id" int4,
  "survey_hasil_1_perijinan" varchar(255) COLLATE "pg_catalog"."default",
  "survey_hasil_1_nilai_kes_usp" varchar(255) COLLATE "pg_catalog"."default",
  "survey_hasil_1_rat" varchar(255) COLLATE "pg_catalog"."default",
  "survey_hasil_1_jml_angg_produktif" int4,
  "survey_hasil_1_jml_angg" int4,
  "survey_hasil_2_modal_sendiri" int8,
  "survey_hasil_2_modal_luar" int8,
  "survey_hasil_3_usaha" varchar(255) COLLATE "pg_catalog"."default",
  "survey_hasil_3_omset_per_tahun" int8,
  "survey_hasil_3_pendptn_per_tahun" int8,
  "survey_hasil_3_beban_operasional" int8,
  "survey_hasil_3_shu" int8,
  "survey_hasil_4_kas_per_bulan" int8,
  "survey_hasil_4_pengeluaran" int8,
  "survey_hasil_4_saldo" int8,
  "survey_hasil_5_jaminan" varchar(255) COLLATE "pg_catalog"."default",
  "survey_hasil_5_taksiran_harga" int8,
  "survey_hasil_5_status_jaminan" varchar(255) COLLATE "pg_catalog"."default",
  "survey_hasil_6_kelangsungan_hidup" varchar(255) COLLATE "pg_catalog"."default",
  "survey_hasil_permasalahan" varchar(255) COLLATE "pg_catalog"."default",
  "survey_hasil_created_at" timestamp(6),
  "survey_hasil_created_by" int4,
  "survey_hasil_1_status" varchar(255) COLLATE "pg_catalog"."default",
  "survey_hasil_lock_is" bool DEFAULT false,
  "survey_hasil_lock_at" timestamp(6),
  "survey_hasil_lock_by" int4,
  "survey_hasil_approve_is" bool,
  "survey_hasil_approve_at" timestamp(6),
  "survey_hasil_approve_by" int4,
  "survey_hasil_reject_is" bool,
  "survey_hasil_reject_at" timestamp(6),
  "survey_hasil_reject_by" int4,
  "survey_hasil_file" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of survey_hasil
-- ----------------------------
INSERT INTO "public"."survey_hasil" VALUES (11, 31, 23, 'Legal', 'Ujicoba', 'Ujicoba', 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-10 08:45:21.564029', NULL, 'Ujicoba', 't', '2020-12-10 08:45:26.595193', 1, 't', '2020-12-15 15:00:07.198602', 1, 'f', '2020-12-12 10:28:11.015998', 1, NULL);
INSERT INTO "public"."survey_hasil" VALUES (12, 32, 24, 'Legal', 'ujicoba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-08 11:10:13.490722', NULL, NULL, 'f', '2020-12-15 14:41:23.219944', 1, 't', '2020-12-12 11:07:29.897836', 1, 'f', '2020-12-12 10:29:11.429378', 1, '1608018347_0ced3ef79cd506caee4f.pdf.pdf');

-- ----------------------------
-- Table structure for survey_tempat
-- ----------------------------
DROP TABLE IF EXISTS "public"."survey_tempat";
CREATE TABLE "public"."survey_tempat" (
  "survey_tem_id" int4 NOT NULL DEFAULT nextval('survey_tempat_survey_tem_id_seq'::regclass),
  "survey_tem_head_id" int4,
  "survey_tem_peng_id" int4
)
;

-- ----------------------------
-- Records of survey_tempat
-- ----------------------------
INSERT INTO "public"."survey_tempat" VALUES (19, 31, 23);
INSERT INTO "public"."survey_tempat" VALUES (20, 32, 24);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "public"."user";
CREATE TABLE "public"."user" (
  "user_id" int4 NOT NULL DEFAULT nextval('user_user_id_seq'::regclass),
  "user_name" varchar COLLATE "pg_catalog"."default",
  "user_password" varchar(255) COLLATE "pg_catalog"."default",
  "user_kar_id" int4,
  "user_disable" bool,
  "user_created_at" timestamp(6),
  "user_namalengkap" varchar(255) COLLATE "pg_catalog"."default",
  "user_member_id" int4
)
;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO "public"."user" VALUES (15, 'yus', '36c3eaa0e1e290f41e2810bae8d9502c785e92d9', 0, NULL, '2020-10-23 15:39:55.106223', 'yusuf', 18);
INSERT INTO "public"."user" VALUES (19, 'almikurniawan', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', NULL, NULL, '2020-11-06 15:08:25.874301', 'mohammad almi kurniawan', 32);
INSERT INTO "public"."user" VALUES (20, 'patria', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1, NULL, '2020-11-20 09:45:15.074359', 'PATRIA HADI WIJAYA,SH', NULL);
INSERT INTO "public"."user" VALUES (21, 'husna', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 2, NULL, '2020-11-20 09:47:41.181877', 'HUSNAWATI,S.Sos', NULL);
INSERT INTO "public"."user" VALUES (6, 'yus', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0, NULL, NULL, 'yusuf', 17);
INSERT INTO "public"."user" VALUES (3, 'wina', '2fee5e53252cce3b7146551b6459fc99c3e28041', 0, NULL, NULL, 'wina', NULL);
INSERT INTO "public"."user" VALUES (2, 'surveyor', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0, 'f', '2020-09-16 10:34:30.089515', 'Almi', NULL);
INSERT INTO "public"."user" VALUES (22, 'ari', '7158a9e0f8e84a0a74ed148e0f652dfbd4913a18', NULL, NULL, '2020-12-08 14:32:26.902357', 'ari', 34);
INSERT INTO "public"."user" VALUES (23, 'almikur', 'a9e0378601ec4a08f949292d349f0c9abe8f82e8', NULL, NULL, '2020-12-09 08:27:34.243121', 'almi kurniawan', 35);
INSERT INTO "public"."user" VALUES (24, 'ucup', '36c3eaa0e1e290f41e2810bae8d9502c785e92d9', NULL, NULL, '2020-12-09 09:00:04.940915', 'almi kurniawan', 36);
INSERT INTO "public"."user" VALUES (25, 'anis', '36c3eaa0e1e290f41e2810bae8d9502c785e92d9', NULL, NULL, '2020-12-10 08:18:38.105918', 'Anis Fahmi', 37);
INSERT INTO "public"."user" VALUES (1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0, 'f', '2020-09-16 10:34:30.089515', 'Yusuf', NULL);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."jenis_jaminan_jns_jam_id_seq"
OWNED BY "public"."ref_jenis_jaminan"."jns_jam_id";
SELECT setval('"public"."jenis_jaminan_jns_jam_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."karyawan_kar_id_seq"
OWNED BY "public"."karyawan"."kar_id";
SELECT setval('"public"."karyawan_kar_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."member_member_id_seq"
OWNED BY "public"."member"."member_id";
SELECT setval('"public"."member_member_id_seq"', 38, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pembayaran_pembayaran_id_seq"
OWNED BY "public"."pembayaran"."pembayaran_id";
SELECT setval('"public"."pembayaran_pembayaran_id_seq"', 1721, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pengajuan_foto_peng_foto_id_seq"
OWNED BY "public"."pengajuan_foto"."peng_foto_id";
SELECT setval('"public"."pengajuan_foto_peng_foto_id_seq"', 20, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pengajuan_jaminan_jam_id_seq"
OWNED BY "public"."pengajuan_jaminan"."jam_id";
SELECT setval('"public"."pengajuan_jaminan_jam_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pengajuan_peng_id_seq"
OWNED BY "public"."pengajuan"."peng_id";
SELECT setval('"public"."pengajuan_peng_id_seq"', 28, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_approval_ref_approval_id_seq"
OWNED BY "public"."ref_approval"."ref_approval_id";
SELECT setval('"public"."ref_approval_ref_approval_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_bank_ref_bank_id_seq"
OWNED BY "public"."ref_bank"."ref_bank_id";
SELECT setval('"public"."ref_bank_ref_bank_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_bidang_usaha_ref_bidang_id_seq"
OWNED BY "public"."ref_bidang_usaha"."ref_bidang_id";
SELECT setval('"public"."ref_bidang_usaha_ref_bidang_id_seq"', 9, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_group_akses_ref_group_akses_id_seq"
OWNED BY "public"."ref_group_akses"."ref_group_akses_id";
SELECT setval('"public"."ref_group_akses_ref_group_akses_id_seq"', 14, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_jaminan_ref_jaminan_id_seq"
OWNED BY "public"."ref_jaminan"."ref_jaminan_id";
SELECT setval('"public"."ref_jaminan_ref_jaminan_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_jenis_pengajuan_jns_pengajuan_id_seq"
OWNED BY "public"."ref_jenis_pengajuan"."jns_pengajuan_id";
SELECT setval('"public"."ref_jenis_pengajuan_jns_pengajuan_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_kecamatan_ref_kec_id_seq"
OWNED BY "public"."ref_kecamatan"."ref_kec_id";
SELECT setval('"public"."ref_kecamatan_ref_kec_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_kelurahan_ref_kel_id_seq"
OWNED BY "public"."ref_kelurahan"."ref_kel_id";
SELECT setval('"public"."ref_kelurahan_ref_kel_id_seq"', 48, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_modul_akses_ref_modul_akses_id_seq"
OWNED BY "public"."ref_modul_akses"."ref_modul_akses_id";
SELECT setval('"public"."ref_modul_akses_ref_modul_akses_id_seq"', 42, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_user_akses_ref_user_akses_id_seq"
OWNED BY "public"."ref_user_akses"."ref_user_akses_id";
SELECT setval('"public"."ref_user_akses_ref_user_akses_id_seq"', 34, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."survey_detail_survey_det_id_seq"
OWNED BY "public"."survey_detail"."survey_det_id";
SELECT setval('"public"."survey_detail_survey_det_id_seq"', 22, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."survey_hasil_survey_hasil_id_seq"
OWNED BY "public"."survey_hasil"."survey_hasil_id";
SELECT setval('"public"."survey_hasil_survey_hasil_id_seq"', 13, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."survey_survey_id_seq"
OWNED BY "public"."survey"."survey_id";
SELECT setval('"public"."survey_survey_id_seq"', 33, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."survey_tempat_survey_tem_id_seq"
OWNED BY "public"."survey_tempat"."survey_tem_id";
SELECT setval('"public"."survey_tempat_survey_tem_id_seq"', 21, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_user_id_seq"
OWNED BY "public"."user"."user_id";
SELECT setval('"public"."user_user_id_seq"', 26, true);

-- ----------------------------
-- Primary Key structure for table karyawan
-- ----------------------------
ALTER TABLE "public"."karyawan" ADD CONSTRAINT "karyawan_pkey" PRIMARY KEY ("kar_id");

-- ----------------------------
-- Primary Key structure for table member
-- ----------------------------
ALTER TABLE "public"."member" ADD CONSTRAINT "member_pkey" PRIMARY KEY ("member_id");

-- ----------------------------
-- Primary Key structure for table pembayaran
-- ----------------------------
ALTER TABLE "public"."pembayaran" ADD CONSTRAINT "pembayaran_pkey" PRIMARY KEY ("pembayaran_id");

-- ----------------------------
-- Primary Key structure for table pengajuan
-- ----------------------------
ALTER TABLE "public"."pengajuan" ADD CONSTRAINT "pengajuan_pkey" PRIMARY KEY ("peng_id");

-- ----------------------------
-- Primary Key structure for table pengajuan_foto
-- ----------------------------
ALTER TABLE "public"."pengajuan_foto" ADD CONSTRAINT "pengajuan_foto_pkey" PRIMARY KEY ("peng_foto_id");

-- ----------------------------
-- Primary Key structure for table pengajuan_jaminan
-- ----------------------------
ALTER TABLE "public"."pengajuan_jaminan" ADD CONSTRAINT "pengajuan_jaminan_pkey" PRIMARY KEY ("jam_id");

-- ----------------------------
-- Primary Key structure for table ref_bank
-- ----------------------------
ALTER TABLE "public"."ref_bank" ADD CONSTRAINT "ref_bank_pkey" PRIMARY KEY ("ref_bank_id");

-- ----------------------------
-- Primary Key structure for table ref_bidang_usaha
-- ----------------------------
ALTER TABLE "public"."ref_bidang_usaha" ADD CONSTRAINT "ref_bidang_usaha_pkey" PRIMARY KEY ("ref_bidang_id");

-- ----------------------------
-- Primary Key structure for table ref_group_akses
-- ----------------------------
ALTER TABLE "public"."ref_group_akses" ADD CONSTRAINT "ref_group_akses_pkey" PRIMARY KEY ("ref_group_akses_id");

-- ----------------------------
-- Primary Key structure for table ref_jenis_jaminan
-- ----------------------------
ALTER TABLE "public"."ref_jenis_jaminan" ADD CONSTRAINT "jenis_jaminan_pkey" PRIMARY KEY ("jns_jam_id");

-- ----------------------------
-- Primary Key structure for table ref_jenis_pengajuan
-- ----------------------------
ALTER TABLE "public"."ref_jenis_pengajuan" ADD CONSTRAINT "ref_jenis_pengajuan_pkey" PRIMARY KEY ("jns_pengajuan_id");

-- ----------------------------
-- Primary Key structure for table ref_kecamatan
-- ----------------------------
ALTER TABLE "public"."ref_kecamatan" ADD CONSTRAINT "ref_kecamatan_pkey" PRIMARY KEY ("ref_kec_id");

-- ----------------------------
-- Primary Key structure for table ref_kelurahan
-- ----------------------------
ALTER TABLE "public"."ref_kelurahan" ADD CONSTRAINT "ref_kelurahan_pkey" PRIMARY KEY ("ref_kel_id");

-- ----------------------------
-- Primary Key structure for table ref_modul_akses
-- ----------------------------
ALTER TABLE "public"."ref_modul_akses" ADD CONSTRAINT "ref_modul_akses_pkey" PRIMARY KEY ("ref_modul_akses_id");

-- ----------------------------
-- Primary Key structure for table ref_user_akses
-- ----------------------------
ALTER TABLE "public"."ref_user_akses" ADD CONSTRAINT "ref_user_akses_pkey" PRIMARY KEY ("ref_user_akses_id");

-- ----------------------------
-- Primary Key structure for table survey_detail
-- ----------------------------
ALTER TABLE "public"."survey_detail" ADD CONSTRAINT "survey_detail_pkey" PRIMARY KEY ("survey_det_id");

-- ----------------------------
-- Primary Key structure for table survey_hasil
-- ----------------------------
ALTER TABLE "public"."survey_hasil" ADD CONSTRAINT "survey_hasil_pkey" PRIMARY KEY ("survey_hasil_id");

-- ----------------------------
-- Primary Key structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("user_id");
