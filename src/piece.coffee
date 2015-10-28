class @Piece
  START_HEIGHT: 75
  velocity: 1
  height: 75

  constructor: (game, player) ->
    @game = game
    @geometry = new THREE.CylinderGeometry(6, 6, 3, 20)
    if player
      color = 0xf1c40f
    else
      color = 0xe74c3c
    @material = new THREE.MeshPhongMaterial({ color: color })
    @object = new Physijs.CylinderMesh(@geometry, @material, 10)
    @object._physijs.collison_flags = 4
    @object.receiveShadow = true
    @object.castShadow = true
    game.addToScene(@object)

  place: (row, column) ->
    x_val = @game.board.COLUMNS[column]
    @object.position.set(x_val, 0, @START_HEIGHT)
    @object.__dirtyPosition = true
    @check(row)

  check: (row) ->
    if @object.position.z <= @game.board.ROWS[row]
      @object.mass = 0
    else
      timeout 50, =>
        @check(row)
