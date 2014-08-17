// ne pas oublier le rapel de l'image a chque mouvement


Robot suiveur;
PVector tmpPosition;
PVector offset;
Float angle = 0.0;

void setup() {
  size(500, 500);
  smooth();
  offset = new PVector(100, 100);
  tmpPosition = new PVector(100, 100);
  newRobot();
}

void newRobot() {
  suiveur = new Robot(offset);
}

void draw() {
  background(255);
  suiveur.robotRender(tmpPosition,angle);
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
