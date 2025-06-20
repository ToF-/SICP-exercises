; Fermat's little theorem : if n is prime and 0 < a < n, then a^(n-1) ≡ 1 mod n
; but (Miller Rabin test)
; there can be a non trivial square root of 1 mod n, a number m ≠ 1 and m ≠ (n-1) | m² = 1 mod n
; if m exists, than n is not prime
; if n is odd and not prime, then for some a < n, there's a number m ≠ 1 and m ≠ (n-1) | m² = 1 mod n
; extend the primality test using Fermat's little theorem checked with Miller Rabin test


(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod-checked a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod-checked base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder-square-checked (expmod-checked base (/ exp 2) m) m))
        (else
          (remainder (* base (expmod-checked base (- exp 1) m))
                     m))))

(define (remainder-square-checked x m)
  (if (and (not (or (= x 1)
                    (= x (- m 1))))
           (= (remainder (* x x) m) 1))
    0
    (remainder (* x x) m)))

(define (miller-rabin-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n)
         (miller-rabin-prime? n (- times 1)))
        (else #f)))

(define (timed-prime-test n runs)
  (start-prime-test n (runtime) runs))

(define (start-prime-test n start-time runs)
  (miller-rabin-prime? n 100)
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


