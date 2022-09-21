int x, y, xx, yy; // Declares x, y, xx, and yy as integers
int w = 60; // Width of Zoog's head
int h = 60; // Height of Zoog's head
int eyeSize = 16;

void setup() {
  
  size(800, 600); // Create window 800 x 600 pixels
  background(255); // Draw a white background 
  
}

void draw() {
  
  background(255); // Draw a white background
  
  // Defines noStart as true at beginning to prevent Zoog from showing up in the corner before the user starts moving the mouse over the window
  boolean noStart = true;
  if (mouseX > 1 && mouseY > 1) {
    noStart = false;
  }
  
  // Sets x and y (which will be used as the coordinates for Zoog's position) equal to mouse's position
  x = mouseX;
  y = mouseY;
  
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  ///////////////////////////////////////////////
  ////////// When mouse is not pressed //////////
  ///////////////////////////////////////////////
  
  if (!noStart && !mousePressed) {
    
    // If current position of mouse is the same as the position from the previous frame (i.e. has not moved)
    // Then draw Zoog at mouse's position
    if (mouseX == pmouseX && mouseY == pmouseY) {
      
      // Draw Zoog's arms with a for loop
      for (int i = y + 5; i < y + h; i += 10) {
        stroke(0);
        line(x - (w/3), i, x+w/3, i);
      }
    
      // Draw Zoog's body
      stroke(0);
      fill(mouseX, 0, mouseY);
      rect(x, y, w/6, h*2);
    
      // Draw Zoog's head
      fill(255);
      ellipse(x, y - (h/2), w, h);
      
      // Draw Zoog's eyes
      fill(mouseX, 0, mouseY);
      ellipse(x-(w/3), y-(h/2), eyeSize, eyeSize*2);
      ellipse(x+(w/3), y-(h/2), eyeSize, eyeSize*2);
      
      // Draw Zoog's legs
      stroke(0);
      line(x-(w/12), y+h, x-(w/4), y+h+10);
      line(x+(w/12), y+h, x+(w/4), y+h+10);
      
    }
    else {
      // Do not draw Zoog if mouse is moving
    }
    
  }
  
  ///////////////////////////////////////////
  ////////// When mouse is pressed //////////
  ///////////////////////////////////////////
  
  else if (!noStart && mousePressed) {
    
    // Sets xx and yy equal to mouse's position from the previous frame
    xx = pmouseX;
    yy = pmouseY;
    
    // Draw Zoog's arms with a for loop
    // Made Zoog's arms dependent on mouse's position in previous frame to ensure lag
    for (int i = y + 5; i < y + h; i += 10) {
      stroke(0);
      line(x - (w/12), i, xx - (w/3), yy-y+i);
      line(x + (w/12), i, xx + (w/3), yy-y+i);
    }
  
    // Draw Zoog's body
    stroke(0);
    fill(mouseX, 0, mouseY);
    rect(x, y, w/6, h*2);
    
    // Define d as the distance between mouse's position in current and previous frames
    float d = dist(x, y, xx, yy);
    
    // Draw Zoog's head
    // Made color of Zoog's head dependent on distance between mouse's position in current and previous frames
    fill(255 - 2*d, 255, 255 - 2*d);
    ellipse(x, y - (h/2), w, h);
    
    // Draw Zoog's eyes
    fill(mouseX, 0, mouseY);
    ellipse(x-(w/3), y-(h/2), eyeSize, eyeSize*2);
    ellipse(x+(w/3), y-(h/2), eyeSize, eyeSize*2);
    
    // Draw Zoog's legs
    // Made Zoog's legs dependent on mouse's position in previous frame to ensure lag
    stroke(0);
    line(x-(w/12), y+h, xx-(w/4), yy+h+10);
    line(x+(w/12), y+h, xx+(w/4), yy+h+10);
  
  }
  
}
