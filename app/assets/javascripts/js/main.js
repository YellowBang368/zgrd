var ready;

ready = function() {

  /* Выбор представления ленты участков */
  $(".post-products-row").hide()
  $(".choose-products-view .open-products-column").click(function(){
    $(".post-products-default").hide();
    $(".post-products-column").show();
  });

  $(".choose-products-view .open-products-row").click(function(){
    $(".post-products-default").hide();
    $(".post-products-row").show();
  });

  $(".choose-products-view .open-products-map").click(function(){
    $(".post-products-default").hide();
    $(".post-products-map").show();
  });

  /* nav-bar */
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

  /* user-show */
  $(".post-comments").hide();
  $(".open-user-comments").click(function(){
    $(".post-user-products").hide();
    $(".post-comments").show();
  });

  $(".open-user-products").click(function(){
    $(".post-comments").hide();
    $(".post-user-products").show();
  });

  $('.open-dialog-pro').click( function(event){
    event.preventDefault();
    $('#overlay').fadeIn(400,
      function(){
        $('.modal_form.modal-form-pro')
        .css('display', 'block')
        .animate({opacity: 1, top: '50%'}, 200);
      });
    });
    $('#modal_close, #overlay').click( function(){
      $('.modal_form')
      .animate({opacity: 0, top: '45%'}, 200,
      function(){
        $(this).css('display', 'none');
        $('#overlay').fadeOut(400);
      }
    );
  });

  $('.open-dialog-status').click( function(event){
    event.preventDefault();
    $('#overlay').fadeIn(400,
      function(){
        $('.modal_form.modal-form-status')
        .css('display', 'block')
        .animate({opacity: 1, top: '50%'}, 200);
      });
    });
    $('#modal_close, #overlay').click( function(){
      $('.modal_form')
      .animate({opacity: 0, top: '45%'}, 200,
      function(){
        $(this).css('display', 'none');
        $('#overlay').fadeOut(400);
      }
    );
  });

  $('.open-dialog-country').click( function(event){
    event.preventDefault();
    $('#overlay').fadeIn(400,
      function(){
        $('.modal_form.modal-form-country')
        .css('display', 'block')
        .animate({opacity: 1, top: '50%'}, 200);
      });
    });
    $('#modal_close, #overlay').click( function(){
      $('.modal_form')
      .animate({opacity: 0, top: '45%'}, 200,
      function(){
        $(this).css('display', 'none');
        $('#overlay').fadeOut(400);
      }
    );
  });

  $('.open-currency-menu').on('click', function() {
    if (!$(this).hasClass('clicked')) {
      $(this).addClass('clicked');
      $(".currency-menu").css({"opacity":"0", "display":"block", }).animate({opacity:1}, 300);
    } else {
      $(this).removeClass('clicked');
      $(".currency-menu").css({"display":"none"});
    }
  });

  $(".currency-menu").mouseleave(function(){
    $(".currency-menu").css({"display":"none"});
    $(".open-currency-menu").removeClass("clicked");
  });

  $(".conversations-wrapper .chat").hide();
  $(".conversations-wrapper .chat").first().show();
  $(".conversations-wrapper .dialogs li").click(function(){
    var $current_conversation_id = $(this).attr('data');
    $(".conversations-wrapper .chat").hide();
    $('.conversations-wrapper .chat[data="'+$current_conversation_id+'"]').show();
  });


};

$(document).ready(ready);
