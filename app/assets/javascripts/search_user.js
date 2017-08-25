$(function(){
    $('#search_user').on('click', function(){
        var email = $('#search_user_email').val();
        var url = "/api/users/search?email=" + email;
        $.getJSON(url, function(data){
            $("#search_result").empty();
            for (var i = 0; i < data.length; i++) {
                var user = data[i];
                var row = $('<li>');
                row.append($("<li>").append($('<div>')).append($('<div>').text(user.email)).append($('<button>').text('フォローする')));
                $('#search_result').append(row);
            }
        });
    })
})
