/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function  ShowModal(msg,bodymsg){
    
    var Modal = document.getElementsByClassName("inactive");
    document.getElementById("msg").textContent=msg;
     document.getElementById("bodymsg").textContent=bodymsg;
     for (Mod of Modal) {
        
        Mod.classList.add("Back");
    }
            
   document.body.style.overflow="hidden";
            
        
    
    
}
function CloseModal(){
      var Modal = document.getElementsByClassName("inactive");
        
     for (Mod of Modal) {
        
        Mod.classList.remove("Back");
    }
            
   document.body.style.overflow="auto";
}