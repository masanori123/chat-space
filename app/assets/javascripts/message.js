$(function() {
  function buildHTML(message){
    var insertImage = '';
    if (message.image) {
      insertImage = `<img src="${message.image}">`;
    }
    var html = `
      <div class="chat-main__body--message-list" id="js-messages-list">
        <div class="chat-main__body--message-list__message" data-message-id="${message.id}">
          <div class="chat-main__body--message-list__message-name">${message.name}</div>
          <div class="chat-main__body--message-list__message-time">${message.time}</div>
          <div class="chat-main__body--message-list__message-body">${message.body}</div>
          ${insertImage}
        </div>
      </div>`;

    return html;

  }
  $('.new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href
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
      $('#js-messages-list').append(html)
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

  var interval = setInterval(function(){
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    $.ajax({
      url: location.href,
      type: "GET",
      dataType: 'json'
    })
    .done(function(json) {
      console.log(json);
      var id = $('.chat-main__body--message-list__message').last().data('messageId');
      console.log(id);
      var message_id = $(".chat-main__body--message-list").last().data("message-id");
      console.log(message_id);
      var insertHTML = '';
      json.messages.forEach(function(message) {
        if (message.id > id ) {
          insertHTML += buildHTML(message);
        }
      });
      $('#js-messages-list').append(insertHTML);
    })
    .fail(function(json) {
       alert('自動更新に失敗しました');
    });
  } else {
    clearInterval(interval);
   }} , 5000 );
});
