class @Piece
  START_HEIGHT: 75
  velocity: 1
  height: 75

  constructor: (game, player = true) ->
    @game = game
    @geometry = new THREE.CylinderGeometry(6, 6, 3, 20)
    if player
      color = 0xf1c40f
    else
      color = 0xe74c3c
    @material = new THREE.MeshPhongMaterial({ color: color })
    @object = new Physijs.CylinderMesh(@geometry, @material, 10)
    @object._physijs.collision_flags = 4
    @object.receiveShadow = true
    @object.castShadow = true
    game.addToScene(@object)

  setName: (name) ->
    @object.name = name

  setColor: (color) ->
    @object.material.color.set(color)

  setOpacity: (opacity) ->
    @object.material.transparent = true
    @object.material.opacity = opacity

  setPosition: (x, y, z) ->
    @object.position.set(x, y, z)
    @object.__dirtyPosition = true

  place: (row, column) ->
    x_val = @game.board.COLUMNS[column]
    @setPosition(x_val, 0, @START_HEIGHT)
    @check(row)

  stop: ->
    @object.mass = 0

  check: (row) ->
    if @object.position.z <= @game.board.ROWS[row]
      @stop()
    else
      timeout 50, =>
        @check(row)
