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
});
