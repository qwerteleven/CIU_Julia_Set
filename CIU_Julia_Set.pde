int MAXITER = 100;
float K = 2*PI;
void setup() {
  size(750, 750);
  noSmooth();
  colorMode(HSB);
}
void draw() { 
  background(9);
  float fn1 = random(255), fn2 = random(255), fn3 = random(255);
  float cx = random(-1, 1);
  float cy = random(-1, 1);
  float R = random(-9, 9);
  for(int x = 0; x < 750; x=x+2) {
    for(int y = 0; y < 750; y=y+2) {
      float zx = map(x, 0, 750, -R/2 , R/2 );
      float zy = map(y, 0, 750, -R/2 , R/2 );
      int n = 0;
      int grade = (int)random(0, 9);  
      while(zx*zx + zy*zy < K*K && n < MAXITER) {
        float aux = (float) Math.pow(zx*zx + zy*zy, grade / 2) * (float) Math.cos(grade * Math.atan2(zy, zx)) + cx;
        zy = (float) Math.pow(zx*zx + zy*zy, grade / 2) * (float) Math.sin(grade * Math.atan2(zy, zx)) + cy;
        zx = (float) Math.atan(aux); n++;
      }
      if(n == MAXITER) stroke(0);
      else stroke((n * fn1) % 255, (n * fn2) % 255, (n * fn3) % 255);
      point(x,y);
    }
  }
}
