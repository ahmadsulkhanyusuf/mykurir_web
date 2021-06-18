<?php
$session = service('session');

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>D'KURIR</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="<?= base_url("/assets/bs-material.min.css"); ?>">

	<link rel="stylesheet" href="<?= base_url("/assets/material.css"); ?>" />


	<!-- <link rel="stylesheet" href="<?= base_url("/assets/kendo/styles/kendo.common.min.css") ?>" /> -->
	<!-- <link rel="stylesheet" href="<?= base_url("/assets/kendo/styles/kendo.default.min.css") ?>" /> -->
	<link rel="stylesheet" href="<?= base_url("/assets/kendo/styles/kendo.default.mobile.min.css") ?>" />

	<script src="<?= base_url("/assets/kendo/js/jquery.min.js") ?>"></script>
	<script src="<?= base_url("/assets/kendo/js/kendo.all.min.js") ?>"></script>
	<!-- <script src="<?= base_url("/assets/kendo/js/kendo.web.min.js") ?>"></script> -->
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

		function showForm(setWidth, setHeight, windowName, URL) {

			var w = window.screen.availWidth;
			var h = window.screen.availHeight;

			var leftPos = (w - setWidth) / 2,
				topPos = ((h - setHeight) / 2) - 50;
			setHeight += 50;
			eval(windowName + " = window.open('" + URL + "','" + windowName + "', 'toolbar=0,scrollbars=1,location=0,statusbar=1,menubar=0,resizable=0,width=" + setWidth + ",height=" + setHeight + ",left = " + leftPos + ",top = " + topPos + "');");
		}
	</script>

	<style>
		.bg-light {
			background-color: #D50000 !important;
		}

		.navbar-light .navbar-brand,
		.navbar-light .navbar-brand:focus,
		.navbar-light .navbar-brand:hover {
			color: white !important;
		}

		.navbar-light .navbar-nav .nav-link {
			color: white !important;
		}

		.dropdown-menu {
			color: white !important;
			background-color: #D50000 !important;
		}

		.dropdown-item {
			color: #ffffff;
		}

		.dropdown-menu .dropdown-item.active,
		.dropdown-menu .dropdown-item:active {
			background-color: #D50000 !important;
		}

		.material-icons {
			font-size: 20px;
			line-height: 0.75;
		}

		li.nav-item {
			padding-left: 15px;
			padding-right: 15px;
		}

		li.k-current-page {
			display: none;
		}

		.red {
			color: red;
		}
	</style>
</head>

<body>
	<navigation class="fixed-top">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<!-- <a class="navbar-brand ml-1" href="<?= base_url("admin") ?>"> MODAL BERGILIR</a> -->
			<a class="navbar-brand ml-1" href="<?= base_url("admin/pengajuan") ?>"><img src="<?= base_url("assets/images/logo.png")?>" width=30"/> D'KURIR</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<?= view_cell('\App\Libraries\Navigation::menu') ?>
				<ul class="navbar-nav ml-auto nav-flex-icons">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-55" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-user"></i> <?= $session->get('user')['user_name']?>
							<img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-2.jpg" width="30" class="rounded-circle z-depth-0" alt="avatar image">
						</a>
						<div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
							<a class="dropdown-item" href="<?= base_url('login/logout') ?>">Log out</a>
						</div>
					</li>
				</ul>
			</div>
		</nav>
		<nav id="breadcrumb"></nav>
	</navigation>

	<div class="container mt-5 pt-5 mb-3">
		<?= $this->renderSection('content') ?>
	</div>
</body>

</html>