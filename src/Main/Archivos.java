package Main;

import java.awt.FileDialog;
import javax.swing.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
//import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
//import java.io.ObjectOutputStream;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.PrintStream;


public class Archivos {
    FileDialog fd;
    String fNombre;
    String fDirectorio;
    File arch;
    FileReader fLeer;
    BufferedReader leer;
    int col1,fil1;
    String contenido,guardarN, NombreArch;
	
    public String Abrir(JFrame ventana){

        fd = new FileDialog(ventana, "Elige un archivo", FileDialog.LOAD); 
        fd.setDirectory("D:\\Cascarus\\Documents"); 
        fd.setFile("*.uweb;"); 
        fd.setVisible(true); 
        fNombre = fd.getFile();
        fDirectorio = fd.getDirectory(); 
        //System.out.println(fd.getType());
        if(fNombre == null){
            contenido = "";
            NombreArch = "Nuevo Documento.uweb";
        }else{
            try{
                arch = new File(fDirectorio+fNombre);
                guardarN = fDirectorio+fNombre;
                NombreArch = fNombre;
                System.out.println(guardarN);
                fLeer = new FileReader(arch);
                leer = new BufferedReader(fLeer);
                String linea = "";
                contenido = "";
                while ((linea=leer.readLine())!= null) {
                    contenido += linea + "\n";
                }
                leer.close();
            }catch(Exception e){

            }
        }
        return contenido;
    }
    
    public void Guardar(String actual){
        try{
	     
            FileOutputStream arch = null;
            
            arch = new FileOutputStream(guardarN);
            PrintStream imprimir = new PrintStream(arch);
            imprimir.println(actual);
            imprimir.close();

        }catch(FileNotFoundException e){
        }
    }

    public void Guardar_Como(JFrame ventana,String actual){
        fd = new FileDialog(ventana, "Elige un archivo", FileDialog.SAVE);
        fd.setDirectory("D:\\Cascarus\\Documents"); 
        fd.setFile("*.uweb"); 
        fd.setVisible(true);
        fNombre = fd.getFile();
        fDirectorio = fd.getDirectory();
        fNombre = fd.getFile();
        
        if(fNombre != null){
            NombreArch = fNombre;
            try{
                
                FileOutputStream arch = null;
                
                arch = new FileOutputStream(fDirectorio+fNombre + ".uweb");
                PrintStream imprimir = new PrintStream(arch);
                
                imprimir.println(actual);
                imprimir.close();
                
            }catch(FileNotFoundException e){
            }
        }		
    }
    
    public String Nombre_Archivo(){
        return NombreArch;
    }
}
