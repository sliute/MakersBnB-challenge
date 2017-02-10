$(document).ready(function(){
  var date_input=$('input[name="date"]');
  var options={
    format: 'dd/mm/yyyy',
    todayHighlight: true,
    autoclose: true,
  };

    $('#date_picker .input-group.date').datepicker({
      format: 'dd/mm/yyyy',
      todayHighlight: true,
      autoclose: true,
    });
});
