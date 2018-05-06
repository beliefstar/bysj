<#assign uuid=.now?string["hhmmSSsss"]/>
<link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">

  <link rel="stylesheet" href="/plugins/ionslider/ion.rangeSlider.css">
  <!-- ion slider Nice -->
  <link rel="stylesheet" href="/plugins/ionslider/ion.rangeSlider.skinFlat.css">

<link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker-bs3.css">

<link rel="stylesheet" href="/plugins/iCheck/all.css">

<link rel="stylesheet" href="/plugins/datepicker/datepicker3.css">

<style>
    #backend {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background: #eee;
        opacity: 0.5;
        z-index: 999;
        cursor: not-allowed;
    }
    #back-week {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        z-index: 999;
        cursor: not-allowed;
    }
</style>
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary load-content">
            <div class="box-header with-border">
                <h3 class="box-title">上下班时间</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <button class="btn btn-sm btn-default" onclick="editeAble(this)">编辑</button>
                <div style="display: none;">
                    <button class="btn btn-sm btn-success" onclick="updateTime(this)">确定</button>
                    <button class="btn btn-sm btn-success" onclick="cancel(this)">取消</button>
                </div>
                <div class="row margin">
                    <div class="col-sm-12">
                        <div id="backend"></div>
                        <input id="range-slider" type="text" style="display: none;" value="">
                    </div>

                    <div class="col-sm-12 text-center">
                        <label id="time-sheet">${time.startTime?string("HH:mm")} - ${time.endTime?string("HH:mm")}</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="box box-danger load-content">
            <div class="box-header with-border">
                <h3 class="box-title">考勤情况</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>选择查看时间段：</label>

                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control" id="reservation" value="${timeRange!}">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <button class="btn btn-sm btn-primary" style="width: 100px;margin-top: 28px;" onclick="refreshData()"><i class="fa fa-search"></i>确定</button>
                    </div>
                </div>
                <table id="table${uuid}" class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>姓名</th>
                        <th>迟到数量</th>
                        <th>早退数量</th>
                        <th>旷工数量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list attendances as item>
                    <tr>
                        <td>${item_index + 1}</td>
                        <td>${item.emp.name}</td>
                        <td>${item.lastNumber}</td>
                        <td>${item.leaveNumber}</td>
                        <td>${item.outNumber!"0"}</td>
                        <td>
                            <button class="btn btn-xs btn-primary" onclick="showLab('/salary/attendance/view?empId=${item.emp.id}')"><i class="fa fa-search"></i>查看详细</button>
                        </td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
            <!-- /.box-body -->
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="box box-info load-content">
            <div class="box-header with-border">
                <h3 class="box-title">一周工作日</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <div class="col-md-12">
                    <div id="back-week"></div>
                    <form id="form${uuid}">
                        <label>
                            <input type="checkbox" name="weekday" class="flat-red" value="1" <#if weekdays?seq_contains("1")>checked</#if>>星期一
                        </label>
                        <label>
                            <input type="checkbox" name="weekday" class="flat-red" value="2" <#if weekdays?seq_contains("2")>checked</#if>>星期二
                        </label>
                        <label>
                            <input type="checkbox" name="weekday" class="flat-red" value="3" <#if weekdays?seq_contains("3")>checked</#if>>星期三
                        </label>
                        <label>
                            <input type="checkbox" name="weekday" class="flat-red" value="4" <#if weekdays?seq_contains("4")>checked</#if>>星期四
                        </label>
                        <label>
                            <input type="checkbox" name="weekday" class="flat-red" value="5" <#if weekdays?seq_contains("5")>checked</#if>>星期五
                        </label>
                        <label>
                            <input type="checkbox" name="weekday" class="flat-red" value="6" <#if weekdays?seq_contains("6")>checked</#if>>星期六
                        </label>
                        <label>
                            <input type="checkbox" name="weekday" class="flat-red" value="7" <#if weekdays?seq_contains("7")>checked</#if>>星期天
                        </label>
                    </form>
                </div>
                <div class="col-md-12">
                    <button class="btn btn-sm btn-default" onclick="editeAble2(this)">编辑</button>
                    <div style="display: none;">
                        <button class="btn btn-sm btn-success" onclick="updateTime2(this)">确定</button>
                        <button class="btn btn-sm btn-success" onclick="cancel2(this)">取消</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="box box-success load-content">
            <div class="box-header with-border">
                <h3 class="box-title">节假日</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <input type="text" class="form-control" id="newHoliday" placeholder="日期">
                    </div>
                    <div class="col-md-6">
                        <input type="text" class="form-control" id="newHoliday-comment" placeholder="节日名称">
                    </div>
                </div>
                <div class="row margin">
                    <div class="col-sm-12">
                        <button class="btn btn-sm btn-block btn-primary" id="addholidaybtn">添加</button>
                    </div>
                </div>
                <ul class="list-group list-group-unbordered" id="holidayUL">
                    <#if holidays?? && holidays?size gt 0>
                        <#list holidays as item>
                            <li class="list-group-item">
                                <b>${item.comment}</b> <a class="pull-right">${item.weekDate?string("yyyy/MM/dd")}</a>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
