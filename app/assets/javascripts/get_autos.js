
function get_makes(year) {
    url = 'https://www.carqueryapi.com/api/0.3/?callback=?&cmd=getMakes&year=' + year + '&sold_in_us=1';
    $.ajax({
        type: "POST",
        url: url,
        data: '',
        dataType: 'jsonp',
        success: function(data) {
            console.log(data.Makes);
            $('#auto_make').empty();
            $('#auto_make').append("<option>Select Make</option>");
            var makes = data.Makes;
            $.each(makes, function(i, val) {
                $('#auto_make').append("<option value='" + makes[i].make_display + "'>" + makes[i].make_display + "</option>");
            });
            $('#auto_make').removeAttr('disabled');

            console.log('Step 2: Makes select was populated and enabled');
            console.log(makes);
        }
    });
}
function get_models(make, year) {
    url = 'https://www.carqueryapi.com/api/0.3/?callback=?&cmd=getModels&make=' + make + '&year=' + year + '&sold_in_us=1';
    $.ajax({
        type: "POST",
        url: url,
        data: '',
        dataType: 'jsonp',
        success: function(data) {
            $('#auto_model').empty();
            $('#auto_model').append("<option>Select Model</option>");
            var models = data.Models;
            $.each(models, function(i, val) {
                $('#auto_model').append("<option value='" + models[i].model_name + "'>" + models[i].model_name + "</option>");
            });
            $('#auto_model').removeAttr('disabled');
            console.log(models);
            console.log('Step 4: Models select was populated and enabled');
        }
    });
}
function get_styles(make, model, year) {
    url = 'https://www.carqueryapi.com/api/0.3/?callback=?&cmd=getTrims&make=' + make + '&year=' + year + '&model=' + model + '&full_results=0&sold_in_us=1';
    $.ajax({
        type: "POST",
        timeout: 20000,
        url: url,
        data: '',
        dataType: 'jsonp',
        success: function(data) {
            $('#auto_trim').empty();
            $('#auto_trim').append("<option>Select Trim</option>");
            var trim = data.Trims;
            $.each(trim, function(i, val) {
                console.log(trim[i]);
                $('#auto_trim').append("<option value='" + trim[i].model_trim + "'>" + trim[i].model_trim + "</option>");
            });
            $('#auto_trim').removeAttr('disabled');
            console.log(trim)
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

$(document).on('turbolinks:load', function() {
$('#autos').ready(function (){
    validate();
    $('#auto_make, #auto_model, #auto_trim').change(validate);
});

  function validate(){
      if ($('#auto_make').val()   ==   "Select Make"   &&
          $('#auto_model').val()  ==   "Select Model"  &&
          $('#auto_trim').val()  ==   "Select Trim") {
          $("input[type=submit]").prop("disabled", true);
          console.log('#auto_trim');
      }
      else {
          $("input[type=submit]").prop("disabled", false);
      }
  }
});
