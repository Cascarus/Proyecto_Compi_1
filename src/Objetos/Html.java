/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import Main.*;

public class Html implements Metodo{
   
    public Cabecera cabecera;
    public Cuerpo cuerpo;
    
    public Html(Cabecera cab){
        cabecera = cab;
    }
    
    public Html(Cabecera cab, Cuerpo cuer){
        cabecera = cab;
        cuerpo = cuer;
    }
    
    @Override
    public String html_code() {
        String cont = "";
        
        cont = "<!DOCTYPE html>\n" +
                    "<html lang=\"es-ES\">";
        
        if(cabecera != null){
            cont += cabecera.html_code();
        }
        
        if(cuerpo != null){
            cont += cuerpo.html_code();
        }
         
        cont += "</html>";
        
        return cont;
    }
    
    
}
