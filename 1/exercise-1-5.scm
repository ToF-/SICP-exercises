; given the following two procedures :

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; what will the expression 

(test 0 (p))

; will evaluate to with an intrepreter that uses applicative-order evaluation ?
; and with an interpreter that uses normal-order evaluation ?
; (assume that the if always evaluate its predicate first in both normal and applicative order)

; applicative-order is : evaluate the arguments, then apply

; while normal-order is : fully expand, then reduce


; applicative-order of (test 0 (p)) :
; test is evaluated
;      x is bound to 0
;           0 is evaluated
;      y is bound to (p) 
;           p is evaluated
;                p evaluates to itself indefinitely


; normal-order of (test 0 (p)) :
; test arguments are expanded :
;        (test 0 (p)
;            (if (= 0 0)
;                0
;               (p)))
;
;        (test 0 (p)
;            (if #t
;                0
;               (p)))
;
;        (test 0 (p)
;             0)

; the scheme code evaluates forever

; this haskell code
;
; p = p
; test x y = if x == 0 then 0 else y
; test 0 p

; would return 0

