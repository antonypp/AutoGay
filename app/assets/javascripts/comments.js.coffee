jQuery ->
  $('#comment .send').click ->
    text = $('#comment .text').val()
    url = $('#comment').attr('action')
    $.ajax {
      url: url
      data: { comment: text }
      type: 'POST'
      dataType: 'html'
      success: (data) ->
        if $(data).find('.error').length == 0
          $('.comments .comments-list').prepend(data)
    }
    false