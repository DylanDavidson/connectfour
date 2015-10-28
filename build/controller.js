// Generated by CoffeeScript 1.10.0
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.Controller = (function() {
    Controller.prototype.mouse = new THREE.Vector2();

    Controller.prototype.raycaster = new THREE.Raycaster();

    Controller.prototype.last = null;

    function Controller(game) {
      this.mouseclick = bind(this.mouseclick, this);
      this.mousemove = bind(this.mousemove, this);
      this.game = game;
      window.addEventListener('mousemove', this.mousemove);
      window.onclick = this.mouseclick;
    }

    Controller.prototype.mousemove = function(event) {
      this.mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
      return this.mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;
    };

    Controller.prototype.mouseclick = function(event) {
      var column;
      if (!this.last) {
        return;
      }
      column = this.game.board.COLUMNS.indexOf(this.last.position.x);
      return this.game.place(column);
    };

    Controller.prototype.update = function() {
      var intersects;
      this.raycaster.setFromCamera(this.mouse, this.game.base.camera);
      intersects = this.raycaster.intersectObjects(this.game.base.scene.children);
      if (!intersects.length) {
        return;
      }
      if (intersects[0].object === this.last || intersects[0].object.name !== 'Placeholder') {
        return;
      }
      if (this.last !== null) {
        this.last.material.color.set(this.last.oldColor);
      }
      this.last = intersects[0].object;
      this.last.oldColor = this.last.material.color.getHex();
      return this.last.material.color.set(0xFF0000);
    };

    return Controller;

  })();

}).call(this);
