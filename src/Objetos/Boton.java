/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import Main.Metodo;

/**
 *
 * @author Cascarus
 */
public class Boton implements Metodo{
    
    String id = "";
    String texto = "";
    
    public Boton(String id, String texto){
        this.id = id;
        this.texto = texto;
    }
    
    public Boton(){
    }

    @Override
    public String html_code() {
        String contenido = "";
        
        contenido = "<input  type=\"button\" ";
        contenido += "name=" + id + " ";
        contenido += "value =" + texto + "> \n";
        
        return contenido;
    }
    
}
