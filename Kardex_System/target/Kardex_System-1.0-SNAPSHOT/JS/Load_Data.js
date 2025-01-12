/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import {Interface} from "./Interface/Interface.js";

/* global fetch */
function Load_User(){
    //llamar a la clase 
    let Authorized=document.getElementById("body").getAttribute("Authorized");
     if(Authorized =="False"){
         
         window.location.href="./Login.jsp?Acces=' Access no authorized'";
     }else{
  
     var user=document.getElementById("body").getAttribute("User");
     const data= new Interface("carga user");
     data.load_photo_Profile("imgProfile",user);
     
     }
     
          
}
Load_User();