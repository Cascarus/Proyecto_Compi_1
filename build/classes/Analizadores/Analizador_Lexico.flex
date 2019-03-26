package Analizadores;
import java_cup.runtime.*;
import java.util.*;
import Lista.*;

%%


%public
%class A_Lexico
%cupsym Simbolos
%cup
%char
%line
%column
%full
%unicode
%ignorecase

%{
	
	//Codigo de Java
	//public static LinkedList<Errores> ListE = new LinkedList<Errores>();
  String cadena = "";
  boolean text = false;

  void agregar_token(String token, int col, int fil, String tipo){
      Tokens dat = new Tokens(token, col, fil, tipo);
      Listas.Token.add(dat);
  }
	
%}

%init{ 
    yyline = 1; 
    yycolumn = 1; 
%init} 

//------------------------------------- EXPRESIONES REGULARES

letra = [a-zA-Z]
numero = [0-9]+
decimal = {numero}+"."+{numero}
id = ("$"|"#")({letra}|{numero}|"_")*
//hexa = ({letra}|{numero})({letra}|{numero})({letra}|{numero})({letra}|{numero})({letra}|{numero})({letra}|{numero})
cadena = "\""~"\""
espacio = \t|\f|" "|\r|\n
simple = "//" ~(\n|\r)
multi = "/*" ~"*/"
eticoment = "<!" ~"!>"
//comillas = "\""

//----------> Estados 
%state COMENT, TEXT

%%
//-------------------------------------- PALABRAS RESERVADAS
/*
<YYINITIAL> "<!"						{cadena = "";yybegin(COMENT); return new Symbol(Simbolos.comentaA,yycolumn,yyline,yytext());}
<COMENT> .								{cadena+= yytext();}
<COMENT> [ \t\r\n\f]  					{cadena+= yytext();}
<COMENT> "!>"							{yybegin(YYINITIAL); System.out.println("Reconocido:" + cadena +", Comentario");}

<YYINITIAL>
*/		

<TEXT> [^<]								              {cadena += yytext();}
<TEXT> "<"                              {yybegin(YYINITIAL); text = false;
                                         System.out.println("Reconocio " + cadena + " texto"); agregar_token(yytext(),yycolumn, yyline,"TEXTO"); return new Symbol(Simbolos.TextoN, yycolumn, yyline, cadena);
                                        }
	
