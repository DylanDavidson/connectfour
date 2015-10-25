class @Box
  constructor: (game, length, width, height) ->
    @geometry = new THREE.BoxGeometry(length, width, height)
    @material = new THREE.MeshBasicMaterial({ color: 0x34495e })
    @object = new THREE.Mesh(@geometry, @material)
    game.addToScene(@object)
