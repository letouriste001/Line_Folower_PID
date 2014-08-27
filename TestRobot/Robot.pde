// @author : Christophe Aubert.
// @bref : inspirate by the nature of code writen by Daniel Shiffman <http://www.shiffman.net> and NXT line folower by LEGO.
// @description : Virtual line folower for simulation of line folower

//changement a venir suite a reflexion
class Robot implements Drawable {

  //Variables

  public PVector robotPosition;
  public PVector sensorPosition;
  public ArrayList<Sensor> sensors; // en prevision de la creation d'un robot multi-capteur;
  public float proportional = 0;
  public float integral = 0;
  public float derivative = 0;
  public float kProportional;
  public  float kIntegral;
  public float kDerivative;
  public float errorPrev = 0;
  public float setpoit;
  public float heading =0;
  public float velocity = 2.0 / frameRate;
  public float dt = frameRate;

  //Constructeur

  public Robot() {
  }

  public Robot(float kP, float kI, float kD, PImage path, PVector offsetPosition, PVector offestSensorPosition, int sWidth, int sHeight ) {

    //il doit manquer des choses !!
    this();
    this.robotPosition = offsetPosition;
    this.sensors = new ArrayList<Sensor>();
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
    this.proportional = setpoit - tmpSensor.readValue(sensorPosition);
    this.integral += this.proportional;
    this.derivative = this.proportional - errorPrev;
    controller = (this.kProportional * this.proportional)+(this.kIntegral * this.integral)+(this.kDerivative * this.derivative);
    //Transformation de la valeur du PID en un angle [ f(0) = -90; f(50)= 0; f(100)=+90 ]
    this.heading = (QUARTER_PI/25)*controller-HALF_PI;
  }


  public void updatePosition() {

    println("la position x est :" + this.robotPosition.x );
    println("la position y est :" + this.robotPosition.y );
    this.robotPosition.x += cos(this.heading) * this.velocity / dt;
    this.robotPosition.y += sin(this.heading) * this.velocity / dt;
    
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
