<#assign uuid=.now?string["hhmmSSsss"]/>
<link rel="stylesheet" href="/plugins/datepicker/datepicker3.css">
<link rel="stylesheet" href="/plugins/iCheck/all.css">

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">
            <#if train??>
                更新
            <#else >
                新建
            </#if>培训
        </h3>
    </div>
    <!-- /.box-header -->
    <!-- form start -->
    <form role="form" class="form-horizontal" id="form${uuid}">
        <div class="box-body">
            <#if train??>
                <input type="hidden" name="id" value="${train.id}">
            </#if>
            <div class="form-group">
                <label class="col-sm-3 control-label">标题：</label>
                <div class="col-sm-9">
                    <input type="text" name="title" class="form-control" <#if train??>value="${train.title!}"</#if>>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">内容：</label>
                <div class="col-sm-9">
                    <textarea name="text" class="form-control"><#if train??>${train.text!}</#if></textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">开始时间：</label>
                <div class="col-sm-9">
                    <input type="text" name="startTime" class="form-control" id="startTime" required readonly <#if train??>value="${train.startTime?string('yyyy/MM/dd')}"</#if>>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">结束时间：</label>
                <div class="col-sm-9">
                    <input type="text" name="endTime" class="form-control" id="endTime" required readonly <#if train??>value="${train.endTime?string('yyyy/MM/dd')}"</#if>>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">参加员工：</label><br>
                <input type="hidden" id="empIds" name="empIds">
                <button type="button" class="btn btn-sm btn-primary" onclick="selectAll()">全选/取消</button>
                <table class="table table-hover">
                    <tbody id="tbody${uuid}" style="text-align: center">
                        <#list empList as item>
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox" class="flat-red" value="${item.id}" <#if train?? && empIds?seq_contains(item.id)>checked</#if>>
                                    </label>
                                </td>
                                <td>${item.name}</td>
                                <td>${item.post}</td>
                                <td>${item.joinTime?string('dd.MM.yyyy')}</td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- /.box-body -->

        <div class="box-footer">
            <button type="submit" class="btn btn-primary">提交</button>
        </div>
    </form>
</div>



<script src="/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="/plugins/iCheck/icheck.min.js"></script>
<script>
    var flag  = false;
    function selectAll() {
        var tbody = $("#tbody${uuid}");
        var boxes = tbody.find("input[type=checkbox]");
        jQuery.each(boxes, function (k, v) {
            if (flag) {
                $(v).iCheck('uncheck');
            } else {
                $(v).iCheck('check');
            }
        });
        flag = !flag;
        getVal();
    }

    $('#startTime').datepicker({
        language: "zh-CN",
        format: "yyyy/mm/dd"
    });
    $('#endTime').datepicker({
        language: "zh-CN",
        format: "yyyy/mm/dd"
    });

    function getVal() {
        var arr = [];
        $('#tbody${uuid} input[type="checkbox"]:checked').each(function() {
            arr.push($(this).val());
        });
        return arr;
    }

    $('input[type="checkbox"].flat-red').iCheck({
        checkboxClass: 'icheckbox_flat-green',
        radioClass: 'iradio_flat-green'
    });

    $("#form${uuid}").submit(function () {
        var arr = getVal();
        $("#empIds").val(arr.join(","));

        var formData = $(this).serialize();

        jQuery.ajax({
            url: "/emp/newTrain",
            type: "POST",
            data: formData<#if train??> + '&type=update' <#else > + '&type=create'</#if>
        }).done(function (result) {
            if (result.status === 200) {
                messageBox("提交成功！");
                // todo
            } else {
                messageBox("提交失败！");
            }
        });

        return false;
    });
</script>