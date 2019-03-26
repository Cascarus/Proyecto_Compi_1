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
public class Fila implements Metodo{
    ArrayList<Object> columnas = new ArrayList<>();
    
    public Fila(ArrayList a){
        this.columnas = a;
    }

    @Override
    public String html_code() {
        String cuerpo = "";
        
        cuerpo = "<tr>";
        
        if(columnas != null){
            for(Object a: columnas){
                if(a instanceof Metodo){
                    cuerpo += ((Metodo) a).html_code();
                }else if(a instanceof String){
                    cuerpo += (String)a;
                }
            }
        }
        
        cuerpo += "</tr>\n";
        return cuerpo;
    }
    
}
