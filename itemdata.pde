HashMap itemdata=new HashMap<Integer,item>();//x,yはコピーしない
void loaditem(String filename){
  Table t=loadTable(filename,"header");
    for(int k=0;k<t.getRowCount();k++){
      item st=new item();
      st.heal=t.getInt(k,"heal");
      st.eat=t.getInt(k,"eat");
      st.atkup=t.getInt(k,"atkup");
      st.defup=t.getInt(k,"defup");
      st.name=t.getString(k,"name");
      String gtype=t.getString(k,"type");
      if(gtype.equals("none")){
        st.type=itemtype.none;
      }else if(gtype.equals("eat")){
        st.type=itemtype.eat;
      }else if(gtype.equals("equip")){
        st.type=itemtype.equip;
      }else if(gtype.equals("wear")){
        st.type=itemtype.wear;;
      }else if(gtype.equals("use")){
        st.type=itemtype.use;
      }else{
        st.type=itemtype.none;
      }
      enmdata.put(t.getInt(k,"id"),st);
    }
  }
