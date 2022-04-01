
$(document).ready(function () {
    $(document).on('click', '.btn-reply', function () {
        var micropostId = $(this).data("id")
        var parentId = $(this).data("parent-id")
        $.ajax({
            method: "get",
            url: "/microposts/" + micropostId + "/comments/new?parent_id=" + parentId
        })
    })

});