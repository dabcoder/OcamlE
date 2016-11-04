
print_string "****************************************\n";;
print_string "Welcome to the rock-paper-scissors game!\n";;
print_string "****************************************\n";;

(*Player's choice*)
print_string "What is your choice? 1 for Rock, 2 for Paper, 3 for Scissors: ";;

let pchoice = match read_int () with
	| 1 -> "Rock"
	| 2 -> "Scissors"
	| 3 -> "Paper"
	| _ -> "Error"
;;

Printf.printf "You chose %s\n" pchoice;;

(*Computer choice*)
Random.self_init ()

let random_compchoice = match Random.int 3 with
    | 0 -> "Rock"
    | 1 -> "Paper"
    | 2 -> "Scissors"
    | _ -> "Error"
;;

Printf.printf "Computer chose %s\n" random_compchoice;;


(*Comparisons*)
let finalresult = match (pchoice, random_compchoice) with 
	| ("Rock", "Rock")         -> "It's a tie"
	| ("Rock", "Paper")        -> "You lost"
	| ("Rock", "Scissors")     -> "You won"
	| ("Paper", "Rock")        -> "You won"
	| ("Paper", "Paper")       -> "It's a tie"
	| ("Paper", "Scissors")    -> "You lost"
	| ("Scissors", "Rock")     -> "You lost"
	| ("Scissors", "Paper")    -> "You won"
	| ("Scissors", "Scissors") -> "It's a tie"
	| _                        -> "Error"
;;

(*Final result*)
Printf.printf "And... %s\n" finalresult;;