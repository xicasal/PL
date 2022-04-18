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
    : lista_declaraciones bloque_instrucciones      { printf (" modulo -> lista_declaraciones y bloque_instruciones\n"); }
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

bloque_instrucciones
    : START lista_instrucciones END         { printf (" bloque_instrucciones -> 'start' instruccion/es 'end'\n"); }
    ;

lista_instrucciones
    : instruccion                       { printf (" lista_instrucciones -> instruccion\n"); }
    | lista_instrucciones instruccion   { printf (" lista_instrucciones -> lista_instrucciones\n"); }
    ;

instruccion
    : instruccion_de_for         { printf (" instruccion -> instruccion_de_for\n"); }
    | instruccion_de_when        { printf (" instruccion -> instruccion_de_when\n"); }
    | instruccion_de_do          { printf (" instruccion -> instruccion_de_do\n"); }
    ;

instruccion_de_for
    : INSTRUCCION_FOR IDENTIFICADOR '{' lista_instrucciones '}' { printf (" instruccion_de_for -> bloque_para_la_instruccion_for\n"); }
    ;

instruccion_de_when
    : INSTRUCCION_WHEN IDENTIFICADOR ':' NUMERO instruccion_de_do    { printf (" instruccion_de_when -> bloque_para_la_instruccion_when\n"); }
    ;

instruccion_de_do
    : INSTRUCCION_DO '{' funcion '}'                { printf (" instruccion_de_do -> bloque_para_la_instruccion_do\n"); }
    ;

funcion
    : funcion_de_suma               { printf (" funcion -> funcion_de_suma\n"); }
    | funcion_de_resta              { printf (" funcion -> funcion_de_resta\n"); }
    | funcion_de_multiplicacion     { printf (" funcion -> funcion_de_multiplicacion\n"); }
    | funcion_de_division           { printf (" funcion -> funcion_de_division\n"); }
    ;

funcion_de_suma
    : FUNCION_SUM cuerpo_de_funcion { printf (" funcion_de_suma -> funcion_para_sumar_dos_numeros\n"); }
    ;

funcion_de_resta
    : FUNCION_RES cuerpo_de_funcion { printf (" funcion_de_resta -> funcion_para_restar_dos_numeros\n"); }
    ;

funcion_de_multiplicacion
    : FUNCION_MUL cuerpo_de_funcion { printf (" funcion_de_multiplicacion -> funcion_para_multiplicar_dos_numeros\n"); }
    ;

funcion_de_division
    : FUNCION_DIV cuerpo_de_funcion { printf (" funcion_de_division -> funcion_para_dividir_dos_numeros\n"); }
    ;

cuerpo_de_funcion
    : '(' IDENTIFICADOR ',' IDENTIFICADOR ')' ';'   { printf (" cuerpo_de_funcion -> contiene_los_dos_numeros_para_la_funcion\n"); }
    ;

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