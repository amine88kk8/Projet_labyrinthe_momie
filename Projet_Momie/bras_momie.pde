PShape createbras(float rayon, float epaisseur_bande, float longueur){
  PShape m = createShape();
  m.beginShape(QUAD_STRIP);
  float rrayon;
  for (float j = 0; j < longueur; j++) {
    float r = random(3);
    rrayon = rayon/2*sin((PI/longueur) * j) + rayon/2;
    for (int i = 0; i <= 50; i++) {
        float a = i / 50.0 * 2 * PI + r;
        float n = noise(i * 0.1, j * 0.1) * 50;
        m.fill(188 + n, 149 + n, 24);
        m.noStroke();
        m.vertex((rrayon) * cos(a), (rrayon) * sin(a), j * epaisseur_bande);
        m.vertex((rrayon) * cos(a), (rrayon) * sin(a), (j + 1) * epaisseur_bande);
      }
   }
   float rayon_ ;
   for (float j = 0; j < longueur; j++) {
     rayon_ = 0.5*rayon/2*sin((PI/longueur) * j) + 0.5*rayon/2;
    for (int i = 0; i <= 50; i++) {
        float a = i / 50.0 * 2 * PI;
        float n = noise(i * 0.1, j * 0.1) * 50;
        m.fill(188 + n, 149 + n, 24);
        m.noStroke();
        m.vertex((rayon_) * cos(a), (rayon_) * sin(a), j * epaisseur_bande);
        m.vertex((rayon_) * cos(a), (rayon_) * sin(a), (j + 1) * epaisseur_bande);
      }
   }
   
   m.endShape();
   return m;
}
