<?= $this->extend('template/default') ?>
<?= $this->section('content') ?>
<div class="row">
    <div class="col-sm-12">
        <div class="card card-primary">
            <div class="card-body">
                <h1 class="card-title mb-4">
                    <?= $title ?>
                    <a class="btn btn-warning btn-xs btn-raised float-right" href="<?= $url_back ?>"> <i class="k-icon k-i-arrow-chevron-left"></i>Kembali</a>
                </h1>
                <hr />
                <?php
                if (session()->getFlashdata('success')) {
                    echo '<div class="alert alert-success" role="alert">
									' . session()->getFlashdata('success') . '
						  		</div>';
                }
                ?>
                <?php
                if (session()->getFlashdata('danger')) {
                    echo '<div class="alert alert-danger" role="alert">
									' . session()->getFlashdata('danger') . '
						  		</div>';
                }
                ?>
                <?= $form ?>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection() ?>