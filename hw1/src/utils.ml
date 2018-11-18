open Lambda;;
open Buffer;;

let (>>) x f = f x;;

let string_to_tree parser s = s >> Lexing.from_string >> parser Lexer.main;;

let rec tree_to_buf buf exp = 
	match exp with
	| Var (Id v) -> Buffer.add_string buf v;
	| Application (t1, t2) -> begin
		Buffer.add_string buf "(";
		tree_to_buf buf t1;
		Buffer.add_string buf " ";
		tree_to_buf buf t2;
		Buffer.add_string buf ")";
	end 
	| Abstraction (Id v, t) -> begin
		Buffer.add_string buf "(\\";
		Buffer.add_string buf v;
		Buffer.add_string buf ".";
		tree_to_buf buf t;
		Buffer.add_string buf ")";
	end
;;

let tree_to_string exp = begin
	let buf = Buffer.create 42 in
	tree_to_buf buf exp;
	Buffer.contents buf
end;;