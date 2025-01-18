/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 Archivo js para Login , recibe y verifica los datos antes de mandarlos al servidor
 */

/*Funcion para recibir un form y verificar sus datos antes de enviar al server*/


import {Interface} from "./Interface/Interface.js";
function ReviewInputs(input){
   var Inputs =  document.getElementsByClassName(input);
    for (var i = 0; i < Inputs.length; i++) {
        if(Inputs[i].value === ""){
         alert("Uno de los campos estan vacios");
         return false;
     }
     return true;
    }
  }    
function SubmitLogin(form){ 
    
    let formulario=document.getElementById(form);
    formulario.addEventListener('submit',(fr)=>{
      fr.preventDefault();
      var isbool= ReviewInputs("input");
      if(isbool==false){
          return console.log("Stop");
      }else if(isbool==true){
        let backbody = document.getElementById("back");
        let text = document.getElementById("responseLogin");
             text.innerText="un momento..";
            backbody.classList.add("loading");
           var dataform = new FormData(formulario);
           var body=JSON.stringify({
               "txtUser":dataform.get("txtUser"),
               "txtPass":dataform.get("txtPass")
           });
              
                   
      var rutaSrv="../srvLogin";

      var jsonbody={  headers: {
            "Content-Type": "application/json"}, 
        method:'POST',
        body:body
    };
      fetch(rutaSrv,jsonbody).then(rs=>{
          if(!rs.ok){
              throw new error(" El estado no es ok "+rs.statusText);
          }
          return rs.json();
      }).then(res=>{
          console.log("recibido: "+res.response);
          console.log("user : "+res.txtUser);
          console.log("pass : "+res.txtPass);
          //llamar a la clase 
          const view = new Interface(res.message);
          
          if(res.response=="TRUE"){
                view.loginView("back","responseLogin",true,"imgres");
          }else{
               view.loginView("back","responseLogin",false,"imgres");
              
          }
      })
      .catch(error=>{console.log("error en la consulta : ", error)});
           
      }else{
          console.log("no se obtuvo resultado esperado");
      }
  });
      
      
  
   
}
 SubmitLogin("frmLogin");



