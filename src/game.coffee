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
  pieces: []

  constructor: ->
    @base = new Base()
    @sound = new Sound(@)
    @menu = new Menu(@)
    @floor = new Box(@, 100, 100, 10)
    @board = new Board(@)
    @setupPlaceholderPieces()
    @worker = new Worker('./build/ai.js')
    @worker.onmessage = @onmessage
    @score = new Score(@)

  start: ->
    @controller = new Controller(@)

  reset: ->
    @column_heights = [0, 0, 0, 0, 0, 0, 0]
    @score = new Score(@)
    for piece in @pieces
      @base.removeFromScene(piece.object)
    @pieces = []

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
    @controller.reset()
    @controller = null
    text = if playerWins then 'You Win' else 'AI Wins'
    element = document.getElementById('win')
    element.innerHTML = text
    element.style.opacity = 1
    element.style.visibility = "visible"
    @menu.showResetMenu()

  place: (column) ->
    @column = null
    piece = new Piece(@, @controller.isPlayerTurn())
    row = @column_heights[column]++
    @score.place(row, column, @controller.isPlayerTurn())
    piece.place(row, column)
    @pieces.push(piece)
    result = @score.checkForWin()
    if result || result == false
      @win(result)

  highlight: (column) ->
    @placeholders[column].setColor(0xe74c3c)
    timeout 600, =>
      @placeholders[column].setColor(0xecf0f1)

  moveAI: ->
    @worker.postMessage('move')

  onmessage: (message) =>
    return unless @controller
    timeout 1500, =>
      @place(message.data)
      timeout 750, =>
        return unless @controller
        @controller.setPlayerTurn(true)

  render: ->
    @controller.update() if @controller
    @base.render()

  addToScene: (object) ->
    @base.addToScene(object)

  removeFromScene: (object) ->
    @base.removeFromScene(object)
