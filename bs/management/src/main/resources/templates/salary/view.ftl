<#assign uuid=.now?string["hhmmSSsss"]/>
<link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">
<div class="row">
    <div class="col-md-6">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">基本信息</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <ul>
                    <li><label>基本工资：</label><span id="salary-base">${salary.base?c}</span></li>
                    <li><label>奖金：</label><span id="salary-bonus">${salary.bonus?c}</span></li>
                    <li><label>补贴：</label><span id="salary-subsidy">${salary.subsidy?c}</span></li>
                    <li><label>纳税额：</label><span id="salary-tax"></span></li>
                    <li><label>应收工资额：</label><span id="salary-realIncome"></span></li>
                </ul>
            </div>
        </div>


        <div class="box box-danger">
            <div class="box-header with-border">
                <h3 class="box-title">历史工资</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <table id="table${uuid}" class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>基本工资</th>
                        <th>备注</th>
                        <th>日期</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list sh as item>
                    <tr>
                        <td>${item_index + 1}</td>
                        <td>${item.salary?string("0.00")}</td>
                        <td>${item.comment!}</td>
                        <td>${item.createTime?string("yyyy/MM/dd")}</td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
            <!-- /.box-body -->
        </div>

    </div>

    <div class="col-md-6">

        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">历史曲线</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <div class="chart">
                    <canvas id="lineChart" style="height:250px"></canvas>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
    </div>
</div>
<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="/plugins/chartjs/Chart.min.js"></script>
<script>
    var areaChartData = {
        labels: [
            <#assign index1=1>
            <#list sh as item>
                <#if index1 lt 11>
                    <#assign index1++>
                    "${item.createTime?string("yyyy/MM")}"
                    <#if index1 lt 10>,</#if>
                </#if>
            </#list>
        ],
        datasets: [
            {
                label: "Digital Goods",
                fillColor: "rgba(60,141,188,0.9)",
                strokeColor: "rgba(60,141,188,0.8)",
                pointColor: "#3b8bba",
                pointStrokeColor: "rgba(60,141,188,1)",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(60,141,188,1)",
                data: [
                    <#assign index2=1>
                    <#list sh as item>
                        <#if index2 lt 11>
                            <#assign index2++>
                            ${item.salary?c}
                            <#if index2 lt 10>,</#if>
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

    var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
    var lineChart = new Chart(lineChartCanvas);
    var lineChartOptions = areaChartOptions;
    lineChartOptions.datasetFill = false;
    lineChart.Line(areaChartData, lineChartOptions);


    function computeIncome() {
            var realIncome = $("#salary-realIncome");
            var tax = $("#salary-tax");
            var income = $("#salary-base").html();
            var bonus = $("#salary-bonus").html();
            var subsidy = $("#salary-subsidy").html();

            var rel = compute(parseInt(income));
            tax.html(rel.tax);
            var real = parseInt(rel.realIncome) + parseInt(bonus) + parseInt(subsidy);
            realIncome.html(real.toFixed(2));
    }

    function compute(income)
    {
        var taxableIncome = income - 3500;
        if(taxableIncome <=0){
            return {
                tax: 0,
                realIncome: income.toFixed(2)
            }
        }

        var R,Q;
        var A=taxableIncome;
        A=A.toFixed(2);
        if(A<=1500){R=0.03;Q=0;}
        else if(A>1500 && A<=4500){R=0.1;Q=105}
        else if(A>4500 && A<=9000){R=0.2;Q=555}
        else if(A>9000 && A<=35000){R=0.25;Q=1005}
        else if(A>35000 && A<=55000){R=0.3;Q=2755}
        else if(A>55000 && A<=80000){R=0.35;Q=5505}
        else{R=0.45;Q=13505;}
        var tax=taxableIncome * R -Q;
        var realIncome=income - tax;

        return {
            tax: tax.toFixed(2),
            realIncome: realIncome.toFixed(2)
        }
        //税额
        //实发工资
    }
    computeIncome();

    $("#table${uuid}").DataTable({
        "language": {
            "info": "当前第 _PAGE_ 页 ，共 _PAGES_ 页",
            "lengthMenu": "显示 _MENU_ 条记录",
            "infoFiltered": "（从 _MAX_ 条数据中查询）",
            "paginate": {
                "first": "首页",
                "last": "尾页",
                "next": "下一页",
                "previous": "上一页"
            },
            "emptyTable": "无相关数据",
            "infoEmpty": "无相关数据",
            "search": "搜索:",
            "zeroRecords": "无相关数据"
        }
    });
</script>