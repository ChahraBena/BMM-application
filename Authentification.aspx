﻿<!DOCTYPE html>
<html>
<head>
    <title>Manage Ajax Sourced Data With Grid</title>
    <meta charset="utf-8" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css" />
    <link href="http://code.gijgo.com/1.5.1/css/gijgo.css" rel="stylesheet" type="text/css" />
    <link href="http://code.gijgo.com/1.5.1/css/demo.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://code.gijgo.com/1.5.1/js/gijgo.js" type="text/javascript"></script>
</head>
<body>
    <div class="gj-margin-top-10">
        <div class="gj-float-left">
            <form class="display-inline">
                <input id="txtName" type="text" placeholder="Name..." class="gj-textbox-md gj-display-inline-block gj-width-200" />
                <input id="txtNationality" type="text" placeholder="Nationality..." class="gj-textbox-md gj-display-inline-block gj-width-200" />
                <button id="btnSearch" type="button" class="gj-button-md">Search</button>
                <button id="btnClear" type="button" class="gj-button-md">Clear</button>
            </form>
        </div>
        <div class="gj-float-right">
            <button id="btnAdd" type="button" class="gj-button-md">Add New Record</button>
        </div>
    </div>
    <div class="gj-clear-both"></div>
    <div class="gj-margin-top-10">
        <table id="grid"></table>
    </div>

    <div id="dialog" class="gj-display-none">
        <div data-role="body">
            <input type="hidden" id="ID" />
            <div class="">
                <input type="text" class="gj-textbox-md" id="Name" placeholder="Name...">
            </div>
            <div class="gj-margin-top-20">
                <select id="Nationality" width="100%">
                    <option></option>
                    <option>Bulgaria</option>
                    <option>Brazil</option>
                    <option>England</option>
                    <option>Germany</option>
                    <option>Colombia</option>
                    <option>Poland</option>
                </select>
            </div>
            <div class="gj-margin-top-20">
                <input type="text" id="DateOfBirth" placeholder="Date Of Birth..." width="100%" />
            </div>
            <div class="gj-margin-top-20">
                <input type="checkbox" id="IsActive" />
                <label for="IsActive">Is Active?</label>
            </div>
        </div>
        <div data-role="footer">
            <button type="button" id="btnSave" class="gj-button-md">Save</button>
            <button type="button" id="btnCancel" class="gj-button-md">Cancel</button>
        </div>
    </div>

    <script type="text/javascript">
        var grid, dialog, nationalityDropdown, dateOfBirth, isActiveCheckbox;
        function Edit(e) {
            $('#ID').val(e.data.id);
            $('#Name').val(e.data.record.Name);
            nationalityDropdown.value(e.data.record.Nationality);
            dateOfBirth.value(e.data.record.DateOfBirth);
            isActiveCheckbox.state(e.data.record.IsActive ? 'checked' : 'unchecked');
            dialog.open('Edit Player');
        }
        function Save() {
            var record = {
                ID: $('#ID').val(),
                Name: $('#Name').val(),
                Nationality: nationalityDropdown.value(),
                DateOfBirth: gj.core.parseDate(dateOfBirth.value(), 'mm/dd/yyyy').toISOString(),
                IsActive: $('#IsActive').prop('checked')
            };
            $.ajax({ url: '/Players/Save', data: { record: record }, method: 'POST' })
                .done(function () {
                    dialog.close();
                    grid.reload();
                })
                .fail(function () {
                    alert('Failed to save.');
                    dialog.close();
                });
        }
        function Delete(e) {
            if (confirm('Are you sure?')) {
                $.ajax({ url: '/Players/Delete', data: { id: e.data.id }, method: 'POST' })
                    .done(function () {
                        grid.reload();
                    })
                    .fail(function () {
                        alert('Failed to delete.');
                    });
            }
        }
        $(document).ready(function () {
            grid = $('#grid').grid({
                primaryKey: 'ID',
                dataSource: '/Players/Get',
                selectionMethod: 'checkbox',
                columns: [
                    { field: 'ID', width: 56 },
                    { field: 'Name', sortable: true },
                    { field: 'Nationality', sortable: true },
                    { field: 'DateOfBirth', sortable: true, type: 'date' },
                    { field: 'IsActive', title: 'Active?', type: 'checkbox', width: 90, align: 'center' },
                    { width: 64, tmpl: '<span class="material-icons gj-cursor-pointer">edit</span>', align: 'center', events: { 'click': Edit } },
                    { width: 64, tmpl: '<span class="material-icons gj-cursor-pointer">delete</span>', align: 'center', events: { 'click': Delete } }
                ],
                pager: { limit: 5 }
            });
            dialog = $('#dialog').dialog({
                autoOpen: false,
                resizable: false,
                modal: true,
                width: 360
            });
            nationalityDropdown = $('#Nationality').dropdown();
            dateOfBirth = $('#DateOfBirth').datepicker();
            isActiveCheckbox = $('#IsActive').checkbox();
            $('#btnAdd').on('click', function () {
                $('#ID').val('');
                $('#Name').val('');
                nationalityDropdown.value('');
                dateOfBirth.value('');
                isActiveCheckbox.state('unchecked');
                dialog.open('Add Player');
            });
            $('#btnSave').on('click', Save);
            $('#btnCancel').on('click', function () {
                dialog.close();
            });
            $('#btnSearch').on('click', function () {
                grid.reload({ page: 1, name: $('#txtName').val(), nationality: $('#txtNationality').val() });
            });
            $('#btnClear').on('click', function () {
                $('#txtName').val('');
                $('#txtNationality').val('');
                grid.reload({ name: '', nationality: '' });
            });
        });
    </script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
</body>
</html>