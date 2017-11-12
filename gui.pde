class guicontroller{
  boolean visible;
  ArrayList <button> buttons = new ArrayList();
  ArrayList <text> texts = new ArrayList();
}



class button{
  PVector pos,size;
  String text,action;
  
  button(float a, float b, float c, float d, String e, String f){
    pos = new PVector(a,b);
    size=new PVector(c,d);
    text=e;
    action=f;
  }
  
  void display(){
    fill(255);
    stroke(0);
    rect(pos.x,pos.y,size.x,size.y);
    textAlign(CENTER, CENTER);
    text(text,lerp(pos.x,pos.x+size.x,0.5),lerp(pos.y,pos.y+size.y,0.5));
  }
  
  boolean checkclicked(){
    if(mouseX>pos.x&&mouseX<pos.x+size.y&&mouseY>pos.y&&mouseY<pos.y+size.y){
      return true;
    }
    return false;
  }
}