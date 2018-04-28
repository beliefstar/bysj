<#assign uuid=.now?string["hhmmSSsss"]/>
<link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">
<#--********************************************-->
<div class="box box-success load-content">
    <div class="box-header">
        <#if isMaster><#else ><button class="btn btn-primary" onclick="showLab('/emp/holidayNewApply')">新申请</button></#if>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="table${uuid}" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>请假时间</th>
                <th>申请时间</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <#if list?size gt 0>
            <#list list as item>
            <tr>
                <td>${item_index}</td>
                <td data-name="true">${item.name!}</td>
                <td data-timestamp="true">${item.beginTime?string('yyyy-MM-dd')} - ${item.beginTime?string('yyyy-MM-dd')}</td>
                <td>${item.upTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                <td>
                    <#if item.status == "0">
                        <span class="label label-warning">新申请</span>
                    <#elseif item.status == "1">
                        <span class="label label-success">已通过</span>
                    <#elseif item.status == "2">
                        <span class="label label-danger">已拒绝</span>
                    </#if>
                </td>
                <td>
                    <div style="display: none;">${item.text!}</div>
                    <button class="btn btn-xs btn-primary" onclick="showDetail(this)"><i class="fa fa-search"></i>查看</button>
                    <#if isMaster>
                        <button class="btn btn-xs btn-primary" onclick="accessVacate(${item.id}, 'access')"><i class="fa fa-check-square-o"></i>通过</button>
                        <button class="btn btn-xs btn-primary" onclick="accessVacate(${item.id}, 'denied')"><i class="fa fa-ban"></i>拒绝</button>
                    </#if>
                </td>
            </tr>
            </#list>
            <#else >
            <tr>
                <td colspan="6" style="text-align: center"> --- 无相关数据 --- </td>
            </tr>
            </#if>
            </tbody>
        </table>
    </div>
    <!-- /.box-body -->
</div>
<#--********************************************-->

<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
<#if list?size gt 0>
    $("#table${uuid}").DataTable({
        "language": {
            "info": "当前第 _PAGE_ 页 ，共 _PAGES_ 页",
            "lengthMenu": "显示 _MENU_ 条记录",
            "infoFiltered": "（从 _MAX_ 条数据中查询）"
        }
    });
</#if>
    function showDetail(e) {
        var text = $(e).prev().html();
        var parent = $(e).parent().parent();
        var name = parent.find('td[data-name]').html();
        var timestamp = parent.find("td[data-timestamp]").html();
        var html = '<div class="row">' +
                    '<div class="col-sm-3"> <label for="">请假人：</label></div>' +
                    '<div class="col-sm-9">' + name +  '</div>' +
                    '</div>' +
                    '<div class="row">' +
                    '<div class="col-sm-3"> <label for="">请假时间：</label></div>' +
                    '<div class="col-sm-9">' + timestamp + '</div>' +
                    '</div>' +
                    '<div class="row">' +
                    '<div class="col-sm-3"> <label for="">申请信息：</label></div>' +
                    '<div class="col-sm-9">' + text + '</div>' +
                '</div>';
        showDataBox('详细信息', html);
    }
    <#if isMaster>
        function accessVacate(_id, _type) {
            jQuery.ajax({
                type: "POST",
                url: "/emp/accessOrDeniedVacate",
                data: $.param({
                    type: _type,
                    id: _id
                }),
                dataType: "json"
            }).done(function (result) {
                if (result.status === 200) {
                    messageBox("操作成功");
                    showLab('/emp/holiday');
                } else {
                    messageBox("操作失败");
                }
            })
        }
    </#if>
</script>