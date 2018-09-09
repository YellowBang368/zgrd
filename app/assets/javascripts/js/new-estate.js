var ready;

ready = function() {
  $estate_card = $(".new-estate article.card");

  $estate_card.click(function(){
    if ($(this).hasClass("active")) {
      $(this).removeClass("active");
    } else {
      $(this).addClass("active");
    };
  });
};

$(document).ready(ready);
