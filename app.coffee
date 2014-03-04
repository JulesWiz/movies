"use strict"

$  ->

  $("form").on "submit", (event) ->
    event.preventDefault()
    searchTerm = $("input").val()

    $.ajax
      url: "http://www.omdbapi.com/"
      method: "get"
      data: { s: searchTerm }
      dataType: "json"
