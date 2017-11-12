class guicontroller {//parent class of all gui elements
  boolean visible;
  String name;
  ArrayList <button> buttons = new ArrayList();
  ArrayList <text> texts = new ArrayList();
  guicontroller(boolean a, String b) {
    visible = a;
    name = b;
  }

  void display() {//display method for guicontroller
    if (visible) {//visibility check
      for (int i=0; i<buttons.size(); i++) {//loop through buttons
        buttons.get(i).display();
      }
      for (int i=0; i<texts.size(); i++) {//loop through texts
        texts.get(i).display();
      }
    }
  }

  button clickcheck() {//method to check if a button was clicked
    for (int i=0; i<buttons.size(); i++) {
      if (buttons.get(i).checkclicked()!=null) {
        return buttons.get(i).checkclicked();
      }
    }
    return null;
  }
}



class button {
  PVector pos, size;
  String text, action;

  button(float a, float b, float c, float d, String e, String f) {
    pos = new PVector(a, b);
    size=new PVector(c, d);
    text=e;
    action=f;
  }

  void display() {//display method for button class
    fill(255);
    stroke(0);
    rect(pos.x, pos.y, size.x, size.y);
    textAlign(CENTER, CENTER);
    text(text, lerp(pos.x, pos.x+size.x, 0.5), lerp(pos.y, pos.y+size.y, 0.5));
  }

  button checkclicked() {//check if button was clicked
    if (mouseX>pos.x&&mouseX<pos.x+size.y&&mouseY>pos.y&&mouseY<pos.y+size.y) {
      return this;
    }
    return null;
  }
}

class text {
  void display() {
  }
}



guicontroller getguibyID(String id, ArrayList <guicontroller> list){//method to get a guicontroller by its id
  for(int i=0;i<list.size();i++){
    if(list.get(i).name==id){
      return list.get(i);
    }
  }
  return null;
}