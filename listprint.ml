let mylist = ["first_e"; "second_e"; "third_e"; "fourth_e"; "fifth_e"];;

(*print element of that list*)
let rec print_list_string myList = match myList with
	| [] -> print_endline "End of list"
	| head::body -> 
		begin
		print_endline head;
		print_list_string body;
		end
;;

print_list_string mylist;;