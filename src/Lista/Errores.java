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
public class Errores {
    public String lexema = "";
    public String tipo = "";
    public String descripcion = "";
    int linea = 0;
    int columnas = 0;
    
    public Errores(String lex, int lin, int columna, String tip, String descrip){
        lexema = lex;
        linea = lin;
        columnas = columna;
        tipo = tip;
        descripcion = descrip;
    }
}
