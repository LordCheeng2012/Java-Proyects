/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Modelo;
import Vista.Vista;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author DELL CI7
 */
public class Load_Data_User extends HttpServlet {
          
    private final  Modelo mod=new Modelo();
     private final  Vista vist=new Vista();
    
    /**
     * 
     * 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        response.containsHeader("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        System.out.println("Se ejecuto do get");
         //Obtener los datos del cliente
           String username = request.getParameter("user");
          System.out.println(username);
          String urlImg="";
     
            
                     
          try(BufferedReader reader = request.getReader())
        {
        String linea ;
            //convertir en un objeto json legible
            JSONObject data = new JSONObject();             
            //manejar la logica : debe retornar la ruta de la imagen
            Controlador control = new Controlador(this.mod,this.vist);
            Vista res= control.Load_Data_User("MSA458", "Foto");
            urlImg=res.View_photo_profile();
            System.out.println("url es : "+urlImg);
 
            //preparar la respuesta
                    data.put("url", urlImg);
                     try (PrintWriter out = response.getWriter()) {
                        //enviar la respuesta
                      
                      //genera una resuesta la cliente desde el response
                      out.println(data.toString());
                      out.flush();
                      }
        }catch(Exception ex){
        
              System.out.println(" Ocurrio un error : "+ex.getMessage());
        }
                    
          
          
        
        
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
         //RESPONDER EN FORMATO DE : json 
        response.containsHeader("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        StringBuilder JsonA_Cadena = new StringBuilder();        
          
        try(BufferedReader reader = request.getReader())
        {
        String linea ;
        while((linea = reader.readLine())!=null){
        JsonA_Cadena.append(linea); 
        
        }
        
            //Obtener los datos del cliente
            String responseJson = JsonA_Cadena.toString();
            //convertir en un objeto json legible
            JSONObject json = new JSONObject(responseJson);
            //obtener el dato
            String fecha = json.optString("fecha");
            System.out.println("Fecha actual recibida  es " + fecha);
            String Response = "dato respuesta";
             
            //Manejar la logica -> llamar a listar planilla de la fecha actual
             Controlador control= new Controlador(mod,vist);
               System.out.println("estado control  : "+control.Estado);               
              try{
              List<String> lista =  control.View_liste_Planille(fecha);
              String BodyHtml="";
                for(String item:lista){
                  
                    System.out.println(item);                 
                  BodyHtml+=item;                                 
                }
                         
                //preparar la respuesta
                    json.put("Table", BodyHtml);                  
                    
                    //preparar la respuesta json
                  try (PrintWriter out = response.getWriter()) {
                        //enviar la respuesta
                      
                      //genera una resuesta la cliente desde el response
                      out.println(json.toString());
                      out.flush();
                      }
                
                    }catch(Exception es){

                        System.out.println("Error en la llamada al metodo");
                        System.out.println("Detalle del Error es : "+es.getMessage());
                    }
               
                   
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
