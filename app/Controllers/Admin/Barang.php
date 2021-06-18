<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Libraries\SmartComponent\Grid;
use App\Libraries\SmartComponent\Form;

class Barang extends BaseController
{
    public function index()
    {
        $data['grid']   = $this->grid();
        $data['search'] = $this->search();
        $data['title']  = '';
        $data['url_delete']  = base_url("admin/barang/delete");

        return view('global/list', $data);
    }

    public function grid()
    {
        // dd($this->user['admin_kota_id']);
        $SQL = "SELECT
                    barang.id as id, bar_kode, bar_penerima,bar_catatan,bar_harga,bar_berat,bar_ongkir,bar_total_bayar,bar_tgl,bar_alamat,
                    kur_nama,cust_nama,cust_alamat,
                    kec_asal.kec_nama as kec_asal_nama,
                    kota_asal.kota_nama as kota_asal_nama,
                    kec_tujuan.kec_nama as kec_tujuan_nama,
                    kota_tujuan.kota_nama as kota_tujuan_nama,
                    coalesce(cust_nama,'')||'<br/>Alamat : '||coalesce(cust_alamat,'')||' '||coalesce(kec_asal.kec_nama,'')||' '||coalesce(kota_asal.kota_nama,'') as alamat_dari,
                    coalesce(bar_penerima,'')||'<br/>Alamat : '||coalesce(bar_alamat,'')||' '||coalesce(kec_tujuan.kec_nama,'')||' '||coalesce(kota_tujuan.kota_nama,'') as alamat_untuk,
                    case when bar_kurir_id is null then 'Diantarkan Oleh pengirim' else 'Diambil kurir '||coalesce(kur_nama,'') end as status,
                    '<a class=\"btn btn-warning btn-xs btn-raised\" href=\"" . base_url('admin/barang/history/') . "/'||barang.id||'\">History<i class=\"k-icon k-i-make-vertical-spacing-equal\"></i></a>' as history
                from barang
                left join kurir on bar_kurir_id = kurir.id
                left join customer on bar_cust_id = customer.id
                left join kecamatan kec_asal on cust_kec_id = kec_asal.id
                inner join kota kota_asal on kec_asal.kec_id_kota = kota_asal.id and kota_asal.id = ".$this->user['admin_kota_id']."
                left join kecamatan as kec_tujuan on bar_kec_tujuan = kec_tujuan.id
                inner join kota kota_tujuan on kec_tujuan.kec_id_kota = kota_tujuan.id and kota_tujuan.id = ".$this->user['admin_kota_id']."
                ";
        // die($SQL);
        $action['edit']     = array(
            'link'          => 'admin/barang/edit/'
        );
        $action['delete']     = array(
            'jsf'          => '_delete'
        );

        $grid = new Grid();
        return $grid->set_query($SQL, array(
            array('bar_kode', $this->request->getGet('kode')),
            array('kota_nama', $this->request->getGet('kota_nama'))
        ))
            ->set_sort(array('id', 'desc'))
            ->configure(
                array(
                    'datasouce_url' => base_url("admin/barang/grid?datasource&" . get_query_string()),
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
                            'field' => 'history',
                            'title' => 'History',
                            'encoded' => false
                        ),
                    ),
                    // 'action'    => $action,
                )
            )
            ->set_toolbar(function ($toolbar) {
                $toolbar
                    ->add('add', ['label' => 'Tambah Pengiriman', 'url' => base_url("admin/barang/add")]);
            })
            ->output();
    }

    private function search()
    {
        $form = new Form();
        return $form->set_form_type('search')
            ->set_form_method('GET')
            ->set_submit_label('Cari')
            ->add('kode', 'Kode', 'text', false, $this->request->getGet('kode'), 'style="width:100%;" ')
            // ->add('kec_nama', 'Kecamatan', 'text', false, $this->request->getGet('kec_nama'), 'style="width:100%;" ')
            ->output();
    }

    public function add()
    {
        $data['title']  = 'Tambah Barang';
        $data['form']   = $this->form();
        $data['url_back'] = base_url("admin/barang");

        return view('global/form', $data);
    }

    public function edit($id)
    {
        $data['title']  = 'Edit Barang';
        $data['form']   = $this->form($id);
        $data['url_back'] = base_url("admin/barang");

        return view('global/form', $data);
    }
    public function history($id)
    {
        $data['title']  = 'Edit Barang';
        $data['data']   = $this->dataHistory($id);
        $data['header']   = $this->dataHeader($id);
        $data['url_back'] = base_url("admin/barang");

        return view('admin/barang/history', $data);
    }
    public function dataHeader($id){
        $data = $this->db->table('barang')
        ->join('kurir', 'bar_kurir_id = kurir.id','left')
        ->join('customer' , 'bar_cust_id = customer.id','left')
        ->join('kecamatan kec_asal' , 'cust_kec_id = kec_asal.id','left')
        ->join('kota kota_asal' , 'kec_asal.kec_id_kota = kota_asal.id','left')
        ->join('kecamatan as kec_tujuan' , 'bar_kec_tujuan = kec_tujuan.id','left')
        ->join('kota kota_tujuan' , 'kec_tujuan.kec_id_kota = kota_tujuan.id','left')
        ->select("barang.id as id, bar_kode, bar_penerima,bar_catatan,bar_harga,bar_berat,bar_ongkir,bar_total_bayar,bar_tgl,bar_alamat,
        kur_nama,cust_nama,cust_alamat,
        kec_asal.kec_nama as kec_asal_nama,
        kota_asal.kota_nama as kota_asal_nama,
        kec_tujuan.kec_nama as kec_tujuan_nama,
        kota_tujuan.kota_nama as kota_tujuan_nama,
        bar_penerima_no_hp,cust_no_hp,
        '<b>'||coalesce(cust_nama,'')||'</b><br/>Alamat : '||coalesce(cust_alamat,'')||' '||coalesce(kec_asal.kec_nama,'')||' '||coalesce(kota_asal.kota_nama,'')||'<br> No Hp : '||coalesce(bar_penerima_no_hp,'-') as alamat_dari,
        '<b>'||coalesce(bar_penerima,'')||'</b><br/>Alamat : '||coalesce(bar_alamat,'')||' '||coalesce(kec_tujuan.kec_nama,'')||' '||coalesce(kota_tujuan.kota_nama,'')||'<br> No Hp : '||coalesce(bar_penerima_no_hp,'-') as alamat_untuk")
        ->where('barang.id', $id)
        ->get()->getRow(); 
        // dd($data);
        return $data;
    }
    public function dataHistory($id)
    {
        $data = $this->db->table('log_status')->join('status','status_id = log_id_status','left')->join('kurir','log_by = kur_user_id','left')
        ->select('log_alasan as description')
        ->select('to_char(log_at, \'YYYY-MM-DD HH24:MI:SS\') as date')
        ->select('status_label as title')
        ->select("'Oleh '||coalesce(kur_nama,'')||' </br>pada '||to_char(log_at, 'DD Month YYYY HH24:MI:SS') as subtitle")
        ->where('log_id_barang', $id)
        ->get()->getResult(); 
        // dd($data);
        return json_encode($data);
    }
    public function form($id = null)
    {
        if ($id != null) {
            $data = $this->db->table("barang")->getWhere(['id' => $id])->getRowArray();
        }
        $form = new Form();
        $form->set_attribute_form('class="form-horizontal"')->set_template('admin/barang/sf_add')
            ->add('bar_cust_id', 'Pengirim', 'select', false, (isset($data)) ? $data['bar_cust_id'] : '', 'style="width:100%;"', array(
                'table' => 'customer left join kecamatan on kecamatan.id = cust_kec_id left join kota on kota.id = kec_id_kota',
                'id' => 'customer.id',
                'label' => "coalesce(cust_nama,'')||' '||coalesce(kec_nama,'')||' '||coalesce(kota_nama,'')"
            ))
            ->add('bar_kec_tujuan', 'Kecamatan Tujuan', 'select', false, (isset($data)) ? $data['bar_kec_tujuan'] : '', 'style="width:100%;"', array(
                'table' => 'kecamatan left join kota on kec_id_kota = kota.id',
                'id' => 'kecamatan.id',
                'label' => "coalesce(kec_nama,'')||' '||coalesce(kota_nama,'')"
            ))
            ->add('bar_penerima', 'Penerima', 'text', true, (isset($data)) ? $data['bar_penerima'] : '', 'style="width:100%;"')
            ->add('bar_alamat', 'Alamat Penerima', 'text', true, (isset($data)) ? $data['bar_alamat'] : '', 'style="width:100%;"')
            ->add('bar_catatan', 'Catatan', 'text', true, (isset($data)) ? $data['bar_catatan'] : '', 'style="width:100%;"')
            ->add('bar_penerima_no_hp', 'No HP Penerima', 'text', true, (isset($data)) ? $data['bar_penerima_no_hp'] : '', 'style="width:100%;"')
            ->add('bar_harga', 'Harga Barang', 'number', true, (isset($data)) ? $data['bar_harga'] : '', 'style="width:100%;"')
            ->add('bar_berat', 'Berat', 'text', true, (isset($data)) ? $data['bar_berat'] : '', 'style="width:100%;"');
        if ($form->formVerified()) {
            $dataUpdate = $form->get_data();
            $dataUpdate['bar_kode'] = $this->genKode($this->request->getPost("bar_cust_id"));
            $dataUpdate['bar_ongkir'] = ($this->genOnkir($this->request->getPost("bar_cust_id"), $this->request->getPost("bar_kec_tujuan"))*$this->request->getPost("bar_berat"));
            $dataUpdate['bar_total_bayar'] = ($dataUpdate['bar_ongkir'] + $this->request->getPost("bar_harga"));
            $dataUpdate['bar_tgl'] = 'now()';
            // var_dump($this->user);die();
            $dataUpdate['bar_created_by'] = $this->user['user_id'];
            $bagi_hasil = $this->hitung_bagi_hasil($this->request->getPost("bar_cust_id"),$this->request->getPost("bar_kec_tujuan"), $dataUpdate['bar_ongkir']);
            $dataUpdate['bar_hasil_asal'] = $bagi_hasil['hasil_asal'];
            $dataUpdate['bar_hasil_tujuan'] = $bagi_hasil['hasil_tujuan'];

            if ($id != null) {
                $this->db->table("barang")->where(['id' => $id])->update($dataUpdate);
            } else {
                $this->db->table("barang")->insert($dataUpdate);
            }
            die(forceRedirect(base_url('/admin/barang')));
        } else {
            return $form->output();
        }
    }

    private function hitung_bagi_hasil($cust_id, $kec_tujuan, $ongkir)
    {
        $kota_kustomer = $this->db->table("customer")->join("kecamatan", "kecamatan.id = cust_kec_id","left")->getWhere([
            'customer.id'=> $cust_id
        ])->getRowArray();
        $kota_tujuan = $this->db->table("kecamatan")->getWhere([
            'id'=> $kec_tujuan
        ])->getRowArray();
        if($kota_kustomer['kec_id_kota']!=$kota_tujuan['kec_id_kota']){
            return array(
                'hasil_asal'=> $ongkir * 50 / 100,
                'hasil_tujuan'=> $ongkir * 50 / 100,
            );
        }else{
            return array(
                'hasil_asal'=> $ongkir,
                'hasil_tujuan'=> 0,
            );
        }
    }

    public function genKode($id)
    {
        $data = $this->db->table('customer')->join('kecamatan', 'kecamatan.id = cust_kec_id')->join('kota', 'kota.id = kec_id_kota')->where('customer.id', $id)->limit(1)->get()->getRow();
        // dd($data->kota_kode);
        $barang = $this->db->table('barang')->where("bar_tgl", date('Y-m-d'))->countAllResults();
        $serial = $barang + 1;
        // print_r($serial);die();
        $kode = $data->kota_kode . date('ymd') . sprintf("%03d", $serial);
        return $kode;
    }
    public function genOnkir($cus_id, $kec_tujuan)
    {
        $customer = $this->db->table('customer')->where('customer.id', $cus_id)->limit(1)->get()->getRow();

        $kec1 = $customer->cust_kec_id;
        $kec2 = $kec_tujuan;
        $ongkir = $this->db->table('ongkir_kota')
            ->groupStart()
            ->where('ongkir_kota_satu', $kec1)
            ->where('ongkir_kota_dua', $kec2)
            ->groupEnd()
            ->orGroupStart()
            ->where('ongkir_kota_dua', $kec1)
            ->where('ongkir_kota_satu', $kec2)
            ->groupEnd()
            ->limit(1)->get()->getRow();
        // dd($ongkir);
        if ($ongkir != null) {
            $harga = $ongkir->ong_harga;
        } else {
            return 0;
        }

        return (int)$harga;
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
