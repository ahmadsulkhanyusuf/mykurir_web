<?= $this->extend('template/default_popup') ?>
<?= $this->section('title') ?>
<?= $title ?>
<?= $this->endSection() ?>
<?= $this->section('content') ?>
<div class="row">
    <div class="col-sm-12">
        <div class="card card-primary">
            <div class="card-body">
                <h1 class="card-title mb-4">
                    <?= $title ?>
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