import java.awt.*;

import javax.swing.*;

class Parametre extends JFrame {

  JFrame fenetre;
  JPanel jpChoixRobot, jpRobot, jpParametres, jpResolutionCapteur, jpPID,
      jpFacteur, jpPosition, jpButton, jpContentPanel, jpCenter,
      jpDistanceDx, jpDistanceDy, jpVitesse, jpFacteurKp, jpFacteurKi,
      jpFacteurKd, jpImageRobot, jpImagePID, jpRobotCenterPanel;
  JLabel jlChoixRobot, jlDistanceDx, jlDistanceDy, jlVitesse, jlRayon,
      jlFacteurKp, jlFacteurKi, jlFacteurKd, jlImageRobot, jlImagePID;
  JComboBox<String> jcbChoixRobot;
  JButton jbValider, jbStart, jbStop, jbReset;
  JTextField jtfDistanceDx, jtfDistanceDy, jtfVitesse, jtfRayon,
      jtfFacteurKp, jtfFacteurKi, jtfFacteurKd;
  JRadioButton jrbPositionOne, jrbPositionTwo, jrbPositionThree,
      jrbPositionFour, jrbPositionFive;
  ImageIcon iiImageRobot, iiRobotOneSensor, iiRobotTwoSensor, iiImagePID,
      iiPositionOne, iiPositionTwo, iiPositionThree, iiPositionFour,
      iiPositionFive;
  ButtonGroup bgPosition;

  Parametre() {
    fenetre = new JFrame();
    fenetre.setTitle("Paramètres de la simulation");
    fenetre.setSize(600, 600);
    fenetre.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
    initWindows();
    fenetre.setVisible(true);
  }

  void initChoix() {

    // JPanel Contient le text 'Choix du Robot' et de la liste deroulante
    jpChoixRobot = new JPanel();
    jpChoixRobot.setBackground(Color.white);
    jpChoixRobot.setBorder(BorderFactory.createTitledBorder("Choix"));

    // JLabel text
    jlChoixRobot = new JLabel("Choix du Robot");

    // JComboBox Liste deroulante
    jcbChoixRobot = new JComboBox<String>();
    jcbChoixRobot.addItem("Robot à un capteur");
    jcbChoixRobot.addItem("Robot à deux capteurs");
    jcbChoixRobot.setSelectedIndex(1);

    // ajout des objet dans le JPanel
    jpChoixRobot.add(jlChoixRobot);
    jpChoixRobot.add(jcbChoixRobot);
  }

  void initParametre() {

    // JPanel Parametres
    jpParametres = new JPanel();
    jpParametres.setBackground(Color.white);
    jpParametres.setBorder(BorderFactory.createTitledBorder("Paramètre"));
    jpParametres.setLayout(new GridLayout(3, 1));

    // JPanel des differentes cases
    jpDistanceDx = new JPanel();
    jpDistanceDx.setBackground(Color.white);
    jpDistanceDy = new JPanel();
    jpDistanceDy.setBackground(Color.white);
    jpVitesse = new JPanel();
    jpVitesse.setBackground(Color.white);

    // Jlabel Text Prametres
    jlDistanceDx = new JLabel("Distance dx");
    jlDistanceDy = new JLabel("Distance dy");
    jlVitesse = new JLabel("Vitesse");

    // JTextField Parametres
    jtfDistanceDx = new JTextField();
    jtfDistanceDy = new JTextField();
    jtfVitesse = new JTextField();

    // ajout des objets dans les different JPanel qui represente les cases
    jpDistanceDx.add(jlDistanceDx);
    jpDistanceDx.add(jtfDistanceDx);
    jpDistanceDy.add(jlDistanceDy);
    jpDistanceDy.add(jtfDistanceDy);
    jpVitesse.add(jlVitesse);
    jpVitesse.add(jtfVitesse);

    // ajout des objets dans les cases du GridLayout
    jpParametres.add(jpDistanceDx);
    jpParametres.add(jpDistanceDy);
    jpParametres.add(jpVitesse);
  }

  void initResolutionCapteur() {

    // JPanel Resolution Capteur
    jpResolutionCapteur = new JPanel();
    jpResolutionCapteur.setBackground(Color.white);
    jpResolutionCapteur.setBorder(BorderFactory
        .createTitledBorder("Résolution du Capteur"));

    // Jlabel Text Resolution Capteur
    jlRayon = new JLabel("Rayon");

    // JTextField
    jtfRayon = new JTextField();

    // Ajout des objets dans le JPanel capteur
    jpResolutionCapteur.add(jlRayon);
    jpResolutionCapteur.add(jtfRayon);
  }

  void initImageRobot() {

    // Image Robot
    iiRobotOneSensor = new ImageIcon("images/RobotOneSensor.png");
    iiRobotTwoSensor = new ImageIcon("images/RobotTwoSensor.png");
    iiImageRobot = iiRobotOneSensor; // image par defaut

    jlImageRobot = new JLabel(iiImageRobot);

    jpImageRobot = new JPanel();
    jpImageRobot.setBackground(Color.white);
    jpImageRobot.setLayout(new BorderLayout());
    jpImageRobot.add(jlImageRobot);
  }

  void initRobot() {

    // JPanel prametres
    jpRobot = new JPanel();
    jpRobot.setBackground(Color.white);
    jpRobot.setBorder(BorderFactory.createTitledBorder("Robot"));
    jpRobot.setLayout(new BorderLayout());

    initImageRobot();
    initParametre();
    initResolutionCapteur();

    jpRobotCenterPanel = new JPanel();
    jpRobotCenterPanel.setBackground(Color.white);
    jpRobotCenterPanel.setLayout(new GridLayout(2, 1));

    jpRobotCenterPanel.add(jpParametres);
    jpRobotCenterPanel.add(jpResolutionCapteur);

    jpRobot.add(jpImageRobot, BorderLayout.WEST);
    jpRobot.add(jpRobotCenterPanel, BorderLayout.CENTER);
  }

