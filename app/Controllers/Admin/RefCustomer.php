<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Libraries\SmartComponent\Grid;
use App\Libraries\SmartComponent\Form;

class RefCustomer extends BaseController
{
    public function index()
    {
        $data['grid']   = $this->grid();
        $data['search'] = $this->search();
        $data['title']  = 'List Customer';
        $data['url_delete']  = base_url("admin/refCustomer/delete");

        return view('global/list', $data);
    }

    public function grid()
    {
        $SQL = "select 
            customer.*,
            kec_nama,cust_no_hp,
            kota_nama
        from customer 
        left join kecamatan on kecamatan.id = cust_kec_id
        left join kota on kota.id = kec_id_kota";

        $action['edit']     = array(
            'link'          => 'admin/refCustomer/edit/'
        );
        $action['delete']     = array(
            'jsf'          => '_delete'
        );

        $grid = new Grid();
        return $grid->set_query($SQL, array(
                array('cust_nama', $this->request->getGet('cust_nama')),
                array('kec_nama', $this->request->getGet('kec_nama')),
                array('kota_nama', $this->request->getGet('kota_nama'))
            ))
            ->set_sort(array('customer.id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/refCustomer/grid?datasource&" . get_query_string()),
                    'grid_columns'  => array(
                        array(
                            'field' => 'cust_nama',
                            'title' => 'Nama',
                        ),
                        array(
                            'field' => 'cust_alamat',
                            'title' => 'Alamat',
                        ),
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
                ->add('add', ['label'=>'Tambah Customer', 'url'=> base_url("admin/refCustomer/add")]);
            })
            ->output();
    }

    private function search()
    {
        $form = new Form();
        return $form->set_form_type('search')
            ->set_form_method('GET')
            ->set_submit_label('Cari')
            ->add('cust_nama', 'Nama', 'text', false, $this->request->getGet('cust_nama'), 'style="width:100%;" ')
            ->add('kota_nama', 'Kota', 'text', false, $this->request->getGet('kota_nama'), 'style="width:100%;" ')
            ->add('kec_nama', 'Kecamatan', 'text', false, $this->request->getGet('kec_nama'), 'style="width:100%;" ')
            ->add('cust_no_hp', 'Kecamatan', 'text', false, $this->request->getGet('cust_no_hp'), 'style="width:100%;" ')
            ->output();
    }

    public function add()
    {
        $data['title']  = 'Tambah Customer';
        $data['form']   = $this->form();
        $data['url_back'] = base_url("admin/refCustomer");

        return view('global/form', $data);
    }

    public function edit($id)
    {
        $data['title']  = 'Edit Customer';
        $data['form']   = $this->form($id);
        $data['url_back'] = base_url("admin/refCustomer");

        return view('global/form', $data);
    }

    public function form($id = null)
    {
        if($id!=null){
            $data = $this->db->table("customer")->getWhere(['id'=>$id])->getRowArray();
        }
        $form = new Form();
        $form->set_attribute_form('class="form-horizontal"')
            ->add('cust_nama', 'Nama', 'text', true, (isset($data)) ? $data['cust_nama'] : '', 'style="width:100%;"')
            ->add('cust_alamat', 'Alamat', 'text', true, (isset($data)) ? $data['cust_alamat'] : '', 'style="width:100%;"')
            ->add('cust_kec_id', 'Kecamatan', 'select', false, (isset($data)) ? $data['cust_kec_id'] : 1, 'style="width:100%;"', array(
                'table' => 'kecamatan left join kota on kota.id = kec_id_kota',
                'id' => 'kecamatan.id',
                'label' => 'kec_nama'
            ));
        if ($form->formVerified()) {
            $dataUpdae = $form->get_data();
            if($id!=null){
                $this->db->table("customer")->where(['id'=>$id])->update($dataUpdae);
            }else{
                $this->db->table("customer")->insert($dataUpdae);
            }
            die(forceRedirect(base_url('/admin/refCustomer')));
        } else {
            return $form->output();
        }
    }

    public function delete()
    {
        $id = $this->request->getPost('id');
        $this->db->table('customer')->delete(['id' => $id]);
        return $this->response->setJSON(
            array(
                'status' => true,
                'message' => 'Success delete data'
            )
        );
    }
    
}