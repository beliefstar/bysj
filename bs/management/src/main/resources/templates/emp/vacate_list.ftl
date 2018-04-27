<#assign uuid=.now?string["hhmmSSsss"]/>
<link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">
<#--********************************************-->
<div class="box box-success load-content">
    <div class="box-header">

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
                <td>${item.name!}</td>
                <td>${item.beginTime?string('yyyy-MM-dd')} - ${item.beginTime?string('yyyy-MM-dd')}</td>
                <td>${item.upTime?string('yyyy-MM-dd')}</td>
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
                    <button class="btn btn-xs btn-primary" onclick="showLab('/emp/view?id=${item.id}')"><i class="fa fa-search"></i>查看</button>
                    <button class="btn btn-xs btn-primary" onclick="showLab('/emp/edit?id=${item.id}')"><i class="fa fa-search"></i>编辑</button>
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
</script>