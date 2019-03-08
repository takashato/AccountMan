{% extends "layouts/main-layout.volt" %}
{% block title %}Account Manage{% endblock %}
{% block css %}
    <!-- DataTables -->
    <link rel="stylesheet" href="node_modules/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="node_modules/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <style>
        .selected {
            background: #cccccc !important;
        }
    </style>
{% endblock %}
{% block content_header %}
    Accounts
    <small>Manage all accounts</small>
{% endblock %}
{% block breadcrumb %}
    <li><a href="#"><i class="fa fa-dashboard"></i> Accounts</a></li>
    <li class="active">Manage</li>
{% endblock %}
{% block content %}
    <div class="box">
        <!-- /.box-header -->
        <div class="box-body">
            <table id="data-table" class="table table-bordered table-striped" style="width:100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>E-mail</th>
                    <th>Full-name</th>
                    <th>Gender</th>
                    <th>Birthday</th>
                    <th>Create date</th>
                    <th>Last update date</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>E-mail</th>
                    <th>Full-name</th>
                    <th>Gender</th>
                    <th>Birthday</th>
                    <th>Create date</th>
                    <th>Last update date</th>
                </tr>
                </tfoot>
            </table>
            <div>
                <div style="float: left;">
                    <button class="btn btn-success" data-toggle="modal" data-target="#modal-add"><i
                                class="fa fa-plus"></i> Add new account
                    </button>
                </div>
                <div style="float: right;">
                    <button class="btn btn-info" id="edit-btn" data-toggle="modal" data-target="#modal-edit"><i class="fa fa-edit"></i> Edit</button>
                    <button class="btn btn-danger" id="delete-btn" data-toggle="modal" data-target="#modal-delete"><i
                                class="fa fa-remove"></i> Delete
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal-add">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="" id="add-new-account-form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Add new account</h4>
                    </div>
                    <div class="modal-body">
                        <div class="callout callout-success" style="display: none" id="add-success">
                            <h4><i class="icon fa fa-check"></i> Added account successfully!</h4>
                            Close this dialog or add other new account.
                        </div>
                        <div class="callout callout-danger" style="display: none" id="add-fail">
                            <h4><i class="icon fa fa-ban"></i> Failed to add new account!</h4>
                            <span id="add-error-msg"></span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" name="username" class="form-control" placeholder="Username" required>
                        </div>
                        <br/>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-key"></i></span>
                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                        </div>
                        <br/>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                            <input type="email" name="email" class="form-control" placeholder="E-mail" required>
                        </div>
                        <br/>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user-circle"></i></span>
                            <input type="text" name="fullname" class="form-control" placeholder="Full-name" required>
                        </div>
                        <br/>
                        <div class="form-group">
                            <label>Gender:</label>
                            <select class="form-control" name="gender">
                                <option value="0">Female</option>
                                <option value="1">Male</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Date of Birth:</label>
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" name="birthday" class="form-control pull-right datepicker" required>
                            </div>
                            <!-- /.input group -->
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save account</button>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="modal-edit">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="" id="edit-account-form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Edit account</h4>
                    </div>
                    <div class="modal-body">
                        <div class="callout callout-success" style="display: none" id="edit-success">
                            <h4><i class="icon fa fa-check"></i> Save account successfully!</h4>
                            Close this dialog or continue editing this account.
                        </div>
                        <div class="callout callout-danger" style="display: none" id="edit-fail">
                            <h4><i class="icon fa fa-ban"></i> Failed to save account!</h4>
                            <span id="edit-error-msg"></span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user-secret"></i></span>
                            <input type="text" name="id" class="form-control" id="field-id" required>
                        </div><br/>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" name="username" class="form-control" placeholder="Username" id="field-username" required>
                        </div>
                        <br/>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-key"></i></span>
                            <input type="password" name="password" class="form-control" placeholder="Password (leaving blank means not change)" id="field-password">
                        </div>
                        <br/>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                            <input type="email" name="email" class="form-control" placeholder="E-mail" id="field-email" required>
                        </div>
                        <br/>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user-circle"></i></span>
                            <input type="text" name="fullname" class="form-control" placeholder="Full-name" id="field-fullname" required>
                        </div>
                        <br/>
                        <div class="form-group">
                            <label>Gender:</label>
                            <select class="form-control" name="gender" id="field-gender">
                                <option value="0">Female</option>
                                <option value="1">Male</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Date of Birth:</label>
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" name="birthday" class="form-control pull-right datepicker" id="field-birthday" required>
                            </div>
                            <!-- /.input group -->
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save account</button>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal modal-warning fade" id="modal-delete">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Delete account</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure want to delete account <b id="modal-delete-account-name"></b><br/>
                        This action can not be reversed.</p>
                    <input type="hidden" id="id-to-be-deleted">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-outline" id="confirm-delete-btn">Confirm</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

