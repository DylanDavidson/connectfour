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
  column_heights: [0, 0, 0, 0, 0, 0, 0]

  constructor: ->
    @base = new Base()
    @controller = new Controller(@)
    @floor = new Box(@, 100, 100, 10)
    @board = new Board(@)
    @setupPlaceholderPieces()
    @ai = new AI()
    @score = new Score(@)

  setupPlaceholderPieces: ->
    @placeholders = []
    for i in [0..6]
      piece = new Piece(@)
      piece.stop()
      piece.setColor(0xecf0f1)
      piece.setOpacity(0.3)
      piece.setPosition(@board.COLUMNS[i], 0, 75)
      piece.setName('Placeholder')
      @placeholders.push(piece)

  win: (playerWins) ->
    text = if playerWins then 'You Win' else 'AI Wins'
    element = document.getElementById('win')
    element.innerHTML = text
    element.style.display = "block"

  place: (column) ->
    @piece = new Piece(@, @controller.isPlayerTurn())
    row = @column_heights[column]++
    @score.place(row, column, @controller.isPlayerTurn())
    @piece.place(row, column)
    result = @score.checkForWin()
    if result || result == false
      @win(result)

  highlight: (column) ->
    @placeholders[column].setColor(0xe74c3c)
    timeout 600, =>
      @placeholders[column].setColor(0xecf0f1)

  moveAI: ->
    #@ai.simulate()
    timeout 2000, =>
      @place(@ai.move())
      timeout 750, =>
        @controller.setPlayerTurn(true)

  render: ->
    @controller.update()
    @base.render()

  addToScene: (object) ->
    @base.addToScene(object)

  removeFromScene: (object) ->
    @base.removeFromScene(object)
