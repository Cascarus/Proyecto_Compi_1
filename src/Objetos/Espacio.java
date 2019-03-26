/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import Main.*;
import java.util.ArrayList;

public class Espacio implements Metodo{    
    ArrayList<Object> Contenido = new ArrayList<>();
    
    public Espacio(ArrayList a){
        Contenido = a;
    }
    
    @Override
    public String html_code() {
        String contenido = "";
        
        contenido = "<div>\n";
        
        for(Object a: Contenido){
            if(a instanceof Metodo){
                contenido += ((Metodo) a).html_code();
            }else if( a instanceof String){
                contenido += (String)a;
            }
        }
        
        contenido += "</div>\n";
        
        return contenido;
    }
    
}
