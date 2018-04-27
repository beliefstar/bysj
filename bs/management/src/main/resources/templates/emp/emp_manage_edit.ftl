<#assign uuid=.now?string["hhmmSSsss"]/>

<div class="box box-info load-content">
  <div class="box-header with-border">
    <h3 class="box-title">个人信息</h3>
  </div>
  <!-- /.box-header -->
  <!-- form start -->
    <#assign backUrl = "/emp/detail">
  <#include "emp_edit.ftl">
</div>
<script>
    $("#departmentId").parent().remove();

    $("#form${uuid}").submit(function () {
        var data = $(this).serialize();

        jQuery.ajax({
            type: "post",
            data: data,
            url: "/emp/update",
            dataType: "json"
        }).done(function (data) {
            console.log(data);
            if (data.status === 200) {
                messageBox("修改成功！");
                showLab('/emp/detail', '员工管理', '员工信息管理');
            }
        });
        return false;
    });
</script>