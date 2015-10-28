class @Controller
  mouse: new THREE.Vector2()
  raycaster: new THREE.Raycaster()
  last: null

  constructor: (game) ->
    @game = game
    window.addEventListener('mousemove', @mousemove)
    window.onclick = @mouseclick

  mousemove: (event) =>
    @mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1
    @mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1

  mouseclick: (event) =>
    return unless @last
    column = @game.board.COLUMNS.indexOf(@last.position.x)
    @game.place(column)

  update: ->
    @raycaster.setFromCamera(@mouse, @game.base.camera)
    intersects = @raycaster.intersectObjects(@game.base.scene.children)
    return unless intersects.length
    return if intersects[0].object == @last || intersects[0].object.name != 'Placeholder'

    if @last != null
      @last.material.color.set(@last.oldColor)
    @last = intersects[0].object
    @last.oldColor = @last.material.color.getHex()
    @last.material.color.set(0xFF0000)
