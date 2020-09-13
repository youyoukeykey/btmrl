status dst(status st){
  status sst=new status();
  sst.hp=st.hp;
  sst.mp=st.mp;
  sst.name=st.name;
  sst.mmp=st.mmp;
  sst.mhp=st.mhp;
  sst.atk=st.atk;
  sst.def=st.def;
  return sst;
}
