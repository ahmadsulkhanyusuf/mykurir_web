<?= $this->extend('template/default') ?>
<?= $this->section('content') ?>
<style>
    a {
        color: #7D7D7D;
        text-decoration: none;
        background-color: transparent;
        -webkit-text-decoration-skip: objects;
    }

    a:hover {
        color: #7D7D7D;
        text-decoration: none;
        background-color: transparent;
        -webkit-text-decoration-skip: objects;
    }

    .inforide {
        box-shadow: 1px 2px 8px 0px #b5b0b0;
        background-color: white;
        border-radius: 8px;
        height: 125px;
    }

    .rideone img {
        width: 70%;
    }

    .ridetwo img {
        width: 60%;
    }

    .ridethree img {
        width: 50%;
    }

    .rideone {
        background-color: #e91e63;
        padding-top: 25px;
        border-radius: 8px 0px 0px 8px;
        text-align: center;
        height: 125px;
        margin-left: 15px;
    }

    .ridetwo {
        background-color: #f5b453;
        padding-top: 30px;
        border-radius: 8px 0px 0px 8px;
        text-align: center;
        height: 125px;
        margin-left: 15px;
    }

    .ridethree {
        background-color: #0ddad1;
        padding-top: 35px;
        border-radius: 8px 0px 0px 8px;
        text-align: center;
        height: 125px;
        margin-left: 15px;
    }

    .fontsty {
        margin-right: -15px;
    }

    .fontsty h2 {
        color: #6E6E6E;
        font-size: 35px;
        margin-top: 15px;
        text-align: right;
        margin-right: 30px;
    }

    .fontsty h4 {
        color: #6E6E6E;
        font-size: 25px;
        margin-top: 20px;
        text-align: right;
        margin-right: 30px;
    }
</style>

<div class="row">
    <div class="col">
        <div class="card card-primary">
            <div class="card-body">
                <h3 class="card-title">
                    <?= $title ?>
                </h3>
                <div class="row pb-3">

                    <!-- Icon Cards-->
                    <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-2 mt-4">
                        <div class="inforide">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-4 col-4 rideone">
                                    <!-- <img src="https://vignette.wikia.nocookie.net/nationstates/images/2/29/WS_Logo.png/revision/latest?cb=20080507063620"> -->
                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-8 col-8 fontsty">
                                    <h4>Produk</h4>
                                    <h2><?= $data['jml']['produk'] ?></h2>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-2 mt-4">
                        <div class="inforide">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-4 col-4 ridetwo">
                                    <!-- <img src="https://vignette.wikia.nocookie.net/nationstates/images/2/29/WS_Logo.png/revision/latest?cb=20080507063620"> -->
                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-8 col-8 fontsty">
                                    <h4>Seller</h4>
                                    <h2><?= $data['jml']['seller'] ?></h2>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-2 mt-4">
                        <div class="inforide">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-4 col-4 ridethree">
                                    <!-- <img src="https://vignette.wikia.nocookie.net/nationstates/images/2/29/WS_Logo.png/revision/latest?cb=20080507063620"> -->
                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-8 col-8 fontsty">
                                    <h4>surveyor</h4>
                                    <h2><?= $data['jml']['surveyor'] ?></h2>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <h4 class="mt-5">Tren Komoditas</h4>
                <hr>
                <?= $filter1 ?>
                <div id="example">
                    <div class="demo-section k-content wide">
                        <div id="chart"></div>
                    </div>
                    <script>
                        kendo.culture("id-ID"); 
                        function createChart() {
                            $("#chart").kendoChart({
                                title: {
                                    text: "Tren Komoditas"
                                },
                                legend: {
                                    position: "bottom"
                                },
                                chartArea: {
                                    background: ""
                                },
                                seriesDefaults: {
                                    type: "line",
                                    style: "smooth"
                                },
                                series: <?php echo json_encode($data['series']) ?>,
                                valueAxis: {
                                    labels: {
                                        format: "c"
                                    },
                                    line: {
                                        visible: false
                                    },
                                    axisCrossingValue: 0
                                },
                                categoryAxis: {
                                    categories: <?php echo json_encode($data['category']) ?>,
                                    majorGridLines: {
                                        visible: false
                                    },
                                    labels: {
                                        rotation: "auto"
                                    }
                                },
                                tooltip: {
                                    visible: true,
                                    format: "",
                                    template: "#= series.name #: #= value #"
                                }
                            });
                        }

                        $(document).ready(createChart);
                        $(document).bind("kendo:skinChange", createChart);
                    </script>
                </div>
                <h4 class="mt-5">Tren Surveyor per Produk</h4>
                <hr>
                <?= $filter_tren_svy_prod ?>
                <div class="row">
                    <div class="col-lg-12 demo-section k-content wide">
                        <div id="trensurveyorproduk" style="width: 100%; height: 500px;"></div>
                        <script>
                            function createChart() {
                                $("#trensurveyorproduk").kendoChart({
                                    title: {
                                        text: "Tren Surveyor per Produk"
                                    },
                                    legend: {
                                        position: "bottom"
                                    },
                                    chartArea: {
                                        background: ""
                                    },
                                    seriesDefaults: {
                                        type: "column",
                                        style: "smooth"
                                    },
                                    series: <?= json_encode($svy_produk['series']) ?>,
                                    valueAxis: {
                                        labels: {
                                            format: "{0}"
                                        },
                                        line: {
                                            visible: false
                                        },
                                        axisCrossingValue: -10
                                    },
                                    categoryAxis: {
                                        categories: <?= json_encode($svy_produk['categoryAxis']) ?>,
                                        majorGridLines: {
                                            visible: false
                                        },
                                        labels: {
                                            rotation: "auto"
                                        }
                                    },
                                    tooltip: {
                                        visible: true,
                                        format: "{0}%",
                                        template: "#= series.name #: #= value #"
                                    }
                                });
                            }

                            $(document).ready(createChart);
                            // $(document).bind("kendo:skinChange", createChart);
                        </script>
                    </div>
                </div>
                <h4 class="mt-5">Tren Surveyor per Pedagang</h4>
                <hr>
                <?= $filter_tren_svy_seller ?>
                <div class="row">
                    <div class="col-lg-12 demo-section k-content wide">
                        <div id="trensurveyorpedagang" style="width: 100%; height: 500px;"></div>
                        <script>
                            function createChart() {
                                $("#trensurveyorpedagang").kendoChart({
                                    title: {
                                        text: "Tren Surveyor per Pedagang"
                                    },
                                    legend: {
                                        position: "bottom"
                                    },
                                    chartArea: {
                                        background: ""
                                    },
                                    seriesDefaults: {
                                        type: "column",
                                        style: "smooth"
                                    },
                                    series: <?= json_encode($svy_pedagang['series']) ?>,
                                    valueAxis: {
                                        labels: {
                                            format: "{0}"
                                        },
                                        line: {
                                            visible: false
                                        },
                                        axisCrossingValue: -10
                                    },
                                    categoryAxis: {
                                        categories: <?= json_encode($svy_pedagang['categoryAxis']) ?>,
                                        majorGridLines: {
                                            visible: false
                                        },
                                        labels: {
                                            rotation: "auto"
                                        }
                                    },
                                    tooltip: {
                                        visible: true,
                                        format: "{0}%",
                                        template: "#= series.name #: #= value #"
                                    }
                                });
                            }

                            $(document).ready(createChart);
                            // $(document).bind("kendo:skinChange", createChart);
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection() ?>