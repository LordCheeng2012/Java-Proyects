/*mandar una carga de los elementos*/

function Load(ndiv) {
	//obtenemos los divs de carga...0
	var div_1 = document.getElementById("div_1");
	var div_2 = document.getElementById("div_2");
   
	//...y agregamos la clase para simular la cargas
   if(ndiv==1){
    div_1.classList.add("Load_Page_Active");
    div_2.classList.add("Load_Page_Desactive");
 

    setTimeout(() => {
        div_1.classList.remove("Load_Page_Active");
        div_2.classList.remove("Load_Page_Desactive");
        
        Load(2);
    }, 1000);

   }else if(ndiv==2){
    div_2.classList.add("Load_Page_Active");
    div_1.classList.add("Load_Page_Desactive");
   

    setTimeout(() => {
        div_2.classList.remove("Load_Page_Active");
        div_1.classList.remove("Load_Page_Desactive");
      
        Load(1);
    }, 1000);

   }else if(ndiv==false){
    div_2.classList.remove("Load_Page_Active");
    div_1.classList.remove("Load_Page_Desactive");
    
    console.log( "ok stooped");
   }else{
    alert("error");
   }
    

    
}
/*mandar una carga de los elementos*/

function DiseapearLoad() {
    var load= document.getElementById("ctn_Load");
    var Bod =document.getElementById("body");
    load.classList.add("Disepear_Load");
    Bod.classList.add("loadbody");
    setTimeout(() => {
        //desaparecer los divs hijos y terminar la funcion
        load.classList.add("Disepear_Load_ctn");
        Bod.classList.remove("loadbody");
    }, 2000);
}



