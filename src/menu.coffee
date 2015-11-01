class @Menu
  constructor: (game) ->
    @game = game
    @menu = document.getElementById('menu')
    @title = document.getElementById('title')
    @play = document.getElementById('play')
    @reset = document.getElementById('reset')
    @win = document.getElementById('win')
    @play.addEventListener('click', @clickplay)
    @reset.addEventListener('click', @clickreset)

  clickplay: (event) =>
   @menu.style.opacity = 0
   @menu.style.visibility = 'hidden'
   @title.style.opacity = 0
   @title.style.visibility = 'hidden'
   @play.style.opacity = 0
   @play.style.visibility = 'hidden'
   @game.start()

  clickreset: (event) =>
   @hideResetMenu()
   @title.style.opacity = 1
   @title.style.visibility = 'visible'
   @play.style.opacity = 1
   @play.style.visibility = 'visible'
   @game.reset()

  showResetMenu: ->
   @menu.style.opacity = 0.8
   @menu.style.visibility = 'visible'
   @reset.style.opacity = 1
   @reset.style.visibility = 'visible'

  hideResetMenu: ->
   @win.style.opacity = 0
   @win.style.visibility = 'hidden'
   @reset.style.opacity = 0
   @reset.style.visibility = 'hidden'
