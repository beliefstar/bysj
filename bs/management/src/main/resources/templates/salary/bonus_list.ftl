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
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="table${uuid}" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>基本工资</th>
                <th>奖金</th>
                <th>补贴</th>
                <th>纳税额</th>
                <th>应收工资额</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="tbody${uuid}">
            <#list list as item>
            <tr>
                <td>${item_index + 1}</td>
                <td><a href="javascript:void(0)" onclick="showLab('/emp/view?id=' + ${item.emp.id} + '')">${item.emp.name}</a></td>
                <td data-income="true">${item.base?string("0.00")}</td>
                <td data-bonus="true">${item.bonus?string("0.00")}</td>
                <td data-subsidy="true">${item.subsidy?string("0.00")}</td>
                <td data-tax="true">0</td>
                <td data-realIncome="true">0</td>
                <td>
                    <button class="btn btn-xs btn-primary" onclick="adjustBonus(this)"><i class="fa fa-edit"></i>设置奖金/补贴</button>
                    <div style="display: none;">
                        <button class="btn btn-xs btn-success" onclick="submitRow(${item.id}, this)">确定</button>
                        <button class="btn btn-xs btn-success" onclick="cancel(this)">取消</button>
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
    function computeIncome() {
        $("#tbody${uuid}").find("tr").each(function () {
            var realIncome = $(this).find("td[data-realIncome]");
            var tax = $(this).find("td[data-tax]");
            var income = $(this).find("td[data-income]");
            var bonus = $(this).find("td[data-bonus]");
            var subsidy = $(this).find("td[data-subsidy]");

            var rel = compute(parseInt(income.html()));
            tax.html(rel.tax);
            var real = parseInt(rel.realIncome) + parseInt(bonus.html()) + parseInt(subsidy.html());
            realIncome.html(real.toFixed(2));
        })
    }

    function compute(income) {
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
    }
    computeIncome();
</script>
<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>

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