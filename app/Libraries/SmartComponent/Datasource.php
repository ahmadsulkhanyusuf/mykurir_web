<?php
namespace App\Libraries\SmartComponent;

class Datasource
{
    protected $SQL          = "";
    protected $sort         = array('id', 'asc');
    protected $whereClause  = array();

    public function __construct()
    {
        $this->db = \Config\Database::connect();
    }

    public function set_sort($sort)
    {
        $this->sort = $sort;
        return $this;
    }

    public function set_query($SQL, $whereClause = array())
    {
        $this->whereClause = $whereClause;

        //where clause
        $whereClause = array();
        foreach ($this->whereClause as $value) {
            if ($value[1] != '') {
                if (!isset($value[2])) {
                    array_push($whereClause, "lower(" . $value[0] . " ) like '%" . strtolower($value[1]) . "%'");
                } else if (in_array(trim(strtolower($value[2])),array('not in', 'in','is'))) {
                    array_push($whereClause, $value[0] . " " . $value[2] . " " . $value[1] . "");
                }else {
                    array_push($whereClause, $value[0] . " " . $value[2] . " '" . $value[1] . "'");
                }
            }
        }
        if (!empty($whereClause)) {
            $where = " where " . implode(" and ", $whereClause);
            $this->SQL = $SQL . $where;
        } else {
            $this->SQL = $SQL;
        }
        return $this;
    }

    public function get_query()
    {
        return $this->SQL;
    }

    public function run()
    {
        $page = (int)$_GET['page'];
        $pageSize = (isset($_GET['pageSize']) ? $_GET['pageSize'] : -1);

        //limit
        $limit  = $pageSize;
        $offset = ($page - 1) * $pageSize;

        //sort
        $sort   = array(implode(" ", $this->sort));
        if (isset($_GET['sort'])) {
            $sort = array();
            foreach ($_GET['sort'] as $key => $value) {
                array_push($sort, $value['field'] . " " . $value['dir']);
            }
        }
        $order_by = " order by " . implode(", ", $sort);

        $SQL    = $this->SQL . $order_by;
        if($pageSize>=0){
            $SQL .= " limit " . $limit . " offset " . $offset;
        }
        $query  = $this->db->query($SQL);
        $data   = $query->getResult('array');

        $query = $this->db->query("select count(*) as total from (" . $this->SQL . ") tmp");
        $total = $query->getRowArray();

        $this->SQL = $SQL;

        return array(
            'total'     => (int)$total['total'],
            'result'    => $data,
            // 'sql'       => $this->SQL
        );
    }
}
