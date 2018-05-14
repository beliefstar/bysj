


<link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker-bs3.css">
<style>
    #pieChartLegend {
        position: absolute;
        top: 120px;
        left: 10px;
        list-style: none;
        margin: 0;
        padding: 0;
    }
    #pieChartLegend li {
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
    <div class="col-md-6">


        <!-- DONUT CHART -->
        <div class="box box-danger">
            <div class="box-header with-border">
                <h3 class="box-title">考勤数据分析</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
                <br>
                <div class="col-sm-6">
                    选择时间:
                    <div class="form-group">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" name="timeRange" class="form-control pull-right" id="reservation" value="${timeRangeAttendance}">
                    </div>
                    <!-- /.input group -->
                </div>
                <div class="col-sm-6">
                    选择查看部门：
                    <div class="form-group" style="width: 200px">
                        <select name="departmentId" id="departmentSel" class="form-control">
                            <option value="0" >全部</option>
                            <#list departmentList as d>
                                <option value="${d.departmentId}" <#if departmentId?? && departmentId == d.departmentId>selected</#if>>${d.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
            </div>
            <div class="box-body">
                <canvas id="pieChart" style="height:250px"></canvas>
                <ul id="pieChartLegend"></ul>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
    <!-- /.col (LEFT) -->
    <div class="col-md-6">
        <!-- LINE CHART -->
        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">薪资数据</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
                <br>
                选择时间:
                <div class="form-group">
                    <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                    </div>
                    <input type="text" name="timeRange" class="form-control pull-right" id="reservation2" value="${timeRangeAvg}">
                </div>
            </div>
            <div class="box-body">
                <div class="chart">
                    <canvas id="lineChart" style="height:250px"></canvas>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->

    </div>
    <!-- /.col (RIGHT) -->
</div>
<script src="/plugins/daterangepicker/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/plugins/chartjs/Chart.min.js"></script>

<script>

    $('#reservation').daterangepicker();
    $('#reservation2').daterangepicker();

    $(function () {

        $('#reservation').change(function () {
            var range = $(this).val();

            showLab('/analyze/average?timeRangeAttendance=' + range);
        });
        $('#reservation2').change(function () {
            var range = $(this).val();

            showLab('/analyze/average?timeRangeAvg=' + range);
        });

        $("#departmentSel").change(function () {
            var id = $(this).val();

            showLab('/analyze/average?departmentId=' + id);
        });

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

        //-------------
        //- LINE CHART -
        //--------------
        var lineChartData = {
            labels: [
                <#list salaryLabel as item>
                    "${item}"
                    <#if item_has_next>
                            ,
                    </#if>
                </#list>
            ],
            datasets: [
                {
                    label: "in",
                    fillColor: "rgba(60,141,188,0.9)",
                    strokeColor: "rgba(60,141,188,0.8)",
                    pointColor: "#3b8bba",
                    pointStrokeColor: "rgba(60,141,188,1)",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(60,141,188,1)",
                    data: [
                        <#list salary as item>
                            ${item?c}
                            <#if item_has_next>
                                ,
                            </#if>
                        </#list>
                    ]
                }
            ]
        };
        var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
        var lineChart = new Chart(lineChartCanvas);
        var lineChartOptions = areaChartOptions;
        lineChartOptions.datasetFill = false;

        lineChart.Line(lineChartData, lineChartOptions);

        //-------------
        //- PIE CHART -
        //-------------
        // Get context with jQuery - using jQuery's .get() method.
        var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
        var pieChart = new Chart(pieChartCanvas);
        var PieData = [
            {
                value: ${attendanceVo.lastNumber?c},
                color: "#00c0ef",
                highlight: "#00acd6",
                label: "迟到"
            },
            {
                value: ${attendanceVo.leaveNumber?c},
                color: "#f39c12",
                highlight: "#e08e0b",
                label: "早退"
            },
            {
                value: ${attendanceVo.outNumber?c},
                color: "#dd4b39",
                highlight: "#d73925",
                label: "旷工"
            },
            {
                value: ${normal},
                color: "#00a65a",
                highlight: "#008d4c",
                label: "正常"
            }
        ];
        var pieOptions = {
            //Boolean - Whether we should show a stroke on each segment
            segmentShowStroke: true,
            //String - The colour of each segment stroke
            segmentStrokeColor: "#fff",
            //Number - The width of each segment stroke
            segmentStrokeWidth: 2,
            //Number - The percentage of the chart that we cut out of the middle
            percentageInnerCutout: 50, // This is 0 for Pie charts
            //Number - Amount of animation steps
            animationSteps: 100,
            //String - Animation easing effect
            animationEasing: "easeOutBounce",
            //Boolean - Whether we animate the rotation of the Doughnut
            animateRotate: true,
            //Boolean - Whether we animate scaling the Doughnut from the centre
            animateScale: false,
            //Boolean - whether to make the chart responsive to window resizing
            responsive: true,
            // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
            maintainAspectRatio: true,
            //String - A legend template
            legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>"
        };
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        pieChart.Doughnut(PieData, pieOptions);
        $.each(PieData, function (k, v) {
            var pieHtml = "<li style=\"background-color: " + v.color + "\">" + v.label +  "</li>";
            $("#pieChartLegend").append(pieHtml);
        });

    });
</script>