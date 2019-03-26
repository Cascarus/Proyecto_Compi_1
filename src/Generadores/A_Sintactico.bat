SET JAVA_HOME="C:\Program Files\Java\jdk1.8.0_181\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
cd "D:\Cascarus\Documents\NetBeansProjects\[OCL1]Proyecto1_201603127\src\Analizadores"
java -jar "D:\Librerias\Cup\java-cup-11b.jar" -parser A_Sintactico -symbols Simbolos Analizador_Sintactico.cup
pause
