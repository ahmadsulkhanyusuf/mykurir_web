<?php
namespace App\Libraries\SmartComponent;

class Form{
    protected $template  = 'template/default_smart_form';
    protected $fields    = array();
    protected $attribute_form = '';
    protected $resume    = false;
    protected $form_action = '';
    protected $submit_label = 'Simpan';
    protected $submit_icon  = 'k-icon k-i-save';
    protected $submit_class = 'btn btn-primary btn-raised';
    protected $submit_name  = 'submit';
    protected $cancel_button= false;
    protected $cancel_label = 'Cancel';
    protected $cancel_icon  = 'k-icon k-i-cancel';
    protected $cancel_class = 'btn btn-warning btn-raised ml-1';
    protected $cancel_name  = 'cancel';
    protected $cancel_type  = 'button';
    protected $cancel_onclick  = 'cancel_filter()';
    protected $cancel_action  = '';
    protected $tag_start_resume = '<p>';
    protected $tag_end_resume = '</p>';
    protected $data = array();

    protected $form_method  = 'POST';
    protected $form_type  = 'input';

    public function __construct()
    {
        $this->db = \Config\Database::connect();
    }

    public function set_template_column($number)
    {
        if($number==2){
            $this->template  = 'template/default_smart_form_two_column';
        }
        return $this;
    }

    public function set_form_action($action)
    {
        $this->form_action = $action;
        return $this;
    }

    public function set_submit_name($submit_name)
    {
        $this->submit_name = $submit_name;
        return $this;
    }

    public function set_resume($resume)
    {
        $this->resume = $resume;
        return $this;
    }

    public function set_form_type($type)
    {
        if($type=="search"){
            $this->template = 'template/default_smart_search';
            $this->submit_icon = 'k-icon k-i-search';
            $this->set_cancel_button(true);
            $this->set_submit_label('Cari');
            $this->set_cancel_action("window.location.href='" . base_url(uri_string()) . "';");
            $this->cancel_label = 'Reset';
        }
        $this->form_type = $type;
        return $this;
    }

    public function set_attribute_form($attribute_form)
    {
        $this->attribute_form = $attribute_form;
        return $this;
    }

    public function set_submit_class($class)
    {
        $this->submit_class = $class;
        return $this;
    }

    public function set_submit_icon($icon)
    {
        $this->submit_icon = $icon;
        return $this;
    }

    public function set_submit_label($label)
    {
        $this->submit_label = $label;
        return $this;
    }

    public function set_template($template, $data=array())
    {
        $this->template = $template;
        $this->data = $data;
        return $this;
    }

    public function set_form_method($method)
    {
        $this->form_method = $method;
        return $this;
    }

    public function set_cancel_button($show)
    {
        $this->cancel_button = $show;
        return $this;
    }

    public function set_cancel_action($js)
    {
        $this->cancel_action = $js;
        return $this;
    }

