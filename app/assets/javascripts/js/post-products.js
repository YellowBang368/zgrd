$(document).ready(function(){
  $(".to_favorite").click(function(){
    var $this = $(this);
    if ($this.hasClass("favorite")) {
      $this.html("Убрать из избранного <i class='fas fa-heart'></i>");
      $this.removeClass("favorite").addClass("unfavorite");
      var $action = $this.closest("form").attr('action').replace(/favorite/, 'unfavorite' );
      setTimeout(function(){
        $this.closest("form").attr('action', $action)
      }, 500);
    } else {
      $this.html("Добавить в избранное<i class='fas fa-heart transparent'></i>");
      $this.removeClass("unfavorite").addClass("favorite");
      var $action = $this.closest("form").attr('action').replace(/unfavorite/, 'favorite' );
      setTimeout(function(){
        $this.closest("form").attr('action', $action)
      }, 500);
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
