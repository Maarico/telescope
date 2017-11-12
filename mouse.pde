void mousePressed(){
 button clicked = getclickedbutton();
 if(clicked!=null){
   if(clicked.action=="bright +"){
     brightness=min(brightness*2,256);
   }
   if(clicked.action=="bright -"){
     brightness/=2;
   }
   
 }
}