{% endblock %}
{% block js %}
    <!-- DataTables -->
    <script src="node_modules/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="node_modules/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="node_modules/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <!-- JS -->
    <script>
        $(document).ready(function () {
            let selectedCells;

            if (window.location.hash == "#modal-add") {
                $('#modal-add').modal('show');
            }

            $('.datepicker').datepicker({
                autoclose: true,
                format: "dd/mm/yyyy"
            });

            let table = $('#data-table').DataTable({
                "processing": true,
                "serverSide": true,
                "ajax": "api/load"
            });

            $('#data-table tbody').on('click', 'tr', function () {
                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                    selectedCells = $(this).children("td");
                }
            });

            /* Save new account */
            $('#add-new-account-form').on('submit', function () {
                $.ajax({
                    method: "POST",
                    url: "api/add",
                    data: $('#add-new-account-form').serializeArray(),
                    dataType: 'json'
                }).done(function (res) {
                    if (res.success) {
                        $("#add-success").fadeIn().delay(2000).fadeOut();
                        table.ajax.reload();
                        $('#add-new-account-form').trigger("reset");
                    } else {
                        $("#add-fail").fadeIn().delay(2000).fadeOut();
                        $("#add-error-msg").html(res.msg);
                    }
                });
                return false;
            });

            /* Delete account */
            $('#delete-btn').on('click', function () {
                if (selectedCells == null) {
                    return false;
                }

                $('#modal-delete-account-name').text(selectedCells.eq(1).text());
                $('#id-to-be-deleted').val(selectedCells.eq(0).text());
            });

            $('#confirm-delete-btn').on('click', function () {
                $.ajax({
                    method: "POST",
                    url: "api/delete",
                    data: {id: $('#id-to-be-deleted').val()},
                    dataType: 'json'
                }).done((res) => {
                    if (!res.success) {
                        alert(res.msg);
                    }
                    table.ajax.reload();
                    $('#modal-delete').modal('toggle');
                });
            });

            /* Edit account */
            $('#edit-btn').on('click', function () {
                if (selectedCells == null) {
                    return false;
                }

                $('#field-id').val(selectedCells.eq(0).text());
                $('#field-username').val(selectedCells.eq(1).text());
                $('#field-password').val("");
                $('#field-email').val(selectedCells.eq(2).text());
                $('#field-fullname').val(selectedCells.eq(3).text());
                $('#field-gender').val(selectedCells.eq(4).text() === "Male" ? 1 : 0);
                $('#field-birthday').val(selectedCells.eq(5).text());
            });

            $('#edit-account-form').on('submit', function () {
                let toPost = $('#edit-account-form').serializeArray();
                toPost.id = $("#field-id").val();
                $.ajax({
                    method: "POST",
                    url: "api/edit",
                    data: toPost,
                    dataType: 'json'
                }).done(function (res) {
                    if (res.success) {
                        $("#edit-success").fadeIn().delay(2000).fadeOut();
                        table.ajax.reload();
                    } else {
                        $("#edit-fail").fadeIn().delay(2000).fadeOut();
                        $("#edit-error-msg").html(res.msg);
                    }
                });
                return false;
            });
        });
    </script>
{% endblock %}