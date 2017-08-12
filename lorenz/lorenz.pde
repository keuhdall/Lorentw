float x = 0.1;
float y = 0.1; 
float z = 0.1;

float teta = 10;
float ro = 28;
float beta = 8.0/3.0;

float dt = 0.005;
boolean swap = false;
ArrayList<PVector> points = new ArrayList<PVector>();
void  setup() {
  size(800, 600, P3D);
  colorMode(HSB);
}

void draw() {
  background(0);
  
  float dx = (teta * (y - x)) * dt;
  float dy = (x * (ro - z) - y) * dt;
  float dz = (x * y - beta * z) * dt;
  
  x += dx;
  y += dy;
  z += dz;
  
  points.add(new PVector(x, y, z));
  translate(width / 2, height / 2);
  scale(5);
  strokeWeight(0.4);
  noFill();
  float hue = 0;
  beginShape();
  for (PVector v : points) {
    stroke(hue, 255, 255);
    vertex(v.x, v.y, v.z);
    if (!swap){
      if (hue < 255)
        hue += 0.1;
       else
         swap = true;
    } else {
      if (hue > 0)
        hue -= 0.1;
       else
       swap = false;
    }
  }
  endShape();
}