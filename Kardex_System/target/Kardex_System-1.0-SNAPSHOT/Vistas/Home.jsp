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
       
    </head>
    <body   id="body" User="<%=user%>" Authorized="<%=Authorized%>" >
       
    
        
        
        <div class="Menu" >
            <div class="info_user" >
                <div class="user" >
                    <img id="imgProfile"  >
                   
                </div>
                  
                <div class="title" >
                     <h1>¡Bienvenido Administrador!</h1>
                     <h2><%=user%></h2>
                    <label>Nombre Usuario</label>
                    <label>Estado : Conectado</label>
                    <label> Cargo : Admin</label>  
                </div>
                 
            </div>
          <nav>
              <ul>
                  
                  <li><a href="../SrvLoadDataUser?User=User123" > Registrar Empleado </a></li>
                  <li> <a href="../Load_Data_User?User=User123" > Cerrar Session </a></li>
                   <li> <a href="../SrvListPlanilla?User=User123" > Mi Perfil </a></li>
                     <li> <a href="../SrvListPlanilla?User=User123" >Registrar Asistencia </a></li>
       
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
        <script>
            Busqueda_Planilla("tblBody");
            Listar_Planilla();
        </script>
        <script src="../JS/Load_Data.js" type="module" > </script>
      
    </body>
</html>
