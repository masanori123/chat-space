$(function() {

  function appendUser(user) {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${ user.name }">追加</a>
                </div>`
    $("#user-search-result").append(html);
  }

  function appendNoUser(user) {
    var html = `<li>
                  <div class='user-search-add chat-group-user__btn chat-group-user__btn--add'>${ user }</div>
                </li>`
    $("#user-search-result").append(html);
  }

  function appendUser(user) {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${ user.name }">追加</a>
                </div>`
    $("#user-search-result").append(html);
  }

  function appendAddUser(user_id, user_name) {
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value='${user_id}'>
                  <p class='chat-group-user__name'>${user_name}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    $("#chat-group-users").append(html);
  }

  $("#chat-group-form__input").on("keyup", function() {
    var input = $("#chat-group-form__input").val();

    $.ajax({
      type: 'GET',
      url: '/groups/search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users_data) {
      console.log(users_data);
     if (users_data.length !== 0) {
       users_data.forEach(function(user){
         appendUser(user);
       });
     }
     else {
       appendNoUser("一致するユーザーはいません");
     }
    })
    .fail(function(){
      alert('error');
    })
  });

  $(document).on("click", ".chat-group-user__btn--add", function() {
    var user_id = $(this).data("user-id");
    var user_name = $(this).data("user-name");
    $('.chat-group-user').remove();
      appendAddUser(user_id, user_name);
  });

  $(document).on("click", ".chat-group-user__btn--remove", function() {
    var user_id = $(this).data("user_id");
    var user_name = $(this).data("user-name");
    $(this).remove();
    $(".chat-group-user__name").remove();
  })
});
