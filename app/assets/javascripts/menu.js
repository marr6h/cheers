$(function(){
  $(".js-menu").click(function(){
    $(".js-menu-content").toggleClass("js-menu-block");
  });
  $(document).click(function(event) {
    if(!$(event.target).closest(".js-menu,.js-menu-content").length) {
      $(".js-menu-content").removeClass("js-menu-block");
    }
  });
});
