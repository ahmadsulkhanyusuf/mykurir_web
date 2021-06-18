<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Libraries\SmartComponent\Grid;
use App\Libraries\SmartComponent\Form;

class Tagihan extends BaseController
{
    public function index()
    {
        $data['grid']   = $this->grid();
        $data['search'] = $this->search();
        $data['title']  = 'List Tagihan';
        $data['url_delete']  = base_url("admin/admin/delete");

        return view('admin/tagihan/list', $data);
    }

    public function grid()
    {
        $SQL = "SELECT
                    barang.id as id, bar_kode, bar_penerima,bar_catatan,bar_harga,bar_berat,bar_ongkir,bar_total_bayar,bar_tgl,bar_alamat,
                    kur_nama,cust_nama,cust_alamat,
                    kec_asal.kec_nama as kec_asal_nama,
                    kota_asal.kota_nama as kota_asal_nama,
                    kec_tujuan.kec_nama as kec_tujuan_nama,
                    kota_tujuan.kota_nama as kota_tujuan_nama,
                    coalesce(cust_nama,'')||'<br/>Alamat : '||coalesce(cust_alamat,'')||' '||coalesce(kec_asal.kec_nama,'')||' '||coalesce(kota_asal.kota_nama,'') as alamat_dari,
                    coalesce(bar_penerima,'')||'<br/>Alamat : '||coalesce(bar_alamat,'')||' '||coalesce(kec_tujuan.kec_nama,'')||' '||coalesce(kota_tujuan.kota_nama,'') as alamat_untuk,
                    case when bar_status = 1 then 'Diambil Kurir'
                    when bar_status = 2 then 'Terkirim'
                    when bar_status = 3 then 'Pending'
                    else '-' end as status,
                    '<button class=\"btn btn-sm btn-primary\"><i class=\"k-icon k-i-print\"></i> Cetak</button>' as cetak,
                    (select log_at from log_status where log_id_barang = barang.id and log_id_status = 2) as tanggal_terkirim
                from barang
                left join kurir on bar_kurir_id = kurir.id
                left join customer on bar_cust_id = customer.id
                left join kecamatan kec_asal on cust_kec_id = kec_asal.id
                left join kota kota_asal on kec_asal.kec_id_kota = kota_asal.id
                left join kecamatan as kec_tujuan on bar_kec_tujuan = kec_tujuan.id
                left join kota kota_tujuan on kec_tujuan.kec_id_kota = kota_tujuan.id";

        $tanggal_kemaren = date('Y-m-d', strtotime( date("Y-m-d") . " -1 days"));
        $tanggal = ($this->request->getGet('tanggal')!='' ? $this->request->getGet('tanggal') : $tanggal_kemaren);

        $grid = new Grid();
        return $grid->set_query($SQL, array(
                array('bar_status', 2, '='),
                array("(select to_char(log_at,'YYYY-MM-DD') from log_status where log_id_barang = barang.id and log_id_status = 2)", $tanggal, '='),
            ))
            ->set_sort(array('id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/tagihan/grid?datasource&" . get_query_string()),
                    'grid_columns'  => array(
                        array(
                            'field' => 'bar_kode',
                            'title' => 'kode',
                        ),
                        array(
                            'field' => 'alamat_dari',
                            'title' => 'Dari',
                            'encoded' => false
                        ),
                        array(
                            'field' => 'alamat_untuk',
                            'title' => 'Untuk',
                            'encoded' => false
                        ),
                        array(
                            'field' => 'status',
                            'title' => 'Status',
                        ),
                        array(
                            'field' => 'cetak',
                            'title' => 'Cetak',
                            'encoded' => false
                        ),
                    ),
                )
            )
            ->output();
    }

    private function search()
    {
        $form = new Form();
        return $form->set_form_type('search')
            ->set_form_method('GET')
            ->set_submit_label('Cari')
            ->add('tanggal', 'Tanggal', 'date', false, $this->request->getGet('tanggal'), 'style="width:100%;" ')
            ->output();
    }
}