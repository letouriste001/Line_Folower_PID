// ne pas oublier le rapel de l'image a chque mouvement



Sensor capteur;
PImage test;
PVector tmpPosition;

void setup() {
  size(50, 50);
  smooth();
  tmpPosition = new PVector(10, 10);
  test = loadImage("testCapteur.png");
  image(test, 0, 0);
  newSensor();
}

void newSensor() {
  capteur = new Sensor(test, 10, 10, 5, 2 );
  //capteur.setSensorPosition(10, 10);
  //capteur.setSensorResolution(10, 2);
}

void draw() {
  capteur.sensorRender(tmpPosition);
  ValeurCapteur();
}
void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
      tmpPosition.x -= 1;
      imageDisplay();
      break;
    case RIGHT:
      tmpPosition.x += 1;
      imageDisplay();
      break;
    case UP:
      tmpPosition.y -= 1;
      imageDisplay();
      break;
    case DOWN:
      tmpPosition.y += 1;
      imageDisplay();
      break;
    }
  }
}
void imageDisplay() {
  image(test, 0, 0);
}
void ValeurCapteur() {
  float valeur;
  String text = "la valeur du capteur est :";
  valeur = capteur.readValue(tmpPosition);
  println(text, valeur);
}
