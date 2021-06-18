<?php
namespace App\Libraries\SmartComponent;

use App\Libraries\SmartComponent\Datasource;

class ListView{

    protected $config = array(
        'id'        => 1,
        'datasource'=> array(
            'pageSize'  => 25,
            'url'       => ''
        ),
        'template' => '',
        'reload_jsf'=> "reloadList"
    );
    protected $SQL          = "";
    protected $sort         = array('id', 'asc');
    protected $whereClause  = array();  
    public function __construct()
    {
        $this->config['id'] = uniqid();
        $this->response = service('response');
    }

    public function set_datasource($ds)
    {
        foreach($ds as $key => $value){
            $this->config['datasource'][$key] = $value;
        }
        return $this;
    }

    public function set_query($SQL, $whereClause = array())
    {
        $this->SQL = $SQL;
        $this->whereClause = $whereClause;
        return $this;
    }

    public function set_template($template)
    {
        $this->config['template']    = $template;
        return $this;
    }

    public function set_title($title)
    {
        $this->config['title'] = $title;
        return $this;
    }

    public function output()
    {
        if(isset($_GET['datasource'])){
            return $this->get_datasource();
        }
        return view('template/default_smart_list', $this->config);
    }

    private function get_datasource()
    {
        $datasource = new Datasource();
        $datasource->set_query($this->SQL, $this->whereClause);
        $datasource->set_sort($this->sort);
        $data = $datasource->run();

        return $this->response->setJSON($data);
    }
}