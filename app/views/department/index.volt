{% extends "layouts/main-layout.volt" %}
{% block title %}Department Manage{% endblock %}
{% block css %}
    <!-- DataTables -->
    <link rel="stylesheet" href="node_modules/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="node_modules/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="node_modules/select2/dist/css/select2.min.css">
    <style>
        .selected {
            background: #cccccc !important;
        }
    </style>
{% endblock %}
{% block content_header %}
    Departments
    <small>Manage all departments</small>
{% endblock %}
{% block breadcrumb %}
    <li><a href="#"><i class="fa fa-dashboard"></i> Departments</a></li>
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
                    <th>Name</th>
                    <th>Staffs</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Staffs</th>
                </tr>
                </tfoot>
            </table>
            <div>
                <div style="float: left;">
                    <button class="btn btn-success" data-toggle="modal" data-target="#modal-add"><i
                                class="fa fa-plus"></i> Add new department
                    </button>
                </div>
                <div style="float: right;">
                    <button class="btn btn-info" id="edit-btn" data-toggle="modal" data-target="#modal-edit"><i
                                class="fa fa-edit"></i> Edit
                    </button>
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
                <form action="" id="add-new-department-form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Add new department</h4>
                    </div>
                    <div class="modal-body">
                        <div class="callout callout-success" style="display: none" id="add-success">
                            <h4><i class="icon fa fa-check"></i> Added department successfully!</h4>
                            Close this dialog or add other new department.
                        </div>
                        <div class="callout callout-danger" style="display: none" id="add-fail">
                            <h4><i class="icon fa fa-ban"></i> Failed to add new department!</h4>
                            <span id="add-error-msg"></span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" name="name" class="form-control" placeholder="Department name" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save department</button>
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
                <form action="" id="edit-department-form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Edit department</h4>
                    </div>
                    <div class="modal-body">
                        <div class="callout callout-success" style="display: none" id="edit-success">
                            <h4><i class="icon fa fa-check"></i> Save department successfully!</h4>
                            Close this dialog or continue editing this department.
                        </div>
                        <div class="callout callout-danger" style="display: none" id="edit-fail">
                            <h4><i class="icon fa fa-ban"></i> Failed to save department!</h4>
                            <span id="edit-error-msg"></span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user-secret"></i></span>
                            <input type="text" name="id" class="form-control" id="field-id" required readonly>
                        </div>
                        <br/>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" name="name" class="form-control" placeholder="Department name"
                                   id="field-name" required>
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
                    <h4 class="modal-title">Delete department</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure want to delete department <b id="modal-delete-account-name"></b><br/>
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
    <!-- Select2 -->
    <script src="node_modules/select2/dist/js/select2.full.min.js"></script>
    <!-- DataTables -->
    <script src="node_modules/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="node_modules/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="node_modules/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <!-- JS -->
    <script>
        $(document).ready(function () {
            let selectedCells;

            let table = $('#data-table').DataTable({
                "processing": true,
                "serverSide": true,
                "ajax": {
                    url: "api/department/fullload",
                    data: function (d) {

                    }
                }
            });

            $('#data-table tbody').on('click', 'tr', function () {
                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                } else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                    selectedCells = $(this).children("td");
                }
            });

            /* Save new account */
            $('#add-new-department-form').on('submit', function () {
                $.ajax({
                    method: "POST",
                    url: "api/department/add",
                    data: $('#add-new-department-form').serializeArray(),
                    dataType: 'json'
                }).done(function (res) {
                    if (res.success) {
                        $("#add-success").fadeIn().delay(2000).fadeOut();
                        table.ajax.reload();
                        $('#add-new-department-form').trigger("reset");
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
                    url: "api/department/delete",
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
                $('#field-name').val(selectedCells.eq(1).text());
            });

            $('#edit-department-form').on('submit', function () {
                let toPost = $('#edit-department-form').serializeArray();
                $.ajax({
                    method: "POST",
                    url: "api/department/edit",
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