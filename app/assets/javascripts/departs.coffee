# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@delete_one_ct = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()

@del_all_cts = ->
  $('a.remove_depart').on 'click', ->
    window.delete_one_ct($(this))
    false
  false

@add_new_ct = ->
  $('#add_depart_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_depart", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    panel.find('a.remove_depart').on 'click', ->
      window.delete_one_ct($(this))
      false
    false

ct_ready = ->
  window.add_new_ct()
  window.del_all_cts()
$(document).on 'page:load', ct_ready
$(document).ready ct_ready
