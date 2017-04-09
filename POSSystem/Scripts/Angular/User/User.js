
app.controller("UserController", function ($scope, $compile) {


    $scope.userSearch = {
        Search: "",
        Active: "",

    };

    PreBind();

    function PreBind() {
        UserBindGrid();
    }

    $scope.UserShowModal = function () {
        $scope.UserClearFields();
        $("#UserModal").modal('show');
    }

    $scope.UserFetchById = function (recordId) {
        window.location.href = '/User/UserForm?isEdit=true&userId=' + recordId;

    }

    $scope.UserFetch = function () {
        UserBindGrid();
    }
    function UserBindGrid() {
        //$("#UserTable").dataTable().fnDestroy();
        $("#UserTable").Datatable({
            "ajax": {
                "url": "/User/",
                "type": "POST"
            },
            "deferRender": true,
            "serverSide": true,
            "autoWidth": true,
            "stateSave": true
        });
        $('#UserTable').DataTable({
            "processing": false,
            "bFilter": false,
            "oLanguage": {
                "sSearch": "",
                "sSearchPlaceholder": "Search...",
                "sLengthMenu": "_MENU_",
                "oPaginate":
               {
                   "sNext": '→',
                   "sLast": 'Last',
                   "sFirst": 'First',
                   "sPrevious": '←'
               },
            },
            "initComplete": function (settings, json) {
                $("[name=UserTable_length]").addClass("form-control");
            },
            "serverSide": true,
            "ajaxSource": "/User/Fetch",
            //fnServerData method used to inject the parameters into the AJAX call sent to the server-side
            "fnServerData": function (sSource, aoData, fnCallback) {
                BlockUI();
                aoData.push({ "name": "SearchJson", "value": JSON.stringify($scope.userSearch) }); // Add some extra data to the sender
                $.getJSON(sSource, aoData, function (d) {
                    /* Do whatever additional processing you want on the callback, then tell DataTables */
                    if (!d.msg.Success)
                        ShowMessage(d.msg);
                    else
                        fnCallback(d.Data);
                    UnBlockUI();
                });
            },
            "bResetDisplay": false,
            "aaSorting": [],
            "columns": [
                { "data": "FirstName" },
                { "data": "LastName" },
                { "data": "SerialNumber" },
                { "data": "Email" },
                {
                    "data": "IsActive",
                    "render": function (data, type, row) {
                        return Label(row.IsActive);
                    },
                },
                 {
                     "width": "15%", orderable: false,
                     "render": function (data, type, row) {
                         return '<ul class="icons-list"><li class="dropdown">  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-menu9"></i>  </a>  <ul class="dropdown-menu dropdown-menu-right"><li><a onclick="UserFetchById(' + row.Id + ')"><i class="icon-database-edit2"></i> Edit</a></li>  </ul> </li></ul>';
                     },
                     "className": "text-center"
                 },


            ]
        });
    }

    $scope.user = {
        Id: 0,
        FirstName: "",
        LastName: "",
        SerialNumber: "",
        Email: "",
        Phone: "",
        CNIC: "",
        Address: "",
        City: "",
        UserType_Id: "",
        IsActive: true,
        //AspNetUserTypeRole_Id: "",
        AspNetUsername: "",
        AspNetPassword: "",
        AspNetUser_Id: "",
        IsLoginSetup: false,
        SaveAndAdd: false
    };

    function PreBind() {
        Get("/User/FetchUserTypes").then(function (d) {
            if (d.msg.Success) {
                $scope.userTypes = d.Data.userRolesLogin;//d.Data.userTypes;
                // $scope.userTypesForLogin = d.Data.userRolesLogin;
                $scope.$apply();
            }
            else
                ShowMessage(d);
        })

        BindForm();
    }


    //function BindForm() Check the call for edit
    function BindForm() {
        //editUser is object retrieve data for edit
        var editUser = FetchParams();
        //isEdit is boolean type variable that check the call for save or Edit
        if (editUser.isEdit) {
            Get('/User/FetchUserById?userId=' + editUser.userId).then(function (d) {
                if (d.msg.Success) {
                    $scope.user.Id = d.Data.Id;
                    $scope.user.UserType_Id = d.Data.UserType_Id;
                    $scope.user.FirstName = d.Data.FirstName;
                    $scope.user.LastName = d.Data.LastName;
                    $scope.user.Email = d.Data.Email;
                    $scope.user.IsActive = d.Data.IsActive;
                    $scope.user.City = d.Data.City;
                    $scope.user.Address = d.Data.Address;
                    $scope.user.Phone = d.Data.Phone;
                    $scope.user.CNIC = d.Data.CNIC;
                    $scope.user.SerialNumber = d.Data.SerialNumber;
                    $scope.user.AspNetUser_Id = d.Data.AspNetUser_Id;
                    $scope.user.IsLoginSetup = d.Data.IsLoginSetup;
                    $scope.user.AspNetUsername = d.Data.AspNetUsername;
                    $scope.user.AspNetPassword = d.Data.AspNetPassword;
                    $scope.$apply();
                    $scope.LoginSetup();
                }
            })

        }
    }
    $scope.SubmitForm = function () {
        if ($scope.user.SaveAndAdd)
            $scope.UserSaveAndAdd();

        else
            $scope.UserSave()
    }

    $scope.UserSave = function () {


        //var id = event.currentTarget.button.id;
        if ($scope.user.IsLoginSetup) {
            if ($scope.user.UserType_Id == "" || $scope.user.AspNetUsername == "" || $scope.user.AspNetPassword == "") {
                InfoMessage("Please fill all fields in login setup form");
                return;
            }
        }
        Post("/User/Save", { user: $scope.user }).then(function (d) {
            if (d.Success)
                RedirectDelay("/User");

            ShowMessage(d);
        })


    }

    //function for save and add new
    $scope.UserSaveAndAdd = function () {
        if ($scope.user.IsLoginSetup) {
            if ($scope.user.UserType_Id == "" || $scope.user.AspNetUsername == "" || $scope.user.AspNetPassword == "") {
                InfoMessage("Please fill all fields in login setup form");
                return;
            }
        }
        Post("/User/Save", { user: $scope.user }).then(function (d) {
            if (d.Success) {
                $scope.UserClearFields(); $scope.LoginSetup();
            }

            ShowMessage(d);
        })

    }

    $scope.UserClearFields = function () {

        $scope.user.Id = 0;
        $scope.user.FirstName = "";
        $scope.user.LastName = "";
        $scope.user.SerialNumber = "";
        $scope.user.Email = "";
        $scope.user.Phone = "";
        $scope.user.CNIC = "";
        $scope.user.Address = "";
        $scope.user.City = "";
        $scope.user.UserType_Id = "";
        $scope.user.IsActive = true;
        $scope.user.AspNetUsername = "";
        $scope.user.AspNetPassword = "";
        $scope.user.AspNetUser_Id = "";
        $scope.user.IsLoginSetup = false;
        $scope.user.SaveAndAdd = false;

        $scope.$apply()
    }

    $scope.LoginSetup = function () {

        if ($scope.user.IsLoginSetup)
            $('#LoginDiv').fadeIn(1000);

        else
            $('#LoginDiv').fadeOut(1000);

    }
});

function UserFetchById(recordId) {
    angular.element(document.getElementById('DivUserManagement')).scope().UserFetchById(recordId);

}