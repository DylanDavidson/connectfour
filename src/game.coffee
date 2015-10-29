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
  score: null
  column_heights: [0, 0, 0, 0, 0, 0, 0]

  constructor: ->
    @base = new Base()
    @controller = new Controller(@)
    @floor = new Box(@, 100, 100, 10)
    @board = new Board(@)
    @setupPlaceholderPieces()
    @ai = new AI()
    @score = new Array(7)
    for i in [0..6]
      @score[i] = new Array(7)


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

  place: (column) ->
    @piece = new Piece(@, @controller.isPlayerTurn())
    row = @column_heights[column]++
    @score[row][column] = @controller.isPlayerTurn()
    @piece.place(row, column)
    console.log(@checkForWin())

  checkForWin: ->
    for i in [0..6]
      for j in [0..6]
        # console.log("Horizontal: " + @isHorizontalWin(i, j))
        # console.log("Vertical: " + @isVerticalWin(i, j))
        # console.log("Diagonal: " + @isDiagonalWin(i, j))
        if @isHorizontalWin(i, j) || @isVerticalWin(i, j) || @isDiagonalWin(i, j)
          return true
        else if @isHorizontalWin(i, j) == false || @isVerticalWin(i, j) == false || @isDiagonalWin(i, j) == false
          return false
    return undefined

  isHorizontalWin: (row, col) ->
    return undefined if @score[row][col] == undefined
    return undefined if col > 3 # Horizontal win not possible past this point
    if @score[row][col] == @score[row][col + 1] &&
      @score[row][col + 1] == @score[row][col + 2] &&
      @score[row][col + 2] == @score[row][col + 3]
       return @score[row][col]
    return undefined

  isVerticalWin: (row, col) ->
    return undefined if @score[row][col] == undefined
    return undefined if row > 1 # Vertical win not possible past this point
    if @score[row][col] == @score[row + 1][col] &&
      @score[row + 1][col] == @score[row + 2][col] &&
      @score[row + 2][col] == @score[row + 3][col]
       return @score[row][col]
    return undefined

  isDiagonalWin: (row, col) ->
    return undefined if @score[row][col] == undefined
    return undefined if row > 1
    if col <= 3
     if @score[row][col] == @score[row + 1][col + 1] &&
      @score[row + 1][col + 1] == @score[row + 2][col + 2] &&
      @score[row + 2][col + 2] == @score[row + 3][col + 3]
        return @score[row][col]
    if col >= 3
      if @score[row][col] == @score[row + 1][col - 1] &&
        @score[row + 1][col - 1] == @score[row + 2][col - 2] &&
        @score[row + 2][col - 2] == @score[row + 3][col - 3]
          return @score[row][col]
    return undefined

  highlight: (column) ->
    @placeholders[column].setColor(0xe74c3c)
    timeout 600, =>
      @placeholders[column].setColor(0xecf0f1)

  moveAI: ->
    #@ai.simulate()
    timeout 3000, =>
      @place(@ai.move())
      timeout 1000, =>
        @controller.setPlayerTurn(true)

  render: ->
    @controller.update()
    @base.render()

  addToScene: (object) ->
    @base.addToScene(object)

  removeFromScene: (object) ->
    @base.removeFromScene(object)
