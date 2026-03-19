int LAB_SIZE = 15;
char labyrinthe1 [][];
char labyrinthe2 [][];
char labyrinthe3 [][];

char sides [][][];
int TAILLE = width/LAB_SIZE;
int TAILLEW = 50;

PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage noiseT;


PShader myShader;

PShape sol;
PShape pyra;
PShape laby1;
PShape laby2;
PShape laby3;
PShape ladder;
PShape cactus;


PImage victory;
PImage defaite;

int xvue;
int yvue;
int zvue = 30;

int dirX = 0;
int dirY = 50; 

int saved_dirX = 0;
int saved_dirY = 0;

int haulX;
int haulY;
int pyraCenterX;
int pyraCenterY;
  
float anim = 0;
 
int mode = 1;
int stage = -1;
int lightMode = 1;
boolean inLaby = false;

int debut;
int fin;


boolean mort = false;
boolean victoire = false;
boolean snapped =  false;

char[][][] labys = new char[3][][];
int[] sizes = new int[3];

//---------------momie----------------------------------------
PShape momie;


int posXmomie = 0;
int posYmomie = 0;
int posZmomie = 0;
int[][] actionsMomie = {{-1,0},{0,1},{1,0},{0,-1}};
int actionMomieActuel = 0;
int animMomie = 0;



  
void setup() { 
  
  frameRate(20);
  randomSeed(2);
  size(1000, 1000, P3D);
  xvue = (width*2);
  yvue = (height*2);
  debut = 0;
  fin = 0;
  
  int screenWidth = displayWidth;
  int screenHeight = displayHeight;
  
  
  int x = (screenWidth - width) / 2;
  int y = (screenHeight - height) / 2;
  
  surface.setLocation(x, y);
  
  myShader = loadShader("myFragmentShader.glsl", "myVertexShader.glsl");
  
  img = loadImage("stones.jpg");
  img2 = loadImage("sol.jpg");
  img3 = loadImage("sand.jpg");
  img4 = loadImage("wood.jpg");
  img5 = loadImage("gold.jpg");
  noiseT = loadImage("noiseTexture.png");
  victory = loadImage("victory.png");
  defaite = loadImage("defeaite.png");
  
  cactus = loadShape("10436_Cactus_v1_max2010_it2.obj"); 
 
  
  labyrinthe1 = Initlaby(LAB_SIZE);
  labyrinthe2 = Initlaby(LAB_SIZE-2);
  labyrinthe3 = Initlaby(LAB_SIZE-4);
  labys[0] = labyrinthe1;
  labys[1] = labyrinthe2;
  labys[2] = labyrinthe3;
  
  sizes[0] = LAB_SIZE;
  sizes[1] = LAB_SIZE-2;
  sizes[2] = LAB_SIZE-4;
  
  laby1 = buildlaby(labyrinthe1, LAB_SIZE, 0);
  laby2 = buildlaby(labyrinthe2, LAB_SIZE-2, TAILLEW);
  laby3 = buildlaby(labyrinthe3, LAB_SIZE-4, 2*TAILLEW);
  pyra =  Pyramide();
  ladder = Echelle();
  sol = Initsol();
  
//-----------------momie--------------------------------------------
 
  momie = createMomieFinal(TAILLEW/10, 0.6*TAILLEW/25.0,25.0);
  momie.translate(-TAILLEW,-TAILLEW,0);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if (stage == -1){
        if(((yvue + dirY <= height*2) ||(yvue + dirY > height*2 + (30*(TAILLEW+20))) || (xvue + dirX <= width*2) ||(xvue + dirX > width*2 + (30*(TAILLEW+20)))))
        {
      mode = 1;
      anim = 20;
      xvue += dirX;
      yvue += dirY;
      println(xvue, yvue);
      }}
      else if (((((yvue + dirY) - TAILLEW) / TAILLEW) >= 0) &&((((xvue + dirX) - TAILLEW) / TAILLEW) < sizes[stage]) && (labys[stage][(((yvue + dirY) - TAILLEW) / TAILLEW)]
              [(((xvue + dirX) - TAILLEW) / TAILLEW)] != '#')){
      mode = 1;
      anim = 20;
      xvue += dirX;
      yvue += dirY;
      println(xvue, yvue);
      
      }  
  }else if (keyCode == DOWN) {
      if (lightMode == 0){
        lightMode = 1;
      } else {
        lightMode = 0;
      }
      
    } else if (keyCode == LEFT) {
      mode = 2;
      anim = 20;
      saved_dirX = dirX;
      saved_dirY = dirY;
      int tmp = -dirX;
      dirX = dirY;
      dirY = tmp;
    } else if (keyCode == RIGHT) {
      mode = 2;
      anim = 20;
      saved_dirX = dirX;
      saved_dirY = dirY;
      int tmp = dirX;
      dirX = -dirY;
      dirY = tmp;
    }
  }else{
     if (key == 'e'){
       if (stage < 2){
         if (stage >= 0 && (labys[stage][(((yvue) - TAILLEW) / TAILLEW)][(((xvue) - TAILLEW) / TAILLEW)] == '_')){
           mode = 3;
           anim = 20;
         } 
       } if (stage == 2){
         if (stage >= 0 && (labys[stage][(((yvue) - TAILLEW) / TAILLEW)][(((xvue) - TAILLEW) / TAILLEW)] == '_')){
           if(!victoire){
           victoire = true;
           fin = frameCount;
           }
         } 
       }
   }
     if (key == 'r'){
       xvue = (width*2);
       yvue = (height*2); 
       stage= -1;
       zvue = 25;
       debut = 0;
       fin = 0;
       snapped = false;
       victoire = false;
       mort = false;
       lightMode = 1;
       
     }
     if (key == 'v'){
       mort = true;
       
     }
  
  }
}


