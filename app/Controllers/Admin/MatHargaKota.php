<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Libraries\SmartComponent\Grid;
use App\Libraries\SmartComponent\Form;

class MatHargaKota extends BaseController
{
    public function index()
    {
        $data['grid']   = $this->grid();
        $data['search'] = $this->search();
        $data['title']  = 'Matrix Harga Pengiriman';
        $data['url_delete']  = base_url("admin/matHargaKota/delete");

        return view('global/list', $data);
    }

    public function grid()
    {
        $SQL = "select 
                    ongkir_kota.*,
                    ongkir_id as id,
                    '<a href=\"".base_url("admin/matHargaKota/add")."/'||asal.id||'\">'||asal.kota_nama||'</a>' as asal,
                    '<a href=\"".base_url("admin/matHargaKota/add")."/'||tujuan.id||'\">'||tujuan.kota_nama||'</a>' as tujuan
                from ongkir_kota
                left join kota asal on asal.id = ongkir_kota_satu
                left join kota tujuan on tujuan.id = ongkir_kota_dua";
        
        $action['edit']     = array(
            'link'          => 'admin/matHargaKota/edit/'
        );

        $grid = new Grid();
        return $grid->set_query($SQL, [
            array('asal.kota_nama', $this->request->getGet('kota_nama_asal')),
            array('tujuan.kota_nama', $this->request->getGet('kota_nama_tujuan')),
        ])
            ->set_sort(array('id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/matHargaKota/grid?datasource&" . get_query_string()),
                    'grid_columns'  => array(
                        array(
                            'field' => 'asal',
                            'title' => 'Asal / Tujuan',
                            'encoded'=> false
                        ),
                        array(
                            'field' => 'tujuan',
                            'title' => 'Asal / Tujuan',
                            'encoded'=> false
                        ),
                        array(
                            'field' => 'ongkir_harga',
                            'title' => 'Harga',
                            'format'=> 'number',
                            'align' => 'right'
                        ),
                    ),
                    'action'    => $action,
                )
            )
            ->set_toolbar(function($toolbar){
                $toolbar
                ->add('add', ['label'=>'Tambah Matrix', 'link'=> base_url("admin/matHargaKota/pilihAsal")]);
            })
            ->output();
    }

    private function search()
    {
        $form = new Form();
        return $form->set_form_type('search')
            ->set_form_method('GET')
            ->set_submit_label('Cari')
            ->add('kota_nama_asal', 'Kota Asal', 'text', false, $this->request->getGet('kota_nama_asal'), 'style="width:100%;" ')
            ->add('kota_nama_tujuan', 'Kota Tujuan', 'text', false, $this->request->getGet('kota_nama_tujuan'), 'style="width:100%;" ')
            ->output();
    }

    public function pilihAsal()
    {
        $data['grid']   = $this->gridAsalKota();
        $data['search'] = $this->search();
        $data['title']  = 'Pilih Kota';
        $data['url_delete']  = base_url("admin");

        return view('global/list', $data);
    }

    public function add($asal)
    {
        $data['title']  = 'Tambah Matrix';
        $data['form']   = $this->form($asal);
        $data['url_back'] = base_url("admin/matHargaKota");

        return view('global/form', $data);
    }

    public function edit($id)
    {
        $data['title']  = 'Edit Ongkir';
        $data['form']   = $this->form_edit($id);
        $data['url_back'] = base_url("admin/matHargaKota");

        return view('global/form', $data);
    }

    public function form_edit($id)
    {
        $ongkir = $this->db->table("ongkir_kota")->where(['ongkir_id'=>$id])->Get()->getRowArray();
        $form = new Form();
        $form->set_attribute_form('class="form-horizontal"')
            ->add('ongkir_harga', "Ongkos Kirim", 'number', true, $ongkir['ongkir_harga'], 'style="width:100%;"');

        if ($form->formVerified()) {
            $data = $form->get_data();
            $this->db->table("ongkir_kota")->where(['id'=> $id])->update($data);
            die(forceRedirect(base_url('/admin/matHargaKota')));
        } else {
            return $form->output();
        }
    }

    public function form($asal)
    {
        $kota = $this->db->query("select * from kota where id!=".$asal)->getResultArray();
        $current_kota = $this->db->query("select * from kota where id=".$asal)->getRowArray();
        
        $form = new Form();
        $form->set_attribute_form('class="form-horizontal"')
        ->set_template('admin/matrix/sf_add', ['kecamatan'=> $current_kota['kota_nama'] ]);

        foreach ($kota as $key => $value) {
            $cek_harga = $this->db->query("select * from ongkir_kota where (ongkir_kota_satu=".$asal." and ongkir_kota_dua=".$value['id'].") or (ongkir_kota_dua=".$asal." and ongkir_kota_satu=".$value['id'].")")->getRowArray();
            if(empty($cek_harga)){
                $cek_harga['ongkir_harga'] = 0;
            }
            $form->add('ongkir_'.$value['id'], $value['kota_nama'], 'number', false, $cek_harga['ongkir_harga'], 'style="width:100%;"');
        }

        if ($form->formVerified()) {
            $data = $form->get_data();
            foreach ($data as $key => $value) {
                $kec_tujuan = explode("_", $key);
                $cek_harga = $this->db->query("select * from ongkir_kota where (ongkir_kota_satu=".$asal." and ongkir_kota_dua=".$kec_tujuan[1].") or (ongkir_kota_dua=".$asal." and ongkir_kota_satu=".$kec_tujuan[1].")")->getRowArray();
                if(empty($cek_harga)){
                    $this->db->table("ongkir_kota")->insert(array(
                        'ongkir_kota_satu'=> $asal,
                        'ongkir_kota_dua'=> $kec_tujuan[1],
                        'ongkir_harga'=> $value
                    ));
                }else{
                    $this->db->table("ongkir_kota")->where(['ongkir_id'=> $cek_harga['ongkir_id']])->update(array(
                        'ongkir_harga'=> $value
                    ));
                }
            }

            die(forceRedirect(base_url('/admin/matHargaKota')));
        } else {
            return $form->output();
        }
    }

    public function gridAsalKota()
    {
        $url = base_url("admin/matHargaKota/add");
        $btn_pilih = "'<a href=\"".$url."/'||kota.id||'\" class=\"btn btn-sm btn-primary btn-raised\">Pilih</a>' as pilih";
        $SQL = "SELECT
                    kota.id,
                    kota_nama,
                    ".$btn_pilih."
                from kota";

        $grid = new Grid();
        return $grid->set_query($SQL, array(
                array('kec_nama', $this->request->getGet('kec_nama')),
            ))
            ->set_sort(array('id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/matHargaKota/gridAsalKota?datasource&" . get_query_string()),
                    'grid_columns'  => array(
                        array(
                            'field' => 'kota_nama',
                            'title' => 'Kota',
                        ),
                        array(
                            'field' => 'pilih',
                            'title' => 'Pilih',
                            'encoded'=> false
                        ),
                    ),
                )
            )
            ->output();
    }
    
}