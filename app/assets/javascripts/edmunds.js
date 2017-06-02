

const EDMUNDS_API_KEY = 'edmunds_vehicle_api_key';

function get_makes(year) {
    url = 'http://api.edmunds.com/v1/api/vehicle/makerepository/findmakesbymodelyear?year=' + year + '&api_key=' + EDMUNDS_API_KEY + '&fmt=json';
    $.ajax({
        type: "POST",
        url: url,
        data: '',
        dataType: 'jsonp',
        success: function(data) {
            $('#makes').empty();
            $('#makes').append("<option>Select Make</option>");
            $.each(data.makeHolder, function(i, val) {
                $('#makes').append("<option value='" + data.makeHolder[i].niceName + "'>" + data.makeHolder[i].name + "</option>");
            });
            $('#makes').removeAttr('disabled');
            console.log('Step 2: Makes select was populated and enabled');
        }
    });
}
function get_models(make, year) {
    url = 'http://api.edmunds.com/v1/api/vehicle/modelrepository/findmodelsbymakeandyear?make=' + make + '&year=' + year + '&api_key=' + EDMUNDS_API_KEY + '&fmt=json';
    $.ajax({
        type: "POST",
        url: url,
        data: '',
        dataType: 'jsonp',
        success: function(data) {
            $('#models').empty();
            $('#models').append("<option>Select Model</option>");
            $.each(data.modelHolder, function(i, val) {
                $('#models').append("<option value='" + data.modelHolder[i].niceName + "'>" + data.modelHolder[i].name + "</option>");
            });
            $('#models').removeAttr('disabled');
            console.log('Step 4: Models select was populated and enabled');
        }
    });
}
function get_styles(make, model, year) {
    url = 'http://api.edmunds.com/v1/api/vehicle/stylerepository/findstylesbymakemodelyear?make=' + make + '&model=' + model + '&year=' + year + '&api_key=' + EDMUNDS_API_KEY + '&fmt=json';
    $.ajax({
        type: "POST",
        timeout: 20000,
        url: url,
        data: '',
        dataType: 'jsonp',
        success: function(data) {
            $('#styles').empty();
            $('#styles').append("<option>Select Trim</option>");
            $.each(data.styleHolder, function(i, val) {
                console.log(data.styleHolder[i]);
                $('#styles').append("<option value='" + data.styleHolder[i].id + "'>" + data.styleHolder[i].name + "</option>");
            });
            $('#styles').removeAttr('disabled');
            console.log('Step 6: Styles(trim) select was populated and enabled');
        }
    });
}
function get_style_details(style_id) {
    url = 'http://api.edmunds.com/v1/api/vehicle/stylerepository/findbyid?id=' + style_id + '&api_key=' + EDMUNDS_API_KEY + '&fmt=json';
    $.ajax({
        type: "POST",
        url: url,
        data: '',
        dataType: 'jsonp',
        success: function(data) {
            $('#details').html(JSON.stringify(data.styleHolder[0]));
            console.log('Step 8: Collecting Style/trim data');
        }
    });
}
$(document).ready(function() {
    $('#years').change(function() {
        console.log('Step 1: Year ' + $(this).val() + ' was selected');
        get_makes($(this).val());
    });

    $('#makes').change(function() {
        console.log('Step 3: Make ' + $(this).val() + ' was selected');
        get_models($(this).val(), $('#years').val());
    });
    $('#models').change(function() {
        console.log('Step 5: Model ' + $(this).val() + ' was selected');
        get_styles($('#makes').val(), $(this).val(), $('#years').val());
    });
    $('#styles').change(function() {
        console.log('Step 7: Style ' + $(this).val() + ' was selected');
        get_style_details($(this).val());
    });
});