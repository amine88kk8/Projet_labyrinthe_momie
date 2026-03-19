PShape Pyramide(){
  PShape pyra = createShape(GROUP);
  textureMode(NORMAL);
  TAILLE = TAILLEW+20;
  LAB_SIZE = 30;
  for (int h = 0; h < 10; h++){
    for (int j = 0; j < LAB_SIZE-(2*h); j++) {
      for (int i = 0; i < LAB_SIZE-(2*h); i++) {
        if (i == 0 || j == 0 || i == LAB_SIZE - 2*h - 1 || j == LAB_SIZE - 2*h - 1){
  
        PShape bloc = createShape();
  
        bloc.translate((i+h) * TAILLE, (j+h) * TAILLE);
  
        bloc.beginShape(QUADS);
        bloc.noStroke();
         
            bloc.texture(img);
            bloc.tint(255, 255, 255);
            bloc.vertex(-TAILLE / 2, -TAILLE / 2, (h*TAILLE), 0, 0);
            bloc.vertex(-TAILLE / 2, -TAILLE / 2, (h*TAILLE)+TAILLE, 0, 1);
            bloc.vertex(TAILLE / 2, -TAILLE / 2, (h*TAILLE)+TAILLE, 1, 1);
            bloc.vertex(TAILLE / 2, -TAILLE / 2, (h*TAILLE), 1, 0);
         
            
            bloc.vertex((TAILLE/2), -(TAILLE/2), (h*TAILLE), 0, 0);
            bloc.vertex((TAILLE/2), -(TAILLE/2), (h*TAILLE)+TAILLE, 0, 1);
            bloc.vertex((TAILLE/2), (TAILLE/2), (h*TAILLE)+TAILLE, 1, 1);
            bloc.vertex((TAILLE/2), (TAILLE/2), (h*TAILLE), 1, 0);
  
  
            bloc.vertex((TAILLE/2), (TAILLE/2), (h*TAILLE), 0, 0);
            bloc.vertex((TAILLE/2), (TAILLE/2), (h*TAILLE)+TAILLE, 0, 1);
            bloc.vertex(-(TAILLE/2), (TAILLE/2), (h*TAILLE)+TAILLE, 1, 1);
            bloc.vertex(-(TAILLE/2), (TAILLE/2), (h*TAILLE), 1, 0);
  
  
            bloc.vertex(-(TAILLE/2), (TAILLE/2), (h*TAILLE), 0, 0);
            bloc.vertex(-(TAILLE/2), (TAILLE/2), (h*TAILLE)+TAILLE, 0, 1);
            bloc.vertex(-(TAILLE/2), -(TAILLE/2), (h*TAILLE)+TAILLE, 1, 1);
            bloc.vertex(-(TAILLE/2), -(TAILLE/2), (h*TAILLE), 1, 0);
         
          bloc.endShape(); 
          
          pyra.addChild(bloc);
          
        }
    }}
        if (h==9){
          int size = LAB_SIZE - 2 * h;

          float x0 = h * TAILLE;                      
          float y0 = h * TAILLE;
          
          float x1 = (h + size - 1) * TAILLE;         
          float y1 = y0;
          
          float x2 = x1;                               
          float y2 = (h + size - 1) * TAILLE;
          
          float x3 = x0;                               
          float y3 = y2;

          int high_point = (h+1)*TAILLE;
          int decalage = TAILLE/2;
          PShape sommet = createShape();
          sommet.beginShape(TRIANGLE_FAN);
          sommet.texture(img5);
          sommet.vertex((LAB_SIZE*TAILLE)/2, (LAB_SIZE*TAILLE)/2, high_point+5*TAILLE, 0.5, 0.5);
          sommet.vertex(x0-decalage, y0-decalage, high_point, 0, 0);
          sommet.vertex(x1+decalage, y1-decalage, high_point, 1.0, 0);
          sommet.vertex(x1+decalage, y1-decalage, high_point, 1.0, 0 );
          sommet.vertex(x2+decalage, y2+decalage, high_point, 1.0, 1.0);
          sommet.vertex(x2+decalage, y2+decalage, high_point, 1.0, 1.0);
          sommet.vertex(x3-decalage, y3+decalage, high_point, 0, 1.0);
          sommet.vertex(x3-decalage, y3+decalage, high_point, 0, 1.0);
          sommet.vertex(x0-decalage, y0-decalage, high_point, 0,0);
          sommet.endShape();
          
          pyra.addChild(sommet);
        }
  }  
        int offset = 10;
        PShape bloc = createShape();
        bloc.translate(-1 * TAILLE, 3*TAILLE);
        bloc.beginShape(QUADS);
        bloc.noStroke();
        
        bloc.texture(img);
        bloc.tint(255, 255, 255);
          
        bloc.vertex(-TAILLE / 2, -TAILLE / 2, 0, 0, 0);
        bloc.vertex(-TAILLE / 2, -TAILLE / 2, TAILLE, 0, 1);
        bloc.vertex(TAILLE / 2, -TAILLE / 2, TAILLE, 1, 1);
        bloc.vertex(TAILLE / 2, -TAILLE / 2, 0, 1, 0);
        
        
        bloc.vertex(-TAILLE / 2, -TAILLE / 2 -offset, 0, 0, 0);
        bloc.vertex(-TAILLE / 2, -TAILLE / 2 -offset, TAILLE, 0, 1);
        bloc.vertex(TAILLE / 2, -TAILLE / 2 -offset, TAILLE, 1, 1);
        bloc.vertex(TAILLE / 2, -TAILLE / 2 -offset, 0, 1, 0);
        
        bloc.vertex(-TAILLE / 2, -TAILLE / 2, TAILLE, 0, 0);
        bloc.vertex(-TAILLE / 2, -TAILLE / 2 -offset, TAILLE, 1, 0);
        bloc.vertex(-TAILLE / 2, -TAILLE / 2 -offset, 0, 1, 1);
        bloc.vertex(-TAILLE / 2, -TAILLE / 2, 0, 0, 1);
        
            
        bloc.vertex((TAILLE/2), -(TAILLE/2), 0, 0, 0);
        bloc.vertex((TAILLE/2), -(TAILLE/2), TAILLE, 0, 1);
        bloc.vertex((TAILLE/2), (TAILLE/2), TAILLE, 1, 1);
        bloc.vertex((TAILLE/2), (TAILLE/2), 0, 1, 0);
        
        bloc.vertex((TAILLE/2), (TAILLE/2), 0, 0, 0);
        bloc.vertex((TAILLE/2), (TAILLE/2), TAILLE, 0, 1);
        bloc.vertex(-(TAILLE/2),(TAILLE/2),TAILLE, 1, 1);
        bloc.vertex(-(TAILLE/2),(TAILLE/2), 0, 1, 0);  
        
        
        bloc.vertex(-TAILLE / 2, TAILLE / 2, TAILLE, 0, 0);
        bloc.vertex(-TAILLE / 2, TAILLE / 2+offset, TAILLE, 1, 0);
        bloc.vertex(-TAILLE / 2, TAILLE / 2+offset, 0, 1, 1);
        bloc.vertex(-TAILLE / 2, TAILLE / 2, 0, 0, 1);
  
        bloc.vertex((TAILLE/2), (TAILLE/2) + offset, 0, 0, 0);
        bloc.vertex((TAILLE/2), (TAILLE/2) + offset, TAILLE, 0, 1);
        bloc.vertex(-(TAILLE/2),(TAILLE/2) + offset,TAILLE, 1, 1);
        bloc.vertex(-(TAILLE/2),(TAILLE/2) + offset, 0, 1, 0);
  
        bloc.vertex(-TAILLE / 2, -TAILLE / 2, TAILLE, 0, 0);
        bloc.vertex(TAILLE / 2, -TAILLE / 2, TAILLE, 1, 0);
        bloc.vertex(TAILLE / 2, TAILLE / 2, TAILLE, 1, 1);
        bloc.vertex(-TAILLE / 2, TAILLE / 2, TAILLE, 0, 1);  

        bloc.vertex(-TAILLE / 2, -TAILLE / 2, TAILLE+offset, 0, 0);
        bloc.vertex(TAILLE / 2, -TAILLE / 2, TAILLE+offset, 1, 0);
        bloc.vertex(TAILLE / 2, TAILLE / 2, TAILLE+offset, 1, 1);
        bloc.vertex(-TAILLE / 2, TAILLE / 2, TAILLE+offset, 0, 1); 
        
        
        bloc.vertex(-TAILLE / 2, -TAILLE / 2, TAILLE, 0, 0);
        bloc.vertex(-TAILLE / 2, -TAILLE / 2, TAILLE+offset, 1, 0);
        bloc.vertex(-TAILLE / 2, TAILLE / 2, TAILLE+offset, 1, 1);
        bloc.vertex(-TAILLE / 2, TAILLE / 2, TAILLE, 0, 1); 
        
        
        
        bloc.vertex(-TAILLE / 2, -TAILLE / 2, TAILLE, 0, 0);
        bloc.vertex(-TAILLE / 2, -TAILLE / 2, TAILLE+offset, 1, 0);
        bloc.vertex( TAILLE / 2, -TAILLE / 2, TAILLE+offset, 1, 1);
        bloc.vertex( TAILLE / 2, -TAILLE / 2, TAILLE, 0, 1); 
        
        bloc.vertex(TAILLE / 2,  TAILLE / 2, TAILLE, 0, 0);
        bloc.vertex(TAILLE / 2,  TAILLE / 2, TAILLE+offset, 1, 0);
        bloc.vertex(-TAILLE / 2, TAILLE / 2, TAILLE+offset, 1, 1);
        bloc.vertex(-TAILLE / 2, TAILLE / 2, TAILLE, 0, 1);
        
        bloc.endShape();
        pyra.addChild(bloc);
        
        haulX = 2*width - TAILLE;
        haulY = 2*height + 3*TAILLE;
        pyraCenterX = (LAB_SIZE*TAILLE)/2;
        pyraCenterY = (LAB_SIZE*TAILLE)/2;
        
        
        
        PShape fond = createShape();
        fond.translate(-1 * TAILLE, 3*TAILLE);
        fond.beginShape(QUAD);
        fond.tint(0,0,0);
        fond.vertex(-(TAILLE/2)+10, -(TAILLE/2), 0, 0, 0);
        fond.vertex(-(TAILLE/2)+10, -(TAILLE/2), TAILLE, 0, 1);
        fond.vertex(-(TAILLE/2)+10, (TAILLE/2), TAILLE, 1, 1);
        fond.vertex(-(TAILLE/2)+10, (TAILLE/2), 0, 1, 0);
        fond.endShape();
        
        pyra.addChild(fond);
        pyra.translate(2*width, 2*height);
        
        return pyra;
        
      }
