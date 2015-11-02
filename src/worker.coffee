class @AI
  constructor: ->
    self.onmessage = @onmessage

  onmessage: (message) =>
    board = JSON.parse(message.data)
    move = @randomColumn()
    while board[4][move] != null && board[4][move] != undefined
      move = @randomColumn()
    postMessage(move)

  randomColumn: ->
    Math.round(Math.random() * 6)

  move: ->
    @randomColumn()

@ai = new AI()
