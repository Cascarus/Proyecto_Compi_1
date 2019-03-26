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
public final class Parrafo implements Metodo  {
    String parrafo = "";
    String alineacion = "";
    
    public Parrafo(String parrafo){
        this.parrafo = parrafo;
    }
    
    public Parrafo(String alineacion, String parrafo){
        this.parrafo = parrafo;
        set_Alineacion(alineacion);
    }
    
    void set_Alineacion(String a){
        switch(a){
            case "izquierda":
                alineacion = "\"left\"";
                break;
                
            case "derecha":
                alineacion = "\"right\"";
                break;
                
            case "centrado":
                alineacion = "\"center\"";
                break;
                
            case "justificado":
                alineacion = "\"justify\"";
                break;
                
            default:
                alineacion = "";
                break;
        }
    }

    @Override
    public String html_code() {
        String contenido = "";
        
        contenido = "<p align=" + alineacion +">\n";
        contenido += parrafo;
        contenido += "\n</p>\n";
        
        return contenido;
    }
    
}
