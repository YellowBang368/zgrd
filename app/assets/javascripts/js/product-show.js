var ready;

ready = function() {
  $(".nav-items span").hide();
  $(".nav-bar .dp-background").hide();
  $(".nav-bar .dp-menu").hide();
  $(".show-phone").hide();

  $(".show-phone").hide();
    $(".show-product section .show-phone-button").click(function(){
      $(this).hide();
      $(this).closest("section").find(".show-phone").show();
    });

    $("article .show-phone-button").click(function(){
      $(this).hide();
      $(this).closest("article").find(".show-phone").show();
    });
};

$(document).ready(ready);
