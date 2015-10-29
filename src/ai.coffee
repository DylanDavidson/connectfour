class @AI
  last: 0

  constructor: (game) ->
    @game = game

  randomColumn: ->
    @last = Math.round(Math.random() * 6)

  move: ->
    @last

  simulate: ->
    column = @randomColumn()
    time = 0
    for i in [1..4]
      time += 600
      timeout time, ->
        @last = column
        @game.highlight(column)
        if column == 0
          column += 1
        else if column == 6
          column -= 1
        else
          if Math.round(Math.random()) == 0
            column -= 1
          else
            column += 1
