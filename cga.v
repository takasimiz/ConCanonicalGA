(* Require Import tool. *)
(* Require Import ETC.tool. *)
Require Import tool.
Definition init (seed l mu: nat) := genBits (l*mu).
Compute (init 1 2 3).
