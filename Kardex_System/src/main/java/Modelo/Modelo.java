/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 *
 * @author DELL CI7
 */
public class Modelo {

    public String  Estado ="Estableciendo la Conexion..";
    private Connection Conexion;
    
    public  Modelo()  {
    try {
    Class.forName("com.mysql.cj.jdbc.Driver"); // Registrar el controlador
    String db = "jdbc:mysql://localhost:3306/kardex_db";
    String user = "root";
    String password = "";
    this.Conexion = DriverManager.getConnection(db, user, password);
    this.Estado = "Conexión exitosa";
        } catch (ClassNotFoundException e) {
            System.out.println("Error: No se encontró el controlador JDBC.");
        } catch (SQLException e) {
            System.out.println("Error SQL: " + e.getMessage());
        }
        }
    public boolean Iniciar_session(String User ,String Password) {
    
        String querySql="{CALL Login_Service(?,?,@msg,@result)};";
         boolean resultmethod = false ;
        String msg=null;
        String result="Iniciando Sesion";
        try {
        result ="entro en el try";
            PreparedStatement prepare=this.Conexion.prepareStatement(querySql);
            result ="preparando la consulta";
            prepare.setString(1, User);
             prepare.setString(2, Password);
             result ="asingacion de parametros";
             prepare.execute();
             String QueryResult="SELECT @msg as msg,@result as result";
            ResultSet res = this.Conexion.createStatement().executeQuery(QueryResult);
            
            while(res.next()){
            
                 msg= res.getString("msg");
                result = res.getString("result");
            }
            if(msg.equals("FALSE")){
            
                 resultmethod=false;
                 this.Estado=result;
                 prepare.close();
            }else if (msg.equals("TRUE")){
       
                resultmethod = true;
                     this.Estado=result;
                      prepare.close();
                System.out.println("" + resultmethod) ;
                }else{
            
               resultmethod=false;
                System.out.println("" + result);
                  this.Estado=result;
                   prepare.close();
                  
            }
        }
        catch(Exception ex){
            System.out.println("Hubo un error en la ejecucion del metodo : "+ex.getMessage());
            result="ocurrio un error interno en el servidor";
             }
          this.Estado=result;
         
            return resultmethod;
    }
    
    public boolean Quit_Session(String user){
          boolean result=false;
        System.out.println("Cerrando Sesion... un momento.");
     String querySql="{CALL Quit_Session(?,@msg)};";
     String QueryMsg = "SELECT @msg";
     try{
    PreparedStatement sts=  this.Conexion.prepareStatement(querySql);
    sts.setString(1,user);
    sts.execute();
    ResultSet Lector= this.Conexion.createStatement().executeQuery(QueryMsg);
    if(Lector.isBeforeFirst()){
          System.out.println("se encontro el usuario activo.");
        while(Lector.next()){
            String msg= Lector.getString("@msg");
            System.out.println("Se cerro la sesion correctamente");
            System.out.println("Resultado : "+msg);
            result = true;
        
        }
       
    }else{
         System.out.println("Al parecer el sistema encontro una discrepancia en la llamada al Sp");
       System.out.println(" no se encontro el usuario activo");
       result = false;
    }
      
     }catch(Exception ex){
         System.out.println("Al parecer el sistema encontro un Error en la llamada al metodo");
       System.out.println("Se Detuvo el metodo, encontro una Excepcion");
         System.out.println("Error : "+ex.getMessage());
     }
    
        return result;
    }
    
