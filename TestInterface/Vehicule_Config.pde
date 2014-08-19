import java.awt.*;

import javax.swing.*;

class Parametre extends JFrame {

  JFrame fenetre;
  JPanel jpChoixRobot, jpRobot, jpParametres, jpResolutionCapteur, jpPID, 
  jpPosition, jpButton, jpContentPanel, jpContentCenter, jpDistanceDx, jpDistanceDy, jpVitesse, jpFacteurKp, jpFacteurKi, 
  jpFacteurKd, jpImageRobot, jpImagePID, jpRobotCenterPanel;
  JLabel jlChoixRobot, jlDistanceDx, jlDistanceDy, jlVitesse, jlRayon, jlFacteurKp, jlFacteurKi, jlFacteurKd, jlImageRobot, jlImagePID;
  JComboBox<String> jcbChoixRobot;
  JButton jbValider, jbStart, jbStop, jbReset;
  JTextField jtfDistanceDx, jtfDistanceDy, jtfVitesse, jtfRayon, jtfFacteurKp, jtfFacteurKi, jtfFacteurKd;
  JRadioButton jrbPositionOne, jrbPositionTwo, jrbPositionThree, jrbPositionFour, jrbPositionFive;
  ImageIcon iiImageRobot, iiRobotOneSensor, iiRobotTwoSensor, iiPID;

  Parametre() {
    fenetre = new JFrame();
    fenetre.setTitle("Paramètres de la simulation");
    fenetre.setSize(400, 600);
    fenetre.setVisible(true);
    fenetre.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
    initWindows();
  }

  void initChoix() {

    // JPanel Contient le text 'Choix du Robot' et de la liste deroulante
    jpRobot = new JPanel();
    jpRobot.setBackground(Color.white);
    jpRobot.setBorder(BorderFactory.createTitledBorder("Choix"));

    // JLabel text
    jlChoixRobot = new JLabel("Choix du Robot");

    // JComboBox Liste deroulante
    jcbChoixRobot = new JComboBox<String>();
    jcbChoixRobot.addItem("Robot à un capteur");
    jcbChoixRobot.addItem("Robot à deux capteurs");
    jcbChoixRobot.setSelectedIndex(1);

    // ajout des objet dans le JPanel
    jpRobot.add(jlChoixRobot);
    jpRobot.add(jcbChoixRobot);
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
    jpResolutionCapteur.setBorder(BorderFactory.createTitledBorder("Résolution du Capteur"));

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














  void initWindows() {

    initChoix();
  }
}
