<?= $this->extend('template/default') ?>
<?= $this->section('content') ?>
<div class="row">
    <div class="col-sm-12">
        <div class="card card-primary">
            <div class="card-body">
                <h1 class="card-title mb-4">
                    <?= $title ?>
                </h1>
                <hr/>

                <?= $search . $grid ?>
            </div>
        </div>
    </div>
</div>
<script>
    
</script>
<?= $this->endSection() ?>