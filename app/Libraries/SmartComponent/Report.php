<?php
namespace App\Libraries\SmartComponent;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Report
{
    protected $SQL          = "";
    protected $sort         = array('id', 'asc');
    protected $whereClause  = array();
    protected $columns      = array();
    protected $row_start    = 3;
    protected $header       = array('A1'=> 'Report');
    protected $style_header = [
        'font' => [
            'bold' => true,
        ]
    ];

    public function __construct()
    {
        $this->db = \Config\Database::connect();
    }

    public function set_sort($sort)
    {
        $this->sort = $sort;
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

    public function set_column($columns)
    {
        $this->columns = $columns;
        return $this;
    }

    public function get_query()
    {
        return $this->SQL;
    }

    public function output()
    {
        //sort
        $sort   = array(implode(" ", $this->sort));
        if (isset($_GET['sort'])) {
            $sort = array();
            foreach ($_GET['sort'] as $key => $value) {
                array_push($sort, $value['field'] . " " . $value['dir']);
            }
        }
        $order_by = " order by " . implode(", ", $sort);
        $SQL    = $this->SQL . $order_by ;
        $query  = $this->db->query($SQL);
        $data   = $query->getResult('array');
        $this->SQL = $SQL;

        $alphabeth = range('A','Z');
        // $alphabeth = [];
        for($j='A'; $j<='Z'; $j++){
            $belakang = [];
            for($i='A'; $i<='Z'; $i++){
                $belakang[] = $i;
                $alphabeth[] = $j.$i;
            }
            $alphabeth[] = $j.$i;
        }
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        foreach($this->header as $key => $value){
            $sheet->setCellValue($key, $value);
        }

        unset($this->columns['item']);
        $row = $this->row_start;
        foreach($this->columns as $key => $value){
            if(isset($value['field'])){
                if(isset($value['encoded'])){
                    if($value['encoded']){
                        $sheet->setCellValue($alphabeth[$key].$row, $value['title']);
                        $sheet->getStyle($alphabeth[$key].$row)->applyFromArray($this->style_header);
                    }else{
                        $sheet->setCellValue($alphabeth[$key].$row, $value['title']);
                        $sheet->getStyle($alphabeth[$key].$row)->applyFromArray($this->style_header);
                    }
                }else{
                    $sheet->setCellValue($alphabeth[$key].$row, $value['title']);
                    $sheet->getStyle($alphabeth[$key].$row)->applyFromArray($this->style_header);
                }
            }
        }

        $row++;
        foreach($data as $key => $value){
            foreach($this->columns as $k => $v){
                if(isset($v['field'])){
                    if(isset($v['encoded'])){
                        if($v['encoded']){
                            $sheet->setCellValue($alphabeth[$k].$row, $value[$v['field']]);
                        }
                    }else{
                        $sheet->setCellValue($alphabeth[$k].$row, $value[$v['field']]);
                    }
                }
            }
            $row++;
        }

        $writer = new Xlsx($spreadsheet);
        $filename = "report_".time().".xlsx";
		try {
			$writer = new Xlsx($spreadsheet);
			$writer->save($filename);
			$content = file_get_contents($filename);
		} catch(Exception $e) {
			exit($e->getMessage());
		}
		
		header("Content-Disposition: attachment; filename=".$filename);
		unlink($filename);
		exit($content);
    }
}