    public function add($name, $title, $type, $required, $value='', $extraAttribute = '', $attribute_select = array())
    {
        if($this->resume){
            $this->generate_resume($name, $title, $type, $required, $value, $extraAttribute, $attribute_select);
            return $this;
        }

        $field = '';
        if(strtolower($this->form_method)=='post'){
            $method = $_POST;
        }else{
            $method = $_GET;
        }
        if(isset($method[$this->submit_name])){
            if($type!='file'){
                $value = $method[$name];
            }
        }

        if($type=='text'){
            $field = '<input type="text" class="k-textbox" name="'.$name.'" id="'.$name.'" value="'.$value.'" '.$extraAttribute.' />';
        }else if($type=='hidden'){
            $field = '<input type="hidden" name="'.$name.'" value="'.$value.'" '.$extraAttribute.' />';
        }else if($type=='password'){
            $field = '<input type="password" class="k-textbox" name="'.$name.'" id="'.$name.'" value="'.$value.'" '.$extraAttribute.' />';
        }else if($type=='textArea'){
            $field = '<textarea placeHolder="" class="form-control" name="'.$name.'" id="'.$name.'" '.$extraAttribute.'>'.$value.'</textarea>';
        }else if($type=='number'){
            $extraJS = '';
            if(isset($attribute_select['autofocus'])){
                $extraJS = '$("#'.$name.'").data("kendoNumericTextBox").focus();';
            }
            $field = '<input id="'.$name.'" name="'.$name.'" value="'.$value.'" type="number" '.$extraAttribute.' /><script type="text/javascript">$(document).ready(function(){$("#'.$name.'").kendoNumericTextBox({decimals:0,format:"n0",min:0}); '.$extraJS.'});</script>';
        }else if($type=='date'){
            $field = '<input name="'.$name.'" id="'.$name.'" value="'.$value.'" '.$extraAttribute.' />
            <script type="text/javascript">$(document).ready(function(){$("#'.$name.'").kendoDatePicker({format:"yyyy-MM-dd", parseFormat:["yyyy-mm-dd", "d m yyyy", "d m y", "dd/mm/yyyy", "dd MM yyyy", "dd-MM-yyyy", "d MM yyyy", "dd MMM yyyy"]  });});</script>
            ';
        }else if($type=='month'){
            $field = '<input name="'.$name.'" id="'.$name.'" value="'.$value.'" '.$extraAttribute.' />
            <script type="text/javascript">$(document).ready(function(){$("#'.$name.'").kendoDatePicker({start: "year", depth: "year", format: "yyyy-MM", dateInput: true});});</script>
            ';
        }else if($type=='file'){
            $field = '<input type="file" name="'.$name.'" value="'.$value.'" '.$extraAttribute.'/>';
            if($value!=''){
                $field .= '<a target="_new" href="'.$value.'">Lihat File</a>';
            }
        }else if($type=='select'){
            $option = '<option value="">Pilih</option>';
            $where = '  ';
            if(isset($attribute_select['where'])){
                $where .= ' where ' . $attribute_select['where'];
            }
            
            $order_by = '';
            if(isset($attribute_select['sort'])){
                $order_by .= ' order by ' . $attribute_select['sort'];
            }

            $data = $this->db->query("select ".$attribute_select['id']." as id, ".$attribute_select['label']." as label from ".$attribute_select['table'] . $where . $order_by)->getResult('array');
            foreach ($data as $key => $v) {
                $selected = ($value==$v['id']) ? 'selected="selected"' : "";
                $option .= '<option '.$selected.' value="'.$v['id'].'">'.$v['label'].'</option>';
            }

            $field = '<select name="'.$name.'" id="'.$name.'" '.$extraAttribute.'>'.$option.'</select><script type="text/javascript">$(document).ready(function(){$("#'.$name.'").kendoComboBox({placeholder: "Please select", delay: 50, filter:"contains", suggest:false });});</script>';
        }
        else if($type == 'select_custom'){
            $option = '';
            if(isset($attribute_select['no_option'])){
                if($attribute_select['no_option']){
                    $option = '<option  value="">Semua</option>';
                }
            }
            foreach ($attribute_select['option'] as $key => $v) {
                $selected = ($value==$v['id']) ? 'selected="selected"' : "";
                $option .= '<option '.$selected.' value="'.$v['id'].'">'.$v['label'].'</option>';
            }

            $field = '<select name="'.$name.'" id="'.$name.'" '.$extraAttribute.'>'.$option.'</select><script type="text/javascript">$(document).ready(function(){$("#'.$name.'").kendoComboBox({placeholder: "Please select", delay: 50, filter:"contains", suggest:false });});</script>';
        }else if($type=='autoComplete'){
            $js = '<script type="text/javascript">$(document).ready(function(){var ds_auto_complete_'.$name.' = new kendo.data.DataSource({ serverFiltering: true, transport: {read: {url     : "'.$attribute_select['url'].'",type    : "GET",dataType: "json"}, parameterMap: function (data, type) {return { filter: $("#'.$name.'").val() };}},schema   : {model: {id    : "id",fields: {id  : { type: "id" },value: { type: "string" }}}}});var autoComplete = $("#'.$name.'").kendoAutoComplete({filtering: function (e) {if (!e.filter.value) {e.preventDefault();}}, change: function(e) {this.dataSource.read();}, ignoreCase: false, minLength      : 3,dataSource     : ds_auto_complete_'.$name.', dataTextField  : "value"}).data("kendoAutoComplete");});</script>';

            $field = '<input type="text" id="'.$name.'" name="'.$name.'" '.$extraAttribute.' />'.$js;
        }else if($type == 'selectServerFiltering'){
            $js = '

            <script type="text/javascript">$(document).ready(function () {$("#'.$name.'").kendoComboBox({ dataSource: { type: "json", serverFiltering: true, schema: { total: function (record) { return record.total; }, data: function (record) { return record.data; }, model: { id: "id", fields: { "id": { type: "string" }, "value": { type: "string" } } }, }, transport: { read: { url: "'.$attribute_select['url'].'", dataType: "json", data: { q: function () { var tmp = $("#'.$name.'").data("kendoComboBox"); return tmp.value(); }} } } }, minLength: 3, autoBind: true, open: function (e) { var tmp = $("#'.$name.'").data("kendoComboBox"); tmp.dataSource.read(); }, dataBound: function (e) { }, filter: "contains", dataValueField: "id", dataTextField: "value", placeholder: "Ketik min. 3 huruf"});}); </script>

            ';

            $field = '<input type="text" id="'.$name.'" name="'.$name.'" '.$extraAttribute.' />'.$js;
        } else if($type=='select_multiple'){
            $option = '';
            $where = '  ';
            if(isset($attribute_select['where'])){
                $where .= ' where ' . $attribute_select['where'];
            }
            
            $order_by = '';
            if(isset($attribute_select['sort'])){
                $order_by .= ' order by ' . $attribute_select['sort'];
            }

            $data = $this->db->query("select ".$attribute_select['id']." as id, ".$attribute_select['label']." as label from ".$attribute_select['table'] . $where . $order_by)->getResult('array');
            foreach ($data as $key => $v) {
                $selected = (in_array($v['id'], $value)) ? 'selected="selected"' : '';
                $option .= '<option '.$selected.' value="'.$v['id'].'">'.$v['label'].'</option>';
            }

            $field = '<select name="'.$name.'[]" id="'.$name.'" '.$extraAttribute.' multiple="multiple">'.$option.'</select><script type="text/javascript">$(document).ready(function(){$("#'.$name.'").kendoMultiSelect({autoClose: false,placeholder: "Please select"}).data("kendoMultiSelect");});</script>';
        }else if($type='slider'){
            $js = '<script type="text/javascript">$("#'.$name.'").kendoSlider({increaseButtonTitle: "Right",decreaseButtonTitle: "Left",min: '.$attribute_select['min'].',max: '.$attribute_select['max'].',smallStep: '.$attribute_select['smallStep'].',largeStep: '.$attribute_select['largeStep'].'}).data("kendoSlider");</script>';
            $field = '<input name="'.$name.'" id="'.$name.'" value="'.$value.'" '.$extraAttribute.' />'.$js;
        }
        
        if($required){
            $title .= ' <i class="k-icon k-i-warning"></i>';
        }

        // if($this->resume){
        //     $field = '<p>'.$value.'</p>';
        // }

        $this->fields[$name]= array('title'=>$title, 'field'=>$field, 'required'=> $required, 'class'=>'' ,'type'=> $type);
        return $this;
    }

