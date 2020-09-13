import javax.swing.*;
import java.awt.*;

JLayeredPane pane;
JTextField field;
JTextArea area;

int math;
final int SHIKAI=20;
PImage maptilea;
PImage charatilea;
PImage itemtilea;
map m;
blog b;
pinfo pi;
int randomseed=123452;
ArrayList charatati=new ArrayList();
ArrayList itemtati=new ArrayList();
ArrayList windowtati=new ArrayList();
Player player=new Player();
void setup() {
    // SmoothCanvasの親の親にあたるJLayeredPaneを取得
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();

  // 1行のみのテキストボックスを作成
  field = new JTextField();
  field.setBounds(10, 10, 150, 30);
  pane.add(field);
  loadst("enemydata.csv");
  frameRate(60);
  size(700, 700);
  println("load");
  maptilea=loadImage("ProjectUtumno_full.png");
  itemtilea=loadImage("ProjectUtumno_full.png");
  b=new blog();
  b.print("welcome to nonamerogue,traveler!");
  println("done");
  m=new map(loadcsv("testexp_tile.csv"));
  charatati=tloadcsv("testexp_teki.csv");
  math=width/SHIKAI;
  player.p.x=51;
  player.p.y=55;
  player.st.name="no name";
  player.st.atk=10;
  charatati.add(player);
  pi=new pinfo();
  randomSeed(randomseed);
}
void draw() {
  player.st.name=field.getText();
  background(100);
  byouga();
  b.draw();
  pi.draw();
  if (windowtati.size()>0) {
    for (int i=0; i<windowtati.size(); i++) {
      window w=(window)windowtati.get(i);
      w.draw();
    }
  }
}
void turn() {
  if (keyCode==UP) {
    player.move(0, -1);
  }
  if (keyCode==DOWN) {
    player.move(0, 1);
  }
  if (keyCode==RIGHT) {
    player.move(1, 0);
  }
  if (keyCode==LEFT) {
    player.move(-1, 0);
  }
  if (key=='g') {
    player.take();
  }
  for (int i=0; i<charatati.size(); i++) {
    chara t=(chara)charatati.get(i);
    t.turn();
    if (t.st.hp<0) {
      b.print(t.st.name+" was killed!");
      charatati.remove(t);
    }
  }
}
void byouga() {
  for (int i=0; i<SHIKAI+1; i++) {
    for (int k=0; k<SHIKAI+1; k++) {
      image(gettile(maptilea, m.gettile(toworldx(i), toworldy(k))), i*math, k*math, math, math);
    }
  }
  for (int i=0; i<itemtati.size(); i++) {
    item it=(item)itemtati.get(i);
    it.draw();
  }
  for (int i=0; i<charatati.size(); i++) {
    chara t=(chara)charatati.get(i);
    t.draw();
  }
}
