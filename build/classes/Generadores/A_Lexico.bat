SET JAVA_HOME="D:\Program Files\Java\jdk1.8.0_121\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%
cd "D:\Cascarus\Documents\NetBeansProjects\[OCL1]Proyecto1_201603127\src\Analizadores"
java -jar "D:\Librerias\Jflex1.7.0\lib\jflex-full-1.7.0.jar" Analizador_Lexico.flex --encoding utf-8
pause