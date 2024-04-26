package fr.info805;
import java_cup.runtime.Symbol;

%%

%class LexicalAnalyzer
%unicode
%line
%column

%cup

%{

%}


or 			= "or" | "OR"
chiffre 	= [0-9]
espace 		= \s
mod 		= "%" | "mod"|"MOD"
let			= "let"|"LET"
do 			= "do" | "DO"
while 		= "while" | "WHILE"
if 			= "if" | "IF"
then 		= "then" | "THEN"
else 		= "else" | "ELSE"
nil 		= "nil" | "NIL"
input 		= "input" | "INPUT"
output 		= "output" | "OUTPUT"
not 		= "not" | "NOT"
and		 	= "and" | "AND"


ident		= [:letter:]\w*
comment1	= "//".*
comment2	= "/*"([^*]|("*"+[^/*]))*"*"+"/"
comment	= {comment1}|{comment2}	

%%

{let}		{ return new Symbol(sym.LET, yyline, yycolumn) ;}
{while}		{ return new Symbol(sym.WHILE, yyline, yycolumn) ;}
{do}		{ return new Symbol(sym.DO, yyline, yycolumn) ;}
{if}		{ return new Symbol(sym.IF, yyline, yycolumn) ;}
{then}		{ return new Symbol(sym.THEN, yyline, yycolumn) ;}
{else}		{ return new Symbol(sym.ELSE, yyline, yycolumn) ;}
{nil}		{ return new Symbol(sym.NIL, yyline, yycolumn) ;}
{input}		{ return new Symbol(sym.INPUT, yyline, yycolumn) ;}
{output}	{ return new Symbol(sym.OUTPUT, yyline, yycolumn) ;}
{and}		{ return new Symbol(sym.AND, yyline, yycolumn) ;}
{or}		{ return new Symbol(sym.OR, yyline, yycolumn) ;}
{not}		{ return new Symbol(sym.NOT, yyline, yycolumn) ;}
"="			{ return new Symbol(sym.EGAL, yyline, yycolumn) ;}
"<"			{ return new Symbol(sym.GT, yyline, yycolumn) ;}
"<="		{ return new Symbol(sym.GTE, yyline, yycolumn) ;}
">"			{ return new Symbol(sym.LT, yyline, yycolumn) ;}
">="		{ return new Symbol(sym.LTE, yyline, yycolumn) ;}
"("			{ return new Symbol(sym.PAR_G, yyline, yycolumn) ;}
")"			{ return new Symbol(sym.PAR_D, yyline, yycolumn) ;}
"+"			{ return new Symbol(sym.PLUS, yyline, yycolumn) ;}
"-"			{ return new Symbol(sym.MOINS, yyline, yycolumn) ;}
"/"			{ return new Symbol(sym.DIV, yyline, yycolumn) ;}
{mod}		{ return new Symbol(sym.MOD, yyline, yycolumn) ;}
"*"			{ return new Symbol(sym.MUL, yyline, yycolumn) ;}
";"			{ return new Symbol(sym.SEMI, yyline, yycolumn) ;}
"."			{ return new Symbol(sym.POINT, yyline, yycolumn) ;}
{chiffre}+	{ return new Symbol(sym.ENTIER, yyline, yycolumn, new Integer(yytext())) ;}
{ident}		{ return new Symbol(sym.IDENT, yyline, yycolumn, yytext()) ;}
{comment}	{ /*commentaire : pas d'action*/ }
{espace} 	{ /*espace : pas d'action*/ }
.			{ return new Symbol(sym.ERROR, yyline, yycolumn) ;}