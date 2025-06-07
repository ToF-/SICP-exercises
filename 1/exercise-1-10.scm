; the following procedure computes a mathematical function called Ackermann's function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

; what are the values of the following expressions?

; (A 1 10) → 1024

; (A 2 4) → 65536

; (A 3 2) → 4

; consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

(define (k n) (* 5 n m))

; give concise mathematical definitions for the functions computed by the procedures f,g,h and k for positive integer values of n

; (f n) ⇔ 2n
; (g n) ⇔ 2^n
; (h n) ⇔ 2^h(n-1) = 2^2^h(n-2) = 2^2^2…2

