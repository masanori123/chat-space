$(function() {
  function buildHTML(message){
    var insertImage = '';
    if (message.image) {
      insertImage = `<img src="${message.image}">`;
    }
    var html = `
      <div class="chat-main__body--message-list__message">
        <div class="chat-main__body--message-list__message-name">${message.name}</div>
        <div class="chat-main__body--message-list__message-time">${message.time}</div>
        <div class="chat-main__body--message-list__message-body">${message.body}</div>
        ${insertImage}
      </div>`;

    return html;

  }
  $('.new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href //+ '/messages'
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-main__body--message-list').append(html)
      // $('.chat-main__body--message-list__message').animate({
      //   "color": "red",
      //   'marginTop': '200px'
      // });
      // function getScrollTop(){
      //   $("#message").text($(window).scrollTop() + $(window).height() + 'px');
      // }
      // $(window).on("load scroll resize", getScrollTop);
      // $('#message').scrollTop()
      // function goBottom(targetId) {
      //   var target = $("#message" + targetId);
      //   $(window).scrollTop(target.offset().top);
      // }
      var $messages = $('.chat-main__body');
      console.log($messages[0].scrollHeight);
      // console.log($messages.scrollHeight);
      $messages.animate({
        scrollTop: $messages[0].scrollHeight
      }, 1500);
    })
    .fail(function(){
      alert('error');
    })
    return false;
  })
});
