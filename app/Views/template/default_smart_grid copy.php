<?php
$toolbarComponent = '';
if(!empty($head_left)){
    foreach($head_left as $key=> $value){
        if($key=='add'){
            $toolbarComponent .= ' <a class="btn btn-sm  btn-raised btn-primary float-right mr-1" href="'.$value.'"><i class="k-icon k-i-plus"></i> '.$label_add.'</a> ';
        }
    }
}

if(!empty($toolbar)){
    foreach($toolbar as $key=> $value){
        if($key=='download'){
            $toolbarComponent .= ' <a target="_blank" class="btn btn-sm btn-raised btn-success float-right mr-1" href="'.$download_url.'"><i class="k-icon k-i-download"></i> Download</a> ';
        }
    }
}
?>
<div class="row">
    <div class="col-sm-12">
        <div id="grid_<?= $grid_name?>"></div>
    </div>
</div>

<script id="responsive-column-template" type="text/x-kendo-template">
    <?php
    $items ='';
    foreach($grid_columns as $key => $value){
        if(isset($value['field']))
        {
            if($value['title']!='&nbsp'){
                $items .= '<strong>'.$value['title'].'</strong><p class="col-template-val">#=data.'.$value['field'].'#</p>';
            }else{
                $items .= '<span class="col-template-val mr-3">#=data.'.$value['field'].'#</span>';
            }
        }
    }
    echo $items;
    ?>
</script>

<style>
    .col-template-val {
        margin: 0 0 1em .5em;
    }
</style>
<?php
$columns = json_encode($grid_columns);
$re = '/"template":"kendo.template(.*?)",/mi';
$columns = preg_replace($re, '"template":kendo.template$1,', $columns);
?>
<script type="text/javascript">
    var ds_<?= $datasouce_name?>;
    var grid_<?= $grid_name?>;

    function <?= $gridReload?>{        
        ds_<?= $datasouce_name?>.read();
    }

    $(document).ready(function ($) {
        ds_<?= $datasouce_name?> = new kendo.data.DataSource({
            pageSize: <?= $pageSize?>,
            serverAggregates: false,
            serverFiltering: false,
            serverGrouping: false,
            serverPaging: true,
            serverSorting: true,
            autoSync: true,
            schema: {
                total: "total",
                data: "result",
                aggregates: "aggregate",
                errors: "error",
                groups: "group",
                model: {
                    id: "id",
                    fields: <?= json_encode($fields)?>,
                },
                type: "json"
            },
            transport: {
                read: {
                    url: "<?= $datasouce_url?>",
                data: {
                    wSQL: 1,
                    q: function () {
                        return $("#elh_sgk694_searchbox").val();
                    }
                },
                dataType: "json"
            }
        }
    });

    grid_<?= $grid_name?> = $("#grid_<?= $grid_name?>").kendoGrid({
        dataSource: ds_<?= $datasouce_name?>,
        // height: "<?= $grid_height?>",
        scrollable : false,
        groupable: false,
        toolbar: '<?= $toolbarComponent . $toolbarHtml?>',
        sortable: {
            mode: "multiple",
            allowUnsort: true,
            showIndexes: true
        },
        selectable: "row",
        pageable: {
            refresh: true,
            pageSizes: true,
            buttonCount: 5
        },
        columns: <?= $columns?>
    });
});
</script>