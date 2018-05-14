<#assign uuid=.now?string["hhmmSSsss"]/>
<link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">


<style>
    .editable {
        background-color: #ddd;
        border: 1px solid #000000;
        border-left: none;
        border-right: none;
    }
    .editable td[data-bonus], .editable td[data-subsidy] {
        background-color: #FFFFFF;
        border: 1px solid #3c8dbc;
    }
    .table-hover>tbody>tr.editable:hover {
        background-color: #ddd;
    }
</style>


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
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="table${uuid}" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>奖金</th>
                <th>补贴</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="tbody${uuid}">
            <#list list as item>
            <tr>
                <td>${item_index + 1}</td>
                <td><a href="javascript:void(0)" onclick="showLab('/emp/view?id=' + ${item.emp.id} + '')">${item.emp.name}</a></td>
                <td data-bonus="true">${item.bonus?string("0.00")}</td>
                <td data-subsidy="true">${item.subsidy?string("0.00")}</td>
                <td>
                    <button class="btn btn-sm btn-primary" onclick="adjustBonus(this)"><i class="fa fa-edit"></i>设置奖金/补贴</button>
                    <div style="display: none;">
                        <button class="btn btn-sm btn-success" onclick="submitRow(${item.id}, this)">确定</button>
                        <button class="btn btn-sm btn-success" onclick="cancel(this)">取消</button>
                    </div>
                </td>
            </tr>
            </#list>
            </tbody>
        </table>
    </div>
    <!-- /.box-body -->
</div>
<#--********************************************-->
<script>
</script>
<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>

    $("#departmentSel").change(function () {
        var id = $(this).val();

        showLab('/salary/bonus?departmentId=' + id);
    });

    function adjustBonus(e) {
        $(e).next().show();
        $(e).hide();
        var tr = $(e).parent().parent();
        tr.addClass("editable");
        tr.find("td[data-bonus]").attr("contenteditable", "true");
        tr.find("td[data-subsidy]").attr("contenteditable", "true");
    }

    function submitRow(id, e) {
        var tr = $(e).parent().parent().parent();
        var data = {
            id: id,
            bonus: tr.find("td[data-bonus]").html(),
            subsidy: tr.find("td[data-subsidy]").html()
        };

        if (data.bonus.indexOf(".") !== -1) {
            data.bonus = data.bonus.substring(0, data.bonus.indexOf("."));
        }
        if (data.subsidy.indexOf(".") !== -1) {
            data.subsidy = data.subsidy.substring(0, data.subsidy.indexOf("."));
        }
        var rex = /^[0-9]*$/;
        if (!rex.test(data.bonus) || !rex.test(data.subsidy)) {
            messageBox("格式错误");
            return;
        }
        jQuery.ajax({
            url: "/salary/adjustBonusAnSubsidy",
            data: data,
            type: "POST"
        }).done(function (result) {
            if (result.status === 200) {
                messageBox("操作成功");
            } else {
                messageBox("操作失败");
            }
        });
        cancel(e);
    }

    function cancel(e) {
        $(e).parent().hide();
        $(e).parent().prev().show();
        var tr = $(e).parent().parent().parent();
        tr.removeClass("editable");
        tr.find("td[data-bonus]").attr("contenteditable", "false");
        tr.find("td[data-subsidy]").attr("contenteditable", "false");
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