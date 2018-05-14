<#assign uuid=.now?string["hhmmSSsss"]/>

<div class="row">
    <div class="col-sm-12">
        <div class="box box-primary load-content">
            <div class="box-header with-border">
                <h3 class="box-title">选择部门：</h3>
            </div>
            <div class="box-body">
                <div class="form-group" style="width: 200px">
                    <select name="departmentId" id="departmentSel" class="form-control">
                        <option value="0" >全部</option>
                        <#list departmentList as d>
                            <option value="${d.departmentId}" <#if departmentId?? && departmentId == d.departmentId>selected</#if>>${d.name}</option>
                        </#list>
                    </select>
                    <input type="hidden" id="departmentId" value="${departmentId!}">
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="box box-primary load-content">
            <div class="box-header with-border">
                <h3 class="box-title">部门详细</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <div class="col-sm-12">
                    <h3>${department.name}</h3>
                </div>
                <div class="col-sm-1"><label for="introduce">简介：</label></div>
                <div class="col-sm-11">
                    <textarea class="form-control" id="introduce" rows="5">${department.introduce}</textarea>
                </div>

            </div>
            <div class="box-footer">
                <button class="pull-right btn btn-primary" id="submitBtn">提交</button>
            </div>
        </div>
    </div>
</div>


<script>

    $("#submitBtn").click(function () {
        var text = $("#introduce").val();
        if (text.trim() === "") return;

        jQuery.ajax({
            url: "/department/adjustmentSubmit",
            type: "POST",
            data: {
                departmentId: $("#departmentId").val(),
                introduce: text
            }
        }).done(function (res) {
            if (res.status === 200) {
                messageBox("操作成功")
            } else {
                messageBox("操作失败")
            }
        });
    });

    $("#departmentSel").change(function () {
        var id = $(this).val();

        showLab('/department/adjustment?departmentId=' + id);
    });
</script>