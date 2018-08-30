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

LCURLY : '{';
RCURLY : '}';

ID  :
  ('a'..'z' | 'A'..'Z')+;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|'a'..'z'|'A'..'Z'|'0'..'9'|SIMBOLOS) '\'';
STRING : '"' (ALFABETO|NUMEROS|SIMBOLOS)* '"';

fragment
ESC :  '\\'('n'|'t'|'"'|'\\');

fragment
SIMBOLOS: (' '|'!'|'"'|'#'|'$'|'%'|'&'|'\\\''|'('|')'|'*'|'+'|','|'-'|'.'|'/'|':'|';'|'<'|'='|'>'|'?'|'@'|'['|']'|'^'|'_'|'´'|'`'|'{'|'|'|'}'|'~'|'\t'|'\\'|'\"');

fragment
NUMEROS: ('0'..'9');

fragment
ALFABETO  : ('a'..'z' | 'A'..'Z');

