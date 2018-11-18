open Buffer;;
open Printf;;

let rec read_to_buffer buf = 
	try begin
		let s = input_line stdin in
		Buffer.add_string buf s;
		Buffer.add_string buf " ";
		read_to_buffer buf;
	end
	with
	| End_of_file -> ()
;;

let read() = begin
	let buffer = Buffer.create 42 in
	read_to_buffer buffer;
	Buffer.contents buffer
end;;

let print_result s = 
	fprintf stdout "%s\n" s
;;