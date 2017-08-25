$(function(){
    $('#search_user').on('click', function(){
        var email = $('#search_user_email').val();
        var url = "/api/users/search?email=" + email;
        $.getJSON(url, function(data){
            $("#search_result").empty();
            for (var i = 0; i < data.length; i++) {
                var user = data[i];
                var row = $('<div class="user-content__inner">');
                row.append($('<div class="user-content__main">').append($('<div class="user-content__thumbnail-container"><div class="user-content__thumbnail">')).append($('<p class="user-content__name">').text(user.email)).append($('<div class="user-content__botton-container"><button class="button-default">友達追加</button></div>')));
                $('#search_result').append(row);
            }
        });
    })
})
