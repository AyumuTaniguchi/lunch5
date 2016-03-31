# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  navigator.geolocation.getCurrentPosition( (pos) ->
      $("#stores_latitude").val pos.coords.latitude
      $("#stores_longitude").val pos.coords.longitude
      $("#shops").html("")
      $("#search-form").submit()
    , (error) ->
      errorMsg = ''
      switch(error.code)
        when 1
          errMsg = "位置情報の利用が許可されていません"
        when 2
          errMsg = "デバイスの位置が判定できません"
        when 3
          errMsg = "タイムアウトしました"
  )

  $("#search").click ()->
    $("#shops").html("")
    $("#stores_page").val 0
    $("#more-read").show()
    number = $('#range').val()
    $("#stores_range").val number
    $("#search-form").submit()

  $("#more-read").click ()->
    $("#search-form").submit()

  $("#search-form").submit () ->
    page = parseInt $("#stores_page").val(), 0
    $("#stores_page").val ++page
