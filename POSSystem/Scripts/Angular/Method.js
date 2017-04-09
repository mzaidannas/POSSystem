function Post(url, data, isBlockUI) {
    if (typeof isBlockUI === "undefined") {
        BlockUI();
    }

    return $.ajax({
        method: "Post",
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (d) {
            UnBlockUI();
            if ($.type(d) == "string") {
                AccessDenied();
                //  $("#body").html(d);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            UnBlockUI();
            ErrorMessage("Something went wrong, please try again");
        }
    });
}

function Get(url, isBlockUI) {
    if (typeof isBlockUI === "undefined") {
        isBlockUI = true;
        BlockUI();
    }
    return $.ajax({
        method: "Get",
        url: url,
        success: function (d) {
            UnBlockUI();
            if ($.type(d) == "string") {
                AccessDenied();
                //$("#body").html(d);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            UnBlockUI();
            ErrorMessage("Something went wrong, please try again");
        }
    });
}

function GetWithoutAccess(url) {
    return $.ajax({
        method: "Get",
        url: url,
        success: function (d) {
            UnBlockUI();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            UnBlockUI();
            ErrorMessage("Something went wrong, please try again");
        }
    });
}
function PostWithoutAccess(url, data) {
    return $.ajax({
        method: "Post",
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (d) {
            UnBlockUI();
            if ($.type(d) == "string") {
                AccessDenied();
                //  $("#body").html(d);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            UnBlockUI();
            ErrorMessage("Something went wrong, please try again");
        }
    });
}
function Put(url, data, isBlockUI) {
    if (typeof isBlockUI === "undefined") {
        BlockUI();
    }

    return $.ajax({
        method: "PUT",
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (d) {
            UnBlockUI();
            if ($.type(d) == "string") {
                AccessDenied();
                //  $("#body").html(d);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            UnBlockUI();
            ErrorMessage("Something went wrong, please try again");
        }
    });
}
function Patch(url, data, isBlockUI) {
    if (typeof isBlockUI === "undefined") {
        BlockUI();
    }

    return $.ajax({
        method: "PATCH",
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (d) {
            UnBlockUI();
            if ($.type(d) == "string") {
                AccessDenied();
                //  $("#body").html(d);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            UnBlockUI();
            ErrorMessage("Something went wrong, please try again");
        }
    });
}
function Delete(url, data, isBlockUI) {
    if (typeof isBlockUI === "undefined") {
        BlockUI();
    }

    return $.ajax({
        method: "DELETE",
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (d) {
            UnBlockUI();
            if ($.type(d) == "string") {
                AccessDenied();
                //  $("#body").html(d);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            UnBlockUI();
            ErrorMessage("Something went wrong, please try again");
        }
    });
}