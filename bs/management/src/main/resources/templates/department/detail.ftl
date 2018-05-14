<#assign uuid=.now?string["hhmmSSsss"]/>

<div class="row">
    <#if flag>
    <div class="col-sm-12">
        <div class="box box-primary load-content">
            <div class="box-header with-border">
                <h3 class="box-title">选择查看部门：</h3>
            </div>
            <div class="box-body">
                <div class="form-group" style="width: 200px">
                    <select name="departmentId" id="departmentSel" class="form-control">
                        <option value="0" >全部</option>
                        <#list departmentList as d>
                            <option value="${d.departmentId}" <#if departmentId?? && departmentId == d.departmentId>selected</#if>>${d.name}</option>
                        </#list>
                    </select>
                </div>
            </div>
        </div>
    </div>
    </#if>
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
                <div class="col-sm-12">
                    <p>${department.introduce}</p>
                </div>

            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="box box-success load-content">
            <div class="box-header with-border">
                <h3 class="box-title">人员信息</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body">
                <ul>
                    <li><label for="">经理：</label>${master.name}</li>
                    <li><label for="">员工数量：</label>${empNumber}</li>
                </ul>
            </div>
        </div>
    </div>
</div>


<script>
    $("#departmentSel").change(function () {
        var id = $(this).val();

        showLab('/department/detail?departmentId=' + id);
    });
</script>