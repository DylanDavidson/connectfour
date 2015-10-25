# Dylan Davidson
# Board Game - CAP 4720
#

@game = null

@onload = ->
  @game = new Game()
  @render()

@render = ->
  @game.render()
  requestAnimationFrame(window.render)

class @Game
  constructor: ->
    @base = new Base()
    @board = new Box(@, 100, 100, 10)

  render: ->
    @base.render()

  addToScene: (object) ->
    @base.addToScene(object)

  removeFromScene: (object) ->
    @base.removeFromScene(object)
