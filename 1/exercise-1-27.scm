
(define (rem a b)
  (remainder a b))

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= 0 exp) 1)
        ((even? exp)
         (rem
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (rem (* base (expmod base (- exp 1) m))
               m))))

(define (carmichael-number? n)
  (define (try-it n a)
    (cond ((= a 1) #t)
          ((not (= (expmod a n n) a)) #f)
          (else (try-it n (- a 1)))))
  (try-it n (- n 1)))

(display (carmichael-number? 561))  (newline)
(display (carmichael-number? 1105)) (newline)
(display (carmichael-number? 1729)) (newline)
(display (carmichael-number? 2465)) (newline)
(display (carmichael-number? 2821)) (newline)
(display (carmichael-number? 6601)) (newline)
