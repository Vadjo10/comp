parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS PROGRAM LCURLY field decl* method decl* RCURLY;

field_decl:lista (VIRGULA lista)+ PVIRGURLA;
lista:type id | type id LCOL int literal RCOL
method_decl: type id | VOID  LCOL ( VIRGULA lista2)  RCOL block;
lista2:type id 
block: LCURLY var_decli* statement* RCURLY;
var_decl: type id+VIRGULA PVIRGULA;
type: INT | BOOLEAN01;  
statement: location assign_op expr PVIRGULA
| method_call PVIRGULA
| IF LPAR expr RPAR block LCOL ELSE block RCOL
| FOR id = expr PVIRGULA expr block
| RETURN LPAR expr RPAR PVIRGULA
| BREAK PVIRGULA
| CONTINUE PVIRGULA
| block   

