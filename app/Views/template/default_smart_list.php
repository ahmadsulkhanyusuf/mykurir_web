<div class="row">
    <div class="col-sm-12">
        <?= $title ?>
    </div>
</div>
<div class="row listView" id="listview_<?= $id ?>">
</div>
<div id="pager_<?= $id ?>" class="k-pager-wrap"></div>
<script type="text/x-kendo-template" id="template_<?= $id ?>">
    <?= $template ?>
</script>
<script>
    $(document).ready(function($) {
        var dataSource_<?= $id ?> = new kendo.data.DataSource({
            serverPaging: true,
            pageSize: <?= $datasource['pageSize'] ?>,
            page: 1,
            schema: {
                total: "total",
                data: "result"
            },
            transport: {
                read: {
                    url: "<?= $datasource['url'] ?>",
                    dataType: "json"
                }
            }
        });

        $("#pager_<?= $id ?>").kendoPager({
            dataSource: dataSource_<?= $id ?>
        });

        $("#listview_<?= $id ?>").kendoListView({
            dataSource: dataSource_<?= $id ?>,
            template: kendo.template($("#template_<?= $id ?>").html())
        });
    })

    function <?= $reload_jsf?>(){
        $("#listview_<?= $id ?>").data("kendoListView").dataSource.read();
    }
</script>
<style>
    .list {
        float: left;
        position: relative;
    }
    .k-widget{
        border-style : none !important;
        background : none !important;
    }
    .k-listview{
        flex-flow : wrap !important;
    }
</style>