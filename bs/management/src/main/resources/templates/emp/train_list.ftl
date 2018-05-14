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
        </#if>
        <button class="btn btn-primary" onclick="showLab('/emp/newTrainUI')">新培训</button>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="table${uuid}" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>编号</th>
                <th>标题</th>
                <th>部门</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>发布者</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <#if list?size gt 0>
            <#list list as item>
            <tr>
                <td>${item_index}</td>
                <td data-title="true">${item.title!}</td>
                <td>${item.departmentName}</td>
                <td>${item.startTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                <td>${item.endTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                <td>${item.publisherEmp.name!}</td>
                <td>
                    <button class="btn btn-xs btn-primary" onclick="showLab('/emp/newTrainUI?trainId=' + ${item.id} + '')"><i class="fa fa-search"></i>查看</button>
                </td>
            </tr>
            </#list>
            </#if>
            </tbody>
        </table>
    </div>
    <!-- /.box-body -->
</div>

<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>

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

    $("#departmentSel").change(function () {
        var id = $(this).val();

        showLab('/emp/train?departmentId=' + id);
    });
</script>