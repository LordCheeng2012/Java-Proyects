/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;
import Controlador.Controlador;

import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author DELL CI7
 */
public class Vista {
    
    private Controlador controler;
    public String  estado = "Vista llamada";
    private String  UrlUser=""; 
    private String BodyHtml="";
    private  List<String> Listas=new ArrayList<>();
    public Vista (Controlador control ){
        this.estado="Vista inicialisada";
        this.controler=control;
    }
     public Vista ( ){
        this.estado="Vista inicialisada sin controlador,todos los metodos que se llamen desde vista"
                + "que intervenga control dara null";
        
        
    }
    public String ResponseLogin(String ResultMethod){
      return this.estado=ResultMethod;
    }
    public List<String> Lista_Planilla(String fecha) throws Exception{
         
       List<String> lista = new ArrayList<>();
        System.out.println("En vista,llamando al metodo controler");      
              try{
               lista = this.controler.View_liste_Planille(fecha);
             
              }catch(Exception es){
              
                  System.out.println("no entro a try");
                  System.out.println(es.getMessage());
              }
                 
             
      
         
      return lista;
    
    }
     public String View_photo_profile() throws Exception{
        
        System.out.println("En vista :obteniendo la peticion");
     
        if(this.UrlUser!=null || this.UrlUser.isEmpty()){
            
            System.out.println("UrL DE Foto obtenida");
        }else{
            System.out.println("Url no enviado correctamente dio null");
        }
        return this.UrlUser;
    
    }
    public void Set_Url_Foto(String url){
    
        this.UrlUser=url;
    }
     public void Set_Bodyhtml(String html){
    
        this.BodyHtml=html;
    }
    public String Get_BodyHtml(){
        System.out.println("En vista: Arrojando cuerpo html");
        return this.BodyHtml;
    
    }

    public void Set_lista_Areas(List<String>Area){
        this.Listas=Area;
        System.out.println("Se agrego la lista a Vista"); 
    }
    public List<String>Get_List_Areas(){
        return this.Listas;
    }
    
}
