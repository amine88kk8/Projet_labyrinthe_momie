char[][] Initlaby(int L_SIZE){
  char[][] labyrinthe = new char[L_SIZE][L_SIZE];
  sides = new char[L_SIZE][L_SIZE][4];
  int todig = 0;
  for (int j=0; j<L_SIZE; j++) {
    for (int i=0; i<L_SIZE; i++) {
      sides[j][i][0] = 0;
      sides[j][i][1] = 0;
      sides[j][i][2] = 0;
      sides[j][i][3] = 0;
      if (j%2==1 && i%2==1) {
        labyrinthe[j][i] = '.';
        todig ++;
      } else
        labyrinthe[j][i] = '#';
    }
  }
  int gx = 1;
  int gy = 1;
  while (todig>0 ) {
    int oldgx = gx;
    int oldgy = gy;
    int alea = floor(random(0, 4)); // selon un tirage aleatoire
    if      (alea==0 && gx>1)          gx -= 2; // le fantome va a gauche
    else if (alea==1 && gy>1)          gy -= 2; // le fantome va en haut
    else if (alea==2 && gx<L_SIZE-2) gx += 2; // .. va a droite
    else if (alea==3 && gy<L_SIZE-2) gy += 2; // .. va en bas

    if (labyrinthe[gy][gx] == '.') {
      todig--;
      labyrinthe[gy][gx] = ' ';
      labyrinthe[(gy+oldgy)/2][(gx+oldgx)/2] = ' ';
    }
  }

  labyrinthe[0][1]               = ' '; // entree
  labyrinthe[L_SIZE-2][L_SIZE-1] = '_'; // sortie
  return labyrinthe;
}

