

let z : unit -> unit = fun () -> ()
let one : unit -> unit -> unit = fun () -> fun () -> ()
let is_z : 'a -> bool = fun a -> a () = ()

let () =
  Printf.printf "%b\n" (is_z one)
