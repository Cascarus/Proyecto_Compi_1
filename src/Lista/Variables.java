/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Lista;

/**
 *
 * @author Cascarus
 */
public class Variables {
    private String tipo = "";
    private String nombreVariable = "";
    private String valor;
    
    
    public Variables(String tip, String nombre, String valS){
        tipo = tip;
        nombreVariable = nombre;
        valorR(tip,valS);
        
    }
    
    public void valorR(String tip, String valS){
        switch(tip){
            case "int":
                double a = Double.parseDouble(valS);
                int b = (int)a;
                valor = Integer.toString(b);
                break;
                
            case "double":
                a = Double.parseDouble(valS);
                valor = Double.toString(a);
                break;
                
            case "boolean":
                valor = valS;
                break;
                
            case "string":
                valor = valS;
                break;
        }
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @return the nombreVariable
     */
    public String getNombreVariable() {
        return nombreVariable;
    }

    /**
     * @return the valor
     */
    public String getValor() {
        return valor;
    }
    
    
}
