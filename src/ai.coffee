class @AI
  constructor: ->
    self.onmessage = @onmessage

  onmessage: (message) =>
    if message.data == 'move'
      postMessage(@randomColumn())

  randomColumn: ->
    Math.round(Math.random() * 6)

  move: ->
    @randomColumn()

@ai = new AI()
