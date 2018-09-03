$(document).on('turbolinks:load', function() { // I wrapped all scripts in this listener to reload it after render new page

  $(document).ready(function(){
    $('#open-filter').click(function(){
      $('div.filter').slideToggle('400');
    });
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
    var $dp_menu = $(".dp-menu");
    var $dp_ul = $(".dp-ul");
    var $dp_triangle = $(".dp-triangle");

    $dp_bg.hide();
    $dp_menu.hide();
    $dp_ul.hide();
    $dp_triangle.hide();


    $('.nav-items li.dp-trigger').mouseenter(function() {
        var $this = $(this);
        var $index = $this.data("index");
        var $current_dp_ul = $this.closest(".nav-bar").find("ul.dp-ul[data-index='"+$index+"']") // find nessesary ul-list
        $dp_ul.css({"opacity":"0", "display":"none", });
        $dp_triangle.hide();

        enterTimeout = setTimeout(function() {
            $dp_bg.slideDown(200);
            $dp_menu.slideDown(200);
        }, 500);
        $current_dp_ul.css({"opacity":"0", "display":"flex", }).animate({opacity:1}, 300)
    }).mouseleave(function() {

      clearTimeout(enterTimeout);
    });

    $('.nav-bar').mouseenter(function() {
        clearTimeout(leaveTimeout);

    }).mouseleave(function() {
      leaveTimeout = setTimeout(function() {
        $dp_bg.slideUp(300);
        $dp_ul.css({"opacity":"0", "display":"none"}).animate({opacity:1}, 300);
        $dp_menu.hide(300);
        $dp_triangle.hide();
      }, 700);
    });


  });

});
