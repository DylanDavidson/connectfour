// Generated by CoffeeScript 1.10.0
(function() {
  this.Piece = (function() {
    Piece.prototype.START_HEIGHT = 75;

    Piece.prototype.velocity = 1;

    Piece.prototype.height = 75;

    function Piece(game, player) {
      var color;
      this.game = game;
      this.geometry = new THREE.CylinderGeometry(6, 6, 3, 20);
      if (player) {
        color = 0xf1c40f;
      } else {
        color = 0xe74c3c;
      }
      this.material = new THREE.MeshPhongMaterial({
        color: color
      });
      this.object = new Physijs.CylinderMesh(this.geometry, this.material, 10);
      this.object._physijs.collison_flags = 4;
      this.object.receiveShadow = true;
      this.object.castShadow = true;
      game.addToScene(this.object);
    }

    Piece.prototype.place = function(row, column) {
      var x_val;
      x_val = this.game.board.COLUMNS[column];
      this.object.position.set(x_val, 0, this.START_HEIGHT);
      this.object.__dirtyPosition = true;
      return this.check(row);
    };

    Piece.prototype.check = function(row) {
      if (this.object.position.z <= this.game.board.ROWS[row]) {
        return this.object.mass = 0;
      } else {
        return timeout(50, (function(_this) {
          return function() {
            return _this.check(row);
          };
        })(this));
      }
    };

    return Piece;

  })();

}).call(this);
