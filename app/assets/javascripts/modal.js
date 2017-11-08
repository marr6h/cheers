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
    var entryId = $(this).attr('data-entry-id');
    var postId = $(this).attr('data-post-id');
    var params = {
        'entry':
            {
                'id': entryId != undefined ? entryId : null,
                'post_id': postId}
            }
    var url = '/entries';
    var mes = 'Cheers!';
    var userId = $(this).attr('data-user-id');
    if (userId != undefined) {
        url = url + '/' + postId;
        params['entry']['entry_to'] = userId;
        mes = mes + ' Back'
    }
    $.post(url, params,
        function(data){
            if (data['status']) {
                alert(mes + " を送信しました。");
            } else {
                alert(mes + " が送信できませんでした。");
            }
        }
    );
  });
});
