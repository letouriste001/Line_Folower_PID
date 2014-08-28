// @author : Christophe Aubert.
// @bref : inspirate by the nature of code writen by Daniel Shiffman <http://www.shiffman.net> and NXT line folower by LEGO.
// @description : Virtual line folower for simulation of line folower

//changement a venir suite a reflexion

/* a faire */

/* faire une fonction qui calcule la position du capteur par rapport au robot */

class Robot implements Drawable {

  //Variables

  public PVector robotPosition;
  public PVector sensorPosition;
  public ArrayList<Sensor> sensors; // en prevision de la creation d'un robot multi-capteur;
  public float proportional = 0;
  public float integral = 0;
  public float derivative = 0;
  public float kProportional = 0.1;//fixer pour les tests
  public  float kIntegral = 0.1;//fixer pour les tests
  public float kDerivative = 0.1;//fixer pour les tests
  public float errorPrev = 0;
  public float setpoit = 0.5;//fixer pour les tests
  public float heading =0;
  public float velocity = 20.0 / frameRate;//fixer pour les tests
  public float dt = frameRate;//fixer pour les tests

  //Constructeur

  public Robot() {
  }

  public Robot(float kP, float kI, float kD, PImage path, PVector offsetPosition, PVector offestSensorPosition, int sWidth, int sHeight ) {

    //il doit manquer des choses !!
    this();
    this.robotPosition = offsetPosition;
    this.sensors = new ArrayList<Sensor>();
    this.sensorPosition = new PVector (229, 292);
    this.sensors.add(new Sensor(path, offestSensorPosition, sWidth, sHeight));
    this.kProportional = kP;
    this.kIntegral = kI;
    this.kDerivative = kD;
  }

  //Mehtodes
  // methode capteur unique 
  public void PIDToHeading () {

    //variable
    Sensor tmpSensor;
    float controller;

    //instruction
    tmpSensor = sensors.get(0);
    println("la valeur lu par le capteur"+ tmpSensor.readValue(robotPosition));
    this.proportional = setpoit - tmpSensor.readValue(robotPosition);
    this.integral += this.proportional;
    this.derivative = this.proportional - errorPrev;
    controller = (this.kProportional * this.proportional)+(this.kIntegral * this.integral)+(this.kDerivative * this.derivative);
    println("controller :" + controller );
    //Transformation de la valeur du PID en un angle [ f(-50) = -PI/2; f(0)= 0; f(50)= PI/2 ]
    println("angles :" + this.heading );
    this.heading = (QUARTER_PI/25)*controller; //-HALF_PI;
  }


  public void updatePosition() {

    //println("la position x est :" + this.robotPosition.x );
    //println("la position y est :" + this.robotPosition.y );
    PIDToHeading();
    this.robotPosition.x += cos(this.heading) * this.velocity / dt;
    this.robotPosition.y += sin(this.heading) * this.velocity / dt;
    println("x : " + this.robotPosition.x + " y : " + this.robotPosition.y);
  }

  public  void draw() {

    pushMatrix();
    translate(this.robotPosition.x, this.robotPosition.y);
    rotate(this.heading);

    fill(175);
    stroke(0);
    beginShape(TRIANGLES);
    vertex(0, -4*2);
    vertex(-4, 4*2);
    vertex(4, 4*2);
    endShape();

    for (Sensor sensor : this.sensors) {
      sensor.draw();
    }

    popMatrix();
  }
}
