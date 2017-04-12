app.controller("RoleController", function ($scope) {

    PreBind();

    function PreBind() {
        RoleBindGrid();
    }

    $scope.RoleShowModal = function () {
        $("#RoleModal").modal('show');
    }
    $scope.RoleCloseModal = function () {
        $("#RoleModal").modal('hide');
    }

    $scope.RoleFetchById = function (recordId) {
        //Http GET call and populate role model
    }

    function RoleBindGrid() {
        //$("#RoleTable").dataTable().fnDestroy();
        $("#RoleTable").Datatable({
            "ajax": {
                "url": "/Role/FetchRoleList",
                "type": "POST"
            },
            "deferRender": true,
            "serverSide": true,
            "autoWidth": true,
            "stateSave": true,
            "columns": [
                { "data": "Id" },
                { "data": "Name" },
                {
                    "width": "15%", orderable: false,
                    "render": function (data, type, row) {
                        return '<ul class="icons-list"><li class="dropdown">  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-menu9"></i>  </a>  <ul class="dropdown-menu dropdown-menu-right"><li><a onclick="RoleFetchById(' + row.Id + ')"><i class="icon-database-edit2"></i> Edit</a></li>  </ul> </li></ul>';
                    },
                    "className": "text-center"
                },
            ]
        });
        //$('#RoleTable').DataTable({
        //    "processing": false,
        //    "bFilter": false,
        //    "oLanguage": {
        //        "sSearch": "",
        //        "sSearchPlaceholder": "Search...",
        //        "sLengthMenu": "_MENU_",
        //        "oPaginate":
        //       {
        //           "sNext": '→',
        //           "sLast": 'Last',
        //           "sFirst": 'First',
        //           "sPrevious": '←'
        //       },
        //    },
        //    "initComplete": function (settings, json) {
        //        $("[name=RoleTable_length]").addClass("form-control");
        //    },
        //    "serverSide": true,
        //    "ajaxSource": "/Role/Fetch",
        //    //fnServerData method used to inject the parameters into the AJAX call sent to the server-side
        //    "fnServerData": function (sSource, aoData, fnCallback) {
        //        BlockUI();
        //        aoData.push({ "name": "SearchJson", "value": JSON.stringify($scope.roleSearch) }); // Add some extra data to the sender
        //        $.getJSON(sSource, aoData, function (d) {
        //            /* Do whatever additional processing you want on the callback, then tell DataTables */
        //            if (!d.msg.Success)
        //                ShowMessage(d.msg);
        //            else
        //                fnCallback(d.Data);
        //            UnBlockUI();
        //        });
        //    },
        //    "bResetDisplay": false,
        //    "aaSorting": [],
        //    "columns": [
        //        { "data": "FirstName" },
        //        { "data": "LastName" },
        //        { "data": "SerialNumber" },
        //        { "data": "Email" },
        //        {
        //            "data": "IsActive",
        //            "render": function (data, type, row) {
        //                return Label(row.IsActive);
        //            },
        //        },
        //         {
        //             "width": "15%", orderable: false,
        //             "render": function (data, type, row) {
        //                 return '<ul class="icons-list"><li class="dropdown">  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-menu9"></i>  </a>  <ul class="dropdown-menu dropdown-menu-right"><li><a onclick="RoleFetchById(' + row.Id + ')"><i class="icon-database-edit2"></i> Edit</a></li>  </ul> </li></ul>';
        //             },
        //             "className": "text-center"
        //         },
        //    ]
        //});
    }

    $scope.role = {
        Id: "",
        Name: ""
    };

    function PreBind() {
        Get("/Role/FetchRoleTypes").then(function (d) {
            if (d.msg.Success) {
                $scope.roleTypes = d.Data.roleRolesLogin;//d.Data.roleTypes;
                // $scope.roleTypesForLogin = d.Data.roleRolesLogin;
                $scope.$apply();
            }
            else
                ShowMessage(d);
        });

        BindForm();
    }


    //function BindForm() Check the call for edit
    function BindForm() {
        //editRole is object retrieve data for edit
        var editRole = FetchParams();
        //isEdit is boolean type variable that check the call for save or Edit
        if (editRole.isEdit) {
            Get('/Role/FetchRoleById?roleId=' + editRole.roleId).then(function (d) {
                if (d.msg.Success) {
                    $scope.role.Id = d.Data.Id;
                    $scope.role.RoleType_Id = d.Data.RoleType_Id;
                    $scope.role.FirstName = d.Data.FirstName;
                    $scope.role.LastName = d.Data.LastName;
                    $scope.role.Email = d.Data.Email;
                    $scope.role.IsActive = d.Data.IsActive;
                    $scope.role.City = d.Data.City;
                    $scope.role.Address = d.Data.Address;
                    $scope.role.Phone = d.Data.Phone;
                    $scope.role.CNIC = d.Data.CNIC;
                    $scope.role.SerialNumber = d.Data.SerialNumber;
                    $scope.role.AspNetRole_Id = d.Data.AspNetRole_Id;
                    $scope.role.IsLoginSetup = d.Data.IsLoginSetup;
                    $scope.role.AspNetRolename = d.Data.AspNetRolename;
                    $scope.role.AspNetPassword = d.Data.AspNetPassword;
                    $scope.$apply();
                    $scope.LoginSetup();
                }
            })

        }
    }
    $scope.SubmitForm = function () {
        if ($scope.role.SaveAndAdd)
            $scope.RoleSaveAndAdd();

        else
            $scope.RoleSave()
    }

    $scope.RoleSave = function () {
        Post("/Role/Save", { role: $scope.role }).then(function (d) {
            if (d.Success)
                ShowMessage(d);
        });
    }

    $scope.RoleClearFields = function () {

        $scope.role.Id = "";
        $scope.role.Name = "";
        $scope.$apply()
    }
});