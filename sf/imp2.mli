val negb : bool -> bool

type 'a option =
| Some of 'a
| None

val plus : int -> int -> int

val mult : int -> int -> int

val minus : int -> int -> int

val leb : int -> int -> bool

val beq_nat : int -> int -> bool

type id =
  int
  (* singleton inductive, whose constructor was Id *)

val beq_id : id -> id -> bool

type 'a total_map = id -> 'a

val t_update : 'a1 total_map -> id -> 'a1 -> id -> 'a1

type state = int total_map

type aexp =
| ANum of int
| AId of id
| APlus of aexp * aexp
| AMinus of aexp * aexp
| AMult of aexp * aexp

type bexp =
| BTrue
| BFalse
| BEq of aexp * aexp
| BLe of aexp * aexp
| BNot of bexp
| BAnd of bexp * bexp

val aeval : state -> aexp -> int

val beval : state -> bexp -> bool

type com =
| CSkip
| CAss of id * aexp
| CSeq of com * com
| CIf of bexp * com * com
| CWhile of bexp * com

val ceval_step : state -> com -> int -> state option

