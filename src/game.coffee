# Dylan Davidson
# Board Game - CAP 4720
#

@timeout = (time, method) ->
  setTimeout(method, time)

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
    @floor = new Box(@, 100, 100, 10)
    @board = new Board(@)
    @piece = new Piece(@, true)
    @piece.place(0, 4)
    timeout 3000, =>
      @piece2 = new Piece(@, false)
      @piece2.place(1, 4)
    timeout 6000, =>
      @piece3 = new Piece(@, true)
      @piece3.place(2, 4)
    timeout 9000, =>
      @piece4 = new Piece(@, false)
      @piece4.place(3, 4)
    timeout 12000, =>
      @piece4 = new Piece(@, true)
      @piece4.place(4, 4)

  render: ->
    @base.render()

  addToScene: (object) ->
    @base.addToScene(object)

  removeFromScene: (object) ->
    @base.removeFromScene(object)
