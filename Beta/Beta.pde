Robot lineFolower;
Path path;
PVector tmpPosition;
PVector offset;
PVector offsetSensor;
PImage pathImage;
Boolean pause = false;

void setup() {
  size(800, 600);
  smooth();
  //background(255);
  offset = new PVector(80, 300);
  //tmpPosition = new PVector(400, 400);
  offsetSensor = new PVector(0, -30);
  pathImage = createImage(800, 600, RGB);
  newPath();
  path.display();
  loadPixels();
  pathImage.loadPixels();
  for (int i = 0; i < width*height; i++) {
    pathImage.pixels[i] = pixels[i];
  }
  pathImage.updatePixels();
  newRobot();
}
void draw() {
  if (pause==false) {
    lineFolower.updatePosition();
    background(255);
    path.display();
  }
  //background(255);
  lineFolower.draw();
  //imageDisplay();
}

void keyPressed() {
  switch(key) {
    /*case 'a': 
     lineFolower.heading += 1.0 * (PI/25) / frameRate; 
     break;
     //case 'w': userChoice = 0.0; break;
     case 'e': 
     lineFolower.heading += -1.0 * (PI/25) / frameRate; 
     break;*/
  case ' ': 
    if (pause == true) {
      pause = false;
    } else {
      pause = true;
    }
    break;
  }
}
  void newPath() {
    // A path is a series of connected points
    // A more sophisticated path might be a curve
    path = new Path();
    float offset = 100;
    path.addPoint(offset, offset);
    path.addPoint(width-offset, offset);
    path.addPoint(width-offset, height-offset);
    path.addPoint(width/2, height-offset*3);
    path.addPoint(offset, height-offset);
  }

  void newRobot() {
    lineFolower = new Robot(10, 10, 10, pathImage, offset, 1, 0, -40, 10, 2);
    //Robot(kP,kI,kD,path,offsetPosition,offestSensorPosition, int sWidth, int sHeight )
  }