    public List<String> List_Planille(String fecha) throws Exception
    {
        
        System.out.println("Entrando a Modelo.");
        String status;
        String Expresion = "^\\d{4}\\-(0?[1-9]|1[012])\\-(0?[1-9]|[12][0-9]|3[01])$";
        Pattern pattern = Pattern.compile(Expresion);
        Matcher matcher = pattern.matcher(fecha);
        List<String> Lista_Planilla = new ArrayList<>();
        System.out.println("Se han establecido las variables.");
        System.out.println("Validando :  valor vacio.");
        if (fecha.equals("")) {
            status = "fecha vacia";
            System.out.println(status);
        } else {
            try {
                status = "fecha aceptada";
                System.out.println("Resultado.. : " + status);
                status = "formato correcto";
                System.out.println("Verificando.. : " + status);
                if (matcher.matches()) {
                    status = "formato aceptado";
                    System.out.println("Resultado.. : " + status);
                    String query = "select * from  personal_planilla where Fecha = ?";
                    PreparedStatement stat = this.Conexion.prepareStatement(query);
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    //Aqui es donde parseamos la fecha e tipo date a string
                    status = "formato es Date";
                     System.out.println("Verificando.. : " + status);                    
                     Date IsFormatDte =  format.parse(fecha);
                     
                       if( !(IsFormatDte instanceof Date )){
                           status="la fecha ingresada no es un tipo de dato "
                                   + "compatible para ser usado";
                             System.out.println("Resultado.. : " + status);  
                        
                             return null;
                        }
                       status ="fecha ingresada es de tipo compatible";
                        System.out.println("Resultado.. : " + status);  
                                          
                    String fechaformateada = format.format(IsFormatDte);
                    System.out.println("fecha recibida  :  " + fechaformateada);
                    //entonces ese dato le mandamos al consultor
                    stat.setString(1, fechaformateada);
                    ResultSet set = stat.executeQuery();

                    if (!set.isBeforeFirst()) {
                        System.out.println("el lector  esta vacio..");
                        System.out.println("sin resultados ");
                       Lista_Planilla.add("<td colspan='10' > Sin Resultados,"
                               + " no hay registros encontrados en la fecha de hoy</td>");
                      
                    } else {
                        System.out.println("Obteniendo lista actual.");
                        System.out.println("Cargando Lista");
                        while (set.next()) {

                            System.out.println("entro en el bucle");
                            String Codigo ="<td>" + set.getString("Codigo_Personal")+"</td>";
                            String Fecha ="<td>" + set.getDate("Fecha").toString()+"</td>";
                            String Area ="<td>" + set.getString("Area")+"</td>";
                            String Carrera ="<td>"+ set.getString("Carrera")+"</td>";
                            String Turno = "<td>"+set.getString("Turno")+"</td>";
                            String Rol ="<td>"+ set.getString("rol")+"</td>";
                            String Ingreso ="<td>"+ set.getTimestamp("Hora_Ing").toString()+"</td>";
                            String Break_Sal =  "<td>"+set.getTimestamp("Sal_Break").toString()+"</td>";
                            String Ret_Brike = "<td>"+ set.getTimestamp("Ret_Brike").toString()+"</td>";
                            String Salida = "<td>"+ set.getTimestamp("Hora_Sal").toString()+"</td>";
                            //Agregamos las listas                   
                            String[] Planilla = {Codigo, Fecha, Area, Carrera,
                                Turno, Rol, Ingreso, Break_Sal, Ret_Brike, Salida};
                            Lista_Planilla = Arrays.asList(Planilla);
                        }
                        System.out.println("Se obtuvo la lista de planilla actual  a la vista");

                    }
                } else {
                    status = "no permitido";
                    System.out.println("Verificando..: " + status);
                    Lista_Planilla.add("Metodo no ah sido llamdo correctamente, la fecha ingresada no es correcta");
                }

            } catch (Exception ex) {

                System.out.println("error : " + ex.getMessage());

            }
        }

        return Lista_Planilla;

    }
    

