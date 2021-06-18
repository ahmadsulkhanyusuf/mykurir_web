<?php
$index = 0;
foreach ($field as $key => $value) {
    if($value['type']=='hidden'){
        echo $value['field'];
    }else{
        if($index%2==0){
            if($index!=0){
                echo '</div>';
            }
            echo '<div class="row">';
        }
    ?>
        <div class="form-group col-sm-6">
            <label class="<?= $value['class']?>"><?= $value['title']?></label>
            <?= $value['field']?>
        </div>
<?php 
    }
    $index++;
}?>
</div>
<?= $submit_btn . $cancel_btn?>
<script type="text/javascript">
    function cancel_filter() {
        <?= $cancel_action?>
    }
</script>