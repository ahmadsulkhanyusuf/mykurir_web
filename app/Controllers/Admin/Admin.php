<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Libraries\SmartComponent\Grid;
use App\Libraries\SmartComponent\Form;

class Admin extends BaseController
{
    public function index()
    {
        $data['grid']   = $this->grid();
        $data['search'] = $this->search();
        $data['title']  = 'List Admin';
        $data['url_delete']  = base_url("admin/admin/delete");

        return view('global/list', $data);
    }

    public function grid()
    {
        $SQL = "select *, admin_id as id from admin left join kota on id = admin_kota_id";

        $action['edit']     = array(
            'link'          => 'admin/admin/edit/'
        );
        $action['delete']     = array(
            'jsf'          => '_delete'
        );

        $grid = new Grid();
        return $grid->set_query($SQL, array(
                array('kota_nama', $this->request->getGet('kota_nama')),
                array('admin_nama', $this->request->getGet('admin_nama'))
            ))
            ->set_sort(array('admin_id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/admin/grid?datasource&" . get_query_string()),
                    'grid_columns'  => array(
                        array(
                            'field' => 'admin_nama',
                            'title' => 'Nama',
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
                ->add('add', ['label'=>'Tambah Admin', 'link'=> base_url("admin/admin/add")]);
            })
            ->output();
    }

    private function search()
    {
        $form = new Form();
        return $form->set_form_type('search')
            ->set_form_method('GET')
            ->set_submit_label('Cari')
            ->add('admin_nama', 'Nama', 'text', false, $this->request->getGet('admin_nama'), 'style="width:100%;" ')
            ->add('kota_nama', 'Kota', 'text', false, $this->request->getGet('kota_nama'), 'style="width:100%;" ')
            ->output();
    }

    public function add()
    {
        $data['title']  = 'Tambah Admin';
        $data['form']   = $this->form();
        $data['url_back'] = base_url("admin/admin");

        return view('global/form', $data);
    }

    public function edit($id)
    {
        $data['title']  = 'Edit Admin';
        $data['form']   = $this->form($id);
        $data['url_back'] = base_url("admin/admin");

        return view('global/form', $data);
    }

    public function form($id = null)
    {
        $data = null;
        if($id!=null){
            $data = $this->db->table("admin")->join("user","user_id = admin_user_id")->where(['admin_id'=>$id])->get()->getRowArray();
        }

        $form = new Form();
        $form->set_attribute_form('class="form-horizontal"')
            ->add('admin_nama', 'Nama', 'text', true, ($data!=null ? $data['admin_nama'] : ''), 'style="width:100%;"')
            ->add('admin_kota_id', 'Kota', 'select', true, ($data!=null ? $data['admin_kota_id'] : ''), 'style="width:100%;"', array(
                'table' => 'kota',
                'id' => 'id',
                'label' => 'kota_nama'
            ))
            ->add('user_name', 'Username', 'text', ($data!=null ? false : true), ($data!=null ? $data['user_name'] : ''), 'style="width:100%;"')
            ->add('user_password', 'Password', 'password', ($data!=null ? false : true), '', 'style="width:100%;"');
        if ($form->formVerified()) {
            if($id!=null){
                $data_admin = array(
                    'admin_nama'=> $this->request->getPost('admin_nama'),
                    'admin_kota_id'=> $this->request->getPost('admin_kota_id'),
                );
                $this->db->table("admin")->where(['admin_id'=> $id])->update($data_admin);
                if($this->request->getPost('user_name')!=''){
                    $this->db->table("user")->where(['user_id'=> $data['admin_user_id']])->update(array(
                        'user_name'=> $this->request->getPost('user_name')
                    ));
                }
                if($this->request->getPost('user_password')!=''){
                    $this->db->table("user")->where(['user_id'=> $data['admin_user_id']])->update(array(
                        'user_password'=> password_hash($this->request->getPost('user_password'), PASSWORD_BCRYPT),
                    ));
                }
            }else{
                $data_user = array(
                    'user_name'=> $this->request->getPost('user_name'),
                    'user_password'=> password_hash($this->request->getPost('user_password'), PASSWORD_BCRYPT),
                );
                $this->db->table("user")->insert($data_user);
                $user_id = $this->db->insertId();
                $data_admin = array(
                    'admin_user_id'=> $user_id,
                    'admin_nama'=> $this->request->getPost('admin_nama'),
                    'admin_kota_id'=> $this->request->getPost('admin_kota_id'),
                );
                $this->db->table("admin")->insert($data_admin);
            }
            die(forceRedirect(base_url('/admin/admin')));
        } else {
            return $form->output();
        }
    }

    public function delete()
    {
        $id = $this->request->getPost('id');
        $admin = $this->db->table('admin')->where(['admin_id' => $id])->get()->getRowArray();
        $this->db->table('user')->delete(['user_id' => $admin['admin_user_id']]);
        $this->db->table('admin')->delete(['admin_id' => $id]);
        return $this->response->setJSON(
            array(
                'status' => true,
                'message' => 'Success delete data'
            )
        );
    }
    
}