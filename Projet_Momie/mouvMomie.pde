void initMomie(){
  animMomie = 0;
  posZmomie = ((stage)*TAILLEW);
  while(true){
    int tailleLab = sizes[stage]; 
    int x = int(random(tailleLab/2, tailleLab));
    int y = int(random(tailleLab/2, tailleLab));
    if (labys[stage][y][x] == ' ') {
      posXmomie= (x+1)*TAILLEW;
      posYmomie= (y+1)*TAILLEW;
      break;
    }
  }
}

void deplaceMomie(){
  int x = int(posXmomie/TAILLEW)-1;
  int y = int(posYmomie/TAILLEW)-1;
  if (y == int(yvue/TAILLEW)-1 && x == int(xvue/TAILLEW)-1) {
    println("mort");
    if (!mort && !victoire){
      mort = true;
      fin = frameCount;
    }
    
  } else if (animMomie == 0) {
    if (x == int(xvue/TAILLEW)-1 && pasMurEntreX(x,y)){
      animMomie = 25;
      if (y < int(yvue/TAILLEW)-1) actionMomieActuel = 1;
      else actionMomieActuel = 3;
    } else if (y == int(yvue/TAILLEW)-1 &&  pasMurEntreY(x,y)){
      animMomie = 25;
      if (x < int(xvue/TAILLEW)-1) actionMomieActuel = 2;
      else actionMomieActuel = 0;
    }else {
  momie.translate(TAILLEW,TAILLEW,0);
  momie.rotateZ(actionMomieActuel*PI/2);
      while(true){
        actionMomieActuel = int(random(4));
        if ( (y+actionsMomie[actionMomieActuel][1] < sizes[stage])&& (y+actionsMomie[actionMomieActuel][1] >= 0) && (x+actionsMomie[actionMomieActuel][0] >= 0) && (x+actionsMomie[actionMomieActuel][0] < sizes[stage]) &&labys[stage][y+actionsMomie[actionMomieActuel][1]][x+actionsMomie[actionMomieActuel][0]] == ' '){
          animMomie = 25;
          break;
        }
      }
  momie.rotateZ(-actionMomieActuel*PI/2);
  momie.translate(-TAILLEW,-TAILLEW,0);
    }
  } else {
    posXmomie +=  actionsMomie[actionMomieActuel][0]*2;
    posYmomie +=  actionsMomie[actionMomieActuel][1]*2;
    animMomie--;
  }
}

boolean pasMurEntreX(int x,int y){
  int yJoueur = int(yvue/TAILLEW)-1;
  int yDeb = min(y, yJoueur);
  int yFin = max(y, yJoueur);
  for (int i = yDeb; i < yFin; i++){
    if (labys[stage][i][x] == '#') return false;
  }
  return true;
}

boolean pasMurEntreY(int x,int y){
  int xJoueur = int(xvue/TAILLEW)-1;
  int xDeb = min(x, xJoueur);
  int xFin = max(x, xJoueur);
  for (int i = xDeb; i < xFin; i++){
    if (labys[stage][y][i] == '#') return false;
  }
  return true;
}
