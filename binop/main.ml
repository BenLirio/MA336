
let rec cross' el s2 =
  match s2 with
  | [] -> []
  | h::t -> (el, h) :: cross' el t
let rec cross s1 s2 =
  match (s1,s2) with
  | (h::t,_) -> cross' h s2 @ cross t s2
  | _ -> []

let () =
  let s = [0;1] in
  List.iter (fun (a, (b,c)) -> Printf.printf "%d %d %d\n" a b c) (cross s (cross s s))
