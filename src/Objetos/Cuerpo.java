/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import java.util.ArrayList;
import Main.*;
/**
 *
 * @author Cascarus
 */
public class Cuerpo implements Metodo{
    String color = "";
    ArrayList<Object> Contenido = new ArrayList<>();
    
    public Cuerpo(String color){
        if(color.charAt(0) == '#'){
            this.color = color;
        }else{
            Asignar_Color(color);
        }
    }
    
    public Cuerpo(String color, ArrayList cont){
        if(color.charAt(0) == '#'){
            this.color = color;
        }else{
            Asignar_Color(color);
        }
        
        Contenido = cont;
        
    }
    
    public Cuerpo(){
        
    }
   
    void Asignar_Color(String color){
        switch(color){
            case "rojo":
                this.color = "red";
                break;
                
            case "azul":
                this.color = "blue";
                break;
                
            case "verde":
                this.color = "green";
                break;
                
            case "gris":
                this.color = "gray";
                break;
                
            case "negro":
                this.color = "black";
                break;
                
            case "amarillo":
                this.color = "yellow";
                break;
                
            case "rosado":
                this.color = "pink";
                break;
                
            default:
                this.color = "white";
                break;
        }
    }

    @Override
    public String html_code() {
        String cuerpo = "";
        
        cuerpo = "<body bgcolor = \""+ color + "\">\n";
        
        if(Contenido != null){
            for(Object a: Contenido){
                if(a instanceof Metodo){
                    //cuerpo += ((Metodo) a).html_code();
                    cuerpo += ((Metodo) a).html_code();
                }else if( a instanceof String){
                    cuerpo += (String)a;
                }
            }
        }
        
        cuerpo += "</body>\n";
        
        return cuerpo;
    }
    
    
    
}
