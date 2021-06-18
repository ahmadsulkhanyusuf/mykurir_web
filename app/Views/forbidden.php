<?= $this->extend('template/default') ?>
<?= $this->section('content') ?>
<div class="row">
    <div class="col-sm-12">
        <div class="card card-primary">
            <div class="card-body">
                <center>
                    <img src="<?= base_url("assets/images/stop.jpg")?>"/>
                    <img src="<?= base_url("assets/images/forbidden.jpg")?>"/>
                </center>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection() ?>