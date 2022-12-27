function identity (account, nickname) {
    if (account !== null) {
        $('.login').addClass('hide');
        $('#login').append("<div class='welcome'>欢迎！用户" + nickname + "</div>");
        $('#login').append("<a href='logout.jsp'><input type='button' class='login' value='注销'></a>");
    }
}
