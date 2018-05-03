function showLab(url, title, aside) {
    if (url.trim() === "") return;
    $.ajax({
        type: "GET",
        url: url,
        dataType: "html"
    }).done(function (data) {
        if (title && title.trim() !== "") {
            var tpl = title;
            if (aside && aside.trim() !== "") {
                tpl += "<small>" + aside + "</small>";
            }
            $("#content-header").html(tpl);
        }
        $("#container-view").html(data);
    })
}


function messageBox(data) {
    $("#message-box").find(".modal-body").html(data);
    $("#message-box").modal({
        show: true,
        backdrop: false
    });
}

function showDataBox(title, content) {
    var model = $("#showdata-box");
    model.find(".modal-title").html(title);
    model.find(".modal-body").html(content);
    model.modal("show");
}

function formBox(title, content, ajax) {
    var model = $("#form-box");
    model.find(".modal-title").html(title);
    model.find(".modal-body").html(content);
    model.find("form").submit(function () {
        var data = $(this).serialize();
        $.ajax({
            type: ajax.type || "POST",
            url: ajax.url,
            data: ajax.data || data,
            dataType: ajax.dataType || "json",
            success: function (result) {
                ajax.success(result);
            }
        });
        model.modal("hide");
        return false;
    });
    model.modal("show");
}