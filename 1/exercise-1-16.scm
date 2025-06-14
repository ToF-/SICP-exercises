; Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps
; Hint: Using the observation that 
;
; (b^(n/2))^2 = (b^2)^(n/2)
;
;  if n is even then
;
;    ab^n = a(b^(n/2))^2 = a(b^2)^(n/2) = a'b'^n' with a' = a, b' = b², n = n/2
;
;  if n is odd then
;
;    ab^n = abb^(n-1) = (ab)b^(n-1) = a'b'n' with a' = ab, b' = b, n' = n-1
;
;
(define (fast-exp-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-exp-iter a (* b b) (/ n 2)))
        (else (fast-exp-iter (* a b) b (- n 1)))))

(define (fast-exp x n)
  (fast-exp-iter 1 x n))

(define (slow-exp x n)
  (cond ((= n 0) 1)
        (else (* x (slow-exp x (- n 1))))))
