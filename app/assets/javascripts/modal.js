$(function(){
  $('.js-modal-open').click(function(){
    // $('body').append('<div class="js-modal-overlay"></div>');
    // $('.js-modal-overlay').fadeIn();
    // var modal = '#' + $(this).attr('data-target');
    // $(modal).fadeIn();
    // $('.js-modal-overlay, .js-modal-close').off().click(function(){
    //   $(modal).fadeOut();
    //   $('.js-modal-overlay').fadeOut(function(){
    //     $('.js-modal-overlay').remove();
    //   });
    // });
    var postId = $(this).attr('data-post-id');
    var url = '/entries';
    $.post(url, {'entry': {'post_id': postId}},
        function(data){
            if (data['status']) {
                alert("Cheers! を送信しました。");
            } else {
                alert("Cheers! が送信できませんでした。");
            }
        }
    );
  });
});
