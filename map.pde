class map{
  int[][] map;
  map(){
  }
  map(int[][] map){
    this.map=map;
  }
  int cango(int x,int y){
    if(x>=0&&y>=0&&y<map.length&&x<map[0].length&&map[y][x]==0){
      return 1;
    }
    if(x<0||y<0||y>=map.length&&x>=map[0].length){
      return -1;
    }
    return 0;
  }
  int gettile(int x,int y){
    if(x<0||y<0||y>=map.length||x>=map[y].length){
      return -1;
    }
    return map[y][x];
  }
}
PImage gettile(PImage maptile,int k){
  int col=k%int((maptile.width/32));
  int row=(k-col)/int((maptile.width/32));
  return maptile.get(col*32,row*32,32,32);
}
