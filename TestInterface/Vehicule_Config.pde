//pour afficher ce qu'il y a dans la fenetre redimentioner la fenetre BUG !!!!!!

import java.awt.*;

import javax.swing.*;

class Parametre extends JFrame {

  JFrame fenetre;
  JPanel jpChoixRobot, jpRobot, jpParametre, jpResolutionCapteur, jpPID, jpPosition, jpButton, jpContentPanel, jpContentCenter;
  JLabel jlChoixRobot, jlDistanceDx, jlDistanceDy, jlVitesse, jlRayon, jlFacteurKp, jlFacteurKi, jlFacteurKd, jlImageRobot, jlImagePID;
  JComboBox<String> jcbChoixRobot;
  JButton jbValider, jbStart, jbStop, jbReset;
  JTextField jtfDistanceDx, jtfDistanceDy, jtfVitesse, jtfRayon, 
  jtfFacteurKp, jtfFacteurKi, jtfFacteurKd;
  JRadioButton jrbPositionOne, jrbPositionTwo, jrbPositionThree, 
  jrbPositionFour, jrbPositionFive;

  Parametre() {
    fenetre = new JFrame();
    fenetre.setTitle("Paramètres de la simulation");
    fenetre.setSize(400, 600);
    fenetre.setVisible(true);
    fenetre.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
    initWindows();
  }

  void initWindows() {
    initChoix();
    initRobot();
    jpContentPanel = new JPanel();
    jpContentPanel.setLayout(new BorderLayout() );
    jpContentPanel.add(jpChoixRobot,BorderLayout.NORTH);
    jpContentPanel.add(jpRobot,BorderLayout.CENTER);
    fenetre.add(jpContentPanel );
    
  }

  void initChoix() {

    //JPanel Contient le text 'Choix du Robot' et de la liste deroulante
    jpChoixRobot = new JPanel();
    jpChoixRobot.setBackground(Color.white);
    jpChoixRobot.setBorder(BorderFactory.createTitledBorder("Choix"));

    //JLabel text
    jlChoixRobot = new JLabel("Choix du Robot");

    //JComboBox Liste deroulante
    jcbChoixRobot = new JComboBox<String>();
    jcbChoixRobot.addItem("Robot à un capteur");
    jcbChoixRobot.addItem("Robot à deux capteurs");
    jcbChoixRobot.setSelectedIndex(1);

    //Ajout des objet dans le JPanel jpChoixRobot
    jpChoixRobot.add(jlChoixRobot);
    jpChoixRobot.add(jcbChoixRobot);
  }
  void initRobot() {

    //JPanel Robot Contient une Image du robot, les parametres Robot et prametres capteur
    jpRobot = new JPanel();
    jpRobot.setBackground(Color.white);
    jpRobot.setBorder(BorderFactory.createTitledBorder("Robot"));
  }
}
