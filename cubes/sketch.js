var cam;
var cubes = [];
var spacing = 100;
var cam;
var nums;

function setup() {
  nums = createVector(10, 10);
  //cam = new PeasyCam(this, width / 1.5, height / 2, 0, 2000);
  createCanvas(400, 400, WEBGL);
  cam = createEasyCam();
  cam.state.distance = 2000;
  cam.state.center = [width / 1.5, height / 2, 0];
  cam.state_reset.distance = 2000;
  cam.state_reset.center = [width / 1.5, height / 2, 0];
  //camera(width / 2, 0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  //ortho(-400, 400, 400, -400, 0, 1000);
  for (var j = 0; j < nums.x; j++) {
    cubes.push([]);
    for (var i = 0; i < nums.y; i++) {
      //cubes[i][j] = new Cube(width / 2+((i - 1.5) * spacing), width / 2, (j - 4) * spacing, spacing, map(i + j, 0, 6, 0, 3));
      cubes[j].push(new Cube(i * spacing, width / 2, (j - 4) * spacing, spacing, map(i + j, 0, 6, 0, PI)));
    }
  }
  //cube = new Cube(width / 2, height / 2, 0, 100);
}

function draw() {
  background(127);
  //noFill();
  //rotateY(PI / 4);
  //rotateX(-PI / 4);
  rotateX(-atan(cos(QUARTER_PI)));
  rotateY(-QUARTER_PI);
  //box(500);
  directionalLight(255, 255, 255, -1, 1, -1);
  for (var j = 0; j < nums.x; j++) {
    for (var i = 0; i < nums.y; i++) {
      cubes[i][j].update();
      cubes[i][j].render();
    }
  }
  //cube.move();
  //cube.render();
}
