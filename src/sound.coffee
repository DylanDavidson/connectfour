class @Sound
  soundon: localStorage.getItem('soundon') == 'true' || localStorage.getItem('soundon') == undefined

  constructor: ->
    @on = document.getElementById('on')
    @off = document.getElementById('off')
    @on.addEventListener('click', @togglesound)
    @off.addEventListener('click', @togglesound)
    @track1 = document.getElementById('track1')
    @track2 = document.getElementById('track2')
    @piece = document.getElementById('piece')
    @track1.play()
    @track1.addEventListener('ended', @track1ended)
    @track2.addEventListener('ended', @track2ended)
    if @soundon
      @volumeup()
    else
      @volumedown()

  track1ended: =>
    @track2.play()

  track2ended: =>
    @track1.play()

  togglesound: =>
    if @soundon
      @soundon = false
      @volumedown()
    else
      @soundon = true
      @volumeup()
    localStorage.setItem('soundon', @soundon)

  volumeup: ->
    @track1.volume = 0.8
    @track2.volume = 0.8
    @on.style.visibility = 'visible'
    @on.style.opacity = 1
    @off.style.visibility = 'hidden'
    @off.style.opacity = 0

  volumedown: ->
    @track1.volume = 0
    @track2.volume = 0
    @off.style.visibility = 'visible'
    @off.style.opacity = 1
    @on.style.visibility = 'hidden'
    @on.style.opacity = 0

  playPieceSound: ->
    @piece.play() if @soundon
