import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

Cube[][] cubes;
float spacing = 100.0f;
PeasyCam cam;
PVector size;
void setup() {
  size = new PVector(10, 10);
  cam = new PeasyCam(this, width / 1.5, height / 2, 0, 2000);
  cubes = new Cube[(int)size.x][(int)size.y];
  size(400, 400, P3D);
  //camera(width / 2, 0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  //ortho(-400, 400, 400, -400, 0, 1000);
  for (int j = 0; j < size.x; j++) {
    for (int i = 0; i < size.y; i++) {
      //cubes[i][j] = new Cube(width / 2+((i - 1.5) * spacing), width / 2, (j - 4) * spacing, spacing, map(i + j, 0, 6, 0, 3));
      cubes[i][j] = new Cube(i * spacing, width / 2, (j - 4) * spacing, spacing, map(i + j, 0, 6, 0, PI));
    }
  }
  //cube = new Cube(width / 2, height / 2, 0, 100);
}
void draw() {
  //noFill();
  //rotateY(PI / 4);
  //rotateX(-PI / 4);
  rotateX(-atan(cos(QUARTER_PI)));
  rotateY(-QUARTER_PI);
  directionalLight(255, 255, 255, -1, 1, -1);
  background(127);
  for (int j = 0; j < size.x; j++) {
    for (int i = 0; i < size.y; i++) {
      cubes[i][j].move();
      cubes[i][j].render();
    }
  }
  //cube.move();
  //cube.render();
}
