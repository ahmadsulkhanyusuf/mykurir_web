<?php
foreach ($field as $key => $value) {
    if($value['type']=='hidden'){
        echo $value['field'];
    }else{?>
        <div class="form-group">
            <div class="row align-center">
                <div class="col-sm-2">
                    <label class=""><?= $data['kecamatan']?></label>
                </div>
                <div class="col-sm-1">
                    <b>-></b>
                </div>
                <div class="col-sm-2">
                    <label class=""><?= $value['title']?></label>
                </div>
                <div class="col-sm-7">
                    <?= $value['field']?>
                </div>
            </div>
        </div>
<?php }}?>
<?= $submit_btn . $cancel_btn?>