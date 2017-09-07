$(function(){
    $('#search_user').on('click', function(){
        var email = $('#search_user_email').val();
        $('#search_user_email').val('');
        var url = "/api/users/search?email=" + email;
        $.getJSON(url, function(data){
          $("#search_result").empty();
            for (var i = 0; i < data.length; i++) {
                var user = data[i];
                var row = $('<div>').addClass('user-content__list-item');
                var inner = $('<div>').addClass('user-content__inner');
                row.append(inner);
                var main = $('<div>').addClass('user-content__main');
                var thumbnail = $('<div>').addClass('user-content__thumbnail-container');
                thumbnail.append($('<div>').addClass('user-content__thumbnail'));
                thumbnail.append($('<div>').addClass('userthumbnail'));
                main.append(thumbnail);
                inner.append(main);
                var name = $('<div>').addClass('user-content__name-container');
                name.append($('<p>').addClass('user-content__name').text(user.username));
                main.append(name);
                var button = $('<div>').addClass('user-content__button-container');
                button.append($('<button>').addClass('button-default').text('友達追加する'));
                inner.append(button);
                $('#search_result').append(row);
            }
        });
    })
})