    public function generate_resume($name, $title, $type, $required, $value, $extraAttribute, $attribute_select)
    {
        $field = '';

        if($type=='text'){
            $field = $this->tag_start_resume . $value . $this->tag_end_resume;
        }else if($type=='hidden'){
            $field = '<input type="hidden" name="'.$name.'" value="'.$value.'" '.$extraAttribute.' />';
        }else if($type=='password'){
            $field = '<input type="password" class="k-textbox" name="'.$name.'" id="'.$name.'" value="'.$value.'" '.$extraAttribute.' />';
        }else if($type=='textArea'){
            $field = $this->tag_start_resume . $value . $this->tag_end_resume;
        }else if($type=='number'){
            $field = $this->tag_start_resume . number_format($value,0,'',',')  . $this->tag_end_resume;
        }else if($type=='date'){
            $field = $this->tag_start_resume . $value . $this->tag_end_resume;
        }else if($type=='month'){
            $field = $this->tag_start_resume . $value . $this->tag_end_resume;
        }else if($type=='file'){
            $field = $this->tag_start_resume . '<a href="'.$value.'" target="_new" '.$extraAttribute.'>Lihat File</a>' . $this->tag_end_resume;
        }else if($type=='select'){
            if($value!=''){
                $data = $this->db->query("select ".$attribute_select['id']." as id, ".$attribute_select['label']." as label from ".$attribute_select['table'] . " where " . $attribute_select['id'] . " = '".$value."'")->getRowArray();
            }else{
                $data['label'] = '';
            }
            $field = $this->tag_start_resume . $data['label'] . $this->tag_end_resume;
        }
        else if($type=='select_custom'){
            foreach ($attribute_select['option'] as $key => $v) {
                // $selected = ($value==$v['id']) ? 'selected="selected"' : "";
            }

            $field = $this->tag_start_resume . $value . $this->tag_end_resume;
        }else if($type=='autoComplete'){
            $field = $this->tag_start_resume . $value . $this->tag_end_resume;
        }else if($type == 'selectServerFiltering'){
            $field = $this->tag_start_resume . $value . $this->tag_end_resume;
        } else if($type=='select_multiple'){
            $field = $this->tag_start_resume . $value . $this->tag_end_resume;
        }else if($type='slider'){
            $field = $this->tag_start_resume . number_format($value,0,'',',' ) . $this->tag_end_resume;
        }

        $this->fields[$name]= array('title'=>$title, 'field'=>$field, 'required'=> $required, 'class'=>'' ,'type'=> $type);
        return $this;
    }

