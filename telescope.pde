import processing.video.*;

Capture cam; //the Object through wich to controll the camera

PImage display; //the Image wich will be displayed at the end of draw

float brightness=1;//multiplier for the final image

String mode="longexposure"; //the mode the program is in right now

int maximages = 100; //amount of images after wich images will be deleted if mode=longexposure

ArrayList <PImage> cachedimages = new ArrayList(); //images wich are remembered to be able to delete them out of long exposure

float[] RED;
float[] GREEN;
float[] BLUE; // the 3 arrays in wich the long exposure is saved


tracker target = new tracker(200,200); //the tracking target
int threshold=50;


ArrayList <guicontroller> guicontrollers = new ArrayList();


void setup() {
  size(1280, 720);

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {

    cam = new Capture(this, cameras[0]); //initialisation of camera object
    cam.start();     

    RED = new float[width*height]; 
    GREEN = new float[width*height];
    BLUE = new float[width*height]; // initialisation of arrays
  }

  guicontrollers.add(new guicontroller(true, "main"));//defining the main guicontroller
  getguibyID("main", guicontrollers).addbutton(new button(70, 50, 100, 20, "brightness +", "bright +"));
  getguibyID("main", guicontrollers).addbutton(new button(70, 80, 100, 20, "brightness -", "bright -"));
  getguibyID("main", guicontrollers).addbutton(new button(70, 110, 100, 20, "set tracker", "targetstart"));
  getguibyID("main", guicontrollers).addtext(new text("brightness", "brightness="+brightness, 150, 65));
  
  guicontrollers.add(new guicontroller(false, "selecttracker"));
  getguibyID("selecttracker",guicontrollers).addbutton(new button(70,50,100,20,"cancel tracking", "canceltrack"));

  guicontrollers.add(new guicontroller(true, "longexposure"));//definging the guicontroller when on longexposure mode
  getguibyID("longexposure", guicontrollers).addbutton(new button(70, 140, 100, 20, "images +", "maxima +"));
  getguibyID("longexposure", guicontrollers).addbutton(new button(70, 170, 100, 20, "images -", "maxima -"));
  getguibyID("longexposure", guicontrollers).addtext(new text("maximages", "maximages="+maximages, 150, 125));
}



void draw() {
  background(255);
  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
  }
  try {
    display = processimage();

    image(display, 0, 0);
  }
  catch(Exception e) {
    println(e);
  }
  displaygui(guicontrollers);
  if (mousePressed) {
    thread("mousehold");
  }
  
  target.track();
  target.display();
}