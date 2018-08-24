$(document).ready(function(){
  $('#open-filter').click(function(){
    $('div.filter').slideToggle('400');
  });
});

$(document).ready(function(){
  $('.slider').bxSlider();
});

$(document).ready(function(){
  $(".post-products-row").hide()

  $(".choose-products-view .open-products-column").click(function(){
    $(".post-products-row").hide();
    $(".post-products-column").show();
  });

  $(".choose-products-view .open-products-row").click(function(){
    $(".post-products-column").hide();
    $(".post-products-row").show();
  });

  var $dp_bg = $(".dp-background");
  var $dp_menu = $(".dp-menu")
  var $dp_triangle = $(".dp-triangle")

  $dp_bg.hide();
  $dp_menu.hide();
  $dp_triangle.hide();

  $(".nav-items li.dp-trigger").on({
    mouseenter: function () {
      $dp_bg.slideDown();
    },
    mouseleave: function () {
      $(".nav-bar").mouseleave(function(){
        $dp_bg.slideUp();
      });
    }
  });

  $(".nav-items li.dp-trigger").on({
    mouseenter: function () {
      $(this).find(".dp-menu").fadeIn("slow");
      $(this).find(".dp-triangle").slideDown("slow");
    },
    mouseleave: function () {
      $(this).find(".dp-menu").hide();
      $(this).find(".dp-triangle").hide();
    }
  });

});