PShape buildlaby(char[][] labyrinthe, int L_SIZE, int h) {
  PShape laby = createShape(GROUP);
  textureMode(NORMAL);
  TAILLE = TAILLEW;

  for (int j = 0; j < L_SIZE; j++) {
    for (int i = 0; i < L_SIZE; i++) {
      PShape bloc = createShape();
      bloc.translate(i * TAILLE, j * TAILLE);

      if (labyrinthe[j][i] == '#'){
        bloc.beginShape(QUADS);
        bloc.tint(255, 180, 80);
        if ((j == 0) || (labyrinthe[j - 1][i] != '#')) {
          bloc.texture(img);
          bloc.vertex(-TAILLE / 2, -TAILLE / 2, h, 0, 0);
          bloc.vertex(-TAILLE / 2, -TAILLE / 2, h+TAILLE, 0, 1);
          bloc.vertex(TAILLE / 2, -TAILLE / 2, h+TAILLE, 1, 1);
          bloc.vertex(TAILLE / 2, -TAILLE / 2, h, 1, 0);
        }

        if ((i == L_SIZE-1) || (labyrinthe[j][i+1] != '#')) {
          bloc.texture(img);
          bloc.vertex((TAILLE/2), -(TAILLE/2), h, 0, 0);
          bloc.vertex((TAILLE/2), -(TAILLE/2), h+TAILLE, 0, 1);
          bloc.vertex((TAILLE/2), (TAILLE/2), h+TAILLE, 1, 1);
          bloc.vertex((TAILLE/2), (TAILLE/2), h, 1, 0);
        }

         if ((j == L_SIZE-1) || (labyrinthe[j+1][i] != '#')) {
          bloc.texture(img);
          bloc.vertex((TAILLE/2), (TAILLE/2), h, 0, 0);
          bloc.vertex((TAILLE/2), (TAILLE/2), h+TAILLE, 0, 1);
          bloc.vertex(-(TAILLE/2), (TAILLE/2), h+TAILLE, 1, 1);
          bloc.vertex(-(TAILLE/2), (TAILLE/2), h, 1, 0);
        }

        if ((i == 0) || (labyrinthe[j][i-1] != '#')) {
          bloc.texture(img);
          bloc.vertex(-(TAILLE/2), (TAILLE/2), h, 0, 0);
          bloc.vertex(-(TAILLE/2), (TAILLE/2), h+TAILLE, 0, 1);
          bloc.vertex(-(TAILLE/2), -(TAILLE/2), h+TAILLE, 1, 1);
          bloc.vertex(-(TAILLE/2), -(TAILLE/2), h, 1, 0);
        }
        bloc.endShape(); 

      } else {
        //sol
        bloc.beginShape();
        bloc.tint(255, 180, 80);
        bloc.texture(img2); // sol
        bloc.vertex(-TAILLE / 2, -TAILLE / 2, h, 0, 0);
        bloc.vertex(TAILLE / 2, -TAILLE / 2, h, 1, 0);
        bloc.vertex(TAILLE / 2, TAILLE / 2, h, 1, 1);
        bloc.vertex(-TAILLE / 2, TAILLE / 2, h, 0, 1);
        bloc.endShape();
        
        //Plafond
        PShape blocT = createShape();
        blocT.translate(i * TAILLE, j * TAILLE);


        blocT.beginShape();
        blocT.tint(255, 180, 80);
        blocT.texture(img2); // sol
        blocT.vertex(-TAILLE / 2, -TAILLE / 2, h+TAILLE, 0, 0);
        blocT.vertex(TAILLE / 2, -TAILLE / 2, h+TAILLE, 1, 0);
        blocT.vertex(TAILLE / 2, TAILLE / 2, h+TAILLE, 1, 1);
        blocT.vertex(-TAILLE / 2, TAILLE / 2, h+TAILLE, 0, 1);
        blocT.endShape();
        
        laby.addChild(blocT);
      }

      laby.addChild(bloc);
      
    }
  }
  
    PShape blocdeb = createShape();
    blocdeb.translate(1 * TAILLE, 0 * TAILLE);
    blocdeb.beginShape(QUAD);
    blocdeb.tint(255, 180, 80);
    blocdeb.texture(img);
    blocdeb.vertex(-TAILLE / 2, -TAILLE / 2, h, 0, 0);
    blocdeb.vertex(-TAILLE / 2, -TAILLE / 2, h+TAILLE, 0, 1);
    blocdeb.vertex(TAILLE / 2, -TAILLE / 2, h+TAILLE, 1, 1);
    blocdeb.vertex(TAILLE / 2, -TAILLE / 2, h, 1, 0);
    blocdeb.endShape();
    laby.addChild(blocdeb);
    
    PShape blocfin = createShape();
    blocfin.translate((L_SIZE-1) * TAILLE, (L_SIZE-2) * TAILLE); 
    blocfin.beginShape(QUAD);
    blocfin.tint(255, 180, 80);
    blocfin.texture(img);
    blocfin.vertex((TAILLE/2), -(TAILLE/2), h, 0, 0);
    blocfin.vertex((TAILLE/2), -(TAILLE/2), h+TAILLE, 0, 1);
    blocfin.vertex((TAILLE/2), (TAILLE/2), h+TAILLE, 1, 1);
    blocfin.vertex((TAILLE/2), (TAILLE/2), h, 1, 0);
    blocfin.endShape();
    laby.addChild(blocfin);
  
  
  PShape ladder = Echelle();
  ladder.rotateZ(HALF_PI);
  ladder.translate((L_SIZE-1)*TAILLE+20,(L_SIZE-2)*TAILLE,h+25);
  laby.addChild(ladder);
  
      
  return laby;
}
 
PShape Initsol() {
  int step = 1000;
  int noiseBound = 1000;
  PShape sol = createShape();
  sol.beginShape(QUADS);
  sol.noStroke();
  sol.texture(img3); // sol
  for(int i=step; i < 5*width; i=i+step){
     for(int j=step; j < 5*height; j=j+step){
       if(normPyra(i-step, j-step)<=2000){sol.vertex(i-step, j-step, 10*noise((i-step)*0.01, (j-step)*0.01), 0, 0);}else{sol.vertex(i-step, j-step, (noiseBound)*noise((i-step)*0.01, (j-step)*0.01), 0, 0);}
       if(normPyra(i, j-step)<=2000)     {sol.vertex(i, j-step, 10*noise((i)*0.01, (j-step)*0.01), 1, 0);}     else{sol.vertex(i, j-step, (noiseBound)*noise((i)*0.01, (j-step)*0.01), 1, 0);}
       if(normPyra(i, j)<=2000)          {sol.vertex(i, j, 10*noise(i*0.01, j*0.01), 1, 1);}          else{sol.vertex(i, j, (noiseBound)*noise(i*0.01, j*0.01), 1, 1);}
       if(normPyra(i-step, j)<=2000)     {sol.vertex(i-step, j, 10*noise((i-step)*0.01, j*0.01), 0, 1);}     else{sol.vertex(i-step, j, (noiseBound)*noise((i-step)*0.01, j*0.01), 0, 1);}
       
       
    }
  }
    sol.endShape();
    return sol;
  }



float normPyra(int i, int j){
    return sqrt((2*width - i)*(2*width - i) + (2*height - j)*(2*height - j));
}
