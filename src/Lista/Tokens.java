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
public class Tokens {
    String token = "";
    int Columna = 0;
    int Fila = 0;
    String tipo = "";
    
    public Tokens(String toke, int col, int fil, String tip){
        token = toke;
        Columna = col;
        Fila = fil;
        tipo = tip;
    }
}
