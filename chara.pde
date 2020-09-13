enum state {
  keyinput, 
    actbigin, 
    act, 
    actfinish, 
    moveigin, 
    move, 
    movefinish, 
    turnend
}
class status {
  String name="nanashi";
  float atk=5;
  float def=5;
  float kai=10;
  float hp=100;
  float mhp=100;
  float mp=10;
  float mmp=100;
  float fullness=100;
  status() {
  }
}
class chara {
  position p=new position(0, 0);
  status st=new status();
  direct m=direct.right;
  state s=state.keyinput;
  item equipitem;
  item wearitem;
  int imageid;
  ArrayList inventory=new ArrayList();
  chara() {
    st=new status();
  }
  void draw() {
  }
  void turn(){
  }
  void takef(item it){
    inventory.add(it);
    itemtati.remove(it);
    b.print(this.st.name+" taked "+it.name+" from floor");
  }
  void take(){
    for(int i=0;i<itemtati.size();i++){
      item r=(item)itemtati.get(i);
      if(this.p.x==r.p.x&&this.p.y==r.p.y){
        takef(r);
        return;
      }
    }
  }
  void use(item e){
    inventory.remove(e);
    st.hp+=e.heal;
    st.atk+=e.atkup;
    st.def+=e.defup;
    b.print(st.name+"used"+e.name);
  }
  void eat(item e){
    inventory.remove(e);
    st.fullness+=e.eat;
    b.print(st.name+"ate"+e.name);
  }
  void throwitem(item e){
    
  }
  void drop(item e){
    e.p.x=p.x;
    e.p.y=p.y;
    inventory.remove(e);
    itemtati.add(e);
    b.print(st.name+"droped"+e.name);
  }
  void equip(item e){
    inventory.remove(e);
    if(equipitem==null){
      equipitem=e;
      b.print(st.name+"equip"+e.name);
    }else{
      String str=equipitem.name;
      inventory.add(equipitem);
      equipitem=e;
      b.print(st.name+"changed"+str+"to"+e.name);
    }
  }
  void wear(item e){
    inventory.remove(e);
    if(wearitem==null){
      wearitem=e;
      b.print(st.name+"weared"+e.name);
    }else{
      String str=wearitem.name;
      inventory.add(wearitem);
      wearitem=e;
      b.print(st.name+"changed"+str+"to"+e.name);
    }
  }
}
ArrayList tloadcsv(String filename) {
  ArrayList t=new ArrayList();
  int[][] l=loadcsv(filename);
  for (int i=0; i<l.length; i++) {
    for (int k=0; k<l[i].length; k++) {
      if (l[i][k]>-1) {
        teki tt=new teki(l[i][k], k, i);
        tt.st=new status();
        status ss=(status)enmdata.get(l[i][k]);
        tt.st=dst(ss);
        t.add(tt);
      }
    }
  }
  return t;
}
class teki extends chara {
  teki() {
  }
  teki(int id, int x, int y) {
    imageid=id;
    p.x=x;
    p.y=y;
  }
  void turn() {
    pmove(p,reqestAI());
  }
  direction reqestAI() {
    direction d=new direction(0, 0);
    int dx = player.p.x - this.p.x;
    int dy = player.p.y - this.p.y;
    if(abs(dx)<=1&&abs(dy)<=1){
      atack(this,player);
    }else{
    if (Math.abs(dx) > Math.abs(dy)) {
      if (dx < 0) { 
        d.x=-1;
      } // 左
      else { 
        d.x=1;
      } // 右
    } else {
      // Y方向へ進む
      if (dy < 0) { 
        d.y=-1;
      } // 上
      else { 
        d.y=1;
      } // 下
    }
  }
    return d;
  }
  void draw() {
    image(gettile(maptilea, imageid), math*(toscreenx(p.x)), math*(toscreeny(p.y)), math, math);
  }
}
class Player extends chara {
  Player() {
  }
  void draw() {
    image(gettile(maptilea, 1729), math*(toscreenx(p.x)), math*(toscreeny(p.y)), math, math);
  }
  void move(int x, int y) {
    //if(this.p.x+x>=0&&this.p.y+y>=0&&map[this.p.y+y][this.p.x+x]==0){
    //  this.p.x=this.p.x+x;
    //  this.p.y=this.p.y+y;
    //}
    if(st.hp<=0){
      return;
    }
    direction m=new direction(x, y);
    for (int i=0; i<charatati.size(); i++) {
      chara t=(chara)charatati.get(i);
      if (t.p.x==p.x+m.x&&t.p.y==p.y+m.y) {
        atack(this, t);
      }
    }
    this.p=pmove(p, m);
  }
  void turn(){
    String syuturyoku="there is ";
    int f=0;
    for (int i=0; i<itemtati.size(); i++) {
    item t=(item)itemtati.get(i);
    if(t.p.x==this.p.x&&t.p.y==this.p.y){
      syuturyoku=t.name;
      f+=1;
    }
  }
  if(f==1){
    b.print("there is "+syuturyoku+" in where "+player.st.name+" steped");
  }
  if(f>1){
    f-=1;
    b.print("there is "+syuturyoku+" and "+f+"items"+ " in where "+player.st.name+" steped");
  }
  }//ターン毎の処理
}

void atack(chara n, chara j) {
  float r=(random(112, 143));
  float teisuu=0.9375;
  int dm=int(((n.st.atk*r)*pow(teisuu, j.st.def))/128);
  j.st.hp-=dm;
  //println("atk",n.st.atk,"def",j.st.def,"r",r,"pow",pow(teisuu,j.st.def),"(n.st.atk*r)",(n.st.atk*r),"(n.st.atk*r)*pow((15/16),j.st.def)",(n.st.atk*r)*pow((15/16),j.st.def));
  b.print(j.st.name+" was given "+dm+" damage by "+n.st.name);
}
position pmove(position now,direction mu){
  position p=now;
  if(now.x+mu.x>=0&&now.y+mu.y>=0&&m.map[now.y+mu.y][now.x+mu.x]==211){
    for(int i=0;i<charatati.size();i++){
    chara t=(chara)charatati.get(i);
    if(t.p.x==now.x+mu.x&&t.p.y==now.y+mu.y){
      return p;
    }
  }
   p.x=now.x+mu.x;
   p.y=now.y+mu.y;
  }
  return p;
}
