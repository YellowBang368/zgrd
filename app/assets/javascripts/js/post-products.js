$(document).ready(function(){
  if (parseInt($("#favorite_counter").html().replace("(", "").replace(")", "")) == 0) {
    $("#favorite_counter").hide()
  }

  $(".to_favorite").click(function(){
    var $this = $(this);
    if ($this.hasClass("favorite")) {
      $this.html("Убрать из избранного <i class='fas fa-heart'></i>");
      $this.removeClass("favorite").addClass("unfavorite");
      var $action = $this.closest("form").attr('action').replace(/favorite/, 'unfavorite' );
      setTimeout(function(){
        $this.closest("form").attr('action', $action)
      }, 500);
      var $current_favorite_counter = $("#favorite_counter").html().replace("(", "").replace(")", "");
      var $new_favorite_counter = parseInt($current_favorite_counter) + 1
      $("#favorite_counter").html("(" + $new_favorite_counter + ")");
      if ($current_favorite_counter == 0 && $new_favorite_counter > 0 ) { $("#favorite_counter").show() }
    } else {
      $this.html("Добавить в избранное<i class='fas fa-heart transparent'></i>");
      $this.removeClass("unfavorite").addClass("favorite");
      var $action = $this.closest("form").attr('action').replace(/unfavorite/, 'favorite' );
      setTimeout(function(){
        $this.closest("form").attr('action', $action)
      }, 500);
      var $current_favorite_counter = $("#favorite_counter").html().replace("(", "").replace(")", "");
      var $new_favorite_counter = parseInt($current_favorite_counter) - 1
      $("#favorite_counter").html("(" + $new_favorite_counter + ")");
      if ($new_favorite_counter == 0) { $("#favorite_counter").hide() }

    }
  })

  $(".post-price-difference").hide();
  $(".open-price-difference").click(function(){
    var $this = $(this);
    var $product_id = $this.closest("article").attr("data");
    if ($this.hasClass("showed")) {
      $(".post-price-difference[data='"+ $product_id +"']").hide();
      $this.removeClass("showed");
    } else {
      $(".post-price-difference[data='"+ $product_id +"']").show();
      $this.addClass("showed");
    }
  });
});
