<?php
namespace App\Libraries\SmartComponent;

use App\Libraries\SmartComponent\Datasource;
use App\Libraries\SmartComponent\Report;
use App\Libraries\SmartComponent\Toolbar;
class Grid{
    protected $response;
    protected $template     = 'template/default_smart_grid';
    protected $config       = array();
    protected $SQL          = "";
    protected $sort         = array('id', 'asc');
    protected $whereClause  = array();  
    protected $icon         = array(
        'edit'      => 'edit',
        'delete'    => 'delete',
        'detail'    => 'eye'
    );
    protected $uniq_id = null;
    protected $row_start    = 3;
    protected $header       = array('A1'=> 'Report');

    public function __construct()
    {
        $this->response = service('response');
    }
    
    public function configure($config)
    {
        $this->uniq_id = time() . uniqid();
        $this->config = array(
            'pageSize'      => 25,
            'grid_name'     => $this->uniq_id,
            'gridReload'    => "gridReload()",
            'datasouce_name'=> $this->uniq_id,
            'grid_name'     => $this->uniq_id,
            'scrollable'    => 'false',
            'fields'        => array(
            ),
            'datasouce_url' => '',
            'grid_height'   => 500,
            'grid_columns'  => array(
                array(
                    'field'=>'id',
                    'title'=>'ID',
                    'width'=>50
                )
            ),
            'action'        => array(),
            'toolbar'       => array(),
            'toolbarHtml'   => '',
            'download_url'  => base_url(uri_string()) . '?download&' . get_query_string(),
            'label_add'     => 'Add Item'
        );
        foreach ($config as $key => $value) {
            $this->config[$key] = $value;
        }

        $fields = array();
        foreach($this->config['grid_columns'] as $key => $value){
            if(!isset($value['format'])){
                $fields[$value['field']] = array("type"=> "string");
            }else{
                if($value['format']=='number'){
                    $this->config['grid_columns'][$key]['format']  = "{0:n0}";
                    $fields[$value['field']] = array("type"=> $value['format']);
                }
                if($value['format']=='date'){
                    $this->config['grid_columns'][$key]['template']  = "#= kendo.toString(kendo.parseDate(".$value['field'].", 'yyyy-MM-dd'), 'dd MMMM yyyy') #";
                    $fields[$value['field']] = array("type"=> "string");
                }
                if($value['format']=='datetime'){
                    $this->config['grid_columns'][$key]['template']  = "#= kendo.toString(kendo.parseDate(".$value['field'].", 'yyyy-MM-dd HH:mm:ss'), 'dd MMMM yyyy HH:mm:ss') #";
                    $fields[$value['field']] = array("type"=> "string");
                }
            }
            $this->config['grid_columns'][$key]['media']  = "(min-width: 400px)";
        }
        $this->config['grid_columns'][] = array(
            'title'     => 'Item',
            'template'  => "kendo.template($('#responsive-column-template').html())",
            'media'     => '(max-width: 450px)'
        );
        $this->config['fields'] = $fields;
        return $this;
    }

    public function set_snippet($callback)
    {
        $this->snippet_function = $callback;
        return $this;
    }

    public function set_label_add($label)
    {
        $this->config['label_add'] = $label;
        return $this;
    }

    public function set_sort($sort)
    {
        $this->sort = $sort;
        return $this;
    }

    public function set_query($SQL, $whereClause = array())
    {
        $this->SQL = $SQL;
        $this->whereClause = $whereClause;
        return $this;
    }

    public function set_header($header)
    {
        $this->header = $header;
        return $this;
    }

    public function set_row_start($row_start)
    {
        $this->row_start = $row_start;
        return $this;
    }

    public function output()
    {
        if(isset($_GET['datasource'])){
            return $this->get_datasource();
        }

        if(isset($_GET['download'])){
            return $this->download();
        }
        $columns = array();
        
        foreach ($this->config['grid_columns'] as $key => $value) {
            if(isset($value['align'])){
                $value['attributes'] = array('style'=>'text-align:'.$value['align']);
            }
            array_push($columns, $value);
        }
        
        if(!empty($this->config['action'])){
            foreach($this->config['action'] as $key => $value){
                array_push($columns, array(
                    'field' => $key,
                    'title' => '&nbsp',
                    'encoded'=> false,
                    'width' => 40,
                    'media' => "(min-width: 400px)"
                ));                
            }
        }

        $this->config['grid_columns'] = $columns;
        return view($this->template, $this->config);
    }

    public function set_toolbar($function_toolbar)
    {
        $toolbar = new Toolbar($this->config['download_url']);
        call_user_func_array($function_toolbar, [$toolbar]);

        $this->config['toolbarHtml'] = $toolbar->output();
        return $this;
    }

    private function get_datasource()
    {
        $datasource = new Datasource();
        $datasource->set_query($this->SQL, $this->whereClause);
        $datasource->set_sort($this->sort);
        $data = $datasource->run();

        if(!empty($this->config['action'])){
            foreach($this->config['action'] as $key => $value){
                foreach($data['result'] as $k => $v){
                    if(isset($value['link']) && $value['link']!=''){
                        $data['result'][$k][$key] = '<a href="'.base_url($value['link'] . $v['id']).'"><i class="k-icon k-i-'.$this->icon[$key].'"></i></a>';
                    }
                    if(isset($value['jsf']) && $value['jsf']!=''){
                        $data['result'][$k][$key] = '<a href="javascript:void(0)" onclick="'.$value['jsf'].'(\''.$v['id'].'\')"><i class="k-icon k-i-'.$this->icon[$key].'"></i></a>';
                    }
                }
            }
        }
       
        if(isset($this->snippet_function)){
            foreach ($data['result'] as $key => $value) {
                $data['result'][$key] = call_user_func_array($this->snippet_function, [$value['id'], $value]);
            }
        }

        return $this->response->setJSON($data);
    }

    public function download()
    {
        $report = new Report();
        $report->set_query($this->SQL, $this->whereClause)
        ->set_sort($this->sort)
        ->set_column($this->config['grid_columns'])
        ->set_row_start($this->row_start)
        ->set_header($this->header);
        $excel = $report->output();
        return $excel;
    }

}