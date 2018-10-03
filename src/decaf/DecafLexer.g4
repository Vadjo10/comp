lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}


CLASS: 'class';
PROGRAM:'Program';
BREAK: 'break';
CALLOUT: 'callout';
CONTINUE: 'continue';
RETURN: 'return';
VOID: 'void';

IF:'if';
ELSE:'else';
FOR:'for';
INT: 'int';
BOOLEAN: 'boolean';
BOOLEAN01: 'true'|'false';

LCURLY : '{';
RCURLY : '}';
LPAR : '(';
RPAR: ')';
LCOL: '[';
RCOL: ']'; 

DOISPONTOS:':';
VIRGULA: ',';
PVIRGULA:';';

VEZES:'*';
DIV:'/';
MENOS:'-';
MAIS:'+';
RESTO: '%';
EXCLAMACAO:'!';
E:'&&';
OU:'||';

IGUAL:'==';
DIFERENTE:'!=';
MAIOR:'>';
MENOR:'<';
MAIORIGUAL:'>=';
MENORIGUAL:'<=';
MAISIGUAL:'+=';
MENOSIGUAL:'-=';
ATRIBUI:'=';


ID  :
  ('a'..'z' | 'A'..'Z'|'_')+;

WS_ : (' ' | '\n'| '\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;	

CHAR : '\'' (ESC| ALFANUMERICO| IDCHAR) '\'';
STRING : '"' (IDCSTR | ALFANUMERICO)+ '"';
HEXADECIMAL : '0x'(NUMERO | ALFAHEX)+;
OP : (OPERADORES|SIMBOLOS);
INTLITERAL : NUMERO(NUMERO)*;

fragment
ESC :  '\\' ('n'| '"'| 't' | '\\');


fragment
IDCSTR :
    (' '| '!' | '#' | '$' | '%' | '&' | '(' | ')' | '*' | '+' |
         ','| '-' | '.' | '/' | ':' | ';' | '<' | '=' | '>' | '?' |
     '@'| ']' | '^' | '_' | '`' | '{' | '|' | '}' | '~' | '\\\'' | '\t' | '"' | '\\' );

fragment
IDCHAR:
    (' '| '!' | '#' | '$' | '%' | '&' | '(' | ')' | '*' | '+' |
         ','| '-' | '.' | '/' | ':' | ';' | '<' | '=' | '>' | '?' |
     '@'| ']' | '^' | '_' | '`' | '{' | '|' | '}' | '~');
 

fragment
ALFANUMERICO  : ('a'..'z' | 'A'..'Z' | '0'..'9');

fragment
ALFAHEX : ('a'..'f' | 'A'..'F');

fragment
NUMERO : ('0'..'9');

fragment
OPERADORES :
    ('+' | '-' | '*' | '<' | '<=' | '!=' | '&&');
fragment SIMBOLOS : (' '|'!'|'"'|'#'|'$'|'%'|'&'|'\\\''|'('|')'|'*'|'+'|','|'-'|'.'|'/'|':'|';'|'<'|'='|'>'|'?'|'@'|'['|']'|'^'|'_'|'´'|'`'|'{'|'|'|'}'|'~'|'\t'|'\\'|'\"');
