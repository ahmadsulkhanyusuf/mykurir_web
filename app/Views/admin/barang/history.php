<?= $this->extend('template/default') ?>
<?= $this->section('content') ?>
<div class="row">
    <div class="col-sm-12">
        <div class="card card-primary">
            <div class="card-header">
                <h1><?= $header->bar_kode ?></h1>
            </div>
            <div class="card-body">
                <div class="row">

                    <div class="col">
                        Dari:
                        </br>
                        <?= $header->alamat_dari ?>
                        </br>
                        </br>

                        Untuk:
                        </br>
                        <?= $header->alamat_untuk ?>
                        </br>

                    </div>
                    <div class="col">

                        Berat(Kg):
                        </br>
                        <?= $header->bar_berat ?> 
                        </br>

                        Harga:
                        </br>
                        <?= 'Rp. '.number_format($header->bar_harga,0) ?>
                        </br>

                        Catatan:
                        </br>
                        <?= $header->bar_catatan ?>

                    </div>
                </div>
            </div>
        </div>

        <div class="card card-primary">
            <div class="card-body">
                <div id="timeline"></div>
                <script>
                    $(document).ready(function() {
                        $("#timeline").kendoTimeline({
                            orientation: "vertical", // Define the layout of the widget.
                            alterMode: true, // Render the events on both sides of the axis in the vertical mode.
                            collapsibleEvents: false, // Start all collapsed events in the vertical mode.
                            dataSource: {
                                data: eventsData, // Defined later in this snippet.
                                schema: {
                                    model: {
                                        fields: {
                                            date: {
                                                type: "date"
                                            },
                                        }
                                    }
                                }
                            }
                        });
                    });

                    // The literals in this example use the default field names the widget takes.
                    var eventsData = <?= $data ?>;
                </script>
            </div>
        </div>
    </div>
</div>
<script>

</script>
<?= $this->endSection() ?>