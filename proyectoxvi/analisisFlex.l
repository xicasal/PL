%{
  #include <stdio.h>
  #include <string.h>
  #include <stdlib.h>
  int num_linea = 1;
  void error(char *s);
  typedef struct _token{
	int bloque;
	char value[32];
  } token;

  token TOKEN;
  enum bloque{
  MAYOR, MENOR, MAYORIGUAL, MENORIGUAL, TIPOPRINCIPAL, TIPOCONTADOR, 
  START, END, INSTRUCCION_FOR, INSTRUCCION_WHEN, INSTRUCCION_DO, 
  FUNCION_SUM, FUNCION_RES, FUNCION_MUL, FUNCION_DIV,
  ASIGNACION, CIERRE_INSTRUCCION, LLAVE_ABIERTA, LLAVE_CERRADA, 
  DELIMITADOR_ABIERTO, DELIMITADOR_CERRADO, NUMERO, IDENTIFICADOR, SEPARADOR
  };

%}

%x COMENTARIO

/*Expresiones Regulares*/
/*Definimos las expresiones regulares que utilizará nuestra gramática*/
num [0-9]+
id [a-z]+_{num}+|[a-z]+


/* Reglas */

%%

">" {TOKEN.bloque = MAYOR;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'MAYOR' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"<" {TOKEN.bloque = MENOR;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'MENOR' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

">=" {TOKEN.bloque = MAYORIGUAL;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'MAYORIGUAL' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"<=" {TOKEN.bloque = MENORIGUAL;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'MENORIGUAL' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"principal" {TOKEN.bloque = TIPOPRINCIPAL;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'TIPOPRINCIPAL' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"contador" {TOKEN.bloque = TIPOCONTADOR;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'TIPOCONTADOR' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"start" {TOKEN.bloque = START;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'START' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"end" {TOKEN.bloque = END;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'END' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"for" {TOKEN.bloque = INSTRUCCION_FOR;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'INSTRUCCION_FOR' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"when" {TOKEN.bloque = INSTRUCCION_WHEN;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'INSTRUCCION_WHEN' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"do" {TOKEN.bloque = INSTRUCCION_DO;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'INSTRUCCION_DO' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"sum" {TOKEN.bloque = FUNCION_SUM;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'FUNCION_SUM' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"res" {TOKEN.bloque = FUNCION_RES;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'FUNCION_RES' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"mul" {TOKEN.bloque = FUNCION_MUL;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'FUNCION_MUL' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"div" {TOKEN.bloque = FUNCION_DIV;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'FUNCION_DIV' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

":" {TOKEN.bloque = ASIGNACION;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'ASIGNACION' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

";" {TOKEN.bloque = CIERRE_INSTRUCCION;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'CIERRE_INSTRUCCION' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"{" {TOKEN.bloque = LLAVE_ABIERTA;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'LLAVE_ABIERTA' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"}" {TOKEN.bloque = LLAVE_CERRADA;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'LLAVE_CERRADA' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

"(" {TOKEN.bloque = DELIMITADOR_ABIERTO;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'DELIMITADOR_ABIERTO' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
	}

")" {TOKEN.bloque = DELIMITADOR_CERRADO;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'DELIMITADOR_CERRADO' en línea %d\n\n" ,TOKEN.value, TOKEN.bloque, num_linea);
	}

"," {TOKEN.bloque = SEPARADOR;
	strcpy(TOKEN.value, yytext);
	printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'SEPARADOR' en línea %d\n\n" ,TOKEN.value, TOKEN.bloque, num_linea);
	}

{num} {
  TOKEN.bloque = NUMERO;
  strcpy(TOKEN.value, yytext);
  printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'NUMERO' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
}

{id} {
  TOKEN.bloque = IDENTIFICADOR;
  strcpy(TOKEN.value, yytext);
  printf("Palabra a analizar: %s\nNum token: %d\nPalabra reservada: 'IDENTIFICADOR' en línea %d\n\n", TOKEN.value, TOKEN.bloque, num_linea);
}

[ \r\t] {}

\n num_linea++;

<INITIAL>"//" {BEGIN(COMENTARIO);}
<COMENTARIO>[^\n] ;
<COMENTARIO>\n num_linea++; BEGIN 0;
. {error(yytext);}


%%

/* Si encuentra un error lexico, se imprime en la pantalla el siguiente mensaje*/
void error(char *s){
  printf("SE ENCONTRO UN ERROR LEXICO: %s\n\n", s);
}

