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
      var $messages = $('.chat-main__body');
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
