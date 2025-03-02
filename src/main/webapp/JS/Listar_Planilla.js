/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function SelectTypeReport(active){
    //seleccionar elementos
    var InpMes=document.getElementById("itpMens");
    var InpSem=document.getElementById("itpSem");
    if(active == 'Mes'){
        InpMes.removeAttribute("disabled");
       InpSem.setAttribute("disabled","");
    }
    if(active == 'Week'){
          InpSem.removeAttribute("disabled");
          InpMes.setAttribute("disabled","");
    }
    
}


function QueryAsistency(){
    var form = document.getElementById("form");
    form.addEventListener('submit',(frm)=>{
        frm.preventDefault();
    var DataForm = new FormData(form);   
     //obtener los datos 
    var Request=JSON.stringify({
        "Cod_Emp":DataForm.get("txtCod"),
        "sltArea":DataForm.get("sltArea"),
        "txtfecha":DataForm.get("txtfecha"),
        "sltCarrera":DataForm.get("sltCarrera")
        
    });
    });
    
    
    
}


