function get_makes(year) {
    url = 'https://api.edmunds.com/api/vehicle/v2/makes?fmt=json&year=' + year + '&api_key=' + EDMUNDS_API_KEY;
    $.ajax({
        type: "POST",
        url: url,
        data: '',
        dataType: 'jsonp',
        success: function(data) {
            $('#auto_make').empty();
            $('#auto_make').append("<option>Select Make</option>");
            $.each(data.makes, function(i, val) {
                $('#auto_make').append("<option value='" + data.makes[i].name + "'>" + data.makes[i].name + "</option>");
            });
            $('#auto_make').removeAttr('disabled');

            console.log('Step 2: Makes select was populated and enabled');
            console.log(data.makes);
        }
    });
}
function get_models(make, year) {
    url = 'https://api.edmunds.com/v1/api/vehicle/modelrepository/findmodelsbymakeandyear?make=' + make + '&year=' + year + '&api_key=' + EDMUNDS_API_KEY + '&fmt=json';
    $.ajax({
        type: "POST",
        url: url,
        data: '',
        dataType: 'jsonp',
        success: function(data) {
            $('#auto_model').empty();
            $('#auto_model').append("<option>Select Model</option>");
            $.each(data.modelHolder, function(i, val) {
                $('#auto_model').append("<option value='" + data.modelHolder[i].name + "'>" + data.modelHolder[i].name + "</option>");
            });
            $('#auto_model').removeAttr('disabled');
            console.log('Step 4: Models select was populated and enabled');
        }
    });
}
function get_styles(make, model, year) {
    url = 'https://api.edmunds.com/v1/api/vehicle/stylerepository/findstylesbymakemodelyear?make=' + make + '&model=' + model + '&year=' + year + '&api_key=' + EDMUNDS_API_KEY + '&fmt=json';
    $.ajax({
        type: "POST",
        timeout: 20000,
        url: url,
        data: '',
        dataType: 'jsonp',
        success: function(data) {
            $('#auto_trim').empty();
            $('#auto_trim').append("<option>Select Trim</option>");
            $.each(data.styleHolder, function(i, val) {
                console.log(data.styleHolder[i]);
                $('#auto_trim').append("<option value='" + data.styleHolder[i].name + "'>" + data.styleHolder[i].name + "</option>");
            });
            $('#auto_trim').removeAttr('disabled');
            console.log('Step 6: Styles(trim) select was populated and enabled');
        }
    });
}

$(document).on('turbolinks:load', function() {
  $('#autos').ready(function() {
      $('#auto_year').change(function() {
          console.log('Step 1: Year ' + $(this).val() + ' was selected');
          get_makes($(this).val());
      });

      $('#auto_make').change(function() {
          console.log('Step 3: Make ' + $(this).val() + ' was selected');
          get_models($(this).val(), $('#auto_year').val());
      });
      $('#auto_model').change(function() {
          console.log('Step 5: Model ' + $(this).val() + ' was selected');
          get_styles($('#auto_make').val(), $(this).val(), $('#auto_year').val());
      });
      $('#auto_trim').change(function() {
          console.log('Step 7: Style ' + $(this).val() + ' was selected');
      });
  });
});