</div>


<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="/plugins/daterangepicker/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/plugins/iCheck/icheck.min.js"></script>
<script src="/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script>
    function refreshData() {
        var timeRange = $("#reservation").val();
        if (timeRange.trim() === "") {
            return;
        }
        showLab("/salary/attendance?timeRange=" + timeRange);
    }

    function editeAble2(e) {
        $(e).hide().next().show().parent().parent().find("#back-week").hide();
    }
    function editeAble(e) {
        $(e).hide().next().show().parent().find("#backend").hide();
    }

    function cancel(e) {
        $(e).parent().hide().prev().show().parent().find("#backend").show();
    }
    function cancel2(e) {
        $(e).parent().hide().prev().show().parent().parent().find("#back-week").show();
    }

    function updateTime(e) {
        var str = $("#time-sheet").html();
        var arr = str.split("-");
        var data = {
            startTime: arr[0].trim() + ":00",
            endTime: arr[1].trim() + ":00"
        };
        jQuery.ajax({
            url: "/salary/updateAttendanceTime",
            type: "POST",
            data: data
        }).done(function (result) {
            if (result.status === 200) {
                messageBox("修改成功");
            } else {
                messageBox("修改失败");
            }
        });
        cancel(e);
    }
    function updateTime2(e) {
        var data = $("#form${uuid}").serialize();
        jQuery.ajax({
            url: "/salary/updateWeekDay",
            type: "POST",
            data: data
        }).done(function (result) {
            if (result.status === 200) {
                messageBox("修改成功");
            } else {
                messageBox("修改失败");
            }
        });
        cancel2(e);
    }

    $("#range-slider").ionRangeSlider({
        min: 0,
        max: 24,
        from: ${time.startTime?string("HH")},
        to: ${time.endTime?string("HH")},
        type: 'double',
        step: 0.5,
        prettify: false,
        grid: true,
        onFinish: function (obj) {
            var val = analy(obj.from) + " - " + analy(obj.to);
            $("#time-sheet").html(val);
        }
    });

    function analy(item) {
        var str = item + "";
        if (str.indexOf(".") !== -1) {
            str = str.substring(0, str.indexOf("."));
            str = (str.length < 2 ? "0" + str : str) + ":30";
        } else {
            str = (str.length < 2 ? "0" + str : str) + ":00";
        }
        return str;
    }
    $('#reservation').daterangepicker();
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

    $('input[type="checkbox"].flat-red').iCheck({
        checkboxClass: 'icheckbox_flat-green',
        radioClass: 'iradio_flat-green'
    });

    $('#newHoliday').datepicker({
        language: "zh-CN",
        format: "yyyy/mm/dd"
    });

    $("#addholidaybtn").click(function () {
        var date = $("#newHoliday").val();
        var comment = $("#newHoliday-comment").val();
        var data = {
            weekDate: date,
            comment: comment
        };
        if (date.trim() === "") return;
        if (comment.trim() === "") return;
        jQuery.ajax({
            url: "/salary/addHoliday",
            type: "POST",
            data: data
        }).done(function (result) {
            if (result.status === 200) {
                var html = "<li class=\"list-group-item\">\n" +
                        "                                <b>" + comment + "</b> <a class=\"pull-right\">" + date + "</a>\n" +
                        "                            </li>";
                $("#holidayUL").children().first().before(html);
                $("#newHoliday").val("");
                $("#newHoliday-comment").val("");
            }
        })
    })
</script>