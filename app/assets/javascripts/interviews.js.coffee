$(document).on 'ready page:load', ->
  initialValue = parseInt($('input#answer_mark').prop('value'))
  $('input#answer_mark').slider(min: 1, max: 100, value: initialValue)

$(document).on('ajax:complete', '.simple_form.edit_answer', (e, resp, status) ->
  if resp.responseJSON.errors.length
    alert(resp.responseJSON.errors)
)
