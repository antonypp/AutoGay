jQuery ->
  @container = $(".rating-js")

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
      $(target).parents(".rating-js").remove()
  false
