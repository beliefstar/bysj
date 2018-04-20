<#assign uuid=.now?string["hhmmSSsss"]/>

<link rel="stylesheet" href="/plugins/datepicker/datepicker3.css">

<div class="box box-info load-content">
  <div class="box-header with-border">
    <h3 class="box-title">个人信息</h3>
  </div>
  <!-- /.box-header -->
  <!-- form start -->
  <form class="form-horizontal" id="form${uuid}">
    <div class="box-body">
      <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">姓名 :</label>

        <div class="col-sm-10">
          <input type="text" name="name" class="form-control" required>
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">年龄 :</label>

        <div class="col-sm-10">
          <input type="number" name="age" class="form-control" required>
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">性别 :</label>

        <div class="col-sm-10">
          <select class="form-control" name="gender">
              <option>男</option>
              <option>女</option>
          </select>
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">民族 :</label>

        <div class="col-sm-10">
          <input type="text" name="nation" class="form-control" required>
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">政治面貌 :</label>

        <div class="col-sm-10">
          <input type="text" name="politics" class="form-control" required>
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">家庭住址 :</label>

        <div class="col-sm-10">
          <input type="text" name="address" class="form-control" required>
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">生日 :</label>

        <div class="col-sm-10">
          <input type="text" name="birthday" class="form-control" id="birthday" required readonly>
            <input type="hidden" class="form-control" id="birthday-hidden">
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">联系电话 :</label>

        <div class="col-sm-10">
          <input type="text" name="phone" class="form-control" required>
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">邮箱 :</label>

        <div class="col-sm-10">
          <input type="email" name="email" class="form-control" required>
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">毕业院校 :</label>

        <div class="col-sm-10">
          <input type="text" name="school" class="form-control" required>
        </div>
      </div>
      <div class="form-group">
        <label for="inputtext3" class="col-sm-2 control-label">学历 :</label>

        <div class="col-sm-10">
          <input type="text" name="education" class="form-control" required>
        </div>
      </div>

    </div>
    <!-- /.box-body -->
    <div class="box-footer">
      <button class="btn btn-default">上一步</button>
      <button type="submit" class="btn btn-info pull-right">保存并下一步</button>
    </div>
    <!-- /.box-footer -->
  </form>
</div>
<script src="/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script>
  // new Vue({
  //   el: "#${uuid}",
    $('#birthday').datepicker({
        language: "zh-CN",
        format: "yyyy/mm/dd"
    });

    $("#form${uuid}").submit(function () {

        //var dateSpan = Date.parse(new Date($("#birthday").val()));

        //$("#birthday-hidden").val(dateSpan);

        var data = $(this).serialize();
        jQuery.ajax({
            type: "post",
            data: data,
            url: "/invitePost/saveEmp",
            dataType: "json"
        }).done(function (data) {
            console.log(data);
            if (data.status === 200) {
                // showLab()
            }
        });
        return false;
    });
</script>