type variable = Id of string;;

type lambda = 
	Var of variable | 
	Abstraction of variable * lambda | 
	Application of lambda * lambda
;;