void mouseaction() {
  button clicked = getclickedbutton();
  if (clicked!=null) {
    if (clicked.action=="bright +") {
      brightness=min(brightness*2, 256);
      getguibyID("main", guicontrollers).gettextbyid("brightness").text="brightness="+brightness;
    }
    if (clicked.action=="bright -") {
      brightness/=2;
      getguibyID("main", guicontrollers).gettextbyid("brightness").text="brightness="+brightness;
    }
    if (clicked.action=="maxima +") {
      maximages+=1;
      getguibyID("longexposure", guicontrollers).gettextbyid("maximages").text="maximages="+maximages;
    }
    if (clicked.action=="maxima -") {
      maximages=max(1, maximages-1);
      getguibyID("longexposure", guicontrollers).gettextbyid("maximages").text="maximages="+maximages;
    }
    if (clicked.action=="targetstart") {
      mode="select tracking";
      getguibyID("main", guicontrollers).visible=false;
      getguibyID("selecttracker", guicontrollers).visible=true;
      getguibyID("longexposure", guicontrollers).visible=false;
    }
    if (clicked.action=="canceltrack") {
      mode="longexposure";
      getguibyID("main", guicontrollers).visible=true;
      getguibyID("selecttracker", guicontrollers).visible=false;
      getguibyID("longexposure", guicontrollers).visible=true;
    }
  } else if (mode=="select tracking") {
      target = new PVector(mouseX,mouseY);
    }
}

void mousehold() {//if you hold any button this will repediately call mouseaction()
  delay(500);
  if (mousePressed) {
    mouseaction();
  }
}

void mousePressed() {
  mouseaction();
}