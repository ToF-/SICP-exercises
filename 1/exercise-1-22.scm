
(define (timed-prime-test n runs)
  (start-prime-test n (runtime) runs))

(define (start-prime-test n start-time runs)
  (prime? n)
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

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(measure-time-for-primes primes-list)

; |        1013 |   0.03 |
; |        1019 |   0.03 |
; |       10007 |   0.10 |
; |       10009 |   0.11 |
; |       10037 |   0.10 |
; |      100003 |   0.34 |
; |      100019 |   0.34 |
; |      100043 |   0.33 |
; |     1000003 |   1.02 |
; |     1000033 |   1.02 |
; |     1000037 |   1.02 |
; |    10000019 |   3.21 |
; |    10000079 |   3.23 |
; |    10000103 |   3.29 |
; |   100000007 |  10.28 |
; |   100000037 |  10.34 |
; |   100000039 |  10.30 |
; |  1000000007 |  32.28 |
; |  1000000009 |  32.03 |
; |  1000000021 |  32.33 |
; | 10000000019 | 102.25 |
; | 10000000033 | 103.95 |
; | 10000000061 | 104.08 |
