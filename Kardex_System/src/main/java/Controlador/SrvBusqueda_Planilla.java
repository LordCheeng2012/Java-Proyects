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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
/**
 *
 * @author DELL CI7
 */
public class SrvBusqueda_Planilla extends HttpServlet {

    
      private final  Modelo mod=new Modelo();
     private final  Vista vist=new Vista();
     private final Controlador control = new Controlador(mod,vist);
    /**
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
        processRequest(request, response);
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
        //processRequest(request, response);
        System.out.println("Se esta procesando la peticion en POST:"
                + " Busqueda de registros en Planilla");
        
         //RESPONDER EN FORMATO DE : json 
        response.containsHeader("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        //crear un objeto StringBuilder => libreria externa para obtener datos en formato 
        //json
        StringBuilder JsonObjeto= new StringBuilder();
        
        //crear un objeto lector para recorrer la peticion
       try(BufferedReader reader = request.getReader())  {
           String Data ;
           while((Data=reader.readLine())!=null){
           
               JsonObjeto.append(Data);
           }
            //Obtener los datos del cliente
           String DataRequest=JsonObjeto.toString();
           //Convertir la respuesta en un formato legible para java 
           JSONObject formatRequest= new JSONObject(DataRequest);
           //Extraer los datos en formato legible del cliente 
           String Fecha = formatRequest.optString("IptFecha");
           String Codigo = formatRequest.optString("IptCodigo");
           String Area = formatRequest.optString("IptArea");
           String Turno = formatRequest.optString("SltTurno");
           
           //System.out.println(" datos : " + Fecha);
           //System.out.println(" datos : " + Codigo);
           //System.out.println(" datos : " + Area);
           //System.out.println(" datos : " + Turno);
         //manejar logica peticion 
          Vista Res =this.control.Listar_Busqueda(Fecha, Codigo, Area, Turno);
          String html= Res.Get_BodyHtml();
           
           //Preparar la respuesta
           formatRequest.put("Respuesta",html);
           try(PrintWriter salida=response.getWriter())
           {
               salida.println(formatRequest.toString());
               salida.flush();
           }catch(Exception ex)
           {
               System.out.println("Error  : "+ex.getMessage());
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
