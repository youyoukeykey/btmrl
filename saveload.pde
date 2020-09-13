void save() {
  JSONObject j;
  j=new JSONObject();
  JSONArray ja=new JSONArray();
  for (int i=0; i<m.map.length; i++) {
    JSONArray jar=new JSONArray();
    for (int k=0; k<m.map[i].length; k++) {
      jar.append(m.map[i][k]);
    }
    ja.append(jar);
  }
  JSONObject pl=charato(player);
  j.setJSONObject("player", pl);
  j.setJSONArray("tilemap", ja);
  j.setInt("randomseed", randomseed);
  charatati.remove(player);
  JSONArray tekitati=new JSONArray();
  for (int i=0; i<charatati.size(); i++) {
    chara t=(chara)charatati.get(i);
    tekitati.append(charato(t));
  }
  j.setJSONArray("tekitati", tekitati);
  charatati.add(player);
  if (saveJSONObject(j, "data/save.json")) {
    b.print("saved.");
  } else {
    b.print("couldn't save.");
  }
}
void load() {
  JSONObject j=loadJSONObject("data/save.json");
  JSONArray rows=j.getJSONArray("tilemap");
  for (int i=0; i<rows.size(); i++) {
    JSONArray row=rows.getJSONArray(i);
    for (int k=0; k<row.size(); k++) {
      m.map[i][k]=row.getInt(k);
    }
  }
  charatati.add(player);
  randomseed=j.getInt("randomseed");
  charatati=new ArrayList();
  JSONArray tekitati=j.getJSONArray("tekitati");
  for (int i=0; i<tekitati.size(); i++) {
    chara gck=jsonto(tekitati.getJSONObject(i));
    teki t=new teki();
    t.st=gck.st;
    t.p.x=gck.p.x;
    t.p.y=gck.p.y;
    t.imageid=gck.imageid;
    charatati.add(t);
  }
  chara ck=jsonto(j.getJSONObject("player"));
  player.st=ck.st;
  player.p.x=ck.p.x;
  player.p.y=ck.p.y;
  player.imageid=ck.imageid;
  charatati.add(player);
  b=new blog();
  b.print("loaded.");
}
JSONObject charato(chara c) {
  JSONObject teki=new JSONObject();
  teki.setInt("x", c.p.x);
  teki.setInt("y", c.p.y);
  teki.setInt("imageid", c.imageid);
  teki.setFloat("hp", c.st.hp);
  teki.setFloat("mp", c.st.mp);
  teki.setFloat("mhp", c.st.mhp);
  teki.setFloat("mmp", c.st.mmp);
  teki.setFloat("atk", c.st.atk);
  teki.setFloat("def", c.st.def);
  teki.setFloat("fullness", c.st.fullness);
  teki.setString("name", c.st.name);
  return teki;
}
chara jsonto(JSONObject teki) {
  chara c=new chara();
  c.p.x=teki.getInt("x");
  c.p.y=teki.getInt("y");
  c.imageid=teki.getInt("imageid");
  c.st.hp=teki.getFloat("hp");
  c.st.mp=teki.getFloat("mp");
  c.st.mhp=teki.getFloat("mhp");
  c.st.mmp=teki.getFloat("mmp");
  c.st.atk=teki.getFloat("atk");
  c.st.def=teki.getFloat("def");
  c.st.fullness=teki.getFloat("fullness");
  c.st.name=teki.getString("name");
  return c;
}
int[][] loadcsv(String filename){
  Table t=loadTable(filename);
  int[][] r=new int[t.getRowCount()][t.getColumnCount()];
  for(int i=0;i<t.getRowCount();i++){
     for(int k=0;k<t.getColumnCount();k++){
    r[i][k]=t.getInt(i,k);
  }
  }
  return r;
}
