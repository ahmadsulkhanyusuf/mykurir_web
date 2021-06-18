<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Libraries\SmartComponent\Grid;
use App\Libraries\SmartComponent\Form;

class RefKec extends BaseController
{
    public function index()
    {
        $data['grid']   = $this->grid();
        $data['search'] = $this->search();
        $data['title']  = 'List Kecamatan';
        $data['url_delete']  = base_url("admin/refKec/delete");

        return view('global/list', $data);
    }

    public function grid()
    {
        $SQL = "SELECT
                    kecamatan.id,
                    kec_nama,
                    kota_nama
                from kecamatan
                left join kota on kecamatan.kec_id_kota = kota.id";

        $action['edit']     = array(
            'link'          => 'admin/refKec/edit/'
        );
        $action['delete']     = array(
            'jsf'          => '_delete'
        );

        $grid = new Grid();
        return $grid->set_query($SQL, array(
                array('kec_nama', $this->request->getGet('kec_nama')),
                array('kota_nama', $this->request->getGet('kota_nama'))
            ))
            ->set_sort(array('id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/refKec/grid?datasource&" . get_query_string()),
                    'grid_columns'  => array(
                        array(
                            'field' => 'kec_nama',
                            'title' => 'Kecamatan',
                        ),
                        array(
                            'field' => 'kota_nama',
                            'title' => 'Kota',
                        ),
                    ),
                    'action'    => $action,
                )
            )
            ->set_toolbar(function($toolbar){
                $toolbar
                ->add('add', ['label'=>'Tambah kecamatan', 'url'=> base_url("admin/refKec/add")]);
            })
            ->output();
    }

    private function search()
    {
        $form = new Form();
        return $form->set_form_type('search')
            ->set_form_method('GET')
            ->set_submit_label('Cari')
            ->add('kota_nama', 'Kota', 'text', false, $this->request->getGet('kota_nama'), 'style="width:100%;" ')
            ->add('kec_nama', 'Kecamatan', 'text', false, $this->request->getGet('kec_nama'), 'style="width:100%;" ')
            ->output();
    }

    public function add()
    {
        $data['title']  = 'Tambah Kecamatan';
        $data['form']   = $this->form();
        $data['url_back'] = base_url("admin/refKec");

        return view('global/form', $data);
    }

    public function edit($id)
    {
        $data['title']  = 'Edit Kecamatan';
        $data['form']   = $this->form($id);
        $data['url_back'] = base_url("admin/refKec");

        return view('global/form', $data);
    }

    public function form($id = null)
    {
        if($id!=null){
            $data = $this->db->table("kecamatan")->getWhere(['id'=>$id])->getRowArray();
        }
        $form = new Form();
        $form->set_attribute_form('class="form-horizontal"')
            ->add('kec_nama', 'Kecamatan', 'text', true, (isset($data)) ? $data['kec_nama'] : '', 'style="width:100%;"')
            ->add('kec_id_kota', 'Kota', 'select', false, 1, 'style="width:100%;"', array(
                'table' => 'kota',
                'id' => 'id',
                'label' => 'kota_nama'
            ));
        if ($form->formVerified()) {
            $dataUpdae = $form->get_data();
            if($id!=null){
                $this->db->table("kecamatan")->where(['id'=>$id])->update($dataUpdae);
            }else{
                $this->db->table("kecamatan")->insert($dataUpdae);
            }
            die(forceRedirect(base_url('/admin/refKec')));
        } else {
            return $form->output();
        }
    }

    public function delete()
    {
        $id = $this->request->getPost('id');
        $this->db->table('kecamatan')->delete(['id' => $id]);
        return $this->response->setJSON(
            array(
                'status' => true,
                'message' => 'Success delete data'
            )
        );
    }
    
}