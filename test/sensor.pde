// @author : Christophe Aubert.
// @bref : inspirate by the nature of code writen by Daniel Shiffman <http://www.shiffman.net> and NXT line folower by LEGO.
// @description : Virtual light sensor for simulation of line folower

class Sensor {

  //definition de constante
  final color BLACK = #000000;
  final color WHITE = #FFFFFF;
  final color RED = #FF0000;

  //variable
  PImage sensorPath;
  int sensorX;
  int sensorY;
  int sensorLength;
  int sensorWidth;
  //ArrayList<pixels> sensorRead;
  IntList sensorRead;
  float sensorValue;

  //Constructeur

  Sensor(PImage path) {
    sensorPath = path; //mise en memoire sur circuit
    sensorX = 1; //attribution arbitraire d'une position du centre sur x
    sensorY = 1; //attribution arbitraire d'une position du centre sur y
    sensorLength = 1; //attribution arbitraire d'une longeur de capteur
    sensorWidth = 1; //attribution arbitraire d'une largeur de capteur
    //sensorRead = new ArrayList<pixels>(); //liste de pixel lu
  }

  //Méthodes Set

  //set position
  void setSensorPosition(int posX, int posY) {
    sensorX = posX;
    sensorY = posY;
  }
  //set Resolution
  void setSensorResolution(int sLength, int sWidth) {
    sensorLength = sLength;
    sensorWidth = sWidth;
  }

  //Lecture du capteur  
  float ReadValue() {

    //variable temporaire
    int tmpLength = 0;
    int tmpWidth = 0;
    int tmpIndex = 0;
    color tmpColor;
    int sum = 0; //init de la variable pour corriger un bug sur la ligne sensorValue = sum / sensorRead.size();

    //instruction
    tmpLength = sensorLength / 2; // distance dx du centre par rapport au debut du capteur.
    tmpWidth = sensorWidth / 2; //distance dy du centre par rapport au debut du capteur.
    //lecture du capteur
    for (int i = 0; i < sensorWidth; i++) {
      for (int j = 0; j < sensorLength; j++) {
        tmpIndex = (sensorX - tmpLength + j) + ((sensorY - tmpWidth + i)* sensorPath.width); //Premier pixel du capteur sur le circuit.
        tmpColor = sensorPath.pixels[tmpIndex]; //on recupere la valeur du pixel
        //traitement de l'information
        if (tmpColor == BLACK) {
          sensorRead.append(100);
        }
        if (tmpColor == WHITE) {
          sensorRead.append(0);
        }
      }
    }
    //Calcule de la somme des valeurs des pixels
    for (int i = 0; i < sensorRead.size (); i++) {
      sum = sensorRead.index(i);
    }
    sensorValue = sum / sensorRead.size(); //calcule de la valeur moyenne de lecture
    return sensorValue;
  }

  //Methode dessin du capteur
  void sensorRender() {
    //integration future de pushmatrix et popmatrix
    noStroke();
    fill(RED);
    rectMode(CENTER); //positionement par le centre
    rect(sensorX, sensorY, sensorLength, sensorWidth);
  }
}
