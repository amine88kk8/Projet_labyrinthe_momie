PShape createtete(float rayon, float epaisseur_bande, float nbr_bande) {
  PShape m = createShape();
  m.beginShape(QUAD_STRIP);
  float rrayon;
  for (int j = 0; j < nbr_bande; j++) {
    float r = random(3);
    rrayon =rayon/2*sin((PI/(nbr_bande-1)*j))+ rayon/2;
 
    for (int i = 0; i <= 50; i++) {
      float a = i / 50.0 * 2 * PI + r;  
      float n = noise(i * 0.1, j * 0.1) * 50;  
      m.fill(188 + n, 149 + n, 24);  
      m.noStroke();
      m.vertex(rrayon * cos(a), rrayon * sin(a), j * epaisseur_bande);
      m.vertex(rrayon * cos(a), rrayon * sin(a), (j + 1) * epaisseur_bande);  
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
