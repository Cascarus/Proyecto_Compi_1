/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import Main.*;
import java.util.ArrayList;

/**
 *
 * @author Cascarus
 */
public class Imagen implements Metodo {
    
    ArrayList<Detalle_IMG> Detalle = new ArrayList<>();
    
    public Imagen(ArrayList a){
        Detalle = a;
    }
    
    public Imagen(){
        
    }
    
    
    @Override
    public String html_code() {
        String contenido = "";
        
        if(Detalle != null){
            contenido = "<img ";
            for(Detalle_IMG a: Detalle){
                if(a.tipo.equals("url")){
                    contenido += "src=" + a.url + " ";
                }else if(a.tipo.equals("ancho")){
                    contenido += "width = \"" + a.dato + "\" ";
                }else if(a.tipo.equals("alto")){
                    contenido += "height =\"" + a.dato + "\"";
                }
            }
            contenido += ">\n";
        }
        //contenido = "";
        
        return contenido;
    }
    
}