  void initCorrection() {

    // JPanel Correction
    jpFacteur = new JPanel();
    jpFacteur.setBackground(Color.white);
    jpFacteur.setBorder(BorderFactory
        .createTitledBorder("Facteur de Correction"));
    jpFacteur.setLayout(new GridLayout(3, 1));

    // JPanel des differentes cases
    jpFacteurKp = new JPanel();
    jpFacteurKp.setBackground(Color.white);
    jpFacteurKi = new JPanel();
    jpFacteurKi.setBackground(Color.white);
    jpFacteurKd = new JPanel();
    jpFacteurKd.setBackground(Color.white);

    // Jlabel Text Prametres
    jlFacteurKp = new JLabel("Facteur kp");
    jlFacteurKi = new JLabel("Facteur ki");
    jlFacteurKd = new JLabel("Facteur kd");

    // JTextField Parametres
    jtfFacteurKp = new JTextField();
    jtfFacteurKi = new JTextField();
    jtfFacteurKd = new JTextField();

    // ajout des objets dans les different JPanel qui represente les cases
    jpFacteurKp.add(jlFacteurKp);
    jpFacteurKp.add(jtfFacteurKp);
    jpFacteurKi.add(jlFacteurKi);
    jpFacteurKi.add(jtfFacteurKi);
    jpFacteurKd.add(jlFacteurKd);
    jpFacteurKd.add(jtfFacteurKd);

    // ajout des objets dans les cases du GridLayout
    jpFacteur.add(jpFacteurKp);
    jpFacteur.add(jpFacteurKi);
    jpFacteur.add(jpFacteurKd);
  }

  void initImagePID() {

    // Image PID
    iiImagePID = new ImageIcon("images/TableauPID.jpg");

    jlImagePID = new JLabel(iiImagePID);

    jpImagePID = new JPanel();
    jpImagePID.setBackground(Color.white);
    jpImagePID.setLayout(new BorderLayout());
    jpImagePID.add(jlImagePID);
  }

  void initPID() {

    jpPID = new JPanel();
    jpPID.setBackground(Color.white);
    jpPID.setBorder(BorderFactory.createTitledBorder("Robot"));
    jpPID.setLayout(new BorderLayout());

    initCorrection();
    initImagePID();

    jpPID.add(jpImagePID, BorderLayout.WEST);
    jpPID.add(jpFacteur, BorderLayout.CENTER);
  }

  void initPosition() {

    jpPosition = new JPanel();
    jpPosition.setBackground(Color.white);
    jpPosition.setBorder(BorderFactory.createTitledBorder("Position"));
    
    iiPositionOne = new ImageIcon("images/Position1.png");
    iiPositionTwo = new ImageIcon("images/Position2.png");
    iiPositionThree = new ImageIcon("images/Position3.png");
    iiPositionFour = new ImageIcon("images/Position4.png");
    iiPositionFive = new ImageIcon("images/Position5.png");
    
    jrbPositionOne = new JRadioButton(iiPositionOne,true);
    jrbPositionTwo = new JRadioButton(iiPositionTwo);
    jrbPositionThree = new JRadioButton(iiPositionThree);
    jrbPositionFour = new JRadioButton(iiPositionFour);
    jrbPositionFive = new JRadioButton(iiPositionFive);
    
    bgPosition = new ButtonGroup();
    bgPosition.add(jrbPositionOne);
    bgPosition.add(jrbPositionTwo);
    bgPosition.add(jrbPositionThree);
    bgPosition.add(jrbPositionFour);
    bgPosition.add(jrbPositionFive);
    
    jpPosition.add(jrbPositionOne);
    jpPosition.add(jrbPositionTwo);
    jpPosition.add(jrbPositionThree);
    jpPosition.add(jrbPositionFour);
    jpPosition.add(jrbPositionFive);
  }

  void initCenter(){
    
    jpCenter = new JPanel();
    jpCenter.setBackground(Color.white);
    jpCenter.setLayout(new BorderLayout());
    
    initRobot();
    initPID();
    initPosition();
    
    jpCenter.add(jpRobot,BorderLayout.NORTH);
    jpCenter.add(jpPID,BorderLayout.CENTER);
    jpCenter.add(jpPosition,BorderLayout.SOUTH);
  }
  void initButton(){
    
    jpButton = new JPanel();
    jpButton.setBackground(Color.white);
    jpButton.setBorder(BorderFactory.createTitledBorder("Control"));
    
    jbValider = new JButton("Valider");
    jbReset = new JButton("Reset");
    jbStart = new JButton("Start");
    jbStop = new JButton("Stop");
    
    jpButton.add(jbValider);
    jpButton.add(jbReset);
    jpButton.add(jbStart);
    jpButton.add(jbStop);
  }
  
  void initWindows() {
    
    jpContentPanel = new JPanel();
    jpContentPanel.setBackground(Color.white);
    jpContentPanel.setLayout(new BorderLayout());
    
    initChoix();
    initCenter();
    initButton();
    
    jpContentPanel.add(jpChoixRobot,BorderLayout.NORTH);
    jpContentPanel.add(jpCenter,BorderLayout.CENTER);
    jpContentPanel.add(jpButton,BorderLayout.SOUTH);
    
    fenetre.setContentPane(jpContentPanel);
  }
}
