exception Bounds of string

let rec range n =
  let rec aux cur n =
    match n with
      | 0 -> [cur]
      | n when n > 0 -> cur :: aux (cur+1) (n-1)
      | _ -> raise (Bounds "Range of n > 0")
  in aux 0 n

let num_partitions n =
  let memo : int option array = Array.make ((n+1)*(n+1)) None in
  let rec aux x y =
    let mi = x*n + y in
    match memo.(mi) with
    | Some res -> res
    | None -> (match (x,y) with
      | (0,0) -> 1
      | (x,0) -> let res = aux (x-1) (x-1) in memo.(mi) <- (Some res); res
      | (x,y) -> let res = aux x (y-1) + aux (x-1) (y-1) in memo.(mi) <- (Some res); res)
  in aux n n

let x = unit_big_int

let () =
  List.iter (fun n -> num_partitions n |> (Printf.printf "%d: %d\n" n)) (range 25)
