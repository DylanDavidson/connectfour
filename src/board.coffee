class @Board
  constructor: (game) ->
    @loader = new THREE.STLLoader()
    @material = new THREE.MeshPhongMaterial( { color: 0x2980b9, shininess: 0} )
    @loader.load './models/board.stl', (geometry) =>
      @object = new THREE.Mesh(geometry, @material)
      @object.receiveShadow = true
      @object.castShadow = true
      @object.position.set(0, 0, 5)
      game.addToScene(@object)
