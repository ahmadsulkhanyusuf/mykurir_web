<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Libraries\SmartComponent\Grid;
use App\Libraries\SmartComponent\Form;

class RefKurir extends BaseController
{
    public function index()
    {
        $data['grid']   = $this->grid();
        $data['search'] = $this->search();
        $data['title']  = 'List Kurir';
        $data['url_delete']  = base_url("admin/refKurir/delete");

        return view('global/list', $data);
    }

    public function grid()
    {
        $SQL = "SELECT
                    id,
                    kur_nama,
                    kur_no_telp,
                    jk_label
                from kurir
                left join jenis_kelamin on kur_jk = jk_id";

        $action['edit']     = array(
            'link'          => 'admin/refKurir/edit/'
        );
        $action['delete']     = array(
            'jsf'          => '_delete'
        );

        $grid = new Grid();
        return $grid->set_query($SQL, array(
                array('kur_nama', $this->request->getGet('kur_nama')),
                array('kur_no_telp', $this->request->getGet('kur_no_telp'))
            ))
            ->set_sort(array('id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/refKurir/grid?datasource&" . get_query_string()),
                    'grid_columns'  => array(
                        array(
                            'field' => 'kur_nama',
                            'title' => 'Kurir',
                        ),
                        array(
                            'field' => 'kur_no_telp',
                            'title' => 'Telp',
                        ),
                        array(
                            'field' => 'jk_label',
                            'title' => 'Jenis Kelamin',
                        ),
                    ),
                    'action'    => $action,
                )
            )
            ->set_toolbar(function($toolbar){
                $toolbar
                ->add('add', ['label'=>'Tambah Kurir', 'url'=> base_url("admin/refKurir/add")]);
            })
            ->output();
    }

    private function search()
    {
        $form = new Form();
        return $form->set_form_type('search')
            ->set_form_method('GET')
            ->set_submit_label('Cari')
            ->add('kur_nama', 'Nama Kurir', 'text', false, $this->request->getGet('kur_nama'), 'style="width:100%;" ')
            ->add('kur_no_telp', 'No Telp', 'text', false, $this->request->getGet('kur_no_telp'), 'style="width:100%;" ')
            ->output();
    }

    public function add()
    {
        $data['title']  = 'Tambah Kurir';
        $data['form']   = $this->form();
        $data['url_back'] = base_url("admin/refKurir");

        return view('global/form', $data);
    }

    public function edit($id)
    {
        $data['title']  = 'Edit Kurir';
        $data['form']   = $this->form($id);
        $data['grid']   = $this->grid_kecamatan($id);
        $data['url_back'] = base_url("admin/refKurir");
        $data['url_add'] = base_url("admin/refKurir/addKecamatan/".$id);
        $data['url_delete'] = base_url("admin/refKurir/deleteMap");

        return view('admin/kurir/edit', $data);
    }

    public function grid_kecamatan($id)
    {
        $SQL = "select *, kurir_map.id as id from kurir_map left join kecamatan on map_kec_id = kecamatan.id where map_kur_id=".$id;

        $action['delete']     = array(
            'jsf'          => '_delete'
        );

        $grid = new Grid();
        return $grid->set_query($SQL)
            ->set_sort(array('kurir_map.id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/refKurir/grid_kecamatan/".$id."?datasource&" . get_query_string()),
                    'grid_columns'  => array(
                        array(
                            'field' => 'id',
                            'title' => 'ID',
                        ),
                        array(
                            'field' => 'kec_nama',
                            'title' => 'Kecamatan',
                        ),
                    ),
                    'action'    => $action,
                )
            )
            ->set_toolbar(function($toolbar) use($id){
                $toolbar
                ->add('add', ['label'=>'Tambah Kecamatan', 'jsf'=> 'addKecamatan()']);
            })
            ->output();
    }

    public function addKecamatan($kurir_id)
    {
        $data['title']  = 'Form Maping Kurir Kecamatan';
        $data['form']   = $this->formAddKecamatan($kurir_id);
        return view('global/form_pop', $data);
    }

