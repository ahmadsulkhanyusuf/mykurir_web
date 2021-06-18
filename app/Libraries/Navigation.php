<?php

namespace App\Libraries;

class Navigation
{
    public function __construct()
    {
        $this->db 		= \Config\Database::connect();
        $this->session 	= \Config\Services::session();
    }

    public function menu()
    {
        $data['menu'] = $this->gen_menu();
        return view('template/menu', $data);
    }

    private function gen_menu()
    {
        $menu = '';
        $list_menu = $this->list_menu();
        foreach ($list_menu as $key => $value) {
            if($this->cek_akses($value['controller'])){
                if (isset($value['child'])) {
                    $menu .= '<li class="nav-item dropdown"><a class="nav-link pl-0 dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#"><i class="' . $value['icon'] . '"></i> ' . $value['label'] . ' </a><div class="dropdown-menu" aria-labelledby="navbarDropdown">';
                    foreach ($value['child'] as $k => $v) {
                        $menu .= '<a class="dropdown-item" href="' . base_url($v['controller']) . '">' . $v['label'] . ' </a>';
                    }
                    $menu .= '</div></li>';
                } else {
                    $menu .= '<li class="nav-item"><a class="nav-link pl-0" href="' . base_url($value['controller']) . '"><i class="' . $value['icon'] . '"></i> ' . $value['label'] . ' </a></li>';
                }
            }
        }
        // $menu .= '<li><a class="nav-link pl-0" href="' . base_url("login/logout") . '"><i class="k-icon k-i-logout"></i> Logout </a></li>';

        return $menu;
    }

    public function cek_akses($controller)
    {
        return true;
    }

    private function list_menu()
    {

        $list_menu = array(
            array(
                'label'         => 'Home',
                'controller'    => 'admin/home',
                'icon'          => 'fa-home',
            ),
            array(
                'label'         => 'Barang',
                'controller'    => 'admin/barang',
                'icon'          => 'fa-home',
            ),
            array(
                'label'         => 'Tagihan',
                'controller'    => 'admin/tagihan',
                'icon'          => 'fa-home',
            ),
            array(
                'label'         => 'Rekap Pendapatan',
                'controller'    => 'admin/rekapPendapatan',
                'icon'          => 'fa-home',
            ),
            array(
                'label'         => 'Rekap Poin',
                'controller'    => 'admin/rekapPoin',
                'icon'          => 'fa-home',
            ),
            array(
                'label'         => 'Data Master',
                'controller'    => '#data_master',
                'icon'          => 'fa-home',
                'child'         => array(
                    array(
                        'label'     => 'Kota',
                        'controller' => 'admin/refKota',
                    ),
                    array(
                        'label'     => 'Kecamatan',
                        'controller' => 'admin/refKec',
                    ),
                    array(
                        'label'     => 'Kurir',
                        'controller' => 'admin/refKurir',
                    ),
                    array(
                        'label'     => 'Matrix Harga',
                        'controller' => 'admin/matHargaKota',
                    ),
                    // array(
                    //     'label'     => 'Matrix Harga',
                    //     'controller' => 'admin/matHarga',
                    // ),
                    array(
                        'label'     => 'Admin',
                        'controller' => 'admin/admin',
                    ),
                    array(
                        'label'     => 'Customer',
                        'controller' => 'admin/refCustomer',
                    ),
                )
            ),
        );

        return $list_menu;
    }
}
