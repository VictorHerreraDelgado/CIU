//Basado en el ejemplo de generación de mandelbrot incluido en la instalación de Processing
//https://processing.org/examples/mandelbrot.html
PImage img;

int modo=0;
int jx,jy;

void setup(){
  size(500,500);
  background(255);
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  dibuja();  
}

void draw(){
  
}

void mousePressed(){
  modo=1-modo;//alterna
  background(255);
  if (modo==1)
  {//coordenadas de arranque para Julia
    jx=mouseX;
    jy=mouseY;    
  }
  dibuja();
}

void mouseDragged(){
  if (modo==1)
  {//coordenadas de arranque para Julia
    jx=mouseX;
    jy=mouseY;    
    dibuja();
  }
  
}


void dibuja(){
//https://processing.org/examples/mandelbrot.html
// It all starts with the width, try higher or lower values
float w = 4;
float h = (w * height) / width;

// Start at negative half the width and height
float xmin = -w/2;
float ymin = -h/2;
  
  //
  if (modo==0){
    //Mandelbrot


    // Make sure we can write to the pixels[] array.
    // Only need to do this once since we don't do any other drawing.
    loadPixels();
    
    // Maximum number of iterations for each point on the complex plane
    int maxiterations = 100;
    
    // x goes from xmin to xmax
    float xmax = xmin + w;
    // y goes from ymin to ymax
    float ymax = ymin + h;
    
    // Calculate amount we increment x,y for each pixel
    float dx = (xmax - xmin) / (width);
    float dy = (ymax - ymin) / (height);
    
    // Start y
    float y = ymin;
    for (int j = 0; j < height; j++) {
      // Start x
      float x = xmin;
      for (int i = 0; i < width; i++) {
    
        // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
        float a = x;
        float b = y;
        int n = 0;
        while (n < maxiterations) {
          float aa = a * a;
          float bb = b * b;
          float twoab = 2.0 * a * b;
          a = aa - bb + x;
          b = twoab + y;
          // Infinty in our finite world is simple, let's just consider it 16
          if (dist(aa, bb, 0, 0) > 4.0) {
            break;  // Bail
          }
          n++;
        }
    
        // We color each pixel based on how long it takes to get to infinity
        // If we never got there, let's pick the color black
        if (n == maxiterations) {
          pixels[i+j*width] = color(0);
        } else {
          // Gosh, we could make fancy colors here if we wanted
          float norm = map(n, 0, maxiterations, 0, 1);
          pixels[i+j*width] = color(map(sqrt(norm), 0, 1, 0, 255));
        }
        x += dx;
      }
      y += dy;
    }
    updatePixels();
    
  }
  else{
    //Julia
    
       // Make sure we can write to the pixels[] array.
    // Only need to do this once since we don't do any other drawing.
    loadPixels();
    
    // Maximum number of iterations for each point on the complex plane
    int maxiterations = 100;
    
    // x goes from xmin to xmax
    float xmax = xmin + w;
    // y goes from ymin to ymax
    float ymax = ymin + h;
    
    // Calculate amount we increment x,y for each pixel
    float dx = (xmax - xmin) / (width);
    float dy = (ymax - ymin) / (height);
    
    //c defined from clicked point
    float cx=map(jx, 0, width, xmin, xmax);
    float cy=map(jy, 0, height, ymin, ymax);
    
    
    // Start y
    float y = ymin;
    for (int j = 0; j < height; j++) {
      // Start x
      float x = xmin;
      for (int i = 0; i < width; i++) {
    
        // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
        float a = x;
        float b = y;
        int n = 0;
        while (n < maxiterations) {
          float aa = a * a;
          float bb = b * b;
          float twoab = 2.0 * a * b;
          a = aa - bb + cx;
          b = twoab + cy;
          // Infinty in our finite world is simple, let's just consider it 16
          if (dist(aa, bb, 0, 0) > 4.0) {
            break;  // Bail
          }
          n++;
        }
    
        // We color each pixel based on how long it takes to get to infinity
        // If we never got there, let's pick the color black
        if (n == maxiterations) {
          pixels[i+j*width] = color(0);
        } else {
          // Gosh, we could make fancy colors here if we wanted
          float norm = map(n, 0, maxiterations, 0, 1);
          pixels[i+j*width] = color(map(sqrt(norm), 0, 1, 0, 255));
        }
        x += dx;
      }
      y += dy;
    }
    updatePixels();
  }
} 
 