# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ajaxComplete (event, request) ->
delete_all_confirm = ->
r = confirm('Press a button!')
if r == true
  txt = 'You pressed OK!'
else
  txt = 'You pressed Cancel!' 