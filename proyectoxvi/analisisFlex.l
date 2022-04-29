
%x COMENTARIO

%{
  #include <stdio.h>
  #include <string.h>
  #include <stdlib.h>
  #include "analisisBison.tab.h"
  int num_linea = 1;

%}



/*Expresiones Regulares*/
/*Definimos las expresiones regulares que utilizará nuestra gramática*/
num [0-9]+
id [a-z]+_{num}+|[a-z]+


/* Reglas */

%%

">" {printf("linea %d, operador: %s\n", num_linea,yytext);return('>');}

"<" {printf("linea %d, operador: %s\n", num_linea,yytext);return('<');}

">=" {printf("linea %d, operador: %s\n", num_linea,yytext);return(MAYORIGUAL);}

"<=" {printf("linea %d, operador: %s\n", num_linea,yytext);return(MENORIGUAL);}

principal {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(TIPOPRINCIPAL);}

contador {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(TIPOCONTADOR);}

local {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(TIPOLOCAL);}

start {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(START);}

end {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(END);}

for {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(INSTRUCCION_FOR);}

when {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(INSTRUCCION_WHEN);}

do {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(INSTRUCCION_DO);}

sum {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(FUNCION_SUM);}

res {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(FUNCION_RES);}

mul {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(FUNCION_MUL);}

div {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(FUNCION_DIV);}

show {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(FUNCION_SHOW);}

"=" {printf("linea %d, operador: %s\n", num_linea,yytext);return('=');}

":" {printf("linea %d, operador: %s\n", num_linea,yytext);return(':');}

";" {printf("linea %d, operador: %s\n", num_linea,yytext);return(';');}

"{" {printf("linea %d, operador: %s\n", num_linea,yytext);return('{');}

"}" {printf("linea %d, operador: %s\n", num_linea,yytext);return('}');}

"(" {printf("linea %d, operador: %s\n", num_linea,yytext);return('(');}

")" {printf("linea %d, operador: %s\n", num_linea,yytext);return(')');}

"," {printf("linea %d, operador: %s\n", num_linea,yytext);return(',');}

{num} {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(NUMERO);}

{id} {printf("linea %d, palabra reservada: %s\n", num_linea,yytext);return(IDENTIFICADOR);}

[ \r\t] {}

\n num_linea++;

<INITIAL>"//" {BEGIN(COMENTARIO);}
<COMENTARIO>[^\n] ;
<COMENTARIO>\n num_linea++; BEGIN 0;
. printf("linea %d, error: %s\n", num_linea,yytext);


%%

