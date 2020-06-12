int diameter = 200;
int resolution = 256;  // circle resolution = number of vertices
int numCircles = 300;  // number of circles

float noiseScale = 0.001;  

void setup() {
  size(1000, 1000);
  background(0);
    
  noiseSeed(24902);    // use the same seed every time => same result every time
  noiseDetail(8, 0.25);  
  
  background(0);
  
  noFill();  
  stroke(255, 75);
  pushMatrix();
  // offset the canvas 
  // move x origin to center point and y origin to 1/4 of the height (25%)
  translate(width/2, height*1/4);
  
  // nested for loop
  // first loop iterates through all circles
  for(int i = 0; i < numCircles; i++) {
    beginShape();
    float yOff = i + 50;
    
    // remap the noise scale value for every circle
    // noise gets more extreme with every circle
    float scale = map(i, 0, numCircles, noiseScale, 0.009);  
    
    // calculate a multiplier for the circle amplitude for every circle
    float amplitude = map(i, 0, numCircles, 0, diameter);
    // calculates all vertices on the circle
    for(int j = 0; j < resolution; j++) {
      // calculate the radius for every vertex
      float rad = TWO_PI / resolution * j;
       
      // calculate x and y position of every vertex
      float x = cos(rad) * diameter;
      float y = sin(rad) * diameter;
      
      // apply noise() function to x and y
      // remap noise values (0 - 1) to more usefull values
      float dx = map(noise((x+0.005)*scale), 0, 1, x-amplitude/2, x+amplitude);
      float dy = map(noise((y+0.0025)*scale), 0, 1, y-amplitude, y+amplitude*2);
      dy+=yOff;
      // draw vertex
      vertex(dx, dy);
    }
    endShape(CLOSE);
  }
  popMatrix();
  saveFrame("data/line-######.png");
  exit();
}

void draw() {
  
  
}
