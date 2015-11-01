class @Score
  constructor: (game) ->
    @board = new Array(5)
    for i in [0..4]
      @board[i] = new Array(7)

  place: (row, column, isPlayer) ->
    @board[row][column] = isPlayer


  checkForDraw: ->
    for row in [0..4]
      for col in [0..6]
        if @board[row][col] == undefined || @board[row][col] == null
          return false
    return true

  checkForWin: ->
    for i in [0..4]
      for j in [0..6]
        h = @isHorizontalWin(i, j); v = @isVerticalWin(i, j); d = @isDiagonalWin(i, j)
        if h || v || d
          return true
        else if h == false || v == false || d == false
          return false
    return undefined

  isHorizontalWin: (row, col) ->
    return undefined if @board[row][col] == undefined
    return undefined if col > 3 # Horizontal win not possible past this point
    if @board[row][col] == @board[row][col + 1] &&
      @board[row][col + 1] == @board[row][col + 2] &&
      @board[row][col + 2] == @board[row][col + 3]
       return @board[row][col]
    return undefined

  isVerticalWin: (row, col) ->
    return undefined if @board[row][col] == undefined
    return undefined if row > 1 # Vertical win not possible past this point
    if @board[row][col] == @board[row + 1][col] &&
      @board[row + 1][col] == @board[row + 2][col] &&
      @board[row + 2][col] == @board[row + 3][col]
       return @board[row][col]
    return undefined

  isDiagonalWin: (row, col) ->
    return undefined if @board[row][col] == undefined
    return undefined if row > 1
    if col <= 3
     if @board[row][col] == @board[row + 1][col + 1] &&
      @board[row + 1][col + 1] == @board[row + 2][col + 2] &&
      @board[row + 2][col + 2] == @board[row + 3][col + 3]
        return @board[row][col]
    if col >= 3
      if @board[row][col] == @board[row + 1][col - 1] &&
        @board[row + 1][col - 1] == @board[row + 2][col - 2] &&
        @board[row + 2][col - 2] == @board[row + 3][col - 3]
          return @board[row][col]
    return undefined
