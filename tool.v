Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.


(** *Objective function *)

(** so far, [designspace] is only supported a subset of nat. *)
Definition designSpace := nat.    
Definition range := nat.
Definition objFun := designSpace -> range.
Definition ev (x:designSpace) (f:objFun) := f x.


Inductive randBit := Zero|One|Either.
(* Inductive nat' : Set := O' : nat' | S' : nat' -> nat' | Inf : nat' . *)
Inductive randBits : Set := B : randBits | ConB : randBit -> randBits.
Require Import List.
Import ListNotations.

Fixpoint genBits (len : nat)  :=
  match len with
    | S n => Either :: (genBits n)
    | O => nil
  end.

Require Import Coq.NArith.BinNat.
Import N.
Locate "_ - _".
(* Notation            Scope      *)
(* "x - y" := sub x y   : N_scope  *)
(* "x - y" := Init.Nat.sub x y    : nat_scope *)
(*                       (default interpretation) *)


Open Scope N_scope.
Check (two - two).
Compute (two * two).
Compute (succ_double two).
Compute (size_nat 1024).
Compute iter 1 (fun foo => foo+1) two.
     (* = 3 *)
     (* : N *)
Compute iter 3 (fun foo => foo+1) two.
     (* = 5 *)
     (* : N *)
(* Close Scope N_scope. *)

Definition init (seed l mu: nat) := genBits (l*mu).
Compute (init 1 2 3).

