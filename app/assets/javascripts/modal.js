$(function(){
  $('.js-modal-open').click(function(){
    $('body').append('<div class="js-modal-overlay"></div>');
    $('.js-modal-overlay').fadeIn();
    var modal = '#' + $(this).attr('data-target');
    modalResize();
    $(modal).fadeIn();
    $('.js-modal-overlay, .js-modal-close').off().click(function(){
      $(modal).fadeOut();
      $('.js-modal-overlay').fadeOut(function(){
        $('.js-modal-overlay').remove();
      });
    });
    $(window).on('resize', function(){
      modalResize();
    });
    function modalResize(){
      var w = $(window).width();
      var h = $(window).height();
      var x = (w - $(modal).outerWidth(true)) / 2;
      var y = (h - $(modal).outerHeight(true)) / 2;
      $(modal).css({'left': x + 'px','top': y + 'px'});
    }
  });
});
