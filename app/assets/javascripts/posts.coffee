# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setTimeout(() ->
  $('.top-10-container .tips').text('initialize component')
  $('.top-10-container .top-10-list').hide()
  setTimeout(() ->
    $('.top-10-container .tips').text('start loading...')
    setTimeout(() ->
      $('.top-10-container .tips').hide()
      $('.top-10-container .top-10-list').show()
      $.ajax('/posts/top-10').done((data) ->
        data.forEach((item) ->
          $('.top-10-container .top-10-list').append("
          <li> #{item.title}</li>
          ")
        )
      )
    , 2000)
  , 2000);
, 2000);
