//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require underscore
//= require gmaps/google

$(document).ready(function(){

// After 3 seconds the alerts are vanishing
  setTimeout(
    function() {
      $('.alert').fadeOut(1000);
  }, 3000);
})

