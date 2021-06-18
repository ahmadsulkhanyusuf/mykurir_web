<div class="row">
    <div class="form-group col-sm-6">
        <label class="<?= $field['bar_cust_id']['class'] ?>"><?= $field['bar_cust_id']['title'] ?></label>
        <?= $field['bar_cust_id']['field'] ?>
    </div>
    <div class="form-group col-sm-6">
        <label class="<?= $field['bar_penerima']['class'] ?>"><?= $field['bar_penerima']['title'] ?></label>
        <?= $field['bar_penerima']['field'] ?>
    </div>
</div>
<div class="row">
    <div class="form-group col-sm-6">
        <label class="<?= $field['bar_berat']['class'] ?>"><?= $field['bar_berat']['title'] ?></label>
        <?= $field['bar_berat']['field'] ?>
    </div>
    <div class="form-group col-sm-6">
        <label class="<?= $field['bar_alamat']['class'] ?>"><?= $field['bar_alamat']['title'] ?></label>
        <?= $field['bar_alamat']['field'] ?>
    </div>
</div>
<div class="row">
    <div class="form-group col-sm-6">
        <label class="<?= $field['bar_catatan']['class'] ?>"><?= $field['bar_catatan']['title'] ?></label>
        <?= $field['bar_catatan']['field'] ?>
    </div>
    <div class="form-group col-sm-6">
        <label class="<?= $field['bar_kec_tujuan']['class'] ?>"><?= $field['bar_kec_tujuan']['title'] ?></label>
        <?= $field['bar_kec_tujuan']['field'] ?>
    </div>
</div>
<div class="row">
    <div class="form-group col-sm-6">
        <label class="<?= $field['bar_harga']['class'] ?>"><?= $field['bar_harga']['title'] ?></label>
        <?= $field['bar_harga']['field'] ?>
    </div>
    <div class="form-group col-sm-6">
        <label class="<?= $field['bar_penerima_no_hp']['class'] ?>"><?= $field['bar_penerima_no_hp']['title'] ?></label>
        <?= $field['bar_penerima_no_hp']['field'] ?>
    </div>
</div>

<?= $submit_btn . $cancel_btn ?>
<script type="text/javascript">
    function cancel_filter() {
        <?= $cancel_action ?>
    }
</script>