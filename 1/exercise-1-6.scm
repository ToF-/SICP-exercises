
; this is a new if function that is not relying on a special form

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; but when we use it in the the square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; what happens is that during the evaluation of sqrt-iter, both guess and the recursive call to sqrt-iter will be evaluated, leading to a stack overflow
