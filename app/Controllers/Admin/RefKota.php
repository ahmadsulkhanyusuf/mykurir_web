<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Libraries\SmartComponent\Grid;
use App\Libraries\SmartComponent\Form;

class RefKota extends BaseController
{
    public function index()
    {
        $data['grid']   = $this->grid();
        $data['search'] = $this->search();
        $data['title']  = 'List Kota';
        $data['url_delete']  = base_url("admin/refKota/delete");

        return view('global/list', $data);
    }

    public function grid()
    {
        $SQL = "SELECT
                    id,
                    kota_nama
                from kota";

        $action['edit']     = array(
            'link'          => 'admin/refKota/edit/'
        );
        $action['delete']     = array(
            'link'          => '_delete'
        );

        $grid = new Grid();
        return $grid->set_query($SQL, array(
                array('kota_nama', $this->request->getGet('kota_nama'))
            ))
            ->set_sort(array('id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/refKota/grid?datasource&" . get_query_string()),
                    'grid_columns'  => array(
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
                ->add('add', ['label'=>'Tambah Kota', 'url'=> base_url("admin/refKota/add")]);
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
            ->output();
    }

    public function add()
    {
        $data['title']  = 'Tambah Kota';
        $data['form']   = $this->form();
        $data['url_back'] = base_url("admin/refKota");

        return view('global/form', $data);
    }

    public function edit($id)
    {
        $data['title']  = 'Edit Kota';
        $data['form']   = $this->form($id);
        $data['url_back'] = base_url("admin/refKota");

        return view('global/form', $data);
    }

    public function form($id = null)
    {
        if($id!=null){
            $data = $this->db->table("kota")->getWhere(['id'=>$id])->getRowArray();
        }
        $form = new Form();
        $form->set_attribute_form('class="form-horizontal"')
            ->add('kota_nama', 'Kota', 'text', true, (isset($data)) ? $data['kota_nama'] : '', 'style="width:100%;"');
        if ($form->formVerified()) {
            $dataUpdae = $form->get_data();
            if($id!=null){
                $this->db->table("kota")->where(['id'=>$id])->update($dataUpdae);
            }else{
                $this->db->table("kota")->insert($dataUpdae);
            }
            die(forceRedirect(base_url('/admin/refKota')));
        } else {
            return $form->output();
        }
    }

    public function delete()
    {
        $id = $this->request->getPost('id');
        $this->db->table('kota')->delete(['id' => $id]);
        return $this->response->setJSON(
            array(
                'status' => true,
                'message' => 'Success delete data'
            )
        );
    }
    
}