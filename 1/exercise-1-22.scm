(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))
    (display " not a prime")))

(define (search-for-primes start-range end-range)
  (if (even? start-range)
    (search-for-primes (+ 1 start-range) end-range)
    (cond ((> start-range end-range)
           (newline)
           (display "done"))
          (else (timed-prime-test start-range)
                (search-for-primes (+ 2 start-range) end-range)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

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

