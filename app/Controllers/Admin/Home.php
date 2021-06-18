<?php
namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Libraries\SmartComponent\Grid;
use App\Libraries\SmartComponent\Form;

class Home extends BaseController
{
    public function index()
    {
        $data['grid']   = $this->grid();
        $data['search'] = $this->search();
        $data['title']  = 'Verifikasi';

        return view('admin/verifikasi/list', $data);
    }
    public function search()
    {
        $form = new Form();
        return $form->set_form_type('search')
            ->set_form_method('GET')
            ->set_submit_label('Cari')
            ->add('member', 'Member', 'text', false, $this->request->getGet('member'), 'style="width:100%;" ')
            ->add('tanggal', 'Tanggal', 'date', false, $this->request->getGet('tanggal'), 'style="width:100%;" ')
            ->output();
    }

    public function grid()
    {
        $SQL = "SELECT
                    peng_nominal,
                    member_nama_lengkap,
                    jns_pengajuan_label,
                    peng_tanggal,
                    case when peng_verif_reject_is is true then '<span class=\"badge badge-danger\">Rejected</span>' when peng_verif_is is true then '<span class=\"badge badge-success\">Verified</span>' else '<span class=\"badge badge-warning\">Waiting</span>' end as status,
                    '<button onclick=\"view('||peng_id||','||peng_jenis_pengajuan||')\" class=\"btn btn-primary bmd-btn-fab-sm bmd-btn-fab\"><i class=\"k-icon k-i-preview\"></i> </button> '
                    ||
                    case when peng_verif_reject_is is true then '' when peng_verif_is is true then '' else '<button onclick=\"verifikasi('||peng_id||')\" class=\"btn btn-success bmd-btn-fab-sm bmd-btn-fab\"><i class=\"k-icon k-i-check\"></i> </button> <button onclick=\"reject('||peng_id||')\" class=\"btn btn-danger bmd-btn-fab-sm bmd-btn-fab\"><i class=\"k-icon k-i-close\"></i> </button>' end as verifikasi,
                    peng_id AS ID 
                FROM
                    pengajuan
                    left join member on member_id = peng_member_id
                    left join ref_jenis_pengajuan on ref_jenis_pengajuan.jns_pengajuan_id = peng_jenis_pengajuan";

        $filter = array(
            ['member_nama_lengkap',$this->request->getGet('member')],
            ['peng_tanggal',$this->request->getGet('tanggal'),'='],
            ['peng_lock_is','true','is']
        );

        $grid = new Grid();
        return $grid->set_query($SQL, $filter)
            ->set_sort(array('id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/verifikasi/grid?datasource&" . get_query_string()),
                    'grid_columns'  => array(
                        array(
                            'field' => 'member_nama_lengkap',
                            'title' => 'Member',
                        ),
                        array(
                            'field' => 'jns_pengajuan_label',
                            'title' => 'Jenis',
                        ),
                        array(
                            'field' => 'peng_tanggal',
                            'title' => 'Tanggal',
                            'format'=> 'date'
                        ),
                        array(
                            'field' => 'peng_nominal',
                            'title' => 'Jumlah Pinjaman',
                            'format'=> 'number',
                            'align' => 'right'
                        ),
                        array(
                            'field' => 'status',
                            'title' => 'Status',
                            'encoded'=> false
                        ),
                        array(
                            'field' => 'verifikasi',
                            'title' => 'Action',
                            'encoded'=> false
                        ),
                    ),
                )
            )
            ->set_sort(['status','desc'])
            ->output();
    }

    public function approve()
    {
        $peng_id = $this->request->getPost('id');
        $this->db->table("pengajuan")->where('peng_id='.$peng_id)->update([
            'peng_verif_is'=> true,
            'peng_verif_by'=> $this->user['user_id'],
            'peng_verif_at'=> date("Y-m-d H:i:s"),
            'peng_verif_reject_is'=> null,
            'peng_verif_reject_by'=> null,
            'peng_verif_reject_at'=> null,
            'peng_verif_reject_note'=> null
        ]);
        return $this->response->setJSON([
            'status'=> true,
            'message'=> 'Sukses verifikasi dokumen'
        ]);
    }

    public function reject()
    {
        $peng_id = $this->request->getPost('id');
        $this->db->table("pengajuan")->where('peng_id='.$peng_id)->update([
            'peng_verif_is'=> null,
            'peng_verif_by'=> null,
            'peng_verif_at'=> null,
            'peng_verif_reject_is'=> true,
            'peng_verif_reject_by'=> $this->user['user_id'],
            'peng_verif_reject_at'=> date("Y-m-d H:i:s"),
            'peng_verif_reject_note'=> $this->request->getPost('catatan'),
            'peng_lock_is'=> false,
            'peng_lock_at'=> null,
            'peng_lock_by'=> null
        ]);
        return $this->response->setJSON([
            'status'=> true,
            'message'=> 'Sukses reject dokumen'
        ]);
    }
}