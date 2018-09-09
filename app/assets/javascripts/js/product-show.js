var ready;

ready = function() {
  $(".nav-items span").hide();
  $(".nav-bar .dp-background").hide();
  $(".nav-bar .dp-menu").hide();
  $(".show-phone").hide();

  $(".show-phone").hide();
    $(".show-phone-button").click(function(){
      $(this).hide();
      $(this).closest("section").find(".show-phone").show();
    });
};

$(document).ready(ready);
