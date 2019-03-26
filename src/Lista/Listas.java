/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Lista;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import Objetos.*;

/**
 *
 * @author Cascarus
 */
public class Listas {
    public static ArrayList<Variables> variablesG = new ArrayList<Variables>();
    public static ArrayList<Errores> Errores_Lex = new ArrayList<Errores>();
    public static ArrayList<Errores> Errores_Sin = new ArrayList<Errores>();
    public static ArrayList<Tokens> Token = new ArrayList<Tokens>();
    public static String contTokens = "";
    public static String contE_Lex = "";
    public static String contE_Sin = "";
    public static String contHTML = "";
    public static String Mi_consola = "";
    public static ArrayList<Echo> contEcho = new ArrayList<Echo>();
    
    
    
    public static void limpiar(){
        variablesG.clear();
        Errores_Lex.clear();
        Errores_Sin.clear();
        Token.clear();
        contEcho.clear();
    }
    
    public static void imprimir(){
        for(int a=0; a < variablesG.size(); a++){
            System.out.println("ID: " + variablesG.get(a).getNombreVariable() + " Valor: " + variablesG.get(a).getValor());
        }
        
    }
    
    public static void Reporte_Tokens() throws FileNotFoundException{
        contTokens = "";
        String cuerpo = "";
        String titulo = "<!DOCTYPE html>\n" + 
			"<html>\n" + 
			"  <head>\n" + 
			"    <meta charset=\"utf-8\">\n" + 
			"    <title>Reporte de Tokens</title>\n"+
                        "<style type=\"text/css\">\n" +
                        ".tg  {border-collapse:collapse;border-spacing:0;border-color:#999;}\n" +
                        ".tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#999;color:#444;background-color:#F7FDFA;}\n" +
                        ".tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#999;color:#fff;background-color:#26ADE4;}\n" +
                        ".tg .tg-0lax{text-align:left;vertical-align:top}\n" +
                        "</style>\n" +
                        "<table class=\"tg\">\n" +
                        "<th class=\"tg-0lax\">No</th>\n" +
                        "<th class=\"tg-0lax\">Token</th>\n" +
                        "<th class=\"tg-0lax\">Tipo</th>\n" +
                        "<th class=\"tg-0lax\">Fila</th>\n" +
                        "<th class=\"tg-0lax\">Columna</th>\n" +
                        "  </tr>";
        
        String fina = "</table>\n"
			+ "</body>\n"
			+ "</html>";
        
        for(int a=0; a<Token.size(); a++){
            cuerpo += "<tr>\n";
            cuerpo += "<td class=\"tg-0lax\">" + (a+1) + "<br></td>";
            cuerpo += "<td class=\"tg-0lax\">\"" + Token.get(a).token + "\"<br></td>";
            cuerpo += "<td class=\"tg-0lax\">" + Token.get(a).tipo + "<br></td>";
            cuerpo += "<td class=\"tg-0lax\">" + Token.get(a).Fila + "<br></td>";
            cuerpo += "<td class=\"tg-0lax\">" + Token.get(a).Columna + "<br></td>";
            cuerpo += "<tr>\n";
        }
        contTokens = titulo + cuerpo + fina;
        
        FileOutputStream arch = null;
            
        arch = new FileOutputStream("Reporte_Tokens.html");
        PrintStream imprimir = new PrintStream(arch);
        imprimir.println(titulo);
        imprimir.println(cuerpo);
        imprimir.println(fina);
        imprimir.close();
        
    }
     
    public static void Reporte_E_Lexicos() throws FileNotFoundException{
        contE_Lex = "";
        String cuerpo = "";
        String titulo = "<!DOCTYPE html>\n" + 
			"<html>\n" + 
			"  <head>\n" + 
			"    <meta charset=\"utf-8\">\n" + 
			"    <title>Reporte de Errores Lexicos</title>\n"+
                        "<style type=\"text/css\">\n" +
                        ".tg  {border-collapse:collapse;border-spacing:0;border-color:#999;}\n" +
                        ".tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#999;color:#444;background-color:#F7FDFA;}\n" +
                        ".tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#999;color:#fff;background-color:#26ADE4;}\n" +
                        ".tg .tg-0lax{text-align:left;vertical-align:top}\n" +
                        "</style>\n" +
                        "<table class=\"tg\">\n" +
                        "<th class=\"tg-0lax\">No</th>\n" +
                        "<th class=\"tg-0lax\">Caracter</th>\n" +
                        "<th class=\"tg-0lax\">Fila</th>\n" +
                        "<th class=\"tg-0lax\">Columna</th>\n" +
                        "<th class=\"tg-0lax\">Descripcion</th>" +
                        "  </tr>";
        
        String fina = "</table>\n"
			+ "</body>\n"
			+ "</html>";
        
        for(int a=0; a<Errores_Lex.size(); a++){
            cuerpo += "<tr>\n";
            cuerpo += "<td class=\"tg-0lax\">" + (a+1) + "<br></td>";
            cuerpo += "<td class=\"tg-0lax\">" + Errores_Lex.get(a).lexema + "<br></td>";
            cuerpo += "<td class=\"tg-0lax\">" + Errores_Lex.get(a).linea + "<br></td>";
            cuerpo += "<td class=\"tg-0lax\">" + Errores_Lex.get(a).columnas + "<br></td>";
            cuerpo += "<td class=\"tg-0lax\">" + Errores_Lex.get(a).descripcion + "<br></td>";
            cuerpo += "<tr>\n";
        }
        contE_Lex = titulo + cuerpo + fina;
        
        FileOutputStream arch = null;
        arch = new FileOutputStream("Reporte_Errores_Lex.html");
        PrintStream imprimir = new PrintStream(arch);
        imprimir.println(titulo);
        imprimir.println(cuerpo);
        imprimir.println(fina);
        imprimir.close();   
    } 
    
