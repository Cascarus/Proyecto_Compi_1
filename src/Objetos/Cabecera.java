/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import Main.*;
/**
 *
 * @author Cascarus
 */
public class Cabecera implements Metodo {
    
    Titulo tit;
    
    public Cabecera(Titulo ti){
        tit = ti;
    }
    
    public Cabecera(){
        tit = null;
    }
    
    @Override
    public String html_code() {
        String contenido ="";
        
        contenido = "<head>\n";
        contenido += "<meta charset=\"utf-8\">\n";
        contenido += tit.html_code();
        contenido += "</head>\n";
        
        return contenido;
    }
    
    
    
}
