/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Item1(){
   
   return new Promise((res)=>{
       console.log("item1");
    var item1 = document.getElementById("it1"); 
    
     item1.classList.add("active");       
     setTimeout(()=>{
     item1.classList.remove("active");     
     item1.classList.add("disabled");  
     res();
      },500);    
   });
  
}
function Item2(){
   
   return new Promise((res)=>{
      var item2 = document.getElementById("it2");    
     item2.classList.add("active");
     setTimeout(()=>{
     item2.classList.remove("active");     
     item2.classList.add("disabled"); 
     res();    
      },500);  
   });
  
}

 function body(){
    var body = document.body; 
    var content = document.getElementById("content");
    body.classList.add("body");
    content.classList.add("absolute");

        content.innerHTML=`<div class="contet_load">
            
            <div  class="content">
                <div id="it1" class="item blue">
                    <h1 class="text">Cargando..</h1>
                </div>
                 <div id="it2" class="item white  ">
                    
                </div>
            </div>
        </div>`;
    
    
}          
// Función principal para coordinar las animaciones
async function animate() {
    body();
    while (true) {
        await Item1();
        await new Promise(res => setTimeout(res, 700)); // Esperar a que el azul vuelva a su tamaño
        await Item2();
        await new Promise(res => setTimeout(res, 700)); // Esperar a que el blanco vuelva a su tamaño
    }
}
function Loading(){    
    animate();   
};
function Final(){
   var body = document.body; 
   var content = document.getElementById("content");
    body.classList.remove("body");
    content.classList.remove("absolute");
     content.innerHTML="";
}