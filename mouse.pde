void mousePressed(){
 button clicked = getclickedbutton();
 if(clicked!=null){
   if(clicked.action=="bright +"){
     brightness=min(brightness*2,256);
     getguibyID("main",guicontrollers).gettextbyid("brightness").text="brightness="+brightness;
   }
   if(clicked.action=="bright -"){
     brightness/=2;
     getguibyID("main",guicontrollers).gettextbyid("brightness").text="brightness="+brightness;  
 }
   
 }
}