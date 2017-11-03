$(function(){
  $(document).on('click','.js-modal-open',function(){
    $('body').append('<div class="js-modal-overlay"></div>');
    $('.js-modal-overlay').fadeIn();
    $(this).next('.modal-content').fadeIn();
  });
  $(document).on('click','.js-modal-overlay, .js-modal-close',function(){
    $('.modal-content').fadeOut();
    $('.js-modal-overlay').fadeOut(function(){
      $('.js-modal-overlay').remove();
    });
  });
});
