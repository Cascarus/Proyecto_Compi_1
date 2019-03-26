/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import Main.Metodo;
import java.util.ArrayList;

/**
 *
 * @author Cascarus
 */
public class Tabla implements Metodo{
    ArrayList<Object> contenido = new ArrayList<>();
    boolean borde = false;
    
    public Tabla(ArrayList a){
        this.contenido = a;
        borde = false;
    }
    
    public Tabla(String borde, ArrayList a){
        if(borde.equals("true")){
            this.borde = true;
        }else{
            this.borde = false;
        }
        this.contenido = a;
    }
    
    @Override
    public String html_code() {
        String cont = "";
        
        cont = "<table ";
        
        if(borde == true){
            cont += " border=\"1\"";
        }
         cont += ">";
        if(contenido != null){
            for(Object a: contenido){
                if(a instanceof Metodo){
                    cont += ((Metodo) a).html_code();
                }else if(a instanceof String){
                    cont += (String)a;
                }
            }
        }
        
        cont += "</table>\n";
        
        return cont;
    }
    
}
