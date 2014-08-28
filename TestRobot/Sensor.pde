// @author : Christophe Aubert.
// @bref : inspirate by the nature of code writen by Daniel Shiffman <http://www.shiffman.net> and NXT line folower by LEGO.
// @description : Virtual light sensor for simulation of line folower

class Sensor implements Drawable {

  //definition de constante
  final color RED = #FF0000;

  //variable
  public PImage sensorPath;
  public PVector sensorOffsetPosition;
  public int sensorWidth;
  public int sensorHeight;
  public IntList sensorRead;
  public float sensorValue;

  //Constructeur
  public Sensor() {
  }

  public Sensor(PImage path, PVector offsetPosition, int sWidth, int sHeight ) {
    this();
    this.sensorPath = path; //mise en memoire sur circuit
    this.sensorOffsetPosition = offsetPosition;
    this.sensorWidth = sWidth; //attribution arbitraire d'une longeur de capteur
    this.sensorHeight = sHeight; //attribution arbitraire d'une largeur de capteur
  }

  //Lecture du capteur  
  public float readValue(PVector vehiculeSensorPosition) {

    //variable temporaire
    int tmpWidth = 0;
    int tmpHeight = 0;
    int tmpIndex = 0;
    color tmpColor;
    double sumColors = 0.0;
    //instruction
    tmpWidth = this.sensorWidth / 2; // distance dx du centre par rapport au debut du capteur.
    tmpHeight = this.sensorHeight / 2; //distance dy du centre par rapport au debut du capteur.
    //lecture du capteur
    for (int i = 0; i < this.sensorHeight; i++) {
      for (int j = 0; j < this.sensorWidth; j++) {
        //println("index : " + tmpIndex );
        tmpIndex = (int(vehiculeSensorPosition.x)- tmpWidth + j) + ((int(vehiculeSensorPosition.y)- tmpHeight + i)* this.sensorPath.width); //Premier pixel du capteur sur le circuit.
        tmpColor = this.sensorPath.pixels[tmpIndex]; //on recupere la valeur du pixel
        sumColors += (blue(tmpColor) + red(tmpColor) + green(tmpColor)) / (255 * 3.0);
      }
    }
    return (float)(1.0 - sumColors / (sensorHeight * sensorWidth));
  }

  //Methode dessin du capteur
  public void draw() {
    pushMatrix();
    translate(this.sensorOffsetPosition.x, this.sensorOffsetPosition.y);
    fill(RED);
    stroke(0);
    rectMode(CENTER); //positionement par le centre
    rect(0, 0, sensorWidth, sensorHeight);
    popMatrix();
  }
}
