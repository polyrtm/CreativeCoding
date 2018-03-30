
void setup() {
  size(255, 255);
  background(255);
  stroke(0);
  colorMode(HSB);
}
int num;
int numOfChars[] = new int[255];
void keyPressed() {
  loadPixels();
  if (key != CODED) {
    num++;
    String[] list = split(convert(num, 256), " ");
    printArray(list);
    numOfChars[key]++;
    if (list.length == 2) {
      pixels[key + width * numOfChars[key]] = color(Integer.parseInt(list[0]), Integer.parseInt(list[1]), 255);
    } else{
      pixels[key + width * numOfChars[key]] = color(0, Integer.parseInt(list[0]), 255);
    }
    println(saturation(pixels[key + width * numOfChars[key]]));
    println(key);
  }
  updatePixels();
}
void mousePressed() {
  save("code.png");
}
void draw() {
}
public static String convert(int number, int base)
{
  int quotient = number / base;
  int remainder = number % base;

  if (quotient == 0) // base case
  {
    return Integer.toString(remainder);
  } else
  {
    return convert(quotient, base) + " " + Integer.toString(remainder);
  }
}
