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
                <th>性别</th>
                <th>职位</th>
                <th>入职时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <#list empList as item>
            <tr>
                <td>${item_index}</td>
                <td>${item.name}</td>
                <td>${item.age}</td>
                <td>${item.post}</td>
                <td>${item.joinTime?string('yyyy-MM-dd')}</td>
                <td><button class="btn btn-xs btn-primary" onclick="showLab('/emp/view?id=${item.id}')"><i class="fa fa-search"></i>查看</button></td>
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

    $("#table${uuid}").DataTable({
        "language": {
            "info": "当前第 _PAGE_ 页 ，共 _PAGES_ 页",
            "lengthMenu": "显示 _MENU_ 条记录",
            "infoFiltered": "（从 _MAX_ 条数据中查询）"
        }
    });

</script>