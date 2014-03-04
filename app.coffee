"use strict"

$  ->
  $("input").focus()

  $("form").on "submit", (event) ->
    event.preventDefault()
    searchTerm = $("input").val()

    movieData = $.ajax
      url: "http://www.omdbapi.com/"
      method: "get"
      data: { s: searchTerm }
      dataType: "json"

    movieData.done (data) ->
      $("input").val("")
      $(".result").html("")

      for movie in data["Search"]
        li = $ "<li data-imdb=" + id + ">" + movie.Title + "</li>"
        id = movie.imdbID
        $(".result").append(li)

    $(".result").delegate "li","click", (event) ->
      event.preventDefault()
      movieID = @.dataset.imdb

      moviePoster = $.ajax
        url: "http://www.omdbapi.com/"
        method: "get"
        data: { i: movieID }
        dataType: "json"

      moviePoster.done (data) ->
        console.log data.Poster

        $('body').css({'background-image': 'url('+data.Poster+')', 'height': '600px', 'width': '1046px'})

