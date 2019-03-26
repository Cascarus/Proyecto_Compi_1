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
public class Columna implements Metodo {
    int tipo = 0; 
    ArrayList<Object> Contenido = new ArrayList<>();
    
    public Columna(int tipo, ArrayList a){
        this.tipo = tipo;
        this.Contenido = a;
    }
    
    @Override
    public String html_code() {
        String contenido = "";
        
        if(tipo == 1){
            contenido = "<th>";
            contenido += Cont_Col();
            contenido += "</th>\n";
        }else if(tipo == 2){
            contenido = "<td>";
            contenido += Cont_Col();
            contenido += "</td>\n";
        }
        
        return contenido;
    }
    
    String Cont_Col(){
        String contenido = "";
        
        if(Contenido != null){
            for(Object a: Contenido){
                if(a instanceof Metodo){
                    contenido += ((Metodo) a).html_code();
                }else if( a instanceof String){
                    contenido += (String)a;
                }
            }
        }
        
        return contenido;
    }
    
}
