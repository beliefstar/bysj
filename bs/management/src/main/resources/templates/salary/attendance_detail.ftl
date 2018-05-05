<#assign uuid=.now?string["hhmmSSsss"]/>
<link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker-bs3.css">

<style>
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
                <ul>
                    <li><label>上班时间：</label>${time.startTime?string("HH:mm")}</li>
                    <li><label>下班时间：</label>${time.endTime?string("HH:mm")}</li>
                </ul>
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
                        <th>日期</th>
                        <th>上班时间</th>
                        <th>下班时间</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list attendanceList as item>
                    <tr>
                        <td>${item_index + 1}</td>
                        <td>${item.emp.name}</td>
                        <td>
                            ${item.createTime?string("yyyy/MM/dd")}
                        </td>
                        <td>
                            <#if item.startTime??>
                                ${item.startTime?string("yyyy/MM/dd HH:mm:ss")}
                            </#if>
                        </td>
                        <td>
                            <#if item.endTime??>
                                ${item.endTime?string("yyyy/MM/dd HH:mm:ss")}
                            </#if>
                        </td>
                        <td>
                            <#if item.last?? && item.last=="1">
                                <span class="label label-info">迟到</span>
                            </#if>
                            <#if item.hour?? && item.hour lt time.hour>
                                <span class="label label-warning">早退</span>
                            </#if>
                            <#if item.startTime??>
                            <#else >
                                <span class="label label-danger">旷工</span>
                            </#if>
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
<script src="/plugins/daterangepicker/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<script>
    $('#reservation').daterangepicker();
    function refreshData() {
        var timeRange = $("#reservation").val();
        if (timeRange.trim() === "") {
            return;
        }
        showLab("/salary/attendance/view?empId=${empId}&timeRange=" + timeRange);
    }

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