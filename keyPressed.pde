void keyReleased() {
  if (keyCode==ENTER) {
    field.setText("");
    area.setText("");
  }
  if(windowtati.size()<=0){
    b.popdown();
    if(key=='s'){
      save();
    }else if(key=='l'){
      load();
    }else if(key=='/'){
      b.popup();
    }else if(key=='i'){
      inventorywindow iw=new inventorywindow(player);
      windowtati.add(iw);
    }else{
    turn();
    }
  }else{
    window w=(window)windowtati.get(windowtati.size()-1);
    w.keyinput();
  }
}
