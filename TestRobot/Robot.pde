// @author : Christophe Aubert.
// @bref : inspirate by the nature of code writen by Daniel Shiffman <http://www.shiffman.net> and NXT line folower by LEGO.
// @description : Virtual line folower for simulation of line folower

//changement a venir suite a reflexion
class Robot {

  //Variables

  PVector robotPosition;
  PVector sensorPosition;
  ArrayList<Sensor> sensors; // en prevision de la creation d'un robot multi-capteur;
  float proportional = 0;
  float integral = 0;
  float derivative = 0;
  float kProportional;
  float kIntegral;
  float kDerivative;
  float errorPrev = 0;
  float setpoit;

  //Constructeur

  Robot(float kP, float kI, float kD, PImage path, PVector offsetPosition, PVector offestSensorPosition, int sWidth, int sHeight ) {

    //il doit manquer des choses !!
    robotPosition = offsetPosition;
    sensors = new ArrayList<Sensor>();
    sensors.add(new Sensor(path, offestSensorPosition, sWidth, sHeight));
    kProportional = kP;
    kIntegral = kI;
    kDerivative = kD;
  }

  //Mehtodes
  float ControllerPID () {

    //variable
    Sensor tmpSensor;
    float controller;

    //instruction
    tmpSensor = sensors.get(0);
    proportional = setpoit - tmpSensor.readValue(sensorPosition);
    integral += proportional;
    derivative = proportional - errorPrev;
    controller = (kProportional * proportional)+(kIntegral * integral)+(kDerivative * derivative);
    return controller;
  }
  void run(){
    
    //equation du mouvement en fonction de la valeur du capteur
  }
  
  void robotRender(PVector vehiculeSensorPosition, float theta) {

    Sensor tmpSensor;
    tmpSensor = sensors.get(0);

    /*Probleme de deplacement pour la rotation suivi de la translation*/
    fill(175);
    stroke(0);
    pushMatrix();
    tmpSensor.sensorRender();
    translate(vehiculeSensorPosition.x, vehiculeSensorPosition.y);
    rotate(theta); // probleme de deplacement a la rotation
    //translate(vehiculeSensorPosition.x, vehiculeSensorPosition.y);
    rectMode(CENTER); //ne marche pas ??
    beginShape(TRIANGLES);
    vertex(0, -4*2);
    vertex(-4, 4*2);
    vertex(4, 4*2);
    endShape();
    popMatrix();
  }
}
