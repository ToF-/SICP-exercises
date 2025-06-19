
(define (timed-prime-test n runs)
  (start-prime-test n (runtime) runs))

(define (start-prime-test n start-time runs)
  (fast-prime? n 100)
  (if (= runs 0)
    (- (runtime) start-time)
    (start-prime-test n start-time (- runs 1))))

(define primes-list '(1009
                      1013
                      1019
                      10007
                      10009
                      10037
                      100003
                      100019
                      100043
                      1000003
                      1000033
                      1000037
                      10000019
                      10000079
                      10000103
                      100000007
                      100000037
                      100000039
                      1000000007
                      1000000009
                      1000000021
                      10000000019
                      10000000033
                      10000000061
                      ))

(define runs 1000)

(define (rounded n)
  (/ (round (* n 100)) 100))

(define (measure-time-for-primes l)
  (display "| ")(display (car l))(display " | ")(display (rounded (timed-prime-test (car l) runs)))(display " |")(newline)
  (cond ((null? (cdr l)) 0)
        (else (measure-time-for-primes (cdr l)))))

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else #f)))

(measure-time-for-primes primes-list)

; |        1013 |  0.02 |
; |        1019 |  0.02 |
; |       10007 |  0.07 |
; |       10009 |  0.06 |
; |       10037 |  0.06 |
; |      100003 |  0.21 |
; |      100019 |  0.21 |
; |      100043 |  0.22 |
; |     1000003 |  0.66 |
; |     1000033 |  0.65 |
; |     1000037 |  0.64 |
; |    10000019 |  2.05 |
; |    10000079 |  2.04 |
; |    10000103 |  2.04 |
; |   100000007 |  6.45 |
; |   100000037 |  6.45 |
; |   100000039 |  6.60 |
; |  1000000007 | 20.79 |
; |  1000000009 | 20.69 |
; |  1000000021 | 20.52 |
; | 10000000019 | 65.29 |
; | 10000000033 | 65.23 |
; | 10000000061 | 65.31 |
