/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;
import Controlador.Controlador;
import Modelo.Modelo;
import Vista.Vista;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject; //Libreria EXTERNA 
/**
 *
 * @author DELL CI7
 */

public class srvLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    
          private final  Modelo mod=new Modelo();
           private final  Vista vist=new Vista();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        
       
      
        
        
                
        
        
        
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // Establece el tipo de respuesta
            response.containsHeader("application/json;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            //Leer los datos
            //convertir el json en una cadena de texto
            StringBuilder jsonBuilder = new StringBuilder();
            //leer la solicitud
            try (BufferedReader reder = request.getReader()   ){
                String line;
                while((line=reder.readLine())!=null){
                    //lectura de la cadena 
                    jsonBuilder.append(line);
                    //añade cada linea leida al objetos
                }   
            }
            
            //parsear el json 
            String recibidoJson = jsonBuilder.toString();
            JSONObject json =  new JSONObject(recibidoJson);
            String txtUser= json.optString("txtUser");
            String txtPass=json.optString("txtPass");
            String Response = "dato respuesta";
                     
            //consultar la sesion                       
            Controlador control= new Controlador(mod,vist);
            System.out.println("estado control  : "+control.Estado);
            
            try{
                 boolean resullogin = control.ViewLogin_System(txtUser,txtPass);
                 System.out.println( "se llamo al metodo : " +resullogin);
                if(resullogin==true){
                    
                Response = "TRUE";
                //si da exito y existe el usuario , entonces guardarlo y creamos 
                //una session
                HttpSession session= request.getSession();
                session.setAttribute("User_login",txtUser );
                
                
                }else if(resullogin==false) {
                    
                    Response="FALSE";
                }else{
                    Response="no se verifico el dato recibido";
                }
            }catch(Exception ex){
            
                
                System.out.println("Error el metodo llamado viewLogin : "+ex.getLocalizedMessage());
            }
          
            
            //generar el cuerpo
            json.put("status", "success");
            json.put("message",control.Estado);
            json.put("txtUser",txtUser);
            json.put("txtPass",txtPass);
            json.put("response",Response);
           
            //System.out.println("valores  recibidos..");
            //System.out.println("user : "+txtUser);
            //System.out.println("Pass : "+txtPass);
            //preparar la respuesta json
            try(PrintWriter out = response.getWriter()){
                //genera una resuesta la cliente desde el response
            out.println(json.toString());
            out.flush();
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
