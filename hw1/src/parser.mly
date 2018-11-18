%{
open Lambda;;
%}
%token <string> VAR
%token LAMBDA DOT
%token OPEN CLOSE
%token EOF
%nonassoc LAMBDA DOT
%start main
%type <Lambda.lambda> main
%%
main:
        expression EOF          { $1 }

expression:
		application LAMBDA VAR DOT expression	{ Application($1, Abstraction(Id($3), $5)) }
		| LAMBDA VAR DOT expression				{ Abstraction(Id($2), $4) }
		| application 							{ $1 }

application: 
		application atom						{ Application($1, $2) }
		| atom									{ $1 }

atom:
		OPEN expression CLOSE					{ $2 }
		| VAR 									{ Var(Id($1)) }