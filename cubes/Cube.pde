class Cube{
  float x;
  float y;
  float z;
  float size;
  float angle = asin(y);
  float offset = 0;
  Cube(float x_, float y_, float z_, float size_, float offset_){
    x = x_;
    y = y_;
    z = z_;
    size = size_;
    offset = offset_;
  }
  void move(){
    y = map(sin(angle + offset), -1, 1, size / 2, height - size / 2);
    angle += 0.05;
  }
  void render(){
    pushMatrix();
    translate(x, y, z);
    box(size);
    popMatrix();
  }
}
