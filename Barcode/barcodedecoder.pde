PImage img;
void setup() {
  colorMode(HSB);
  img = loadImage("code.png");
  size(255, 255);
  background(0, 0, 0);
  image(img, 0, 0);
  img.loadPixels();
}
void draw(){
  noLoop();
  String result = decode();
  println(result);
  saveStrings("output.txt", new String[]{result});
}
String decode() {
  //image(img, 0, 0);
  String decoded = "";
  int[] chars = new int[255 * 255];
  for (int i = 0; i < 255; i++) {
    for (int j = 0; j < 255; j++) {
      color col = img.pixels[i * 255 + j];//get(i, j);
      println(hue(col));
        chars[floor(hue(col) * 256 + saturation(col))] = j;
    }
  }
  decoded = new String(chars, 0, chars.length);
  String[] list = decoded.split("þ");
  for(String string : list) {
  list = string.split("\u0000");
  }
  StringBuilder builder = new StringBuilder();
  for (String string : list) {
    builder.append(string);
  }

  decoded = builder.toString();
  return decoded;
}
