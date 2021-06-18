<?php

namespace App\Controllers;

class Login extends BaseController
{
	public function index()
	{
		return view('login');
	}

	public function auth()
	{
		$user_name 		= addslashes($this->request->getPost('username'));
		$user_password 	= $this->request->getPost('password');
		$sql 			= $this->db->query("select user_id, user_name, admin_nama, admin_kota_id, user_password from public.user inner join admin on admin_user_id = user_id where public.user.user_name='" . $user_name . "'");
		$data 			= $sql->getRowArray();
		if (!empty($data)) {
			if(password_verify($user_password, $data['user_password'])){
				unset($data['user_password']);
				$this->session->set('user', $data);
				return redirect()->to(base_url("admin/barang"));
			}else{
				$this->session->setFlashdata('warning', 'Login Gagal, Password tidak sama !');
				return redirect()->to(base_url("login"));
			}
		} else {
			$this->session->setFlashdata('warning', 'Login Gagal, Username tidka ada !');
			return redirect()->to(base_url("login"));
		}
	}
	public function vRegister($id = null)
	{
		$data = [];
		$kelSelected = '';
		if ($id != null) {
			$data = $this->db->table('member')->select('*')->join('public.user', 'user_member_id=member_id')->getWhere(['member_id' => $id])->getRowArray();
			$kelSelected = $data['member_kelurahan'];
		}
		$data_kel = $this->db->table('ref_kelurahan')->select('*')->get()->getResultArray();
		$opsi = '<option>Kelurahan</option>';
		foreach ($data_kel as $key => $value) {
			if ($value['ref_kel_id'] == $kelSelected) {
				$opsi .= ' <option value="' . $value['ref_kel_id'] . '" selected>' . $value['ref_kel_label'] . '</option>';
			}
			$opsi .= ' <option value="' . $value['ref_kel_id'] . '" >' . $value['ref_kel_label'] . '</option>';
		}
		$data['opsi'] = $opsi;
		return view('register', $data);
	}
	public function register()
	{
		$member_insert = array(
			'member_nama_lengkap' 	=> $this->request->getPost('member_nama_lengkap'),
			'member_alamat' 		=> $this->request->getPost('member_alamat'),
			'member_no_telp' 		=> $this->request->getPost('member_no_telp'),
			'member_pekerjaan' 		=> $this->request->getPost('member_pekerjaan'),
			'member_no_ktp' 		=> $this->request->getPost('member_no_ktp'),
			'member_kelurahan' 		=> $this->request->getPost('member_kelurahan'),
			'member_created_at'		=> 'now()',
		);
		$this->db->table('public.member')->insert($member_insert);
		$id_member = $this->db->insertID();

		$cekUser = $this->db->table('user')->getWhere(['user_name' => $this->request->getPost('user_name')])->getRowArray();
		if (!empty($cekUser)) {
			$this->session->setFlashdata('danger', 'username = ' . strtoupper($this->request->getPost('user_name')) . ' sudah ada! Silahkan buat username yang baru');
			return redirect()->to(base_url("login/vRegister"));
		}
		$user_insert = array(
			'user_name' 		=> $this->request->getPost('user_name'),
			'user_member_id' 	=> $id_member,
			'user_namalengkap' 	=> $this->request->getPost('member_nama_lengkap'),
			'user_created_at'	=> 'now()'
		);
		if ($this->request->getPost('user_password') != '') {
			$user_insert['user_password'] = sha1($this->request->getPost('user_password'));
		}
		$this->db->table('public.user')->insert($user_insert);
		$this->session->setFlashdata('success', 'Registrasi username = ' . strtoupper($this->request->getPost('user_name')) . ' berhasil! Silahkan login untuk melanjutkan');
		return redirect()->to(base_url("login/vRegister/" . $id_member));
	}
	public function logout()
	{
		$this->session->remove('user');
		return redirect()->to(base_url("login"));
	}
}
