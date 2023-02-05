

let data = 1::2::3::4::[]

let rec idx data n =
  match data,n with
  | _::t,n when n > 0 -> idx t (n-1)
  | h::_,0 -> h
  | _ -> failwith "Bad idx"

let rec idx2 data n m =
  idx (idx data n) m




let data = 1::2::3::4::[]
let data2 = (1::2::[])::(3::4::[])::([])
let () =
  Printf.printf "%d\n" (idx2 data2 0 1)
