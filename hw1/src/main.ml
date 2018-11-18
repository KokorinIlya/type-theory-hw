open Lambda;;
open Utils;;
open Io;;

let input_string = read();;

let s = string_to_tree Parser.main input_string;;
print_result (tree_to_string s);;