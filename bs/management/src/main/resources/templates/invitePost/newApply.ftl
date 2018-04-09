<#assign uuid=.now?string["hhmmSSsss"]/>

<div class="box box-info" id="${uuid}">
  <div class="box-header with-border">
    <h3 class="box-title">个人信息</h3>
  </div>
  <!-- /.box-header -->
  <!-- form start -->
  <form class="form-horizontal">
    <div class="box-body">
      <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>

        <div class="col-sm-10">
          <input type="email" class="form-control" placeholder="姓名...">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">年龄</label>

        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="年龄...">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">性别</label>

        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="性别...">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">民族</label>

        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="民族...">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">政治面貌</label>

        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="政治面貌...">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">家庭住址</label>

        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="家庭住址...">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">生日</label>

        <div class="col-sm-10">
          <input type="password" class="form-control" id="birthday" placeholder="生日...">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">联系电话1</label>

        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="联系电话1...">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">联系电话2</label>

        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="联系电话2...">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>

        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="邮箱...">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">毕业院校</label>

        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="毕业院校...">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">学历</label>

        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="学历...">
        </div>
      </div>

    </div>
    <!-- /.box-body -->
    <div class="box-footer">
      <button type="submit" class="btn btn-default">上一步</button>
      <button type="submit" class="btn btn-info pull-right">保存并下一步</button>
    </div>
    <!-- /.box-footer -->
  </form>
</div>

<script>
  // new Vue({
  //   el: "#${uuid}",
    $('#birthday').daterangepicker();
  // })

</script>