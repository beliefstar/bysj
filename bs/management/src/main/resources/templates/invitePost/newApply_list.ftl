<#assign uuid=.now?string["hhmmSSsss"]/>

<div class="box box-success load-content">
    <div class="box-header">
        <#--<div class="btn-group">-->
            <button type="button" class="btn btn-default" onclick="getData()">全部</button>
            <button type="button" class="btn btn-default" onclick="getData(0)">新建</button>
            <button type="button" class="btn btn-default" onclick="getData(2)">已拒绝</button>
        <#--</div>-->

        <div class="box-tools">
            <div class="input-group input-group-sm" style="width: 150px;">
                <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                </div>
            </div>
        </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body table-responsive no-padding">
        <table class="table table-hover">
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>部门</th>
                <th>申请时间</th>
                <th>申请状态</th>
                <th>操作</th>
            </tr>
            <tbody id="tbody${uuid}">

            </tbody>
        </table>
    </div>
    <!-- /.box-body -->
</div>
<!-- /.box -->

<script>

    function getData(status) {
        jQuery.ajax({
            url: "/invitePost/getList",
            type: "POST",
            data: $.param({
                status: status
            }),
            dataType: "json"
        }).done(function (rel) {
            if (rel.status === 200) {
                var html = "";
                if (rel.data.length > 0) {
                    $.each(rel.data, function (k, v) {
                        html += '<tr>\
                                    <td>' + v.id + '</td>\
                                    <td>' + v.emp.name + '</td>\
                                    <td>' + v.empDepartment.name + '</td>';
                        var date = new Date(v.entryTime);
                        html += '<td>' + date.toLocaleString() + '</td>';
                        switch (v.status) {
                            case "0":
                                html += '<td><span class="label label-warning">新申请</span></td>';
                                break;
                            case "1":
                                html += '<td><span class="label label-success">已通过</span></td>';
                                break;
                            case "2":
                                html += '<td><span class="label label-danger">已拒绝</span></td>';
                        }
                        html +=    '<td><button class="btn btn-primary"><i class="fa fa-search"></i>查看</button></td>\
                                </tr>';
                    });
                } else {
                    html = "<td rowspan='5'>无相关数据</td>";
                }
                $("#tbody${uuid}").html(html);
            }
        })
    }

    getData();
</script>