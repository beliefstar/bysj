<#assign uuid=.now?string["hhmmSSsss"]/>
<link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">
<#--********************************************-->
<div class="box box-success load-content">
    <div class="box-header">
        <#if flag>
            选择查看部门：
        <div class="form-group" style="width: 200px">
            <select name="departmentId" id="departmentSel" class="form-control">
                <option value="0" >全部</option>
                <#list departmentList as d>
                    <option value="${d.departmentId}" <#if departmentId?? && departmentId == d.departmentId>selected</#if>>${d.name}</option>
                </#list>
            </select>
        </div>
        <#else >
        <button class="btn btn-primary" onclick="showLab('/emp/adjustment?type=arrive')">转入</button>
        <button class="btn btn-primary" onclick="showLab('/emp/adjustment?type=origin')">转出</button>
        </#if>
        <#if flag>
            <button class="btn btn-default" onclick="showLab('/emp/newAdjustApply')">新调度</button>
        </#if>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="table${uuid}" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>申请时间</th>
                <th>原部门</th>
                <th>转到部门</th>
                <th>职位</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <#list list as item>
            <tr>
                <td>${item_index}</td>
                <td data-empName="true">${item.empName}</td>
                <td data-applyTime="true">
                    <#if item.applyTime??>
                        ${item.applyTime?string('yyyy-MM-dd HH:mm:ss')}
                    </#if>
                </td>
                <td data-originName="true">${item.originName!}</td>
                <td data-arriveName="true">${item.arriveName!}</td>
                <td data-post="true">${item.post!}</td>
                <td data-status="${item.status}">
                    <#if item.status == "0">
                        <span class="label label-info">新申请</span>
                    <#elseif item.status == "3">
                        <span class="label label-success">已同意</span>
                    <#elseif item.status == "4">
                        <span class="label label-danger">已拒绝</span>
                    </#if>
                </td>
                <td>
                    <div data-text="true" style="display: none;">${item.text!}</div>
                    <div data-originComment="true" style="display: none;">${item.originComment!}</div>
                    <div data-arriveComment="true" style="display: none;">${item.arriveComment!}</div>
                    <div data-originDealTime="true" style="display: none;">
                        <#if item.originDealTime??>
                            ${item.originDealTime?string('yyyy-MM-dd HH:mm:ss')}
                        </#if>
                    </div>
                    <div data-arriveDealTime="true" style="display: none;">
                        <#if item.arriveDealTime??>
                            ${item.arriveDealTime?string('yyyy-MM-dd HH:mm:ss')}
                        </#if>
                    </div>
                    <button class="btn btn-xs btn-primary" onclick="showDetail(this)"><i class="fa fa-search"></i>查看</button>
                    <#if admin && item.status != "3" && item.status != "4">
                        <button class="btn btn-xs btn-primary" onclick="deal('${item.id}', ${item.empId}, ${item.arrive}, this)"><i class="fa fa-edit"></i>处理</button>
                    </#if>
                </td>
            </tr>
            </#list>
            </tbody>
        </table>
    </div>
    <!-- /.box-body -->
</div>
<#--********************************************-->

<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
    $("#departmentSel").change(function () {
        var id = $(this).val();

        showLab('/emp/adjustment?departmentId=' + id);
    });
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
    function showDetail(e) {
        var tr = $(e).parent().parent();
        var empName = tr.find('td[data-empName]').html();
        var applyTime = tr.find('td[data-applyTime]').html();
        var originName = tr.find('td[data-originName]').html();
        var arriveName = tr.find('td[data-arriveName]').html();
        var post = tr.find('td[data-post]').html();
        var status = tr.find('td[data-status]').html();
        var text = tr.find('div[data-text]').html();
        var originComment = tr.find('div[data-originComment]').html();
        var arriveComment = tr.find('div[data-arriveComment]').html();
        var arriveDealTime = tr.find('div[data-arriveDealTime]').html();
        var html = '<div class="row">' +
                '<div class="col-sm-3"> <label for="">申请人：</label></div>' +
                '<div class="col-sm-9">' + empName +  '</div>' +
                '</div>' +
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">申请时间：</label></div>' +
                '<div class="col-sm-9">' + applyTime + '</div>' +
                '</div>' +
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">申请信息：</label></div>' +
                '<div class="col-sm-9">' + text + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">职位：</label></div>' +
                '<div class="col-sm-9">' + post + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">状态：</label></div>' +
                '<div class="col-sm-9">' + status + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">原部门：</label></div>' +
                '<div class="col-sm-9">' + originName + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">备注：</label></div>' +
                '<div class="col-sm-9">' + originComment + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">转到部门：</label></div>' +
                '<div class="col-sm-9">' + arriveName + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">处理意见：</label></div>' +
                '<div class="col-sm-9">' + arriveDealTime + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">处理时间：</label></div>' +
                '<div class="col-sm-9">' + arriveComment + '</div>' +
                '</div>';
        showDataBox('详细信息', html);
    }
    function deal(_id, empId, arrive, e) {
        var tr = $(e).parent().parent();
        var empName = tr.find('td[data-empName]').html();
        var applyTime = tr.find('td[data-applyTime]').html();
        var originName = tr.find('td[data-originName]').html();
        var arriveName = tr.find('td[data-arriveName]').html();
        var post = tr.find('td[data-post]').html();
        var status = tr.find('td[data-status]').html();
        var text = tr.find('div[data-text]').html();
        var originComment = tr.find('div[data-originComment]').html();
        var html = '<div class="row">' +
                '<div class="col-sm-3"> <label for="">处理操作：</label></div>' +
                '<div class="col-sm-9">' +
                    '<input type="hidden" name="id" value="' + _id + '">' +
                    '<input type="radio" name="status" value="3" required>通过 ' +
                    '<input type="radio" name="status" value="4" required>拒绝 ' +
                '</div>' +
                '</div>' +
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">申请人：</label></div>' +
                '<div class="col-sm-9">' +
                    '<input type="hidden" name="empId" value="' + empId + '">' + empName +  '</div>' +
                '</div>' +
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">申请时间：</label></div>' +
                '<div class="col-sm-9">' + applyTime + '</div>' +
                '</div>' +
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">申请信息：</label></div>' +
                '<div class="col-sm-9">' + text + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">状态：</label></div>' +
                '<div class="col-sm-9">' + status + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">原部门：</label></div>' +
                '<div class="col-sm-9">' + originName + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">备注：</label></div>' +
                '<div class="col-sm-9">' + originComment + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">转到部门：</label></div>' +
                '<div class="col-sm-9"><input type="hidden" name="arrive" value="' + arrive + '">' + arriveName + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">职位：</label></div>' +
                '<div class="col-sm-9"><input type="hidden" name="post" value="' + post + '">' + post + '</div>' +
                '</div>'+
                '<div class="row">' +
                '<div class="col-sm-3"> <label for="">处理意见：</label></div>' +
                '<div class="col-sm-9"><textarea class="form-control" name="arriveComment" required></textarea></div>' +
                '</div>';
        formBox('处理信息', html, {
            url: "/emp/dealAdjustApply",
            success: function (rel) {
                if (rel.status === 200) {
                    messageBox("操作成功！");
                } else {
                    messageBox("操作失败！");
                }
            }
        });
    }


</script>