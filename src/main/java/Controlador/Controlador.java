/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Modelo;
import Vista.Vista;
import java.util.ArrayList;

import java.util.List;

/**
 *
 * @author DELL CI7
 */
public class Controlador {
  
    public String Estado = "Inicializando controlador";
    private final Modelo modelo;
    private final Vista vista;
    public Controlador(Modelo modelo,Vista vista){
      
        this.modelo=modelo;
        this.vista=vista;
    }
   
    
    public boolean  ViewLogin_System(String Username,String password) throws Exception {
        String User= Username.trim();
        String Pass = password.trim();
        //insertar los datos y llamar al metodo
        boolean Login = this.modelo.Iniciar_session(User, Pass);
        this.Estado="" + modelo.Estado;
        this.vista.ResponseLogin(this.Estado);
        return Login;
    }
    
    public List<String> View_liste_Planille( String fecha ) throws Exception {
      System.out.println("En Controlador,llamando al metodo en Modelo");
            List<String>ViewLista= new ArrayList<>();
     
        try{
           
            ViewLista = this.modelo.List_Planille(fecha);                           
        }catch(Exception Ex){
        
            System.out.println("Ocurrio un error de tipo"
                    + " Exception inesperado : "+Ex.getMessage());        
        }
       
        return ViewLista;
       
        //retornarlo a la vista
     
    }
    
     public Vista Load_Data_User(String User,String Peticion) throws Exception{
    
        List<String> response= this.modelo.Load_Data_User_Logut(User);
        System.out.println("En controlador");
         System.out.println("se recibio el dato user como :"+User);
         Vista resul = new Vista();
        if(response!=null){      
          System.out.println("Datos obtenidos del modelo");
            System.out.println("Se esta mandando los datos a la vista");
           if(Peticion.isEmpty() || Peticion==null ){
           
               System.out.println("No se detecto que tipo de informacion desea obtener del usaurio");
           }else{
           
           switch(Peticion)
           {
              
               case "Codigo":
                     resul.Set_Url_Foto(response.get(0));
                      break;
               case "Apellido":
                   resul.Set_Url_Foto(response.get(2));
                     break;
               case "Edad":
                 resul.Set_Url_Foto(response.get(3));
                     break;
               case "Sexo":
                   resul.Set_Url_Foto(response.get(4));
                     break;
               case "Nacimiento":
                  resul.Set_Url_Foto(response.get(5));
                    break;
                     case "Foto":
                     resul.Set_Url_Foto(response.get(6));
                     break;
               default : 
                   System.out.println("Ninguna de las Expresiones esperadas fue elegida");
                   resul = null;
           }
           
           }
           
        }else{
           System.out.println(" El metodo ah devuelto null");
           
        }
        return resul;
    }
      public Vista Listar_Busqueda(String fecha,String Codigo,
            String Area ,String Turno){
        System.out.println("En Controlador : se obtiene lista de planilla");
           Vista vista=new Vista();
        try{
           String Response=this.modelo.Busqueda_Planilla(fecha, Codigo, Area, Turno);
           
        vista.Set_Bodyhtml(Response);
                           
        }catch(Exception ex){
            System.out.println("Hubo un error en Controlador : "+ex.getMessage());
        }
        return vista;  
    }
      public Vista list_Areas(){
      List<String>areas = this.modelo.List_Area();
      if(areas==null){
      areas.add("Modelo arrojo : null");
      
      }
        Vista result=new Vista();
        result.Set_lista_Areas(areas);
        return result;
      }
          
      
}
