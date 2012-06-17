jQuery ->
  @container = $(".rating-js")
  @container.find('.btn').each (index,el) ->
    button = $(el)
    if ($.cookie('rated_'+button.attr('href')))
      disable(button)
  @container.on "click", ".judge", (e) ->
    send_rate(e.target, "judge")
  @container.on "click", ".acquit", (e) ->
    send_rate(e.target, "acquit")
send_rate = (target, rate) ->
  href = $(target).attr("href")
  $.ajax href,
    type: "POST",
    data: {"rate": rate},
    success:(response) =>
      disable($(target))
  false
disable = (button) ->
  $.cookie('rated_'+button.attr('href'), 'true')
  button.closest(".rating-js").addClass('disabled')
  button.closest(".rating-js").find('btn').attr('disabled','disbled')