void draw(){
  background(135, 206, 235);
  noStroke();
  
  float fovy = PI/3;
  float aspect = float(width)/float(height);
  float zNear = 0.01;
  float zFar = 100000; 
  perspective(fovy, aspect, zNear, zFar);
  
   if (mode == 1){
      camera(xvue-dirX*(anim/20)*1,yvue-dirY*(anim/20)*1, zvue + 2*sin((anim/20)*PI) ,xvue+dirX,yvue+dirY,zvue+2*sin((anim/20)*PI),0,0,-1);
      
  } else if (mode == 2){
       float tmp_dirX = (saved_dirX*(anim) + dirX*(20-anim))/(20); 
       float tmp_dirY = (saved_dirY*(anim) + dirY*(20-anim))/(20);
       camera(xvue, yvue, zvue  ,xvue+tmp_dirX,yvue+tmp_dirY,zvue+3*sin((anim/20)*2*PI),0,0,-1);
  
  } else if (mode == 3){
       camera(xvue,yvue, zvue, xvue+dirX,yvue+dirY,zvue+(20-anim)*2,0,0,-1);
       pushMatrix();
       translate(xvue, yvue, zvue);
       fill(0, 0,0,((20-anim)/20)*255);
       sphere(10);
       popMatrix();
       if(anim <= 2){
         xvue = 100;
         yvue = 50; 
         dirX = 0;
         dirY = 50; 
         stage ++;
         zvue = 25+((stage)*TAILLEW);
         initMomie();
         lightMode = 0;
         
       }
       
  }

  
  
  
  if(lightMode == 0){
  lightFalloff(0.1, 0.01, 0.0001);
  pointLight(255, 255, 255,xvue-dirX*(anim/20)*1,yvue-dirY*(anim/20)*1, zvue + 2*sin((anim/20)*PI));
  }else{
  directionalLight(255, 180, 80, 0.5, 1, -0.3);
  ambientLight(20, 20, 20);
  
}
 
  
  
  shader(myShader);
  myShader.set("noiseTexture", noiseT);
  
  if (anim > 0){
    anim -= 2;
  }
  
  if(anim == 0){
    mode = 1;
  }
 

  
  TAILLE = TAILLEW;
  translate(TAILLE, TAILLE);
  textureMode(NORMAL);
  
   
   if(mort){
    resetShader();
    perspective();
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
    noLights();
    stroke(0);
    background(0,0,0);
    image(defaite,0,0, width, height);
    textSize(62);
    fill(255);
    text((fin-debut)/20.0 + " secondes", 820, 990);
 

} else if(victoire){
    resetShader();
    perspective();
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
    noLights();
    stroke(0);
    background(0,0,0);
    image(victory,0,0, width, height);
    textSize(64);
    fill(255);
    text((fin - debut)/20.0 + " secondes", 850, 885);
  }
   else if (stage==-1){
     shape(sol);
     shape(pyra);
     
     
     if(sqrt((xvue-haulX)*(xvue-haulX) +(yvue-haulY)*(yvue-haulY)) <= 45){
       xvue = 100;
       yvue = 50; 
       dirX = 0;
       dirY = 50; 
       stage ++;
       anim = 10;
       zvue = 25+((stage)*TAILLEW);
       initMomie();
       lightMode = 0;
       if (!snapped){
       debut = frameCount;
       snapped = true;
       }
     }
    
     

 }
   else if (stage == 0){
   shape(laby1);   
 } else if (stage == 1){
   shape(laby2);
 } else if (stage == 2) {
   shape(laby3);
 }
 resetShader();
 
  if (stage >= 0) deplaceMomie();
  
  momie.resetMatrix();
  momie.rotateZ(-actionMomieActuel*PI/2);
  momie.translate(-TAILLEW,-TAILLEW,0);
  pushMatrix();
    // On place la momie en fonction des coordonnées (mx, my) qui ont été mises à jour
    translate(posXmomie, posYmomie, posZmomie);
    shape(momie);
  popMatrix();
 
 
   ////////////////////Mini map/////////////////////
  if(stage >= 0 && !mort && !victoire){
  resetShader();
  perspective();
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  noLights();
  stroke(0);
  pushMatrix();
  translate(TAILLE, TAILLE);
  for (int j=0; j<sizes[stage]; j++) {
    for (int i=0; i<sizes[stage]; i++) {
      if (labys[stage][j][i]=='#') {
        fill(i*25, j*25, 255-i*10+j*10);
        pushMatrix();
        translate(i*TAILLEW/4,j*TAILLEW/4);
        box(TAILLEW/4);
        popMatrix();
      }
    }
  }
  pushMatrix();
  fill(0, 255, 0);
  noStroke();
  translate(xvue/4-TAILLEW/4, yvue/4-TAILLEW/4);
  sphere(3);
  popMatrix();
  pushMatrix();
  fill(255, 0, 0);
  noStroke();
  translate(int(posXmomie/4)-TAILLEW/4, int(posYmomie/4)-TAILLEW/4);
  sphere(3);
  popMatrix();
  popMatrix();
  }
  ///////////////////////////////////////////////
   
 
}  
