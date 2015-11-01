// Generated by CoffeeScript 1.10.0
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.Sound = (function() {
    Sound.prototype.soundon = localStorage.getItem('soundon') === 'true' || localStorage.getItem('soundon') === void 0;

    function Sound() {
      this.togglesound = bind(this.togglesound, this);
      this.track2ended = bind(this.track2ended, this);
      this.track1ended = bind(this.track1ended, this);
      this.on = document.getElementById('on');
      this.off = document.getElementById('off');
      this.on.addEventListener('click', this.togglesound);
      this.off.addEventListener('click', this.togglesound);
      this.track1 = document.getElementById('track1');
      this.track2 = document.getElementById('track2');
      this.piece = document.getElementById('piece');
      this.track1.play();
      this.track1.addEventListener('ended', this.track1ended);
      this.track2.addEventListener('ended', this.track2ended);
      if (this.soundon) {
        this.volumeup();
      } else {
        this.volumedown();
      }
    }

    Sound.prototype.track1ended = function() {
      return this.track2.play();
    };

    Sound.prototype.track2ended = function() {
      return this.track1.play();
    };

    Sound.prototype.togglesound = function() {
      if (this.soundon) {
        this.soundon = false;
        this.volumedown();
      } else {
        this.soundon = true;
        this.volumeup();
      }
      return localStorage.setItem('soundon', this.soundon);
    };

    Sound.prototype.volumeup = function() {
      this.track1.volume = 0.8;
      this.track2.volume = 0.8;
      this.on.style.visibility = 'visible';
      this.on.style.opacity = 1;
      this.off.style.visibility = 'hidden';
      return this.off.style.opacity = 0;
    };

    Sound.prototype.volumedown = function() {
      this.track1.volume = 0;
      this.track2.volume = 0;
      this.off.style.visibility = 'visible';
      this.off.style.opacity = 1;
      this.on.style.visibility = 'hidden';
      return this.on.style.opacity = 0;
    };

    Sound.prototype.playPieceSound = function() {
      if (this.soundon) {
        return this.piece.play();
      }
    };

    return Sound;

  })();

}).call(this);