    public List<String> Load_Data_User_Logut(String username) throws Exception {
    
        System.out.println("en modelo  el parametro recibido es :"+username);
        List<String> Data = null ;     
        String[] datauser = null;
        if(username==null || username.equals("") ){
            System.out.println("El parametro es null o esta vacio");
            return null;
        }
        try{
            String query="SELECT * FROM Empleados_Data Where Codigo_Personal =?";
            PreparedStatement sts= this.Conexion.prepareStatement(query);
            sts.setString(1, username);
            ResultSet setread= sts.executeQuery();
            if(!setread.isBeforeFirst()){
              
                System.out.println("Al parecer, no se encontraron"
                        + " datos personales del usuario : "+username);
                return null;
             }
          
            while(setread.next()){
                System.out.println("Obteniendo Informacion del usuario :" + username);
                String codigo = setread.getString("Codigo_Personal");
                String Nombres = setread.getString("Nombres");
                String Apellido = setread.getString("Apellidos");
                int Edad = setread.getInt("Edad");
                String Sexo = setread.getString("Sexo");
                String Fecha_Nac = setread.getDate("fecha_nacimiento").toString();
                String Foto_Perfil = setread.getString("Img_Date");
                String[] rows = {codigo, Nombres, Apellido,
                String.valueOf(Edad), Sexo, Fecha_Nac, Foto_Perfil};
                //darle el valor al objeto resultante
                datauser=rows;
            }
            
           Data = Arrays.asList(datauser);
                    
        }
        catch(Exception ex){
        
            System.out.println("No se obtuvieron los datos correctamente : error "
                    + ex.getMessage());   
        }
         return Data;
        
    }  
      
     public String Busqueda_Planilla(String fecha, String Codigo, String Area, String Turno) {
    System.out.println("En Modelo");
    StringBuilder Response = new StringBuilder();
    String MultiQuery = "SELECT * FROM Personal_Planilla WHERE 1=1";

    try {
        // Construcción de la consulta con parámetros
        List<Object> parameters = new ArrayList<>();
        if (fecha != null && !fecha.isEmpty()) {
            MultiQuery += " AND DATE(Fecha) = ?";
            parameters.add(fecha);
        }
        if (!Codigo.isEmpty()) {
            MultiQuery += " AND Codigo_Personal = ?";
            parameters.add(Codigo);
        }
        if (!Area.isEmpty()) {
            MultiQuery += " AND Area = ?";
            parameters.add(Area);
        }
        if (!Turno.isEmpty()) {
            MultiQuery += " AND Turno = ?";
            parameters.add(Turno);
        }

        System.out.println("Multiquery: " + MultiQuery);

        PreparedStatement sts = this.Conexion.prepareStatement(MultiQuery);

        // Asignar los valores a los parámetros
        for (int i = 0; i < parameters.size(); i++) {
            sts.setObject(i + 1, parameters.get(i));
        }

        ResultSet result = sts.executeQuery();

        if (!result.isBeforeFirst()) {
            Response.append("<td colspan='10'>").append("No se encontraron Resultados").append("</td>");
        } else {
            while (result.next()) {
                Response.append("<tr>");
                Response.append("<td>").append(result.getString("Codigo_Personal")).append("</td>");
                Response.append("<td>").append(result.getString("Fecha")).append("</td>");
                Response.append("<td>").append(result.getString("Area")).append("</td>");
                Response.append("<td>").append(result.getString("Carrera")).append("</td>");
                Response.append("<td>").append(result.getString("Turno")).append("</td>");
                Response.append("<td>").append(result.getString("rol")).append("</td>");
                Response.append("<td>").append(result.getString("Hora_Ing")).append("</td>");
                Response.append("<td>").append(result.getString("Sal_Break")).append("</td>");
                Response.append("<td>").append(result.getString("Ret_Brike")).append("</td>");
                Response.append("<td>").append(result.getString("Hora_Sal")).append("</td>");
                Response.append("</tr>");
            }
        }
    } catch (Exception err) {
        System.out.println("Ocurrió un error en Modelo");
        System.out.println("Detalle del error: " + err.getMessage());
    }

    return Response.toString();
}
    
     public List<String> List_Area (){
     
     List<String>Areas=new ArrayList<>() ;
     
     String Query="SELECT * FROM Areas";
     try{
          PreparedStatement sts= this.Conexion.prepareStatement(Query);
          ResultSet resul= sts.executeQuery();
        
          while(resul.next()){
            String area = resul.getString("Area");
           Areas.add(area);
          }
          System.out.println("Respuesta en modelo");
          System.out.println(Areas);
     }catch(SQLException es){
     
         System.out.println("Error : "+es.getMessage());
     }
    
     return Areas;
     } 
    
}