    public function formAddKecamatan($kurir_id)
    {
        $form = new Form();
        $form->set_attribute_form('class="form-horizontal"')
            ->add('kecamatan', 'Kecamatan', 'select_multiple', false, [], 'style="width:100%;"', array(
                'table' => 'kecamatan left join kota on kec_id_kota = kota.id',
                'id' => 'kecamatan.id',
                'label' => "kec_nama||' - '||kota_nama"
            )
        );
        if ($form->formVerified()) {
            $data = $form->get_data();
            // dd($data);
            $kecamatans = explode(",", $data['kecamatan']);
            foreach ($kecamatans as $value) {
                $data_insert = array(
                    'map_kur_id'=> $kurir_id,
                    'map_kec_id'=> trim($value),
                    'created_at'=> date("Y-m-d H:i:s")
                );
                $this->db->table("kurir_map")->insert($data_insert);
            }
            die('<script>window.opener.gridReload();window.close();</script>');
        }else{
            return $form->output();
        }
    }

    public function form($id = null)
    {
        if($id!=null){
            $data = $this->db->table("kurir")->join("user","kur_user_id=user_id","left")->getWhere(['id'=>$id])->getRowArray();
        }
        $form = new Form();
        $form->set_attribute_form('class="form-horizontal"')
            ->add('kur_nama', 'Nama Kurir', 'text', true, (isset($data)) ? $data['kur_nama'] : '', 'style="width:100%;"')
            ->add('kur_no_telp', 'Telp Kurir', 'text', true, (isset($data)) ? $data['kur_no_telp'] : '', 'style="width:100%;"')
                ->add('kur_jk', 'Jenis Kelamin', 'select', false, (isset($data)) ? $data['kur_jk'] : 1, 'style="width:100%;"', array(
                    'table' => 'jenis_kelamin',
                    'id' => 'jk_id',
                    'label' => 'jk_label'
                )
            )
            ->add('user_name', 'Username', 'text', ($id!=null ? false : true), (isset($data)) ? $data['user_name'] : '', 'style="width:100%;"')
            ->add('user_password', 'Password', 'password', ($id!=null ? false : true), '', 'style="width:100%;"');
        if ($form->formVerified()) {
            if($id!=null){
                $this->db->table("kurir")->where(['id'=>$id])->update(array(
                    'kur_nama'=> $this->request->getPost('kur_nama'),
                    'kur_no_telp'=> $this->request->getPost('kur_no_telp'),
                    'kur_jk'=> $this->request->getPost('kur_jk')
                ));
                if($this->request->getPost('user_name')!=''){
                    $this->db->table("user")->where(['user_id'=> $data['kur_user_id']])->update(array(
                        'user_name'=> $this->request->getPost('user_name')
                    ));
                }
                if($this->request->getPost('user_password')!=''){
                    $this->db->table("user")->where(['user_id'=> $data['kur_user_id']])->update(array(
                        'user_password'=> password_hash($this->request->getPost('user_password'), PASSWORD_BCRYPT),
                    ));
                }
                die(forceRedirect(base_url('/admin/refKurir')));
            }else{
                $this->db->table("user")->insert(array(
                    'user_name'=> $this->request->getPost('user_name'),
                    'user_password'=> password_hash($this->request->getPost('user_password'), PASSWORD_BCRYPT)
                ));
                $idUser = $this->db->insertId();
                $this->db->table("kurir")->insert(array(
                    'kur_nama'=> $this->request->getPost('kur_nama'),
                    'kur_no_telp'=> $this->request->getPost('kur_no_telp'),
                    'kur_jk'=> $this->request->getPost('kur_jk'),
                    'kur_user_id'=> $idUser
                ));
                $idKurir = $this->db->insertId();
                die(forceRedirect(base_url('/admin/refKurir/edit/'.$idKurir)));
            }
        } else {
            return $form->output();
        }
    }

    public function delete()
    {
        $id = $this->request->getPost('id');
        $this->db->table('kurir')->delete(['id' => $id]);
        return $this->response->setJSON(
            array(
                'status' => true,
                'message' => 'Success delete data'
            )
        );
    }

    public function deleteMap()
    {
        $id = $this->request->getPost('id');
        $this->db->table('kurir_map')->delete(['id' => $id]);
        return $this->response->setJSON(
            array(
                'status' => true,
                'message' => 'Success delete data'
            )
        );
    }
    
}