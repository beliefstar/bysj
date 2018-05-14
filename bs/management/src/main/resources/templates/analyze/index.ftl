


<link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker-bs3.css">
<style>
    #pieChartLegend, #areaChartLegend {
        position: absolute;
        top: 50px;
        left: 10px;
        list-style: none;
        margin: 0;
        padding: 0;
    }
    #pieChartLegend li, #areaChartLegend li {
        margin-bottom: 5px;
        width: 80px;
        height: 25px;
        color: #fff;
        font-size: 12px;
        text-align: center;
        line-height: 25px;
    }
    #areaChartLegend {
        right: 10px;
        left: auto;
        top: 10px;
    }
</style>

<div class="row">
    <div class="col-md-12">
        <!-- AREA CHART -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">入职、离职率</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
                <br>
                <div class="form-group margin">
                    <label class="col-sm-2 control-label" for="reservation">选择时间:</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <input type="text" name="timeRange" class="form-control pull-right" id="reservation" value="${timeRange}">
                        </div>
                    </div>
                    <!-- /.input group -->
                </div>
            </div>
            <div class="box-body">
                <div class="chart">
                    <canvas id="areaChart" style="height:250px"></canvas>
                    <ul id="areaChartLegend"></ul>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->

    </div>
    <div class="col-md-6">
        <!-- AREA CHART -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">入职数据</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <table class="table table-hover">
                    <tr>
                        <th>编号</th>
                        <th>时间</th>
                        <th>入职人数</th>
                    </tr>
                    <tbody>
                        <#list inLevel as item>
                            <tr>
                                <td>${item_index + 1}</td>
                                <td>${itemLabel[item_index]}</td>
                                <td>${item.docCount}</td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->

    </div>
    <div class="col-md-6">
        <!-- AREA CHART -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">离职数据</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <table class="table table-hover">
                    <tr>
                        <th>编号</th>
                        <th>时间</th>
                        <th>入职人数</th>
                    </tr>
                    <tbody>
                        <#list outLevel as item>
                        <tr>
                            <td>${item_index + 1}</td>
                            <td>${itemLabel[item_index]}</td>
                            <td>${item.docCount}</td>
                        </tr>
                        </#list>
                    </tbody>
                </table>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->

    </div>
</div>
<script src="/plugins/daterangepicker/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/plugins/chartjs/Chart.min.js"></script>

<script>

    $('#reservation').daterangepicker();

    $(function () {

        $('#reservation').change(function () {
            var range = $(this).val();

            showLab('/analyze/probability?timeRange=' + range);
        });

        /* ChartJS
         * -------
         * Here we will create a few charts using ChartJS
         */
        // Get context with jQuery - using jQuery's .get() method.
        var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
        var areaChart = new Chart(areaChartCanvas);

        var areaChartData = {
            labels: [
                <#list itemLabel as item>
                    "${item}"
                    <#if item_has_next>
                            ,
                    </#if>
                </#list>
            ],
            datasets: [
                {
                    label: "入职率",
                    fillColor: "rgba(60,141,188,0.1)",
                    strokeColor: "rgba(60,141,188,0.8)",
                    pointColor: "#3b8bba",
                    pointStrokeColor: "rgba(60,141,188,1)",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(60,141,188,1)",
                    data:
                    [
                        <#list inLevel as item>
                            ${item.docCount}
                            <#if item_has_next>
                                ,
                            </#if>
                        </#list>
                    ]
                },
                {
                    label: "离职率",
                    fillColor: "rgba(210, 214, 222, 0.1)",
                    strokeColor: "rgba(210, 214, 222, 1)",
                    pointColor: "rgba(210, 214, 222, 1)",
                    pointStrokeColor: "#c1c7d1",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: [
                        <#list outLevel as item>
                            ${item.docCount}
                            <#if item_has_next>
                                ,
                            </#if>
                        </#list>
                    ]
                }
            ]
        };

        var areaChartOptions = {
            //Boolean - If we should show the scale at all
            showScale: true,
            //Boolean - Whether grid lines are shown across the chart
            scaleShowGridLines: false,
            //String - Colour of the grid lines
            scaleGridLineColor: "rgba(0,0,0,.05)",
            //Number - Width of the grid lines
            scaleGridLineWidth: 1,
            //Boolean - Whether to show horizontal lines (except X axis)
            scaleShowHorizontalLines: true,
            //Boolean - Whether to show vertical lines (except Y axis)
            scaleShowVerticalLines: true,
            //Boolean - Whether the line is curved between points
            bezierCurve: true,
            //Number - Tension of the bezier curve between points
            bezierCurveTension: 0.3,
            //Boolean - Whether to show a dot for each point
            pointDot: true,
            //Number - Radius of each point dot in pixels
            pointDotRadius: 4,
            //Number - Pixel width of point dot stroke
            pointDotStrokeWidth: 1,
            //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
            pointHitDetectionRadius: 20,
            //Boolean - Whether to show a stroke for datasets
            datasetStroke: true,
            //Number - Pixel width of dataset stroke
            datasetStrokeWidth: 2,
            //Boolean - Whether to fill the dataset with a color
            datasetFill: true,
            //String - A legend template
            legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
            //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
            maintainAspectRatio: true,
            //Boolean - whether to make the chart responsive to window resizing
            responsive: true
        };

        areaChart.Line(areaChartData, areaChartOptions);

        $.each(areaChartData.datasets, function (k, v) {
            var pieHtml = "<li style=\"background-color: " + v.pointColor + "\">" + v.label +  "</li>";
            $("#areaChartLegend").append(pieHtml);
        })
    });
</script>