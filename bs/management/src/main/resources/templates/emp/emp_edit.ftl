<link rel="stylesheet" href="/plugins/datepicker/datepicker3.css">


  <form class="form-horizontal" id="form${uuid}">
    <div class="box-body">

        <div class="text-center margin">
            <img id="userImg" src="<#if emp?? && emp.img?? && emp.img != "">${imgServer}${emp.img}<#else >/dist/img/user_img.jpg</#if>" alt="头像" width="200px">
            <div style="position: relative;">
                <input type="file" style="position: absolute; width: 100%;height: 100%;top: 0;left: 0;opacity: 0;" id="imgFile">
                <a href="javascript:void(0)">点击更换</a>
            </div>
            <input type="hidden" name="img" id="imgPath" value="<#if emp?? && emp.img??>${emp.img!}</#if>">
        </div>

        <#if emp?? && emp.id??>
            <input type="hidden" name="id" value="${emp.id}">
        </#if>
      <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">姓名 :</label>

        <div class="col-sm-10">
          <input type="text" name="name" class="form-control" required value="<#if emp??>${emp.name!}</#if>">
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">年龄 :</label>

        <div class="col-sm-10">
          <input type="number" name="age" class="form-control" required value="<#if emp??>${emp.age!}</#if>">
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">性别 :</label>
          <#assign gender1 = "">
          <#assign gender2 = "">
        <#if emp?? && emp.gender??>
            <#if emp.gender == "男">
                <#assign gender1 = "selected">
            <#else >
                <#assign gender2 = "selected">
            </#if>
        </#if>
        <div class="col-sm-10">
          <select class="form-control" name="gender">
              <option ${gender1}>男</option>
              <option ${gender2}>女</option>
          </select>
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">民族 :</label>

        <div class="col-sm-10">
          <input type="text" name="nation" class="form-control" required value="<#if emp??>${emp.nation!}</#if>">
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">政治面貌 :</label>

        <div class="col-sm-10">
          <input type="text" name="politics" class="form-control" required value="<#if emp??>${emp.nation!}</#if>">
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">家庭住址 :</label>

        <div class="col-sm-10">
          <input type="text" name="address" class="form-control" required value="<#if emp??>${emp.address!}</#if>">
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">生日 :</label>
        <div class="col-sm-10">
            <input type="text" name="birthday" class="form-control" id="birthday" required readonly value="<#if emp?? && emp.birthday??>${emp.birthday?string('yyyy/MM/dd')}</#if>">
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">联系电话 :</label>

        <div class="col-sm-10">
          <input type="text" name="phone" class="form-control" required <#if emp?? && emp.phone??> value="${emp.phone}" readonly</#if>>
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">邮箱 :</label>

        <div class="col-sm-10">
          <input type="email" name="email" class="form-control" required <#if emp??>readonly value="${emp.email!}</#if>">
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">毕业院校 :</label>

        <div class="col-sm-10">
          <input type="text" name="school" class="form-control" required value="<#if emp??>${emp.school!}</#if>">
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">学历 :</label>

        <div class="col-sm-10">
          <input type="text" name="education" class="form-control" required value="<#if emp??>${emp.education!}</#if>">
        </div>
      </div>



        <div class="form-group">
            <input type="hidden" name="departmentId" id="departmentId">
            <label for="inputtext3" class="col-sm-2 control-label">部门 :</label>

            <div class="col-sm-2">
                <select class="form-control" id="department">

                </select>
            </div>
        </div>

    </div>
    <!-- /.box-body -->
    <div class="box-footer">
      <button type="button" class="btn btn-default" onclick="showLab('${backUrl!}')">返回</button>
      <button type="submit" class="btn btn-info pull-right">保存</button>
    </div>
    <!-- /.box-footer -->
  </form>
<script src="/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>


<script>

    $("#imgFile").change(function () {
        var formData = new FormData();
        formData.append('file', $(this)[0].files[0]);
        jQuery.ajax({
            url: '${imgServer}/upImg',
            type: 'POST',
            cache: false,
            data: formData,
            processData: false,
            contentType: false
        }).done(function (result) {
            if (result.status === 200) {
                $("#imgPath").val(result.data);
                $("#userImg").attr("src", "${imgServer}" + result.data);
                messageBox("操作成功");
            } else {
                messageBox("操作失败")
            }
        });
    });

    $('#birthday').datepicker({
        language: "zh-CN",
        format: "yyyy/mm/dd"
    });

  function selectChange() {
      var pid = $(this).find("option:selected")[0].dataset.id;
      if (!pid) {
          return;
      }
      $("#departmentId").val(pid);
  }

  function getDepartment() {
      var el = $("#department");
      jQuery.ajax({
          type: "POST",
          url: "/department/findList",
          dataType: "json"
      }).done(function (rel) {
          if (rel.status === 200) {
              var html = "<option>---请选择---</option>";
              if (rel.data.length > 0) {
                  $.each(rel.data, function (k, v) {
                      html += '<option data-id="' + v.departmentId + '" data-pid="' + v.parentId + '">' + v.name + '</option>';
                  });
                  el.html(html);
              }

          } else {
              messageBox("网络异常！");
          }
      })
  }

  getDepartment();

  $("#department").change(selectChange);

</script>