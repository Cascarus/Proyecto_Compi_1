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
public class Detalle_IMG{
    String tipo = "";
    String url = "";
    double dato = 0;
    
    public Detalle_IMG(String tipo, String url){
        this.tipo = tipo;
        this.url = url;
    }
    
    public Detalle_IMG(String tipo, double dato){
        this.tipo = tipo;
        this.dato = dato;
        
    }
    
    public Detalle_IMG(){
        
    }
    
}
