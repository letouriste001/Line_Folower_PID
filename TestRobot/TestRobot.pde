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
  offsetSensor = new PVector(110, 100);
  newRobot();
}

void newRobot() {
  suiveur = new Robot(10, 10, 10, myImage, offset, offsetSensor, 10, 2);
}

void draw() {
  background(255);
  suiveur.robotRender(tmpPosition, angle);
}
void keyPressed() {
  switch(keyCode) {
  case LEFT:
    tmpPosition.x -= 1;
    break;
  case RIGHT:
    tmpPosition.x += 1;
    break;
  case UP:
    tmpPosition.y -= 1;
    break;
  case DOWN:
    tmpPosition.y += 1;
    break;
  case 'a':
  case 'A':
    angle -= PI/8;
    break;
  case 'e':
  case 'E':
    angle += PI/8;
    break;
  }
}
