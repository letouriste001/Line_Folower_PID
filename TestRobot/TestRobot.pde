// ne pas oublier le rapel de l'image a chque mouvement


Robot suiveur;
PVector tmpPosition;
PVector offset;
PVector offsetSensor;
Float angle = 0.0;
PImage myImage;

void setup() {
  size(800, 600);

  smooth();
  offset = new PVector(229, 292);
  tmpPosition = new PVector(100, 100);
  offsetSensor = new PVector(0, -30);
  myImage = loadImage("test.png");
  newRobot();
  image(myImage, 0, 0);
  
}

void newRobot() {
  suiveur = new Robot(10, 10, 10, myImage, offset, offsetSensor, 10, 2);
}

void draw() {
  if (!paused) {
    suiveur.updatePosition();
    imageDisplay();
  }
  //background(255);
  suiveur.draw();
  //imageDisplay();
}

void keyPressed() {
  switch(key) {
    case 'a': suiveur.heading += 1.0 * (PI/25) / frameRate; break;
    //case 'w': userChoice = 0.0; break;
    case 'e': suiveur.heading += -1.0 * (PI/25) / frameRate; break;
    case ' ': paused = !paused;
  }
}
void imageDisplay() {
  image(myImage, 0, 0);
}
