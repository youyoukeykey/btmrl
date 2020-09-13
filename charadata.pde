HashMap enmdata=new HashMap<Integer,status>();
void loadst(String filename){
  Table t=loadTable(filename,"header");
    for(int k=0;k<t.getRowCount();k++){
      status st=new status();
      st.hp=t.getInt(k,"hp");
      st.atk=t.getInt(k,"atk");
      st.def=t.getInt(k,"def");
      st.mp=t.getInt(k,"mp");
      st.mhp=t.getInt(k,"mhp");
      st.mmp=t.getInt(k,"mmp");
      st.name=t.getString(k,"name");
      enmdata.put(t.getInt(k,"id"),st);
    }
  }
