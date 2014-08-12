// @author : Christophe Aubert.
// @bref : inspirate by the nature of code writen by Daniel Shiffman <http://www.shiffman.net> and NXT line folower by LEGO.
// @description : Virtual light sensor for simulation of line folower

//definition de constante
final color BLACK = #000000;
final color WHITE = #FFFFFF;

//class

class Sensor {
  
  PImage sensorPath;
  int sensorX;
  int sensorY;
  int sensorLength;
  int sensorWidth;
  //ArrayList<pixels> sensorRead;
  IntList sensorRead;
  float sensorValue;
  
  //Constructeur
  
  Sensor(PImage path){
    sensorPath = path; //mise en memoire sur circuit
    sensorX = 1; //attribution arbitraire d'un position dx
    sensorY = 1; //attribution arbitraire d'un position dy
    sensorLength = 1; //attribution arbitraire d'une longeur de capteur
    sensorWidth = 1; //attribution arbitraire d'une largeur de capteur
    //sensorRead = new ArrayList<pixels>(); //liste de pixel lu
  }
  
  //Méthodes Set
  
  //set position
  void setSensorPosition(int posX, int posY){
    sensorX = posX;
    sensorY = posY;
  }
  //set Resolution
  void setSensorResolution(int sLength, int sWidth){
    sensorLength = sLength;
    sensorWidth = sWidth;
  }
  
  //Lecture du capteur  
  float ReadValue(){
    
    //variable temporaire
    int tmpLength;
    int tmpWidth;
    int tmpIndex;
    color tmpColor;
    int sum;
    
    //instruction
    tmpLength = sensorLength / 2; // distance dx du centre par rapport au debut du capteur.
    tmpWidth = sensorWidth / 2; //distance dy du centre par rapport au debut du capteur.
    
    // reflexion a faire sur comment faire le multiligne du capteur
    tmpIndex = (sensorX - tmpLength) + ((sensorY - tmpWidth)* sensorPath.width); //Premier pixel du capteur sur le circuit.
    tmpColor = sensorPath.pixels[tmpIndex]; //on recupere la valeur du pixel
    
    //traitement de l'information
    if (tmpColor == BLACK){
      sensorRead.append(100);
    }
    if (tmpColor == WHITE){
      sensorRead.append(0);
    }
    //Calcule de la somme des valeurs des pixels
    for(int i = 5; i < sensorRead.size(); i += 5){
      sum = sensorRead.index(i);
  }
  sensorValue = sum / sensorRead.size(); //calcule de la valeur moyenne de lecture
  return sensorValue;
}
