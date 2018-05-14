



        <!-- Profile Image -->
        <div class="box box-primary load-content">
            <div class="box-header with-border">
                <h3 class="box-title">修改密码</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <div class="box-body box-profile">
                <form class="form-horizontal" id="modifyPwd">
                    <div class="form-group">
                        <div id="alert" style="display: none;" class="alert alert-danger" role="alert">...</div>
                    </div>
                    <div class="form-group">
                        <label for="oldPwd" class="col-sm-2 control-label">旧密码</label>

                        <div class="col-sm-10">
                            <input type="password" name="oldPwd" class="form-control" id="oldPwd" placeholder="old password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newPwd" class="col-sm-2 control-label">新密码</label>

                        <div class="col-sm-10">
                            <input type="password" name="newPwd" class="form-control" id="newPwd" placeholder="new password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rePwd" class="col-sm-2 control-label">重复密码</label>

                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="rePwd" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-danger">提交</button>
                        </div>
                    </div>
                </form>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->


<script>

    $("#modifyPwd").submit(function () {

        var newPwd = $("#newPwd").val();
        var rePwd = $("#rePwd").val();

        if (newPwd !== rePwd) {
            $("#alert").html("两次密码不一致").show();
            return false;
        }
        $("#alert").hide();
        var data = $(this).serialize();
        jQuery.ajax({
            url: "account/modifyPwd",
            type: "POST",
            data: data,
            dataType: "json"
        }).done(function (rel) {
            if (rel.status === 200)
                window.location.reload();
        });

        return false;
    });

</script>