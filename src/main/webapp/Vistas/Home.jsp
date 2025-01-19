<%-- 
    Document   : Home
    Created on : 19/12/2024, 07:59:24 PM
    Author     : DELL CI7
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.Modelo"%>
<%@page import="Controlador.Controlador"%>
<%@page import="Vista.Vista"  session="true" contentType="text/html" pageEncoding="UTF-8"%>
<%
String user ="";
String Authorized="";
HttpSession Is_Logut = request.getSession();
    if(Is_Logut.getAttribute("User_login")==null){
        Authorized="False";
        %>
        <script>
            window.location.href="./Login.jsp";
        </script>
        <%
    }else{
                Authorized="True";
            user=""+Is_Logut.getAttribute("User_login");
    
}


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet"  href="../Css/Home.css" >
       <link rel="stylesheet" href="../Css/Config.css" />
       <link rel="stylesheet" href="../Ultimate2012UICSS/ModalsSystemsUl2012.css" />
      

    </head>
    <body   id="body" User="<%=user%>" Authorized="<%=Authorized%>" >
        <div class="inactive"  >
            
            <div class="conntent_Modal" >
               
                    <div class="Windows" >
                        <div class="Info_Window" >
                            <h1 id="msg" >Informacion Ventana</h1>
                        </div>
                        <div class="Option_Window" >
                            <button onclick="CloseModal()"  ><span class="material-symbols-outlined">close_small</span></button>
                        </div>
                    </div>
                    <div class="Body_Modal" >
                        <div class="Message" >
                            <p id="bodymsg"> </p>
                        </div>
                        
                    </div>
                    <div class="footer_Modal" >
                        <a class="close" href="../srvLogin?CORREO=<%=user%>" >Confirmar </a>
                            <a class="succes" href="#" onclick="CloseModal()" >Cancelar</a>
                      
                    </div>
                </div>
                
            </div>
       
       
    
        
        
        <div class="Menu" >
            <div class="info_user" >
                <div class="user" >
                     <h1>¡Bienvenido Administrador!</h1>
                    <img id="imgProfile"  >
                    
                </div>
                  
                <div class="title" >
                   
                    <label> Correo : <%=user%> </label>  
                    <label>Nombre Usuario : </label>
                    <label>Estado : Conectado</label>
                    <label> Cargo : Admin</label>  
                </div>
                 
            </div>
                    <nav  >
                  <ul>     
        
                          <li>
                              <div class="item" >
                              <div class="Option"> <a href="#" 
                            onclick="ShowModal('¿Cerrar Sesión?','Debe Salir de la Aplicación para Ingresar a esta Pagina')"
                                    > Registrar Asistencia</a></div>
                              <div class="icon"> <span class="material-symbols-outlined">list_alt</span></div>
                              </div>
                             </li>  
                          <li> 
                              
                             <div class="item">
                                 <div class="Option" > <a href="#" onclick="ShowModal('¿Cerrar Sesión?','Cierra todas las operaciones \n\
                                    antes de Finalizar tu Session')" >Cerrar Session</a></div>
                              <div class="icon"> <span class="material-symbols-outlined">login</span></div>
                              </div>
                          </li>
                          <li> 
                           <div class="item" >
                              <div class="Option" > <a href="./Listar_Planilla.jsp" >Listar Empleados</a></div>
                              <div class="icon" > <span class="material-symbols-outlined">list_alt</span></div>
                              </div>
                          
                          </li>

                          <li> 
                           <div class="item" >
                              <div class="Option"> <a href="../SrvLoadDataUser?User=User123" >Registrar Empleados</a></div>
                              <div class="icon" > <span class="material-symbols-outlined">person</span></div>
                              </div>
                          
                          </li>
                          <li>
                          <div class="item">
                              <div class="Option" > <a href="../SrvLoadDataUser?User=User123" >Consulta Empleados</a></div>
                              <div class="icon"> <span class="material-symbols-outlined">query_stats</span></div>
                              </div>
                          </li>
            
                              
              </ul>
                       
            </nav>
        </div>
        
        
        <main class="main" >

            <div class="content">
                <form id="FrmListPLanille" class="search" >
                    <h2>Busqueda de Planilla Historial </h2>
                    <label>Ingrese Fecha de Registro</label>
                    <input type="Date" class="input"  name="IptFecha" >
                    <label>Ingrese Codigo de Empleado</label>
                    <input type="text" class="input" maxlength="10"  name="IptCodigo"
                           placeholder="ingrese Codigo de empleado , ejemplo : MS4V"  >
                    <label>Ingrese Area de Empleado</label>
                    <select  name="SltArea">
                        <option value=""> Seleccione Area</option>
                     <%
                      Modelo mod= new Modelo();
                      Vista vist = new Vista();
                      Controlador control = new Controlador(mod,vist);   
                      List<String> Areas = control.list_Areas().Get_List_Areas();
                     for(String area : Areas){
                     
                     %>
                     <option value="<%=area%>" ><%=area%> </option>
                     <%
                     }
  
                     %>
                        
                    </select>
                    <label> Turno de Empleado</label>
                    <select name="SltTurno" >
                        <option>DIA</option>
                        <option>NOCHE</option>
                    </select>                     
                    <button type="submit" >Buscar</button>
                </form>
            </div>
            <div  class="response"> <h1>Resultados</h1></div>
            <table class="Tabla_Resultados" >
                             
                <thead>
                <th>Codigo Personal</th>
                  <th>Fecha</th>
                    <th>Area</th>
                      <th>Carrera</th>
                        <th>Turno</th>
                        <th>Rol</th>
                            <th>Hora Ingreso</th>
                            <th>Salida Break</th>
                             <th>Retorno Break</th>
                              <th> Hora Salida</th>

                </thead>
                <tbody id="tblBody" >
                    <tr  >
                        <td  >dat</td>
                         <td>dat</td>
                          <td>dat</td>
                           <td>dad</td>
                            <td>dad</td>
                             <td>dasdas</td>
                              <td>dasd</td>
                               <td>dasd</td>
                                <td>asdas</td>
                                 <td>dsad</td>
                    </tr>
                </tbody>
            </table>
            
            
            
        </main>
        <script  src="../JS/Home.js">    
           
        </script>  
        <script src="../UltimateDesingUiSystemJs/Modal.js" > </script>
       
        <script>
            Busqueda_Planilla("tblBody");
            Listar_Planilla();
        </script>
        <script src="../JS/Load_Data.js" type="module" > </script>
      
    </body>
</html>
