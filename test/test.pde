Sensor capteur;
PImage test;

void setup() {
  size(50, 50);
  //smooth();

  test = loadImage("testCapteur.png");
  image(test, 0, 0);
  newSensor();
}

void newSensor() {
  capteur = new Sensor(test);
  capteur.setSensorPosition(10, 10);
  capteur.setSensorResolution(10, 2);
}

void moveSensor(){
  int x = 0;
  int y = 0;
  x = 1 + capteur.
  capteur.setSensorPosition(x,y);
}

void draw(){
  capteur.sensorRender();
}
