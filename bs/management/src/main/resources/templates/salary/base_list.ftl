<#assign uuid=.now?string["hhmmSSsss"]/>
<link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">
<#--********************************************-->
<div class="box box-success load-content">
    <div class="box-header">
        <#--<button class="btn btn-primary" onclick="showLab('/emp/adjustment?type=arrive')">转入</button>-->
        <#--<button class="btn btn-primary" onclick="showLab('/emp/adjustment?type=origin')">转出</button>-->
        <#--<button class="btn btn-default" onclick="showLab('/emp/newAdjustApply')">新调度</button>-->
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
                    <button class="btn btn-xs btn-primary" onclick="showLab('/salary/view?id=' + ${item.emp.id} + '')"><i class="fa fa-search"></i>查看</button>
                    <button class="btn btn-xs btn-primary" onclick="adjustBase(${item.id}, ${item.emp.id}, '${item.emp.name}', '${item.emp.post}', ${item.base?c})"><i class="fa fa-edit"></i>调整基本工资</button>
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

    function adjustBase(id, empId, name, post, base) {

        var html = '<div class="form-group">' +
                '<label class="col-sm-3 control-label" for="">姓名：</label>' +
                '<div class="col-sm-9">' +
                '<input type="hidden" name="empId" value="' + empId + '">' + name + '</div>' +
                '</div>' +
                '<div class="form-group">' +
                '<label class="col-sm-3 control-label" for="">职位：</label>' +
                '<div class="col-sm-9">' +
                '<input type="hidden" name="id" value="' + id + '">' + post +  '</div>' +
                '</div>' +
                '<div class="form-group">' +
                '<label class="col-sm-3 control-label" for="">当前基本工资：</label>' +
                '<div class="col-sm-9">' +
                '<input type="hidden" name="oldBase" value="' + base + '">' + base + '</div>' +
                '</div>' +
                '<div class="form-group">' +
                '<label class="col-sm-3 control-label" for="">调整：</label>' +
                '<div class="col-sm-9"><input type="number" name="base" value="' + base + '"></div>' +
                '</div>'+
                '<div class="form-group">' +
                '<label class="col-sm-3 control-label" for="">备注：</label>' +
                '<div class="col-sm-9"><textarea name="comment" class="form-control"></textarea></div>' +
                '</div>';
        formBox("调整基本工资", html, {
            url: "/salary/adjustBase",
            success: function (rel) {
                if (rel.status === 200) {
                    messageBox("操作成功");
                } else {
                    messageBox("操作失败");
                }
            }
        })
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