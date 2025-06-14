
(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (mult-iter a b)
  (cond ((= b 0) 0)
        ((even? b) (mult-iter (double a) (halve b)))
        (else (+ a (mult-iter a (- b 1))))))


