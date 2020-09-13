class blog{
  ArrayList logs;
  int x=0;
  int y=500;
  int dy=y;
  int dw=500;
  int w=dw;
  int dh=200;
  int h=dh;
  int textsize=20;
  blog(){
    logs=new ArrayList();
  }
  void print(String a){
    logs.add(a);
  }
  void popup(){
    y=0;
    h=height;
  }
  void popdown(){
    y=dy;
    h=dh;
  }
  void draw(){
    fill(0,0,0,128);
    rect(x,y,w,h);
    for(int i=1;i<=logs.size();i++){
      String s=(String)logs.get(logs.size()-i);
      if(y+h-i*textsize>y+textsize/2){
      fill(256,256,256,128);
      textSize(textsize);
      text(s,x,y+h-i*textsize);
    }
    }
  }
}
class pinfo{
  pinfo(){
  }
  int x=500;
  int w=200;
  int y=500;
  int h=200;
  int textsize=15;
  void draw(){
    fill(255);
    rect(x,y,w,h);
    fill(0);
    text("name:"+player.st.name,x,y+textsize);
    text("hp:"+player.st.hp+"/"+player.st.mhp,x,y+textsize*2);
    text("mp:"+player.st.mp+"/"+player.st.mmp,x,y+textsize*3);
    text("atk:"+player.st.atk,x,y+textsize*4);
    text("def:"+player.st.atk,x,y+textsize*5);
  }
}
