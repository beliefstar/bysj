<#assign uuid=.now?string["hhmmSSsss"]/>

<link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker-bs3.css">

<div class="box box-info load-content">
    <div class="box-header with-border">
    </div>

  <form class="form-horizontal" id="form${uuid}">
    <div class="box-body">
      <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">请假原因 :</label>

        <div class="col-sm-10">
            <label style="width: 100%;">
                <textarea rows="6" style="height: 150px;" name="text" class="form-control" required></textarea>
            </label>
        </div>
      </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="reservation">请假时间:</label>
            <div class="col-sm-10">
                <div class="input-group">
                    <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                    </div>
                    <input type="text" name="timeRange" class="form-control pull-right" id="reservation">
                </div>
            </div>
            <!-- /.input group -->
        </div>
    </div>
    <!-- /.box-body -->
    <div class="box-footer">
      <button type="button" class="btn btn-default" onclick="showLab('${backUrl!}')">返回</button>
      <button type="submit" class="btn btn-info pull-right">提交</button>
    </div>
    <!-- /.box-footer -->
  </form>
</div>
<script src="/plugins/daterangepicker/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<script>

    $('#reservation').daterangepicker();

    $("#form${uuid}").submit(function () {

        var data = $(this).serialize();
        jQuery.ajax({
            type: "POST",
            url: "/emp/submitVacate",
            data: data,
            dataType: "json"
        }).done(function (result) {
            if (result.status === 200) {
                messageBox("提交成功!");
                // todo
            } else {
                messageBox("操作失败!");
            }
        });
        return false;
    });

</script>