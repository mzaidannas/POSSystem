var app = angular.module('POSSystem', []);
$(function () {

    //$('.pickadate-accessibility').pickadate({
    //    labelMonthNext: 'Go to the next month',
    //    labelMonthPrev: 'Go to the previous month',
    //    labelMonthSelect: 'Pick a month from the dropdown',
    //    labelYearSelect: 'Pick a year from the dropdown',
    //    selectMonths: true,
    //    selectYears: true,
    //    format: 'dd/mm/yyyy'
    //});
    //$('.daterange-basic').daterangepicker({
    //    applyClass: 'bg-slate-600',
    //    cancelClass: 'btn-default',
    //    locale: {
    //        format: 'DD/MM/YYYY',
    //    }
    //});

    $('.daterange-basic').val('');

    $('.daterange-basic').on('cancel.daterangepicker', function (ev, picker) {
        $(this).val('');
    });

})
function Print(html) {
    //var prtContent = document.getElementById(printDivId);
    var WinPrint = window.open('', '', 'left=0,top=0,width=780,height=600,toolbar=0,scrollbars=1,status=1');
    WinPrint.document.write(html);
    WinPrint.document.close();
    WinPrint.focus();
    WinPrint.print();
    WinPrint.close();
    //prtContent.innerHTML = strOldOne;

}
function FetchHdfValue(id) {
    return $("#" + id).val();
}
function SetHdfValue(id, value) {
    $("#" + id).val(value);
}
$(document).on("keypress", ".allow-number", function (evt) {
    return AllowNumber(evt);
});

$(document).on("keypress", ".allow-number-decimal", function (evt) {
    return AllowDecimal(evt);
});

function RedirectDelay(url) {
    setTimeout(function () { window.location.href = url; }, 3000);
}

function FetchParams() {
    var url = window.location.href;
    var regex = /([^=&?]+)=([^&#]*)/g, params = {}, parts, key, value;

    while ((parts = regex.exec(url)) != null) {

        key = parts[1], value = parts[2];
        var isArray = /\[\]$/.test(key);

        if (isArray) {

            params[key] = params[key] || [];
            params[key].push(value);
        }
        else {

            params[key] = value;
        }
    }

    return params;
}

function FetchParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function AllowNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
function AllowDecimal(evt) {

    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    } else {
        // If the number field already has . then don't allow to enter . again.
        if (evt.target.value.search(/\./) > -1 && charCode == 46) {
            return false;
        }
        return true;
    }
}
function FetchRandomColorHexa() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
function SuccessMessage(msg) {
    // toastr.success(msg);
    new PNotify({
        title: 'Success',
        text: msg,
        addclass: 'alert-styled-left alert-arrow-left',
        type: 'success'
    });
}
function ErrorMessage(msg) {
    // toastr.error(msg);
    new PNotify({
        title: 'Error',
        text: msg,
        addclass: 'alert-styled-left alert-arrow-left',
        type: 'error'
    });
}
function WarningMessage(msg) {
    //toastr.warning(msg);
    new PNotify({
        title: 'Warning',
        text: msg,
        addclass: 'alert-styled-left alert-arrow-left',
        type: 'warning'
    });
}
function InfoMessage(msg) {
    //toastr.info(msg);
    new PNotify({
        title: 'Info',
        text: msg,
        addclass: 'alert-styled-left alert-arrow-left',
        type: 'info'
    });
}
function ShowMessage(msg) {
    if (!($.type(msg.MessageDetail) === "undefined")) {
        if (msg.Info) {
            InfoMessage(msg.MessageDetail);
        }
        else if (msg.Warning) {
            WarningMessage(msg.MessageDetail);
        }
        else if (msg.Success) {
            SuccessMessage(msg.MessageDetail);
        }
        else if (!msg.Success) {
            ErrorMessage(msg.MessageDetail);
        }
        else if (msg.Info) {
            InfoMessage(msg.MessageDetail);
        }
        else if (msg.Warning) {
            WarningMessage(msg.MessageDetail);
        }
    }
}
function BlockUI() {
    $(".divLoader").fadeIn("slow");
}
function UnBlockUI() {
    $(".divLoader").fadeOut("slow");
}
function AccessDenied() {
    swal({
        title: "Unauthorized access has been detected",
        text: "You are not authorize to perform this action",
        confirmButtonColor: "#EF5350",
        confirmButtonText: "Ok, got it!",
        type: "error"
    });
}
function ConvertDecimal(value) {
    return parseFloat(value.toFixed(2));
}
function StatusLabel(status) {

    switch (status) {
        case 'Other':
            return '<span class="label" style="background:gray">' + status + '</span>'
            break;
        case 'Delivered':
            return '<span class="label" style="background:green">' + status + '</span>'
            break;
        case 'Returned':
            return '<span class="label" style="background:orange">' + status + '</span>'
            break;
        case 'Canceled':
            return '<span class="label" style="background:black">' + status + '</span>'
            break;
        case 'Pending':
            return '<span class="label" style="background:#b9b900">' + status + '</span>'
            break;
        case 'ReadyToShip':
            return '<span class="label" style="background:blue">' + status + '</span>'
            break;
        case 'Dispatched':
            return '<span class="label" style="background:green">' + status + '</span>'
            break;
        case 'Undelivered':
            return '<span class="label" style="background:red">' + status + '</span>'
            break;
        default:
            return '<span class="label label-default">' + status + '</span>'
    }
}