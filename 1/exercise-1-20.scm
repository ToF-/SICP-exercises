; consider the iterative gcd procedure given above.
; Suppose we were to interpret this procedure using normal-order evaluation
; Using the substitution method (for normal order), illustrate the process generated in evaluating (gcd 206 40)
; and indicate the remainder operations that are actually performed.
; How many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation?

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; (if (= b_ 0) a_ (gcd b_ (remainder a_ b_)))

; R = # executions of remainder
; (gcd 206 40)
; (if (= 40 0) 40 (gcd 40 (remainder 206 40)))
; (gcd 40 (remainder 206 40))
; (if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
; R=(+ 1)
; (if (= 6 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; (if (= (remainder 40 (remainder 206 40)) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; R=(+ 1 2)
; (if (= 4 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
; R=(+ 1 2 4)
; (if (= 2 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
; R=(+ 1 2 4 7)
; (if (= 0 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))ww
; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
; R=(+ 1 2 4 7 4)
; 2
; remainder was evaluated 18 times

(define (premainder a b)
  (display ">")
  (remainder a b))

(define (gcdr a b)
  (if (= b 0)
      a
      (gcdr b (premainder a b))))

; premainder was evaluated 4 times
