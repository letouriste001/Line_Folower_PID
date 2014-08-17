// @author : Christophe Aubert.
// @bref : inspirate by the nature of code writen by Daniel Shiffman <http://www.shiffman.net> and NXT line folower by LEGO.
// @description : Virtual line folower for simulation of line folower

//changement a venir suite a reflexion
class Robot {

  PVector Position;
  Sensor capteur;
  ArrayList<PVector> tmpSensorsPosition;
  ArrayList<Sensor> Capteurs;
  
  Robot(PVector offsetPosition, PImage path, int sensorNumber, int sensorSensorRange, int sensorRobotRange, int sWidth, int sHeight) {

    Position = offsetPosition;
    tmpSensorsPosition = sensorsPosition(sensorNumber, sensorSensorRange, sensorRobotRange);
    Capteurs = new ArrayList();
    //Boucle for pour le nombre de capteur
    for (int i=0; i < sensorNumber; i++) {
      Capteurs.add(new Sensor(path, tmpSensorsPosition.get(i), sWidth, sHeight ));
    }
  }

  void robotRender(PVector vehiculeSensorPosition, float theta) {

    /*Probleme de deplacement pour la rotation suivi de la translation*/
    fill(175);
    stroke(0);
    pushMatrix();
    rotate(theta); // probleme de deplacement a la rotation
    translate(vehiculeSensorPosition.x, vehiculeSensorPosition.y);
    rectMode(CENTER); //ne marche pas ??
    beginShape(TRIANGLES);
    vertex(0, -4*2);
    vertex(-4, 4*2);
    vertex(4, 4*2);
    endShape();
    popMatrix();
  }

  //Reserver a la classe Robot methode pour calculer la position des capteurs.
  private ArrayList<PVector> sensorsPosition(int sensorNumber, int sensorSensorRange, int sensorRobotRange) {

    ArrayList<PVector> tmpSensorsPosition;

    //creation de la liste

    tmpSensorsPosition = new ArrayList<PVector>();

    if (sensorNumber == 1) {
      tmpSensorsPosition.add(new PVector(sensorSensorRange, sensorRobotRange));
    } else if (sensorNumber == 2) {
      tmpSensorsPosition.add(new PVector((-sensorSensorRange/2), sensorRobotRange));
      tmpSensorsPosition.add(new PVector((sensorSensorRange/2), sensorRobotRange));
    } else if (sensorNumber == 3) {
      tmpSensorsPosition.add(new PVector((-sensorSensorRange/2), sensorRobotRange));
      tmpSensorsPosition.add(new PVector((0), sensorRobotRange));
      tmpSensorsPosition.add(new PVector((sensorSensorRange/2), sensorRobotRange));
    }
    return tmpSensorsPosition;
  }
  private float proportionalIntegralDerivativeController(float setpoint, float measuredValue){
    
    //variable
    float tmpProportional = 0;
    float tmpIntegral = 0;
    float tmpDerivative = 0;
    float tmpErrorPrev = 0;
    float tmpController =0;
    float kProportional=1;
    float kIntegral=1;
    float kDerivative=1;
    
    tmpProportional = setpoint - measuredValue;
    tmpIntegral += tmpProportional;
    tmpDerivative = tmpProportional - tmpErrorPrev;
    tmpController = (kProportional*tmpProportional)+(kIntegral*tmpIntegral)+(kDerivative*tmpDerivative);
    tmpErrorPrev= tmpProportional;
       
  }
}
