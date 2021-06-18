<?php
$session = service('session');

?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>MODAL BERGILIR</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="<?= base_url("/assets/bs-material.min.css"); ?>">

	<link rel="stylesheet" href="<?= base_url("/assets/material.css"); ?>" />

	<link rel="stylesheet" href="<?= base_url("/assets/kendo/styles/kendo.default.mobile.min.css") ?>" />

	<script src="<?= base_url("/assets/kendo/js/jquery.min.js") ?>"></script>
	<script src="<?= base_url("/assets/kendo/js/kendo.all.min.js") ?>"></script>
	<script src="<?= base_url("/assets/kendo/js/cultures/kendo.culture.id-ID.min.js") ?>"></script>

	<script src="<?= base_url("/assets/bootstrap/js/bootstrap.min.js") ?>"></script>
	<script src="<?= base_url("/assets/app.js") ?>"></script>
	<script>
		function confirm_delete(url, id, clb) {
			if (confirm("Yakin ingin menghapus data ini?")) {
				$.post(url, {
					'id': id
				}, function(result) {
					clb(result);
				}, 'json');
			}
		}
	</script>


</head>

<body>
	<nav class="navbar navbar-light bg-primary">
		<a class="navbar-brand text-white"><?= $this->renderSection('title') ?></a>
	</nav>
	<div class="container-fluid mt-5">
		<?= $this->renderSection('content') ?>
	</div>
</body>

</html>