$(document).ready(function() {

  $('body').on("click", '#date_checkbox', function(event) {   
    if(this.checked) {
      $("#datepicker").val("");
    }
  }); 

  $('body').on("change", '#datepicker', function(event) {   
    if( $("#datepicker").val() == "" ) {
      $("#date_checkbox").prop("checked", true);
    } else {
      $("#date_checkbox").prop("checked", false);
    }
  });  

  $( "#datepicker_start" ).datepicker();
  $( "#datepicker_end" ).datepicker();

});