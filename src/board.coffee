class @Board
  COLUMNS: [-41, -28, -14, 0, 14, 27, 41]
  ROWS: [13, 24, 35, 47, 57]

  constructor: (game) ->
    @loader = new THREE.STLLoader()
    @material = new THREE.MeshPhongMaterial( { color: 0x2980b9, shininess: 0 } )
    @loader.load './models/board.stl', (geometry) =>
      @object = new THREE.Mesh(geometry, @material)
      @object.receiveShadow = true
      @object.castShadow = true
      @object.position.set(0, 0, 5)
      game.addToScene(@object)