<YYINITIAL> "<compi>"					          {System.out.println("Reconocio " +yytext()+ " tk_Compi_A"); agregar_token(yytext(),yycolumn, yyline,"COMPI"); return new Symbol(Simbolos.tk_Compi_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<cabecera>"				        {System.out.println("Reconocio " +yytext()+ " tk_Cabecera_A"); agregar_token(yytext(),yycolumn, yyline,"CABECERA"); return new Symbol(Simbolos.tk_Cabecera_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<titulo"					          {text = true; System.out.println("Reconocio " +yytext()+ " tk_Titulo_A"); agregar_token(yytext(),yycolumn, yyline,"TITULO"); return new Symbol(Simbolos.tk_Titulo_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<cuerpo"					          {System.out.println("Reconocio " +yytext()+ " tk_Cuerpo_A"); agregar_token(yytext(),yycolumn, yyline,"CUERPO"); return new Symbol(Simbolos.tk_Cuerpo_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<espacio>"		       		    {System.out.println("Reconocio " +yytext()+ " tk_Espacio_A"); agregar_token(yytext(),yycolumn, yyline,"ESPACIO"); return new Symbol(Simbolos.tk_Espacio_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<parrafo"					        {text = true; System.out.println("Reconocio " +yytext()+ " tk_Parrafo_A"); agregar_token(yytext(),yycolumn, yyline,"PARRAFO"); return new Symbol(Simbolos.tk_Parrafo_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<textoA"					          {text = true; System.out.println("Reconocio " +yytext()+ " tk_TextoA_A"); agregar_token(yytext(),yycolumn, yyline,"TEXTO A"); return new Symbol(Simbolos.tk_TextoA_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<textoB"					          {text = true; System.out.println("Reconocio " +yytext()+ " tk_TextoB_A"); agregar_token(yytext(),yycolumn, yyline,"TEXTO B"); return new Symbol(Simbolos.tk_TextoB_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<imagen"                   {System.out.println("Reconocio " +yytext()+ " tk_Imagen_A"); agregar_token(yytext(),yycolumn, yyline,"IMAGEN"); return new Symbol(Simbolos.tk_Imagen_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<boton"                    {System.out.println("Reconocio " +yytext()+ " tk_Boton_A"); agregar_token(yytext(),yycolumn, yyline,"BOTON"); return new Symbol(Simbolos.tk_Boton_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<tabla"                    {System.out.println("Reconocio " +yytext()+ " tk_Tabla_A"); agregar_token(yytext(),yycolumn, yyline,"TABLA"); return new Symbol(Simbolos.tk_Tabla_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<fila>"                    {System.out.println("Reconocio " +yytext()+ " tk_Fila_A"); agregar_token(yytext(),yycolumn, yyline,"FILA"); return new Symbol(Simbolos.tk_Fila_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<columnac"                 {text = true; System.out.println("Reconocio " +yytext()+ " tk_ColumnaC_A"); agregar_token(yytext(),yycolumn, yyline,"COLUMNAC"); return new Symbol(Simbolos.tk_ColumnaC_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<columna"                  {text = true; System.out.println("Reconocio " +yytext()+ " tk_Columna_A"); agregar_token(yytext(),yycolumn, yyline,"COLUMNA"); return new Symbol(Simbolos.tk_Columna_A,yycolumn,yyline,yytext());}
<YYINITIAL> "<columnac>"                {System.out.println("Reconocio " +yytext()+ " tk_ColumnaC_A2"); agregar_token(yytext(),yycolumn, yyline,"COLUMNAC2"); return new Symbol(Simbolos.tk_ColumnaC_A2,yycolumn,yyline,yytext());}
<YYINITIAL> "<columna>"                 {System.out.println("Reconocio " +yytext()+ " tk_Columna_A2"); agregar_token(yytext(),yycolumn, yyline,"COLUMNA2"); return new Symbol(Simbolos.tk_Columna_A2,yycolumn,yyline,yytext());}
<YYINITIAL> "</compi>"					        {System.out.println("Reconocio " +yytext()+ " tk_Compi_C"); agregar_token(yytext(),yycolumn, yyline,"COMPI"); return new Symbol(Simbolos.tk_Compi_C,yycolumn,yyline,yytext());}
<YYINITIAL> "</cabecera>"				        {System.out.println("Reconocio " +yytext()+ " tk_Cabecera_C"); agregar_token(yytext(),yycolumn, yyline,"CABECERA"); return new Symbol(Simbolos.tk_Cabecera_C,yycolumn,yyline,yytext());}
<YYINITIAL> "/titulo>"					        {System.out.println("Reconocio " +yytext()+ " tk_Titulo_C"); agregar_token(yytext(),yycolumn, yyline,"TITULO"); return new Symbol(Simbolos.tk_Titulo_C,yycolumn,yyline,yytext());}
<YYINITIAL> "</cuerpo>"					        {System.out.println("Reconocio " +yytext()+ " tk_Cuerpo_C"); agregar_token(yytext(),yycolumn, yyline,"CUERPO"); return new Symbol(Simbolos.tk_Cuerpo_C,yycolumn,yyline,yytext());}
<YYINITIAL> "</espacio>"	       		    {System.out.println("Reconocio " +yytext()+ " tk_Espacio_C"); agregar_token(yytext(),yycolumn, yyline,"ESPACIO"); return new Symbol(Simbolos.tk_Espacio_C,yycolumn,yyline,yytext());}
<YYINITIAL> "/parrafo>"					        {System.out.println("Reconocio " +yytext()+ " tk_Parrafo_C"); agregar_token(yytext(),yycolumn, yyline,"PARRAFO"); return new Symbol(Simbolos.tk_Parrafo_C,yycolumn,yyline,yytext());}
<YYINITIAL> "/textoA>"					        {System.out.println("Reconocio " +yytext()+ " tk_TextoA_C"); agregar_token(yytext(),yycolumn, yyline,"TEXTO A"); return new Symbol(Simbolos.tk_TextoA_C,yycolumn,yyline,yytext());}
<YYINITIAL> "/textoB>"					        {System.out.println("Reconocio " +yytext()+ " tk_TextoB_C"); agregar_token(yytext(),yycolumn, yyline,"TEXTO B"); return new Symbol(Simbolos.tk_TextoB_C,yycolumn,yyline,yytext());}
<YYINITIAL> "</imagen>"                 {System.out.println("Reconocio " +yytext()+ " tk_Imagen_C"); agregar_token(yytext(),yycolumn, yyline,"IMAGEN"); return new Symbol(Simbolos.tk_Imagen_C,yycolumn,yyline,yytext());}
<YYINITIAL> "</boton>"                  {System.out.println("Reconocio " +yytext()+ " tk_Boton_C"); agregar_token(yytext(),yycolumn, yyline,"BOTON"); return new Symbol(Simbolos.tk_Boton_C,yycolumn,yyline,yytext());}
<YYINITIAL> "</tabla>"                  {System.out.println("Reconocio " +yytext()+ " tk_Tabla_C"); agregar_token(yytext(),yycolumn, yyline,"TABLA"); return new Symbol(Simbolos.tk_Tabla_C,yycolumn,yyline,yytext());}
<YYINITIAL> "</fila>"                   {System.out.println("Reconocio " +yytext()+ " tk_Fila_C"); agregar_token(yytext(),yycolumn, yyline,"FILA"); return new Symbol(Simbolos.tk_Fila_C,yycolumn,yyline,yytext());}
<YYINITIAL> "/columnac>"                {System.out.println("Reconocio " +yytext()+ " tk_ColumnaC_C"); agregar_token(yytext(),yycolumn, yyline,"COLUMNAC"); return new Symbol(Simbolos.tk_ColumnaC_C,yycolumn,yyline,yytext());}
<YYINITIAL> "/columna>"                 {System.out.println("Reconocio " +yytext()+ " tk_Columna_C"); agregar_token(yytext(),yycolumn, yyline,"COLUMNA"); return new Symbol(Simbolos.tk_Columna_C,yycolumn,yyline,yytext());}
<YYINITIAL> "</columnac>"               {System.out.println("Reconocio " +yytext()+ " tk_ColumnaC_C2"); agregar_token(yytext(),yycolumn, yyline,"COLUMNAC"); return new Symbol(Simbolos.tk_ColumnaC_C2,yycolumn,yyline,yytext());}
<YYINITIAL> "</columna>"                {System.out.println("Reconocio " +yytext()+ " tk_Columna_C2"); agregar_token(yytext(),yycolumn, yyline,"COLUMNA"); return new Symbol(Simbolos.tk_Columna_C2,yycolumn,yyline,yytext());}
<YYINITIAL> "</Salto>"                  {System.out.println("Reconocio " +yytext()+ " tk_Salto");  agregar_token(yytext(),yycolumn, yyline,"SALTO");return new Symbol(Simbolos.tk_Salto,yycolumn,yyline,yytext());}
<YYINITIAL> "\"izquierda\""             {System.out.println("Reconocio " +yytext()+ " tk_Izquierda"); agregar_token(yytext(),yycolumn, yyline,"ALINEACION"); return new Symbol(Simbolos.tk_Izquierda,yycolumn,yyline,yytext());}
<YYINITIAL> "\"Derecha\""               {System.out.println("Reconocio " +yytext()+ " tk_Derecha"); agregar_token(yytext(),yycolumn, yyline,"ALINEACION"); return new Symbol(Simbolos.tk_Derecha,yycolumn,yyline,yytext());}
<YYINITIAL> "\"Centrado\""              {System.out.println("Reconocio " +yytext()+ " tk_Centrado"); agregar_token(yytext(),yycolumn, yyline,"ALINEACION"); return new Symbol(Simbolos.tk_Centrado,yycolumn,yyline,yytext());}
<YYINITIAL> "\"Justificado\""           {System.out.println("Reconocio " +yytext()+ " tk_Justificado"); agregar_token(yytext(),yycolumn, yyline,"ALINEACION"); return new Symbol(Simbolos.tk_Justificado,yycolumn,yyline,yytext());}
<YYINITIAL> "path"                      {System.out.println("Reconocio " +yytext()+ " tk_Path"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Path,yycolumn,yyline,yytext());}
<YYINITIAL> "alto"                      {System.out.println("Reconocio " +yytext()+ " tk_Alto"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Alto,yycolumn,yyline,yytext());}
<YYINITIAL> "ancho"                     {System.out.println("Reconocio " +yytext()+ " tk_Ancho"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Ancho,yycolumn,yyline,yytext());}
<YYINITIAL> "borde"                     {System.out.println("Reconocio " +yytext()+ " tk_Borde"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Borde,yycolumn,yyline,yytext());}
<YYINITIAL> "echo"                      {System.out.println("Reconocio " +yytext()+ " tk_Echo"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Echo,yycolumn,yyline,yytext());}
<YYINITIAL> "if"                        {System.out.println("Reconocio " +yytext()+ " tk_If"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_If,yycolumn,yyline,yytext());}
<YYINITIAL> "else"                      {System.out.println("Reconocio " +yytext()+ " tk_Else"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Else,yycolumn,yyline,yytext());}
<YYINITIAL> "repetir"                   {System.out.println("Reconocio " +yytext()+ " tk_Repetir"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Repetir,yycolumn,yyline,yytext());}
<YYINITIAL> "insertar"                  {System.out.println("Reconocio " +yytext()+ " tk_Insertar"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Insertar,yycolumn,yyline,yytext());}
<YYINITIAL> "crearimagen"               {System.out.println("Reconocio " +yytext()+ " tk_CrearImagen"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_CrearImagen,yycolumn,yyline,yytext());}
<YYINITIAL> "getpath"                   {System.out.println("Reconocio " +yytext()+ " tk_GetPath"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_GetPath,yycolumn,yyline,yytext());}
<YYINITIAL> "getancho"                  {System.out.println("Reconocio " +yytext()+ " tk_GetAncho"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_GetAncho,yycolumn,yyline,yytext());}
<YYINITIAL> "getalto"                   {System.out.println("Reconocio " +yytext()+ " tk_GetAlto"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_GetAlto,yycolumn,yyline,yytext());}
<YYINITIAL> "setpath"                   {System.out.println("Reconocio " +yytext()+ " tk_SetPath"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_SetPath,yycolumn,yyline,yytext());}
<YYINITIAL> "setancho"                  {System.out.println("Reconocio " +yytext()+ " tk_SetAncho"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_SetAncho,yycolumn,yyline,yytext());}
<YYINITIAL> "setalto"                   {System.out.println("Reconocio " +yytext()+ " tk_SetAlto"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_SetAlto,yycolumn,yyline,yytext());}
<YYINITIAL> "crearparrafo"              {System.out.println("Reconocio " +yytext()+ " tk_CrearParrafo"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_CrearParrafo,yycolumn,yyline,yytext());}
<YYINITIAL> "getcontenido"              {System.out.println("Reconocio " +yytext()+ " tk_GetContenido"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_GetContenido,yycolumn,yyline,yytext());}
<YYINITIAL> "getalinecion"              {System.out.println("Reconocio " +yytext()+ " tk_GetAlineacion"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_GetAlineacion,yycolumn,yyline,yytext());}
<YYINITIAL> "setcontenido"              {System.out.println("Reconocio " +yytext()+ " tk_SetContenido"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_SetContenido,yycolumn,yyline,yytext());}
<YYINITIAL> "setalineacion"             {System.out.println("Reconocio " +yytext()+ " tk_SetAlineacion"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_SetAlineacion,yycolumn,yyline,yytext());}
<YYINITIAL> "creartextoa"               {System.out.println("Reconocio " +yytext()+ " tk_CrearTextoA"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_CrearTextoA,yycolumn,yyline,yytext());}
<YYINITIAL> "creartextob"               {System.out.println("Reconocio " +yytext()+ " tk_CrearTextoB");  agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_CrearTextoB,yycolumn,yyline,yytext());}
<YYINITIAL> "creartabla"                {System.out.println("Reconocio " +yytext()+ " tk_CrearTabla"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_CrearTabla,yycolumn,yyline,yytext());}
<YYINITIAL> "setborde"                  {System.out.println("Reconocio " +yytext()+ " tk_SetBorde"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_SetBorde,yycolumn,yyline,yytext());}
<YYINITIAL> "crearboton"                {System.out.println("Reconocio " +yytext()+ " tk_CrearBoton"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_CrearBoton,yycolumn,yyline,yytext());}
<YYINITIAL> "gettexto"                  {System.out.println("Reconocio " +yytext()+ " tk_GetTexto"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_GetTexto,yycolumn,yyline,yytext());}
<YYINITIAL> "settexto"                  {System.out.println("Reconocio " +yytext()+ " tk_SetTexto"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_SetTexto,yycolumn,yyline,yytext());}
<YYINITIAL> "clickboton"                {System.out.println("Reconocio " +yytext()+ " tk_ClickBoton"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_ClickBoton,yycolumn,yyline,yytext());}
<YYINITIAL> "fondo"                     {System.out.println("Reconocio " +yytext()+ " tk_Fondo"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Fondo,yycolumn,yyline,yytext());}
<YYINITIAL> "alineacion"                {System.out.println("Reconocio " +yytext()+ " tk_Alineacion"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Alineacion,yycolumn,yyline,yytext());}
<YYINITIAL> "id"                        {System.out.println("Reconocio " +yytext()+ " tk_ID"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_ID,yycolumn,yyline,yytext());}
<YYINITIAL> "texto"                     {System.out.println("Reconocio " +yytext()+ " tk_Texto"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Texto,yycolumn,yyline,yytext());}
<YYINITIAL> "true"                      {System.out.println("Reconocio " +yytext()+ " tk_True");  agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_True,yycolumn,yyline,yytext());}
<YYINITIAL> "false"                     {System.out.println("Reconocio " +yytext()+ " tk_False"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_False,yycolumn,yyline,yytext());}
<YYINITIAL> "<?hs"                      {System.out.println("Reconocio " +yytext()+ " tk_HS_A");  agregar_token(yytext(),yycolumn, yyline,"HSCRIPT"); return new Symbol(Simbolos.tk_HS_A,yycolumn,yyline,yytext());}
<YYINITIAL> "?>"                        {System.out.println("Reconocio " +yytext()+ " tk_HS_C"); agregar_token(yytext(),yycolumn, yyline,"HSCRIPT"); return new Symbol(Simbolos.tk_HS_C,yycolumn,yyline,yytext());}
<YYINITIAL> "\"rojo\""                  {System.out.println("Reconocio " +yytext()+ " tk_Rojo"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Rojo,yycolumn,yyline,yytext());}
<YYINITIAL> "\"azul\""                  {System.out.println("Reconocio " +yytext()+ " tk_Azul"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Azul,yycolumn,yyline,yytext());}
<YYINITIAL> "\"verde\""                 {System.out.println("Reconocio " +yytext()+ " tk_Verde"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Verde,yycolumn,yyline,yytext());}
<YYINITIAL> "\"gris\""                  {System.out.println("Reconocio " +yytext()+ " tk_Gris"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Gris,yycolumn,yyline,yytext());}
<YYINITIAL> "\"negro\""                 {System.out.println("Reconocio " +yytext()+ " tk_Negro"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Negro,yycolumn,yyline,yytext());}
<YYINITIAL> "\"amarillo\""              {System.out.println("Reconocio " +yytext()+ " tk_Amarillo"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Amarillo,yycolumn,yyline,yytext());}
<YYINITIAL> "\"rosado\""                {System.out.println("Reconocio " +yytext()+ " tk_Rosado"); agregar_token(yytext(),yycolumn, yyline,"PALABRA RESERVADA"); return new Symbol(Simbolos.tk_Rosado,yycolumn,yyline,yytext());}
\n                          {yycolumn=1;}

<YYINITIAL> {espacio}                   {/* IGNORAR */}
<YYINITIAL> {simple}                    {/* IGNORAR */}
<YYINITIAL> {multi}                     {/* IGNORAR */}
<YYINITIAL> {eticoment}                 {System.out.println("Reconocio " +yytext()+ "E_comentario"); agregar_token(yytext(),yycolumn, yyline,"COMENTARIO"); return new Symbol(Simbolos.Eti_Coment, yycolumn, yyline, yytext());}
//<YYINITIAL> {eticoment}                 {}
<YYINITIAL> {cadena}                    {System.out.println("Reconocio " +yytext()+ " cadena"); agregar_token(yytext(),yycolumn, yyline,"CADENA"); return new Symbol(Simbolos.cadena, yycolumn, yyline, yytext());}
<YYINITIAL> {numero}                    {System.out.println("Reconocio " +yytext()+ " numero"); agregar_token(yytext(),yycolumn, yyline,"NUMERO"); return new Symbol(Simbolos.numero, yycolumn, yyline, yytext());}
//<YYINITIAL> {hexa}                      {System.out.println("Reconocio " +yytext()+ " hexa"); return new Symbol(Simbolos.hexa, yycolumn, yyline, yytext());}
<YYINITIAL> {decimal}                   {System.out.println("Reconocio " +yytext()+ " decimal"); agregar_token(yytext(),yycolumn, yyline,"DECIMAL"); return new Symbol(Simbolos.decimal, yycolumn, yyline, yytext());}
<YYINITIAL> {id}                        {System.out.println("Reconocio " +yytext()+ " id");  agregar_token(yytext(),yycolumn, yyline,"ID"); return new Symbol(Simbolos.id, yycolumn, yyline, yytext());}

<YYINITIAL> "+"                         {System.out.println("Reconocio" + yytext() + " mas"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.mas,yycolumn,yyline,yytext());}
<YYINITIAL> "-"                         {System.out.println("Reconocio" + yytext() + " menos"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.menos,yycolumn,yyline,yytext());}
<YYINITIAL> "*"                         {System.out.println("Reconocio" + yytext() + " por"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.por,yycolumn,yyline,yytext());}
<YYINITIAL> "/"                         {System.out.println("Reconocio" + yytext() + " divicion"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.divicion,yycolumn,yyline,yytext());}
<YYINITIAL> "="                         {System.out.println("Reconocio " +yytext()+ " igual"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.igual, yycolumn, yyline, yytext());}
<YYINITIAL> "("                         {System.out.println("Reconocio " +yytext()+ " parentA");  agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.parentA, yycolumn, yyline, yytext());}
<YYINITIAL> ")"                         {System.out.println("Reconocio " +yytext()+ " parentC"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.parentC, yycolumn, yyline, yytext());}
<YYINITIAL> "{"                         {System.out.println("Reconocio " +yytext()+ " llaveA"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.llaveA, yycolumn, yyline, yytext());}
<YYINITIAL> "}"                         {System.out.println("Reconocio " +yytext()+ " llaveC"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.llaveC, yycolumn, yyline, yytext());}
<YYINITIAL> "["                         {System.out.println("Reconocio " +yytext()+ " corecheA"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.corecheA, yycolumn, yyline, yytext());}
<YYINITIAL> "]"                         {System.out.println("Reconocio " +yytext()+ " corecheC"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.corecheC, yycolumn, yyline, yytext());}
<YYINITIAL> "¿"                         {System.out.println("Reconocio " +yytext()+ " interrA"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.interrA, yycolumn, yyline, yytext());}
<YYINITIAL> "?"                         {System.out.println("Reconocio " +yytext()+ " interrC"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.interrC, yycolumn, yyline, yytext());}
<YYINITIAL> "!"                         {System.out.println("Reconocio " +yytext()+ " exclama"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.exclama, yycolumn, yyline, yytext());}
<YYINITIAL> ":"				   			          {System.out.println("Reconocio " +yytext()+ " dosPts"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.dosPts, yycolumn, yyline, yytext());}
<YYINITIAL> ";"                         {System.out.println("Reconocio " +yytext()+ " puntComa"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.puntComa, yycolumn, yyline, yytext());}
<YYINITIAL> ","   				 		          {System.out.println("Reconocio " +yytext()+ " coma"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.coma, yycolumn, yyline, yytext());}
//<YYINITIAL> "$"	 						            {System.out.println("Reconocio " +yytext()+ " dolar"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.dolar, yycolumn, yyline, yytext());}
<YYINITIAL> "&&"                        {System.out.println("Reconocio " +yytext()+ " AND"); agregar_token(yytext(),yycolumn, yyline,"OPERADOR"); return new Symbol(Simbolos.AND, yycolumn, yyline, yytext());}
<YYINITIAL> "||"                        {System.out.println("Reconocio " +yytext()+ " OR"); agregar_token(yytext(),yycolumn, yyline,"OPERADOR"); return new Symbol(Simbolos.OR, yycolumn, yyline, yytext());}
<YYINITIAL> ">="                        {System.out.println("Reconocio " +yytext()+ " mayorigual"); agregar_token(yytext(),yycolumn, yyline,"OPERADOR"); return new Symbol(Simbolos.mayorigual, yycolumn, yyline, yytext());}
<YYINITIAL> "<="                        {System.out.println("Reconocio " +yytext()+ " menorigual"); agregar_token(yytext(),yycolumn, yyline,"OPERADOR"); return new Symbol(Simbolos.menorigual, yycolumn, yyline, yytext());}
<YYINITIAL> "=="                        {System.out.println("Reconocio " +yytext()+ " igualigual"); agregar_token(yytext(),yycolumn, yyline,"OPERADOR"); return new Symbol(Simbolos.igualigual, yycolumn, yyline, yytext());}
<YYINITIAL> "!="                        {System.out.println("Reconocio " +yytext()+ " diferente"); agregar_token(yytext(),yycolumn, yyline,"OPERADOR"); return new Symbol(Simbolos.diferente, yycolumn, yyline, yytext());}
//<YYINITIAL> "#"                         {System.out.println("Reconocio " +yytext()+ " numeral"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.numeral, yycolumn, yyline, yytext());}
<YYINITIAL> "."                         {System.out.println("Reconocio " +yytext()+ " punto");  agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.punto, yycolumn, yyline, yytext());}
<YYINITIAL> "<"							            {System.out.println("Reconocio " +yytext()+ " menor"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.menorq, yycolumn, yyline, yytext());}
<YYINITIAL> ">"							            {if(text == true){
                                            yybegin(TEXT); cadena = "";
                                          }else{ 
                                            System.out.println("Reconocio " +yytext()+ " mayor"); agregar_token(yytext(),yycolumn, yyline,"SIGNO"); return new Symbol(Simbolos.mayorq, yycolumn, yyline, yytext());
                                          }
                                         }

//-------------------------------------- ERRORES

.                           { System.out.println("Error Lexico: "+yytext()+" Linea "+yyline+" Columna "+yycolumn);
                             Errores datos = new Errores(yytext(), yyline, yycolumn,"Error Lexico", "Simbolo no existe");
                             Listas.Errores_Lex.add(datos);}