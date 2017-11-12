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
    rect(pos.x,pos.y,size.x,size.y);
  }
}