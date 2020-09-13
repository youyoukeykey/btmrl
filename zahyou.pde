int toscreenx(int x){
  return x-player.p.x+(SHIKAI/2);
}
int toscreeny(int y){
  return y-player.p.y+(SHIKAI/2);
}
int toworldx(int x){
  return x+player.p.x-(SHIKAI/2);
}
int toworldy(int y){
  return y+player.p.y-(SHIKAI/2);
}
