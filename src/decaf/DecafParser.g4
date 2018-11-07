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

field_decl: type id (VIRGULA type id)* PVIRGULA;

decl: type ID;
method_decl: (type|VOID) ID LPAR (decl (VIRGULA decl)*)? RPAR block;

block: LCURLY (var_decl)* (statement)* RCURLY;

var_decl: type ID (VIRGULA ID)* PVIRGULA;

type: INT|BOOLEAN;

statement: location assign_op expr PVIRGULA
       | method_call PVIRGULA
       | IF LPAR expr RPAR block (ELSE block)?
       | FOR ID ATRIBUI expr VIRGULA expr block
       | RETURN expr? PVIRGULA
       | BREAK PVIRGULA
       | CONTINUE PVIRGULA
       | block ;

assign_op: ATRIBUI | MAISIGUAL | MENOSIGUAL ;

method_call: method_name LPAR (expr (VIRGULA expr)*)? RPAR | CALLOUT LPAR string_literal (VIRGULA callout_arg(VIRGULA callout_arg)*)? RPAR;

method_name : ID;

location: ID | ID LCOL expr RCOL;

expr: location
    |method_call
    |literal
    |expr bin_op expr
    |MENOS expr
    |EXCLAMACAO expr
    |LPAR expr RPAR;

callout_arg: expr | string_literal;

bin_op: arith_op | rel_op | eq_op | cond_op;

arith_op: MAIS | MENOS | VEZES | RESTO | DIV;

rel_op : MENOR | MAIOR | MENORIGUAL | MAIORIGUAL;

eq_op: IGUAL|DIFERENTE;

cond_op: E|OU;

literal : int_literal | char_literal | boolean_literal;

int_literal : INTLITERAL | HEXADECIMAL;

string_literal : STRING;

char_literal: CHAR;

boolean_literal : BOOLEAN01;

id: ID| ID LCOL? int_literal RCOL?;
