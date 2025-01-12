<%-- 
    Document   : Login
    Created on : 19/12/2024, 07:59:12 PM
    Author     : DELL CI7
--%>

<%@page contentType="text/html" session="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INICIAR SESIÓN</title>
        <link rel="stylesheet"  href="../Css/Login.css" >
         <link rel="stylesheet"  href="../Ultimate2012UICSS/ULTIMATE2012(2).css">
        <link rel="stylesheet"  href="../Ultimate2012UICSS/Load_UL2012.css">
    </head>
    <body id="body" class="loadbody">
        
           <div id="ctn_Load" class="Load_Page" >
        <div id="div_1" class="ctn-1" >
            <h1> Kardex System  </h1>
          
        </div>
        <div id="div_2" class="ctn-2" >
          <h1>Cargando</h1>
        
        </div>
    </div>
        
        <form method="POST"   id="frmLogin"   >
             <h1>Sistema de Control y Asistencia Technotect</h1>
             
             <div  id="back" class="response" >
                 <h1 id="responseLogin" ></h1>
                 <img id="imgres" src="" >
             </div>
             
             <div class="content form" >
                 <h3> User Administrador</h3>
                 <div class="ctn_inpts" >
                     <img src="../icons/User.png" >
                     <input type="text" class="input" placeholder="please, enter the user" name="txtUser" maxlength="200" >
                 </div>
                   <h3>Password Administrador</h3>
                   <div class="ctn_inpts" >
                       <img src="../icons/candado.png" >
                 <input  type="Password" class="input" placeholder="please, enter the password" name="txtPass" >
                 </div>
             </div>
             <div class="content submit" > <button>Iniciar Sesión</button>
             </div>
             <div>
                 <h1>Powered by : ULTIMATE 2012</h1>
             </div>
        </form>
        <script type="module" src="../JS/Login.js" >
        </script>
         <script src="../UltimateDesingUiSystemJs/Load_Pages_ULAntms.js"></script>
    <script>
        let cont = 0;
        const interid = setInterval(() => {
          console.log(`Ejecución número: ${cont + 1}`);
          cont++;
      
          // Simulación de la función Load
          try {
            Load(1); // Si hay errores, asegúrate de manejarlos aquí
          } catch (e) {
            console.error("Error en la función Load:", e);
            clearInterval(interid);
          }
      
          // Detener el intervalo
          if (cont === 3) {
            console.log("Se detuvo el bucle...");
            DiseapearLoad();
            //detener la funcion
            clearInterval(interid);
             Load(false);
          }
        }, 450);
      
      
      </script>
    </body>
</html>
