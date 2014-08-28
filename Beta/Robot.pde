// @author : Christoph; i< numberOfSensor; i++){rate by the nature of code writen by Daniel Shiffman <http://www.shiffman.net> and NXT line folower by LEGO.
// @description : Virtual line folower for simulation of line folower

//changement a venir suite a reflexion

/* a faire */

/* faire une fonction qui calcule la position du capteur par rapport au robot */

class Robot implements Drawable {

  //Variables

  public PVector robotPosition;
  public ArrayList<PVector> offsetSensors;
  public ArrayList<Sensor> sensors; // en prevision de la creation d'un robot multi-capteur;
  public float proportional = 0;
  public float integral = 0;
  public float derivative = 0;
  public float kProportional = 0.8;//fixer pour les tests
  public  float kIntegral = 0.7;//fixer pour les tests
  public float kDerivative = 0.7;//fixer pour les tests
  public float errorPrev = 0;
  public float setpoit = 0.5;//fixer pour les tests
  public float heading =0;
  public float velocity = 60.0 / frameRate;//fixer pour les tests
  public float dt = frameRate;//fixer pour les tests

  //Constructeur

  public Robot() {
  }

  public Robot(float kP, float kI, float kD, PImage path, PVector offsetRobot, int numberOfSensor, int sensorsDx, int sensorsDy, int sWidth, int sHeight ) {

    //il doit manquer des choses !!
    this();
    this.robotPosition = offsetRobot;
    this.sensors = new ArrayList<Sensor>();
    this.offsetSensors = new ArrayList<PVector>();

    //cas 1,2,3 capteur
    switch(numberOfSensor) {
    case 1:
      this.offsetSensors.add(new PVector(sensorsDx, sensorsDy) );
      break;
    case 2:
      offsetSensor.add(new PVector(sensorsDx/2, sensorsDy) );
      offsetSensor.add(new PVector(-sensorsDx/2, sensorsDy) );
      break;
    case 3:
      offsetSensor.add(new PVector(sensorsDx/2, sensorsDy) );
      offsetSensor.add(new PVector(0, sensorsDy) );
      offsetSensor.add(new PVector(-sensorsDx/2, sensorsDy) );
      break;
    }
    for (int i =0; i< numberOfSensor; i++) {
      this.sensors.add(new Sensor(path, this.offsetSensors.get(i), sWidth, sHeight));
    }

    //Facteur de correction
    this.kProportional = kP;
    this.kIntegral = kI;
    this.kDerivative = kD;
  }

  //Mehtodes
  // methode capteur unique 
  public void calcPIDToHeading () {

    //variable
    Sensor tmpSensor;
    PVector tmpSensorPosition;
    float controller;

    //instruction
    tmpSensor = this.sensors.get(0);
    tmpSensorPosition = PVector.add(this.robotPosition, this.offsetSensors.get(0));
    println("x capteur : " + tmpSensorPosition.x + " y capteur: " + tmpSensorPosition.y);
    println("la valeur lu par le capteur"+ tmpSensor.readValue(tmpSensorPosition));
    this.proportional = setpoit - tmpSensor.readValue(tmpSensorPosition);
    this.integral += this.proportional;
    this.derivative = this.proportional - errorPrev;
    controller = (this.kProportional * this.proportional)+(this.kIntegral * this.integral)+(this.kDerivative * this.derivative);
   // println("controller :" + controller );
    //Transformation de la valeur du PID en un angle [ f(-50) = -PI/2; f(0)= 0; f(50)= PI/2 ]
   // println("angles :" + this.heading );
    this.heading = (QUARTER_PI/25)*controller; //-HALF_PI;
  }


  public void updatePosition() {

    calcPIDToHeading();
    this.robotPosition.x += cos(this.heading) * this.velocity / dt;
    this.robotPosition.y += sin(this.heading) * this.velocity / dt;
    println("x : " + this.robotPosition.x + " y : " + this.robotPosition.y);
  }

  public  void draw() {

    pushMatrix();
    translate(this.robotPosition.x, this.robotPosition.y);
    rotate(this.heading+PI/2); //  PI /2 ????

    noStroke();
    fill(175);    
    triangle(-10, 10, 0, -20, 10, 10);

    for (Sensor sensor : this.sensors) {
      sensor.draw();
    }

    popMatrix();
  }
}
