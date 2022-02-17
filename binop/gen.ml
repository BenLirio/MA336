
type 'a binop = 'a -> 'a -> 'a
type 'a set = 'a list


let add : int binop = fun x y -> x + y

type elem = Zero | One | Two

let is_closed : 'a set -> 'a binop -> bool =
  fun s op ->
    List.fold_left
    (fun ok v1 ->
      ok && (List.fold_left
      (fun ok' v2 -> ok' && List.mem (op v1 v2) s)
      true
      s)
    )
    true
    s

let op1 : elem binop =
  fun v1 v2 ->
    match v1,v2 with
    | Zero,v2 -> v2
    | v1,Zero -> v1
    | One,One -> Two
    | One,Two -> Zero
    | Two,One -> Zero
    | Two,Two -> One

let next : 'a binop -> 'a binop =
  fun op ->
    fun v1 v2 -> op v2 v1

let binop_eq : 'a binop -> 'a binop -> bool =
  fun op1 op2 ->
    op1 a b = op2 a b for all a and b
    

let () =
  Printf.printf "Is closed: %b\n" (is_closed [Zero;One;Two] (next op1))
