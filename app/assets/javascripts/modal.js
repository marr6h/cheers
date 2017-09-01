$(function(){
  $('.js-modal-open').click(function(){
    $('body').append('<div class="js-modal-overlay"></div>');
    $('.js-modal-overlay').fadeIn();
    var modal = '#' + $(this).attr('data-target');
    $(modal).fadeIn();
    $('.js-modal-overlay, .js-modal-close').off().click(function(){
      $(modal).fadeOut();
      $('.js-modal-overlay').fadeOut(function(){
        $('.js-modal-overlay').remove();
      });
    });
  });
});
