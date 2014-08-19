import java.awt.*;
import javax.swing.*;

class Parametre extends JFrame {
  
  JFrame fenetre;
  JPanel jpChoixRobot,jpRobot,jpParametre,jpResolutionCapteur,jpPID,jpPosition,jpButton,jpContentPanel,jpContentCenter;
  JLabel jlChoixRobot,jlDistanceDx,jlDistanceDy,jlVitesse,jlRayon,jlFacteurKp,jlFacteurKi,jlFacteurKd,jlImageRobot,jlImagePID;
  JComboBox jcbChoixRobot;
  JButton jbValider,jbStart,jbStop,jbReset;
  JTextField jtfDistanceDx, jtfDistanceDy,jtfVitesse,jtfRayon,jtfFacteurKp,jtfFacteurKi,jtfFacteurKd;
  JRadioButton jrbPositionOne,jrbPositionTwo,jrbPositionThree,jrbPositionFour,jrbPositionFive;
   

  Parametre() {
    fenetre = new JFrame();
    fenetre.setTitle("Paramètres de la simulation");
    fenetre.setSize(400, 600);
    fenetre.setVisible(true);
    fenetre.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
    initWindows();
  }

  void initWindows() {
    
  }
  void initChoix() {
    jpRobot = new JPanel();
    jpRobot.setLayout(new BorderLayout());
    jpRobot.setBorder(BorderFactory);
    jcbChoixRobot = new JComboBox();
  }
}
