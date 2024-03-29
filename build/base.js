// Generated by CoffeeScript 1.10.0
(function() {
  var ASPECT_RATIO, BLACK, CAMERA_POSITON, ENABLE_SHADOW_MAPS, FAR_FRUSTRUM, FOV, GRAVITY, GRAY, HEIGHT, LIGHT_COLOR, LIGHT_POSITION, LOOK_AT_POSITION, NEAR_FRUSTRUM, OPAQUE_ALPHA, WHITE, WIDTH;

  BLACK = 0;

  WHITE = 0xFFFFFF;

  GRAY = 0x666666;

  OPAQUE_ALPHA = 1.0;

  LIGHT_COLOR = WHITE;

  WIDTH = window.innerWidth;

  HEIGHT = window.innerHeight;

  FOV = 45;

  ASPECT_RATIO = WIDTH / HEIGHT;

  NEAR_FRUSTRUM = 0.1;

  FAR_FRUSTRUM = 1000;

  ENABLE_SHADOW_MAPS = true;

  GRAVITY = new THREE.Vector3(0, 0, -15);

  CAMERA_POSITON = new THREE.Vector3(70, -120, 50);

  LOOK_AT_POSITION = new THREE.Vector3(0, 0, 25);

  LIGHT_POSITION = new THREE.Vector3(-20, -150, 80);

  this.Base = (function() {
    function Base() {
      this.scene = new Physijs.Scene();
      this.renderer = new THREE.WebGLRenderer();
      this.camera = new THREE.PerspectiveCamera(FOV, ASPECT_RATIO, NEAR_FRUSTRUM, FAR_FRUSTRUM);
      this.spotlight = new THREE.SpotLight(LIGHT_COLOR);
      this.scene.setGravity(GRAVITY);
      this.height = window.innerHeight;
      this.width = window.innerWidth;
      this.setupRenderer();
      this.setupCamera();
      this.setupSpotlight();
    }

    Base.prototype.render = function() {
      this.scene.simulate();
      return this.renderer.render(this.scene, this.camera);
    };

    Base.prototype.addToScene = function(object) {
      return this.scene.add(object);
    };

    Base.prototype.removeFromScene = function(object) {
      return this.scene.remove(object);
    };

    Base.prototype.setCameraPosition = function(x, y, z) {
      return this.camera.position.set(x, y, z);
    };

    Base.prototype.setupRenderer = function() {
      this.renderer.setClearColor(BLACK, OPAQUE_ALPHA);
      this.renderer.setSize(WIDTH, HEIGHT);
      this.renderer.shadowMapEnabled = ENABLE_SHADOW_MAPS;
      return document.body.appendChild(this.renderer.domElement);
    };

    Base.prototype.setupCamera = function() {
      this.setCameraPosition(CAMERA_POSITON.x, CAMERA_POSITON.y, CAMERA_POSITON.z);
      this.camera.up = new THREE.Vector3(0, 0, 1);
      this.camera.lookAt(LOOK_AT_POSITION);
      return this.addToScene(this.camera);
    };

    Base.prototype.setupSpotlight = function() {
      this.scene.add(new THREE.AmbientLight(0xecf0f1));
      this.spotlight.position.set(LIGHT_POSITION.x, LIGHT_POSITION.y, LIGHT_POSITION.z);
      this.spotlight.lookAt(LOOK_AT_POSITION);
      this.spotlight.shadowCameraNear = 20;
      this.spotlight.shadowCameraFar = 500;
      this.spotlight.shadowDarkness = 0.5;
      this.spotlight.castShadow = true;
      return this.addToScene(this.spotlight);
    };

    return Base;

  })();

}).call(this);
