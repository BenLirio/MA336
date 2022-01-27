
let union a b = fun x -> a x || b x
let intersection a b = fun x -> a x && b x
let complement a = fun x -> !(a x)

type num = int

let rec in_natural_numbers (x : num) : bool =
  if x > 0 then in_natural_numbers (x - 1) else
    if x < 0 then false else true

type relation = int * int

let is_equivalance


let () =
  Printf.printf "%b\n" (in_natural_numbers (-5))
