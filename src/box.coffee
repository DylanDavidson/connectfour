class @Box
  constructor: (game, length, width, height) ->
    @geometry = new THREE.BoxGeometry(length, width, height)
    @material = new THREE.MeshPhongMaterial({ color: 0x95a5a6 })
    @object = new Physijs.BoxMesh(@geometry, @material, 0)
    @object.receiveShadow = true
    @object.castShadow = true
    game.addToScene(@object)
