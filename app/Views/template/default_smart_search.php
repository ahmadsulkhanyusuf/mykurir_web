<div class="form-row">
    <?php
    foreach ($field as $key => $value) {
        if($value['type']=='hidden'){
            echo $value['field'];
        }else{?>
            <div class="form-group col-sm-3">
                <label class="<?= $value['class']?>"><?= $value['title']?></label>
                <?= $value['field']?>
            </div>
    <?php }}?>
    <div class="form-group col-sm-3 pt-4">
        <?= $submit_btn . $cancel_btn?>
    </div>
</div>
<script type="text/javascript">
    function cancel_filter() {
        <?= $cancel_action?>
    }
</script>