    public static void Reporte_E_Sintacticos() throws FileNotFoundException{
        contE_Sin = "";
        String cuerpo = "";
        String titulo = "<!DOCTYPE html>\n" + 
			"<html>\n" + 
			"  <head>\n" + 
			"    <meta charset=\"utf-8\">\n" + 
			"    <title>Reporte de Errores Sintacticos</title>\n"+
                        "<style type=\"text/css\">\n" +
                        ".tg  {border-collapse:collapse;border-spacing:0;border-color:#999;}\n" +
                        ".tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#999;color:#444;background-color:#F7FDFA;}\n" +
                        ".tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#999;color:#fff;background-color:#26ADE4;}\n" +
                        ".tg .tg-0lax{text-align:left;vertical-align:top}\n" +
                        "</style>\n" +
                        "<table class=\"tg\">\n" +
                        "<th class=\"tg-0lax\">No</th>\n" +
                        "<th class=\"tg-0lax\">Caracter</th>\n" +
                        "<th class=\"tg-0lax\">Fila</th>\n" +
                        "<th class=\"tg-0lax\">Columna</th>\n" +
                        "<th class=\"tg-0lax\">Descripcion</th>" +
                        "  </tr>";
        
        String fina = "</table>\n"
			+ "</body>\n"
			+ "</html>";
        
        for(int a=0; a<Errores_Sin.size(); a++){
            cuerpo += "<tr>\n";
            cuerpo += "<td class=\"tg-0lax\">" + (a+1) + "<br></td>";
            cuerpo += "<td class=\"tg-0lax\">" + Errores_Sin.get(a).linea + "<br></td>";
            cuerpo += "<td class=\"tg-0lax\">" + Errores_Sin.get(a).columnas + "<br></td>";
            cuerpo += "<td class=\"tg-0lax\">\"" + Errores_Sin.get(a).lexema + "\"<br></td>";
            cuerpo += "<td class=\"tg-0lax\">" + Errores_Sin.get(a).tipo + "<br></td>";
            cuerpo += "<td class=\"tg-0lax\">" + Errores_Sin.get(a).descripcion + "<br></td>";
            cuerpo += "<tr>\n";
        }
        contE_Sin = titulo + cuerpo + fina;
        
        FileOutputStream arch = null;
        arch = new FileOutputStream("Reporte_Errores_Sin.html");
        PrintStream imprimir = new PrintStream(arch);
        imprimir.println(titulo);
        imprimir.println(cuerpo);
        imprimir.println(fina);
        imprimir.close();   
    } 
    
    public static void ver_HTML(){
        contHTML = Objetos.Informacion.documento;
    }
    
    public static void Echo(){
        Mi_consola = "";
        
        for(Echo a: contEcho){
            Mi_consola += a.Obtener_contenido() + "\n";
        }
    }
    
    public static void imprimir_E_Lexicos(){
        for(int a=0; a<Errores_Lex.size(); a++){
            System.out.println(Errores_Lex.get(a).tipo + ": " + Errores_Lex.get(a).lexema + " en la linea " + Errores_Lex.get(a).linea + " columna " + Errores_Lex.get(a).columnas);
        }
    }
    
    public static void imprimir_E_Sintacticos(){
        for(int a=0; a<Errores_Sin.size(); a++){
            System.out.println(Errores_Sin.get(a).tipo + ": " + Errores_Sin.get(a).lexema + " en la linea " + Errores_Sin.get(a).linea + " columna " + Errores_Sin.get(a).columnas);
        }
    }
    
    public static void imprimir_Variables(){
        for(Variables a: variablesG){
            System.out.println("Variable " + a.getNombreVariable() + " de tipo " + a.getTipo() + " con el valor " + a.getValor() + "\n");
        }
    }
    
    
}
