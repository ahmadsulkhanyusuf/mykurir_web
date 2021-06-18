<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Libraries\SmartComponent\Grid;
use App\Libraries\SmartComponent\Form;

class MatHarga extends BaseController
{
    public function index()
    {
        $data['grid']   = $this->grid();
        $data['search'] = $this->search();
        $data['title']  = 'Matrix Harga Pengiriman';
        $data['url_delete']  = base_url("admin/matHarga/delete");

        return view('global/list', $data);
    }

    public function grid()
    {
        $SQL = "select 
                    ongkir.*,
                    '<a href=\"".base_url("admin/matHarga/add")."/'||asal.id||'\">'||asal.kec_nama||'</a>' as asal,
                    '<a href=\"".base_url("admin/matHarga/add")."/'||tujuan.id||'\">'||tujuan.kec_nama||'</a>' as tujuan
                from ongkir
                left join kecamatan asal on asal.id = ong_kec_satu
                left join kecamatan tujuan on tujuan.id = ong_kec_dua";
        
        $action['edit']     = array(
            'link'          => 'admin/matHarga/edit/'
        );

        $grid = new Grid();
        return $grid->set_query($SQL, [
            array('asal.kec_nama', $this->request->getGet('kec_nama_asal')),
            array('tujuan.kec_nama', $this->request->getGet('kec_nama_tujuan')),
        ])
            ->set_sort(array('id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/matHarga/grid?datasource&" . get_query_string()),
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
                            'field' => 'ong_harga',
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
                ->add('add', ['label'=>'Tambah Matrix', 'link'=> base_url("admin/matHarga/pilihAsal")]);
            })
            ->output();
    }

    private function search()
    {
        $form = new Form();
        return $form->set_form_type('search')
            ->set_form_method('GET')
            ->set_submit_label('Cari')
            ->add('kec_nama_asal', 'Kecamatan Asal', 'text', false, $this->request->getGet('kec_nama_asal'), 'style="width:100%;" ')
            ->add('kec_nama_tujuan', 'Kecamatan Tujuan', 'text', false, $this->request->getGet('kec_nama_tujuan'), 'style="width:100%;" ')
            ->output();
    }

    public function pilihAsal()
    {
        $data['grid']   = $this->gridAsalKecamatan();
        $data['search'] = $this->search();
        $data['title']  = 'Pilih Kecamatan';
        $data['url_delete']  = base_url("admin");

        return view('global/list', $data);
    }

    public function add($asal)
    {
        $data['title']  = 'Tambah Matrix';
        $data['form']   = $this->form($asal);
        $data['url_back'] = base_url("admin/matHarga");

        return view('global/form', $data);
    }

    public function edit($id)
    {
        $data['title']  = 'Edit Ongkir';
        $data['form']   = $this->form_edit($id);
        $data['url_back'] = base_url("admin/matHarga");

        return view('global/form', $data);
    }

    public function form_edit($id)
    {
        $ongkir = $this->db->table("ongkir")->where(['id'=>$id])->Get()->getRowArray();
        $form = new Form();
        $form->set_attribute_form('class="form-horizontal"')
            ->add('ong_harga', "Ongkos Kirim", 'number', true, $ongkir['ong_harga'], 'style="width:100%;"');

        if ($form->formVerified()) {
            $data = $form->get_data();
            $this->db->table("ongkir")->where(['id'=> $id])->update($data);
            die(forceRedirect(base_url('/admin/matHarga')));
        } else {
            return $form->output();
        }
    }

    public function form($asal)
    {
        $kecamatan = $this->db->query("select * from kecamatan where id!=".$asal)->getResultArray();
        $current_kecamatan = $this->db->query("select * from kecamatan where id=".$asal)->getRowArray();
        
        $form = new Form();
        $form->set_attribute_form('class="form-horizontal"')
        ->set_template('admin/matrix/sf_add', ['kecamatan'=> $current_kecamatan['kec_nama'] ]);

        foreach ($kecamatan as $key => $value) {
            $cek_harga = $this->db->query("select * from ongkir where (ong_kec_satu=".$asal." and ong_kec_dua=".$value['id'].") or (ong_kec_dua=".$asal." and ong_kec_satu=".$value['id'].")")->getRowArray();
            if(empty($cek_harga)){
                $cek_harga['ong_harga'] = 0;
            }
            $form->add('ongkir_'.$value['id'], $value['kec_nama'], 'number', false, $cek_harga['ong_harga'], 'style="width:100%;"');
        }

        if ($form->formVerified()) {
            $data = $form->get_data();
            foreach ($data as $key => $value) {
                $kec_tujuan = explode("_", $key);
                $cek_harga = $this->db->query("select * from ongkir where (ong_kec_satu=".$asal." and ong_kec_dua=".$kec_tujuan[1].") or (ong_kec_dua=".$asal." and ong_kec_satu=".$kec_tujuan[1].")")->getRowArray();
                if(empty($cek_harga)){
                    $this->db->table("ongkir")->insert(array(
                        'ong_kec_satu'=> $asal,
                        'ong_kec_dua'=> $kec_tujuan[1],
                        'ong_harga'=> $value
                    ));
                }else{
                    $this->db->table("ongkir")->where(['id'=> $cek_harga['id']])->update(array(
                        'ong_harga'=> $value
                    ));
                }
            }

            die(forceRedirect(base_url('/admin/matHarga')));
        } else {
            return $form->output();
        }
    }

    public function gridAsalKecamatan()
    {
        $url = base_url("admin/matHarga/add");
        $btn_pilih = "'<a href=\"".$url."/'||kecamatan.id||'\" class=\"btn btn-sm btn-primary btn-raised\">Pilih</a>' as pilih";
        $SQL = "SELECT
                    kecamatan.id,
                    kec_nama,
                    kota_nama,
                    ".$btn_pilih."
                from kecamatan
                left join kota on kecamatan.kec_id_kota = kota.id";

        $grid = new Grid();
        return $grid->set_query($SQL, array(
                array('kec_nama', $this->request->getGet('kec_nama')),
            ))
            ->set_sort(array('id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/matHarga/gridAsalKecamatan?datasource&" . get_query_string()),
                    'grid_columns'  => array(
                        array(
                            'field' => 'kec_nama',
                            'title' => 'Kecamatan',
                        ),
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