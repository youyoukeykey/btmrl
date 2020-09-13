class item{
  position p=new position(50,50);
  int imageid=5;
  itemtype type=itemtype.none;
  String name="nns";
  int heal=0;
  int eat=0;
  int atkup=0;
  int defup=0;
  int weight=0;
  item(){
  }
  void draw(){
    image(gettile(maptilea, imageid), math*(toscreenx(p.x)), math*(toscreeny(p.y)), math, math);
  }
}
enum itemtype{
  none,
  use,
  eat,
  wear,
  equip
}
String iteminfo(item e){
  String r="none use item";
  switch(e.type){
    case use:
    r="it can be used.";
    break;
    case eat:
    r="you can eat it.";
    break;
    case wear:
    r="you can wear it.";
    break;
    case equip:
    r="you can equip it.";
    break;
  }
  return r;
}
String iteminfo2(item e){
  String r="none use item";
  switch(e.type){
    case use:
    r="it can be used.";
    break;
    case eat:
    r="you can heal "+e.eat+" hullness";
    break;
    case wear:
    r="you can up "+e.atkup+"atk";
    break;
    case equip:
    r="you can up"+e.defup+"def";
    break;
  }
  return r;
}
