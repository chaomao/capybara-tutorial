# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setTimeout(() ->
  document.querySelector('.ajax-area').innerHTML="start loading..."
  setTimeout(() ->
    document.querySelector('.ajax-area').innerHTML="finish loading"
  , 5000);
, 5000);
