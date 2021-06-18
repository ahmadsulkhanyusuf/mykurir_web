<?php namespace App\Filters;

use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\Filters\FilterInterface;
use App\Libraries\Navigation;

class LoginFilter implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        $this->session = \Config\Services::session();
		if($this->session->get('user')==NULL){
            return redirect()->to(base_url('login'));
        }

        $navigation = new Navigation();
        $router     = service('router');
        $controller = $router->controllerName();
        $controller = str_replace("/App/Controllers/","",str_replace("\\","/",$controller));
        if(!$navigation->cek_akses($controller)){
            return redirect()->to(base_url('forbidden'));
        }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
    }
}