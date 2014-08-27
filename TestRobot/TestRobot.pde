// ne pas oublier le rapel de l'image a chque mouvement


Robot suiveur;
PVector tmpPosition;
PVector offset;
PVector offsetSensor;
Float angle = 0.0;
PImage myImage;

void setup() {
  size(500, 500);
  myImage = createImage(500, 500, RGB);
  // dessin initial
  background(255);
  fill(255, 0, 0);
  ellipse(100, 100, 200, 200);

  // on récupère les pixels  
  loadPixels();
  myImage.loadPixels();

  // on recopie
  for (int i = 0; i < width*height; i++) {
    myImage.pixels[i] = pixels[i];
  }
  myImage.updatePixels();
  smooth();
  offset = new PVector(100, 100);
  tmpPosition = new PVector(100, 100);
  offsetSensor = new PVector(0, -30);
  newRobot();
}

void newRobot() {
  suiveur = new Robot(10, 10, 10, myImage, offset, offsetSensor, 10, 2);
}

void draw() {
  if (!paused) {
    suiveur.updatePosition();
  }
  background(255);
  suiveur.draw();
}

void keyPressed() {
  switch(key) {
    case 'a': suiveur.heading += 1.0 * (PI/25) / frameRate; break;
    //case 'w': userChoice = 0.0; break;
    case 'e': suiveur.heading += -1.0 * (PI/25) / frameRate; break;
    case ' ': paused = !paused;
  }
}
