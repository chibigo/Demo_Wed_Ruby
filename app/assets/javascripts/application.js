
$(document).ready(function () {
    $(document).on('click', '.btn-reply', function () {
        var micropostId = $(this).data("id")
        var parentId = $(this).data("parent-id")
        $.ajax({
            method: "get",
            url: "/microposts/" + micropostId + "/comments/new?parent_id=" + parentId
        })
    })

    $(document).on('click', '.btn-update', function () {
        var commentId = $(this).data("comment-id")
        $.ajax({
            method: "get",
            url: "/comments/" + commentId + "/edit"
        })
    })

    $(document).on('click', '.btn_comment', function () {
        var micropostId = $(this).data("id")
        // console.log(micropostId)
        var classCm = ".comment" + "-" + micropostId
        // console.log(classCm)
        $(classCm).toggle("active");
    })


});