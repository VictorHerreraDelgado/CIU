int modo=3;
int modomax=3;

void setup(){
  size(550,550);
  background(128);
  strokeWeight(10);
}

void draw(){
    //dibuja(mouseX,mouseY);
    for (int i=1;i<10;i++)
    {
      int x=(int)random(width);
      int y=(int)random(height);
      dibuja(x,y);
    }
}

void dibuja(int x,int y){
  switch(modo){
    case 0: //franjas
    if (y%50<25)
      stroke(255);
     else
      stroke(255,0,0);    
    point (x,y); //<>//
    break;
    case 1: //franjas sinusoidales
    if ( (y+sin(x/8)*2)%50<25)
      stroke(255);
     else
      stroke(255,0,0);    
    point (x,y);
    break;
    case 2: //franjas
    if (y%50>25 && x%50>25)
      stroke(255);
     else
      stroke(255,0,0);    
    point (x,y);
    break;
    
    case 3: //anillos concéntricos
    //Distancia al cuadrado al centro de la ventana
    float r=sqrt((x-width/2)*(x-width/2)+(y-height/2)*(y-height/2)) ;
    if ((int)r%50<25 )
      stroke(255);
     else
      stroke(255,0,0);    
    point (x,y);
    break;
  }
}

void mousePressed(){
  modo++;  
  if (modo>modomax) modo=0;
  println(modo);
  background(128);
}
