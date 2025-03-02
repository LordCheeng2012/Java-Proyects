<%-- 
    Document   : Listar_Planilla
    Created on : 18/01/2025, 11:41:30 PM
    Author     : DELL CI7
--%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" session="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String user ="";
String Authorized="";
String Correo = "";
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
            Correo=""+Is_Logut.getAttribute("Correo_User");
}


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Planilla</title>
        <link rel="shortcut icon" href="../img/web.png" />
        <link rel="stylesheet" href="../Css/Config.css" />
        <link rel="stylesheet"  href="../Ultimate2012UICSS/Loading_Body.css" >
        <link rel="stylesheet"  href="../Css/Listar_Planilla.css" >
    </head>
    <body id="body"  Correo="<%=Correo%>" Authorized="<%=Authorized%>">
        <div id="content">
            
        </div>
        <nav>
            <div class="info_User" >
                <img id="imgProfile" >
                 <h1><%=user%></h1>
           
            </div>
            <ul>
                <li>
                    <div><span class="material-symbols-outlined">home</span></div>
                    <div><a>Home</a></div>
                </li>
                <li>
                    <div><span class="material-symbols-outlined">sort</span></div>
                    <div><a>Listar Empleados</a></div>
                </li>
                <li>
                    <div><span class="material-symbols-outlined">person_add</span></div>
                    <div><a>Registrar Empleados</a></div>
                </li>
                <li>
                    <div><span class="material-symbols-outlined">manage_search</span></div>
                    <div><a>Consulta Empleado</a></div>
                </li>
                <li>
                    <div><span class="material-symbols-outlined">post_add</span></div>
                    <div><a>Registrar Asistencia</a></div>
                </li>
                <li>
                    <div><span class="material-symbols-outlined">logout</span></div>
                    <div><a>Cerrar Session</a></div>
                </li>
            </ul>
        </nav>
        <main>
            <div class="Panel">
                 <h1> <span class="material-symbols-outlined">manage_search</span> Consulta de Asistencia</h1>
                <form>
                   
                    <label>Ingrese Codigo de Empleado</label>
                    <input type="text" >
                    <label>Seleccione Area  </label>
                    <select>
                        <option>Area</option>
                        <option> Marketing</option>
                        <option> D.Software</option>
                        <option> Administracion</option>
                        <option> Seguridad</option>
                    </select>
                    
                    <label>Seleccione tipo de informe</label>
                   
                    <select  onchange="SelectTypeReport(this.value)"  id="SltTipeInforme">
                        <option>Seleccione Tipo de Reporte</option>
                        <option value="Mes" >Reporte Mensual</option>
                        <option value="Week" >Reporte Semanal</option>
                    </select>
                   <label>Seleccione Mes</label>
                   <input id="itpMens" disabled type="month" value="2019-08">
                   <label>Seleccione Semana</label>
                   <input id="itpSem" disabled  type="week" >
                   <button type="button"  onclick="Loading()" >Buscar</button>
                </form>
            </div>
            <div class="Details" >
                <h1> <span class="material-symbols-outlined">post_add</span> Resultados Busqueda</h1>
                <table id="TblMes">
                    <thead>
                    <tr>
                    <th>Mes</th>
                    <th>Dias</th>
                     <th>Aucencias</th>
                      <th>Retraso</th>
                       <th>Puntual</th>
                        <th>Promedio </th>
                        <th>Opdiones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>date</td>
                             <td>date</td>
                              <td>date</td>
                               <td>date</td>
                                <td>date</td>
                                 <td>date</td>
                                 <td>Opciones</td>
                        </tr>
                        
                    </tbody>
                    <tbody>
                        
                    </tbody>
                </table> 
                <Table class="inactive" id="tblSem">
                     <thead>
                    <tr>
                    <th>Mes</th>
                    <th>Dias</th>
                     <th>Aucencias</th>
                      <th>Retraso</th>
                       <th>Puntual</th>
                        <th>Promedio </th>
                        <th>Opdiones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>date</td>
                             <td>date</td>
                              <td>date</td>
                               <td>date</td>
                                <td>date</td>
                                 <td>date</td>
                                 <td>Opciones</td>
                        </tr>
                        
                    </tbody>
                    <tbody>
                        
                    </tbody>
                </Table>
            </div>
            
        </main>
       <script src="../UltimateDesingUiSystemJs/Load_Body.js"> </script>
         <script src="../JS/Load_Data.js" type="module" > </script>
        <script src="../JS/Listar_Planilla.js"> </script>
    </body>
</html>
