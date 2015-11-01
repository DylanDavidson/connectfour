class @Menu
  constructor: (game) ->
    @game = game
    @menu = document.getElementById('menu')
    @full = document.getElementById('full')
    @play = document.getElementById('play')
    @play.addEventListener('click', @clickplay)

  clickplay: (event) =>
   @menu.style.opacity = 0
   @menu.style.visibility = 'hidden'
   @full.style.opacity = 0
   @full.style.visibility = 'hidden'
   @game.start()

  showMenu: ->
   @menu.style.opacity = 0.8
   @menu.style.visibility = 'visible'
