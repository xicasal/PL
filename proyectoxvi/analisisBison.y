%{
  #include <stdlib.h>
  #include <stdio.h>
  extern FILE *yyin;
  extern int linea;
  extern int yylex();
  extern void yyerror(char *s);

  #define YYDEBUG 1

%}

%token TIPOPRINCIPAL TIPOCONTADOR
%token START END INSTRUCCION_FOR INSTRUCCION_WHEN INSTRUCCION_DO
%token FUNCION_SUM FUNCION_RES FUNCION_MUL FUNCION_DIV
%token NUMERO IDENTIFICADOR 
%token MAYORIGUAL MENORIGUAL

%%

/******************/
/*PROGRAMA*/
/******************/

modulo
    : lista_declaraciones       { printf (" modulo -> lista_declaraciones y bloque_instruciones\n"); }
    ;

    /****************************/
    /*Parte de las declaraciones*/
    /****************************/

lista_declaraciones
    : declaracion                       { printf (" lista_declaraciones -> declaracion\n"); }
    | lista_declaraciones declaracion   { printf (" lista_declaraciones -> lista_declaraciones declaracion\n"); }
    ;

declaracion
    : declaracion_principal     { printf (" declaracion -> declaracion_principal\n"); }
    | declaracion_contador      { printf (" declaracion -> declaracion_contador\n"); }
    ;

declaracion_principal
    : TIPOPRINCIPAL IDENTIFICADOR ':' NUMERO ';'    { printf (" declaracion_principal -> pricipal\n"); }
    ;

declaracion_contador
    : TIPOCONTADOR IDENTIFICADOR ':' NUMERO '<' NUMERO ';'          { printf (" declaracion_contador -> contador_menor\n"); }
    | TIPOCONTADOR IDENTIFICADOR ':' NUMERO '>' NUMERO ';'          { printf (" declaracion_contador -> contador_mayor\n"); }
    | TIPOCONTADOR IDENTIFICADOR ':' NUMERO MENORIGUAL NUMERO ';'   { printf (" declaracion_contador -> contador_menor_o_igual\n"); }
    | TIPOCONTADOR IDENTIFICADOR ':' NUMERO MAYORIGUAL NUMERO ';'   { printf (" declaracion_contador -> contador_mayor_o_igual\n"); }
    ;


    /****************************/
    /*Parte de las instrucciones*/
    /****************************/
/*
bloque_instrucciones
    : START lista_instrucciones END         { printf (" bloque_instrucciones -> 'start' instruccion/es 'end'\n"); }
    ;

*/


%%

void yyerror(char *s) {
    fflush(stdout);
    printf("**************** %s\n", s);
}

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]){

    yydebug = 0;

    if (argc < 2) {
        printf("Uso: ./analizadorxvi NombreArchivo\n");
    }
    else{
        yyin = fopen(argv[1], "r");
        yyparse();
    }
}