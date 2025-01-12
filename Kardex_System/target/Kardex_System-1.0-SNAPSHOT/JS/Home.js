/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 *//* global fetch */

//capturar la fecha actual 
 function EvalExpre(texto){
  if(texto==""){
      
      return true;
  }
   const formato =/^[A-Z]{3}[0-9]{3}$/;
  if (!formato.test(texto)) {
    alert('El identificador no tiene el formato esperado {ABC123}');
    return false;
  } else {
    console.log("ok");
  }
}
 

function ReturnDateNow(){
      let date = new Date();
      let day = date.getDate();
    let month = date.getMonth() + 1;
    let year = date.getFullYear();
     var fecha_actual;
        if(month < 10){
          console.log(`${day}-0${month}-${year}`);
          fecha_actual = year+"-"+"0"+month+"-"+day;
          return fecha_actual;
        }else{
          console.log(`${day}-${month}-${year}`);
          fecha_actual = year+"-"+month+"-"+day;
           return fecha_actual;
        }
    
}
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
//mandar como parametro la lsita 
function Listar_Planilla(){
    //obtener la fecha actual 
  
    //obtener la tabla a mostrar
    let tabla = document.getElementById("tblBody");
  
    var Now=ReturnDateNow();
    console.log("la fecha actual es "+Now);
   
    //preparar los datos
    var rutasrv="../Load_Data_User";
    var Data = JSON.stringify({ "fecha": Now});
            
     //LLamar a fetch para la consulta     
    let body={"Content-Type":"application/json", method:'POST',body:Data};
    
    fetch(rutasrv,body)
            .then((res)=>{
                if(!res.ok){
                  throw  new  error("Ocurrio un error en la peticion"+ res.statusText);   
                    }
                    return res.json();
                })
        .then((r)=>{
            //recibir los datos
            console.log("recibido: "+r.Table);
            //mostrar al cliente
            tabla.innerHTML=r.Table;
        })
        .catch(err=>{
            console.log("Error : " + err);
                }
                );
    //hacer los response
}

function Busqueda_Planilla(table){
    
    let form  = document.getElementById("FrmListPLanille");
        form.addEventListener('submit',(fr)=>{
        fr.preventDefault();
            var tabla= document.getElementById(table);
            tabla.innerHTML="<tr coldspam='10' ><td>Cargando..</td></tr>";
            
            var dataForm = new FormData(form);
            var IptFecha = dataForm.get("IptFecha");
            var IptCodigo = dataForm.get("IptCodigo");
            
           var val = EvalExpre(IptCodigo);
           if(val === false){              
               return  console.log("stop");
           }
            var IptArea = dataForm.get("SltArea");
            var SltTurno=dataForm.get("SltTurno");
                  
    
           //verificar los datos recibidos
         console.log(IptArea);
            var url="../SrvBusqueda_Planilla";
            var data =JSON.stringify({
                "IptFecha":IptFecha,
                "IptCodigo":IptCodigo,
                "IptArea":IptArea,
                "SltTurno":SltTurno 
            });
             let body={"Content-Type":"application/json", method:'POST',body:data};
            //realizar la consulta api
            fetch(url,body)
            //devolviendo las promesas
                    .then((r)=>{if(!r.ok){
                            console.log("error "+r.statusText);
                        }else{
                            return r.json();
                        }
                     })
                    .then((data)=>{
                      
                        tabla.innerHTML=data.Respuesta;
                    })
                    .catch((error)=>{
                        console.log("error : "+error);
                    });
                
    
 });
};