    public function output($status=null, $message = null)
    {
        if($this->resume){
            $submit_button = '';
        }else{
            $submit_button = '<button type="submit" name="'.$this->submit_name.'" class="'.$this->submit_class.'"><i class="'.$this->submit_icon.'"></i> '.$this->submit_label.'</button>';
        }
        $cancel_button = '';
        if($this->cancel_button){
            $cancel_button = '<button onclick="'.$this->cancel_onclick.'" type="'.$this->cancel_type.'" name="'.$this->cancel_name.'" class="'.$this->cancel_class.'"><i class="'.$this->cancel_icon.'"></i> '.$this->cancel_label.'</button>';
        }

        $view = view($this->template, array('field' => $this->fields, 'submit_btn'=> $submit_button, 'cancel_btn'=> $cancel_button,'cancel_action'=>$this->cancel_action, 'data'=> $this->data));

        $alert = '';
        if($status!=null){
            if($status == 'success'){
                $alert = '<div class="alert alert-success" role="alert">'.$message.'</div>';
            }
            if($status == 'danger'){
                $alert = '<div class="alert alert-danger" role="alert">'.$message.'</div>';
            }
            if($status == 'warning'){
                $alert = '<div class="alert alert-warning" role="alert">'.$message.'</div>';
            }   
        }
        
        $this->fields = array();

        $form = $alert . '<form action="'.$this->form_action.'" autocomplete="off" method="'.$this->form_method.'" '.$this->attribute_form.'>'.$view.'</form>';
        return $form;
    }

    public function formVerified()
    {
        if(strtolower($this->form_method)=='post'){
            $method = $_POST;
        }else{
            $method = $_GET;
        }
        if(isset($method[$this->submit_name])){
            $return = true;
            foreach($this->fields as $key=> $value){
                if($value['type']=='file'){
                    if($value['required']){
                        if($_FILES[$key]['name']==''){
                            $this->fields[$key]['class'] = 'red';
                            $return = false;
                        }
                    }
                }else{
                    if($value['required']){
                        if($method[$key]==''){
                            $this->fields[$key]['class'] = 'red';
                            $return = false;
                        }
                    }
                }
            }
            return $return;
        }else{
            return false;
        }
    }

    public function get_data()
    {
        $data = array();
        if(strtolower($this->form_method)=='post'){
            $method = $_POST;
        }else{
            $method = $_GET;
        }

        foreach($this->fields as $key => $value){
            if($value['type']!='file'){
                if($value['type']=='select_multiple'){
                    $data[$key] = implode(",",$method[$key]);
                }else{
                    $data[$key] = html_entity_decode($method[$key]);
                }
            }
        }
        return $data;
    }

}