
; describe the behavior of the following procedure:
;
(define (a-plus-abs-b a b)
   ((if (> b 0) + -) a b))

; the procedure tests if b is positive : if yes, it adds a and b, if no, it subtracts b from a
