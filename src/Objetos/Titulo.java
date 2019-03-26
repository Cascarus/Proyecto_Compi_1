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
public class Titulo implements Metodo{
    String tit = "";
    
    public Titulo(String titulo){
        tit = titulo;
    }
    
    public Titulo(){
    }
    
    @Override
    public String html_code() {
        String contenido = "";
        
        contenido = "<title>" + tit + "</title>\n" ;
        //System.out.println("Hereda la etiqueta titulo");
        return contenido;
    }
    
}
