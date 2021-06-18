<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Libraries\SmartComponent\Grid;
use App\Libraries\SmartComponent\Form;

class RekapPendapatan extends BaseController
{
    public function index()
    {
        $data['grid']   = $this->grid();
        $data['search'] = $this->search();
        $data['title']  = 'Rekap Pendapatan';
        $data['url_delete']  = base_url("");

        return view('global/list', $data);
    }

    public function grid()
    {

        $tanggal_awal = ($this->request->getGet('tanggal_awal')=='' ? date("Y-m-d") : $this->request->getGet('tanggal_awal'));
        $tanggal_akhir = ($this->request->getGet('tanggal_akhir')=='' ? date("Y-m-d") : $this->request->getGet('tanggal_akhir'));

        $grid_columns = array(
            array(
                'field' => 'kur_nama',
                'title' => 'Kurir',
                'locked'=> true,
                'width' => 200
            ),
        );

        $sub_sql = [];

        while (strtotime($tanggal_awal) <= strtotime($tanggal_akhir)) {
            $tanggal_awal = date ("Y-m-d", strtotime("+1 day", strtotime($tanggal_awal)));
            $grid_columns[] = array(
                "field"=> "h_".str_replace("-","_",$tanggal_awal),
                "title"=> date_format(date_create($tanggal_awal),'d F'),
                // "encoded"=> false,
                'width' => 100
            );
            $sub_sql[] = "(select sum(bar_hasil_asal) from barang where bar_kurir_id=kurir.id and bar_tgl='".$tanggal_awal."') + (select sum(bar_hasil_tujuan) from barang where bar_kurir_id_antar=kurir.id and bar_tanggal_terkirim='".$tanggal_awal."') as h_".str_replace("-","_",$tanggal_awal);
        }

        $SQL = "select 
                distinct(kurir.id) as id,
                kur_nama,
                ".implode(", ", $sub_sql)."
                from kurir 
                inner join kurir_map on map_kur_id= kurir.id
                inner join kecamatan on kecamatan.id = map_kec_id
                where kec_id_kota = ".$this->user['admin_kota_id'];

        $grid = new Grid();
        return $grid->set_query($SQL)
            ->set_sort(array('id', 'desc'))            
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/rekapPendapatan/grid?datasource&" . get_query_string()),
                    'grid_columns'  => $grid_columns,
                    'scrollable'    => 'true'
                )
            )
            ->set_toolbar(function($toolbar){
                $toolbar->add('download');
            })
            ->output();
    }

    private function search()
    {
        $form = new Form();
        return $form->set_form_type('search')
            ->set_form_method('GET')
            ->set_submit_label('Cari')
            ->add('tanggal_awal', 'Tanggal Awal', 'date', false, $this->request->getGet('tanggal_awal'), 'style="width:100%;" ')
            ->add('tanggal_akhir', 'Tanggal Akhir', 'date', false, $this->request->getGet('tanggal_akhir'), 'style="width:100%;" ')
            ->output();
    }
}