class window {
  float x, y, w, h;
  int textsize=30;
  void draw() {
  }
  void keyinput() {
  }
}
class inventorywindow extends window {
  chara point=player;
  inventorywindow() {
    x=100;
    y=100;
    w=500;
    h=500;
  }
  inventorywindow(chara p) {
    x=100;
    y=100;
    w=500;
    h=500;
    point = p;
  }
  void keyinput() {
    if (keyCode==BACKSPACE) {
      windowtati.remove(this);
    }
    int offset=int(floor(floor((h/textsize-1))*pagenum));
    if (keyCode==UP) {
      if (nowcirsol>0) {
        nowcirsol--;
      } else {
        nowcirsol=int(floor(h/textsize-2));
        if (nowcirsol+offset>=point.inventory.size()) {
          nowcirsol=point.inventory.size()-1-offset;
        }
      }
    }
    if (keyCode==DOWN) {
      if (nowcirsol<int(floor(h/textsize-2))) {
        nowcirsol++;
        if (nowcirsol+offset>=point.inventory.size()) {
          nowcirsol=0;
        }
      } else {
        nowcirsol=0;
      }
    }
    int pagemax=int((point.inventory.size()-point.inventory.size()%(h/textsize-1))/(h/textsize-1));
    if (keyCode==RIGHT) {
      if (pagenum<pagemax) {
        pagenum++;
        nowcirsol=0;
      } else {
        pagenum=0;
        nowcirsol=0;
      }
    }
    if (keyCode==LEFT) {
      if (pagenum>0) {
        pagenum--;
        nowcirsol=0;
      } else {
        pagenum=pagemax;
        nowcirsol=0;
      }
    }
    if (keyCode==ENTER) {
      item e=(item)point.inventory.get(offset+nowcirsol);
      itemwindow iw=new itemwindow(this, e, point);
      windowtati.add(iw);
    }
  }
  int nowcirsol=0;
  int nowcirsol2=0;
  int pagenum=0;
  void draw() {
    fill(255);
    stroke(0, 0, 0);
    rect(x, y, w, h);
    textSize(textsize);
    fill(0, 0, 0);
    int k=0;
    int offset=int(floor(floor((h/textsize-1))*pagenum));
    for (int i=1; i<h/textsize-1; i++) {
      line(x, y+i*textsize, x+w, y+i*textsize);
      if (nowcirsol==i-1) {
        fill(255, 255, 255);
      } else {
        fill(255, 255, 255, 100);
      }
      fill(255, 255, 255);
      rect(x+textsize/4, y+i*textsize+textsize/4, textsize/6, textsize/2);
      if (offset+i-1<point.inventory.size()) {
        item it=(item)point.inventory.get(offset+i-1);
        image(gettile(itemtilea, it.imageid), x+textsize/2, y+i*textsize, textsize, textsize);
        if (nowcirsol==i-1) {
          fill(0, 0, 0);
        } else {
          fill(255, 255, 255);
        }
        text(it.name, x+textsize/2+textsize, y+i*textsize+textsize);
        fill(255, 255, 255);
      }
      k=i;
    }
    k+=1;
    rect(x, y+k*textsize, w, textsize);
    fill(0);
    textSize(textsize/2);
    int pagemax=int((point.inventory.size()-point.inventory.size()%(h/textsize-1))/(h/textsize-1));
    text(" page"+(pagenum+1)+"/"+(pagemax+1), x, y+k*textsize+textsize/2);
    text(" UP/DOWN to move cirsol |RIGHT/LEFT to move page |ENTER to use", x, y+k*textsize+textsize);
    textSize(textsize);
    text(point.st.name+"'s INVENTORY", x+textsize/2, y+textsize);
    fill(255, 255, 255);
    rect(x+(w/7)*5, y, (w/7)*2, h/2);
    if (point.inventory.size()>0) {
      int maxst=int((w/7)*2/(textsize/4));
      item e=(item)point.inventory.get(offset+nowcirsol);
      image(gettile(itemtilea, e.imageid), x+(w/7)*5, y, (w/7), (w/7));
      fill(0, 0, 0);
      textSize(textsize/2);
      text("name:"+e.name, x+(w/7)*5, y+w/7+textsize);
      text("info:", x+(w/7)*5, y+w/7+(textsize/2*3));
      text(iteminfo(e), x+(w/7)*5, y+w/7+(textsize*2));
      if (iteminfo2(e).length()>maxst) {
        text(iteminfo2(e).substring(0, maxst-2), x+(w/7)*5, y+w/7+(textsize*2.5));
        text(iteminfo2(e).substring(maxst-2, iteminfo2(e).length()), x+(w/7)*5, y+w/7+(textsize*3));
      } else {
        text(iteminfo2(e), x+(w/7)*5, y+w/7+(textsize*2.5));
      }
    }
  }
}
class itemwindow extends window {
  item e=new item();
  chara point=new chara();
  int nowselect=0;
  inventorywindow in=new inventorywindow();
  itemwindow() {
  }
  itemwindow(inventorywindow in, item e, chara point) {
    this.e=e;
    this.point=point;
    this.in=in;
    x=in.x+(in.w/7)*5;
    y=in.y+in.h/2;
    w=(in.w/7)*2;
    h=in.h/2;
  }
  void keyinput() {
    if (keyCode==UP) {
      if (nowselect>0) {
        nowselect--;
      } else {
        nowselect=3;
      }
    }
    if (keyCode==DOWN) {
      if (nowselect<3) {
        nowselect++;
      } else {
        nowselect=0;
      }
    }
    if (keyCode==BACKSPACE) {
      windowtati.remove(this);
    }
    if(keyCode==ENTER){
      switch(nowselect) {
      case 0:
        switch(e.type){
          case use:
          point.use(e);
          break;
          case equip:
          point.equip(e);
          break;
          case wear:
          point.wear(e);
          break;
          case eat:
          point.eat(e);
          break;
          case none:
          b.print(point.st.name+"can't use it");
          break;
          default:
          b.print(point.st.name+"can't use it");
          break;
        }
        break;
      case 1:
        point.drop(e);
        break;
      case 2:
        
        break;
      case 3:
        break;
        default:
        break;
      }
      windowtati.remove(this);
    }
  }
  void draw() {
    fill(255);
    rect(x, y, w, h);
    float rw=h/4;
    for (int i=0; i<4; i++) {
      String text="ERROR"; 
      switch(i) {
      case 0:
        switch(e.type){
          case use:
          text="USE";
          break;
          case equip:
          text="EQUIP";
          break;
          case wear:
          text="WEAR";
          break;
          case eat:
          text="EAT";
          break;
          case none:
          text="USE";
          break;
          default:
          text="USE";
          break;
        }
        break;
      case 1:
        text="DROP";
        break;
      case 2:
        text="THROW";
        break;
      case 3:
        text="CANCEL";
        break;
      }
      textSize(h/7);
      rect(x, y+rw*i, w, rw);
      if (nowselect==i) {
       fill(255,0,0); 
       rect(x, y+rw*i+rw/3, w/7, rw/3);
       fill(255);
      }
      fill(0);
      text(text, x+w/20, y+rw*(i+1));
      fill(255);
    }
  }
}
