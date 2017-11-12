class tracker {//the tracker class
  PVector pos;
  tracker(float x, float y) {
    pos=new PVector(x, y);
  }

  void newpos(float x, float y) {//function to set new position (I know it's kind of unnecessary)
    pos=new PVector(x, y);
  }

  void display() {//how the tracker is displayed
    stroke(255, 0, 0);
    noFill();
    point(pos.x, pos.y);
    rect(pos.x-threshold/2, pos.y-threshold/2, threshold, threshold);
  }

  void track() {//the function to get the new position
    cam.loadPixels();
    int prev = round(pos.y*cam.width+pos.x);//index of the pixel the tracker was on
    PVector best = new PVector(0, 0, -1);//where the current brightest pixel is saved with its brightness
    for (int i=-threshold/2; i<threshold/2; i++) {//loop through y of trackspace
      for (int j=-threshold/2; j<threshold/2; j++) {//loop throug x of trackspace
        try {//try to avoid errors at the border of the image
          if (brightness(cam.pixels[prev+j+i*cam.width])>best.z) {
            best=new PVector(pos.x+j, pos.y+i, brightness(cam.pixels[prev+j+i*cam.width]));
          }
        }
        catch(Exception e) {
        }
      }
    }
    pos=new PVector(best.x, best.y); //save new position
  }
}