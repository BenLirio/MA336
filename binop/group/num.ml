
type bit = One | Zero

type binop = bit -> bit -> bit
type ordering = binop -> binop

let next : ordering =
  fun f a b -> f a b

let binop_eq : binop -> binop -> bool =
  fun op1 op2 ->
    List.fold_left
    (fun ok (a,b) -> ok && (
      match (op1 a b), (op2 a b) with 
      | One,One | Zero,Zero -> true 
      | _ -> false
      )
    )
    true
    [Zero,Zero;Zero,One;One,Zero;One,One]

let order : binop -> ordering -> int =
  fun g t ->
    let rec aux n g' =
      if binop_eq g' g then n else aux (n+1) (t g')
    in aux 1 (t g)

let imp : binop = fun a b ->
  match a,b with
  | One,Zero -> Zero
  | _ -> One


let () =
  Printf.printf "order: %d\n" (order imp next)
