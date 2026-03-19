
PShape createMomie(float rayon, float epaisseur_bande, float nbr_bande) {
  PShape m = createShape();
  m.beginShape(QUAD_STRIP);
  float rrayon;
  for (int j = 0; j < nbr_bande; j++) {
    float r = random(3);
    rrayon = (rayon/2)*sin((PI/nbr_bande*j))+ rayon/2;
    for (int i = 0; i <= 50; i++) {
        float a = (i / 50.0 * 2 * PI) + r;
        float n = noise(i * 0.1, j * 0.1) * 50;
        m.fill(188 + n, 149 + n, 24);
        m.noStroke();
        m.vertex((rrayon) * cos(a), (rrayon) * sin(a), j * epaisseur_bande);
        m.vertex((rrayon) * cos(a), (rrayon) * sin(a), (j + 1) * epaisseur_bande);
      }
  }
  float rayon_ = 0.99*rayon/2;
  for( int j = 0; j < nbr_bande ; j++){
    for (int i = 0; i <= 50; i++) {
        float a = i / 50.0 * 2 * PI;
        float n = noise(i * 0.1, j * 0.1) * 50;
        m.fill(188 + n, 149 + n, 24);
        m.noStroke();
        m.vertex((rayon_) * cos(a), (rayon_) * sin(a), j * epaisseur_bande);
        m.vertex((rayon_) * cos(a), (rayon_) * sin(a), (j + 1) * epaisseur_bande);
    }
 }
  m.endShape(CLOSE);
  return m;
}

PShape createMomieFinal(float rayon, float epaisseur_bande, float nbre_bande) {
 
float hauteur_momie = nbre_bande * epaisseur_bande;
 
PShape momie, tete, brasdroit, brasgauche, yeux1, yeux2, maind,maing;
  momie = createMomie(rayon, epaisseur_bande, nbre_bande);  
  tete   = createtete(0.8* rayon, epaisseur_bande, 0.35 * nbre_bande);
  brasdroit = createbras( 0.5* rayon,  epaisseur_bande, 0.5*nbre_bande);
  brasgauche = createbras(0.5* rayon, epaisseur_bande, 0.5*nbre_bande);
  yeux1 = createShape(SPHERE, 0.2*rayon);
  yeux2 = createShape(SPHERE, 0.2*rayon);
  maind = loadShape("momie_hands.obj");
  maing = loadShape("momie_hands.obj");
 
 
  PShape momieGroup = createShape(GROUP);

  momieGroup.addChild(momie);

  pushMatrix();
  tete.translate(0, 0, hauteur_momie - epaisseur_bande); // Appliquer la translation directement sur le group
  momieGroup.addChild(tete);
  popMatrix();
 

  pushMatrix();
  brasdroit.rotateX(9*PI/10);
  brasdroit.rotateY(3*PI/7);
  brasdroit.translate(0, -rayon/2, hauteur_momie - epaisseur_bande);
  momieGroup.addChild(brasdroit);
  popMatrix();
 
  pushMatrix();
  brasgauche.rotateX(-9*PI/10);
  brasgauche.rotateY(3*PI/7);
  brasgauche.translate(0, rayon/2, hauteur_momie - epaisseur_bande);
  brasgauche.addChild(brasgauche);
  momieGroup.addChild(brasgauche);
  popMatrix();
 
  pushMatrix();
  yeux1.setFill(color(255));
  yeux2.setFill(color(255));
  yeux1.setStroke(false);
  yeux2.setStroke(false);
  yeux1.translate(-3, rayon/4, hauteur_momie + 5*epaisseur_bande);
  yeux2.translate(-3, - rayon/4, hauteur_momie + 5*epaisseur_bande);
  momieGroup.addChild(yeux1);
  momieGroup.addChild(yeux2);
  popMatrix();
 
  pushMatrix();
  maind.setFill(color(255));
  maing.setFill(color(255));
  maing.scale(0.4);
  maind.scale(0.5);
  maind.rotateX(PI/2);
  maing.rotateX(PI/2);
 
  maind.rotateZ(PI/2);
  maing.rotateZ(-PI*0.6);
  maind.rotateY(PI);
  //maing.rotateY(0);
  maing.translate(-2.4*rayon, 1.6*rayon, hauteur_momie -hauteur_momie/5 );
  maind.translate(-2.4*rayon, -1.6*rayon, hauteur_momie -hauteur_momie/8);
  momieGroup.addChild(maing);
  momieGroup.addChild(maind);
 
  popMatrix();
 
 
  return momieGroup;
}
