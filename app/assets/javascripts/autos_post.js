
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('#newAuto').on('click', function () {
  $.ajax({
    url: '/autos',
    dataType: 'JSON',
    method: "POST",
    data: {
      auto: {
        year: $('#auto_year').val(),
        make:     $('#auto_make').val(),
        model:     $('#auto_model').val(),
        trim:     $('#auto_trim').val(),
        user_id:  $('#user_id').val()
      }
    }
  });
});
