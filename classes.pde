enum direct{
  right,
  up,
  down,
  left;
}
direction directtodirection(direct d){
  direction r=new direction(0,0);
  if(d==direct.right){
  }
  if(d==direct.up){
  }
  if(d==direct.down){
  }
  if(d==direct.right){
  }
  return r;
}
void directiontodirect(){
}
class direction{
  int x;
  int y;
  direction(int x,int y){
    this.x=x;
    this.y=y;
  }
}
class position{
  int x;
  int y;
  position(int x,int y){
    this.x=x;
    this.y=y;
  }
}
