// @author : Christophe Aubert.
// @bref : inspirate by the nature of code writen by Daniel Shiffman <http://www.shiffman.net> and NXT line folower by LEGO.
// @description : Virtual light sensor for simulation of line folower

class Sensor {

  //definition de constante
  final color RED = #FF0000;

  //variable
  PImage sensorPath;
  PVector sensorOffsetPosition;
  int sensorWidth;
  int sensorHeight;
  IntList sensorRead;
  float sensorValue;

  //Constructeur
  Sensor(PImage path, PVector offsetPosition, int sWidth, int sHeight ) {
    sensorPath = path; //mise en memoire sur circuit
    sensorOffsetPosition = offsetPosition;
    sensorWidth = sWidth; //attribution arbitraire d'une longeur de capteur
    sensorHeight = sHeight; //attribution arbitraire d'une largeur de capteur
  }

  //Lecture du capteur  
  float readValue(PVector vehiculeSensorPosition) {
    
    //variable temporaire
    int tmpWidth = 0;
    int tmpHeight = 0;
    int tmpIndex = 0;
    color tmpColor;

    //instruction
    tmpWidth = sensorWidth / 2; // distance dx du centre par rapport au debut du capteur.
    tmpHeight = sensorHeight / 2; //distance dy du centre par rapport au debut du capteur.
    //lecture du capteur
    double sumColors = 0.0;
    for (int i = 0; i < sensorHeight; i++) {
      for (int j = 0; j < sensorWidth; j++) {
        tmpIndex = (int(vehiculeSensorPosition.x)- tmpWidth + j) + ((int(vehiculeSensorPosition.y)- tmpHeight + i)* sensorPath.width); //Premier pixel du capteur sur le circuit.
        tmpColor = sensorPath.pixels[tmpIndex]; //on recupere la valeur du pixel
        sumColors += (blue(tmpColor) + red(tmpColor) + green(tmpColor)) / (255 * 3.0);
      }
    }
    return (float)(1.0 - sumColors / (sensorHeight * sensorWidth));
  }

  //Methode dessin du capteur
  //void sensorRender(){
  //void sensorRender(PVector vehiculeSensorPosition) { //pour tester le capteur
  void sensorRender() {
    fill(RED);
    stroke(0);
    pushMatrix();
    translate(offsetPosition.x, offsetPosition.y);
    translate(vehiculeSensorPosition.x, vehiculeSensorPosition.y); //translation pour les test
    rectMode(CENTER); //positionement par le centre
    rect(0, 0, sensorWidth, sensorHeight);
    popMatrix();
  }
}
