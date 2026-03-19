PShape Echelle() {
 
  PShape echelle = createShape(GROUP);
  int largeur = 15;
  int hauteur = 50;
  int barre = 2;
  
  PShape shape1 = createShape(BOX, 2, 2, hauteur);
  shape1.translate(-largeur/2, 0);
  shape1.setTexture(img4);
  PShape shape2 = createShape(BOX, 2, 2, hauteur);
  shape2.translate(largeur/2, 0);
  shape2.setTexture(img4);
  echelle.addChild(shape1);
  echelle.addChild(shape2);
  
  for(int k=-1* barre; k <= barre; k++){
    PShape barreaux = createShape(BOX, largeur, 2, 2);
    barreaux.translate((-largeur+20)/8 , 0, k*9);
    barreaux.setTexture(img4);
    echelle.addChild(barreaux);
  }
  
  
  


  return echelle;
}
