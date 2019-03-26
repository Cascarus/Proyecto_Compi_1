/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import java.util.ArrayList;

/**
 *
 * @author Cascarus
 */
public class Echo {
    ArrayList<String> datos = new ArrayList<>();
    
    public Echo(ArrayList a){
        datos = a;
    }
    
    public String Obtener_contenido(){
        String cont = "";
        
        for(String a: datos){
            cont += a;
        }
        
        return cont;
    }
    
}
