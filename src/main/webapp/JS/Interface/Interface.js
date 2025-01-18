/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 export class Interface {
     Estado = "Inicialiado";
     Vista = null;
  constructor(Valor){
      this.Estado="Constructor ejecutado";
      this.Vista=Valor;
  }
  
    loginView(back,Html,bool,img){
        //console.log("se leyo el metodo");
       var body = document.getElementById(Html);
       var backbody = document.getElementById(back);
       var urlimg=document.getElementById(img);
     
      body.innerText=this.Vista;
      if(bool==true){
          //sabremos si llevara a home
          backbody.classList.remove("loading");
          backbody.classList.remove("Error");
          backbody.classList.add("result");
          urlimg.src="../icons/success.png";
          setTimeout(()=>{
                window.location.href="./Home.jsp";
          },1500);
          
          
      }else if(bool==false) {
           backbody.classList.remove("loading");
           backbody.classList.remove("result");
          backbody.classList.add("Error");
           urlimg.src="../icons/close.png";
          
      }else{
          console.log("no se encontro resultado");
      }
  }
    
   load_photo_Profile(img,username){
       var img= document.getElementById(img);
      
         //la consulta me devolvera la ruta o datos que nesesito cargar en el dom
         var url="../Load_Data_User?user="+username;
         
         fetch(url)
                 .then((respuesta)=>{
             if(!respuesta.ok){
                  throw  new  Error("Ocurrio un error en la peticion"+ respuesta.statusText);   
             }
             return respuesta.json();
            
         })
           .then((res)=>{
             console.log("dato respuesta : "+res.url);
            var src=res.url;     
            img.src="../User_Photo_Profile/"+src;
         }).catch((err)=>{
             console.log("error en la llamada ",err);
         });
       
       
   }
  
    
    
    
    
    
    
    
    
}

