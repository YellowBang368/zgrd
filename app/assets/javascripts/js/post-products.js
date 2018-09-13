$(document).ready(function(){
  $(".fa-heart").click(function(){
    if ($(this).hasClass("transparent")) {
      $(this).removeClass("transparent");
    }
    else {
      $(this).addClass("transparent", 300);
    };
  });
});
