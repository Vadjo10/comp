parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS PROGRAM LCURLY field_decl* method_decl* RCURLY EOF;

field_decl:(type id_col | type id_col LCOL int_literal + RCOL( VIRGULA( type id_col LCOL int_literal RCOL))*) PVIRGULA;

method_decl: (type | VOID) ID LPAR ( type ID(VIRGULA type ID)*)* RPAR block;

block: LCURLY var_decl* statement* RCURLY;

var_decl: (type ID)*  PVIRGULA;

type: INT | BOOLEAN;
  
statement: location assign_op expr PVIRGULA
		| method_call PVIRGULA
		| IF LPAR expr RPAR block ( ELSE block)?
		| FOR id_col ATRIBUI expr VIRGULA expr block
		| RETURN (expr)* PVIRGULA
		| BREAK PVIRGULA
		| CONTINUE PVIRGULA
		| block ;

  
assign_op: ATRIBUI | MAISIGUAL | MENOSIGUAL;

method_call: ID LPAR (expr (VIRGULA expr)*)? RPAR | CALLOUT LPAR STRING (VIRGULA callout_arg(VIRGULA callout_arg)*)? RPAR;

location: ID | ID LCOL expr RCOL;

expr: location
	|method_call
	|literal
	|expr bin_op expr
	|MENOS expr
	|EXCLAMACAO expr
	|LPAR expr RPAR;

callout_arg: expr | STRING;

bin_op: arith_op | rel_op | eq_op | cond_op;

arith_op: MAIS | MENOS | VEZES | RESTO | DIV;

rel_op : MENOR | MAIOR| MENORIGUAL | MAIORIGUAL;

eq_op: IGUAL|DIFERENTE;

cond_op: E|OU;

literal : int_literal | CHAR | BOOLEAN01;

int_literal : INTLITERAL | HEXADECIMAL;

id: ID;

id_col : ID | ID LCOL? int_literal+ RCOL?;


string_literal: STRING;

