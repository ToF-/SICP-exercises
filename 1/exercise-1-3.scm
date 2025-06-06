
; define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers

(define (p a b c)
  (if (> a b)
    (if (> b c)
      (+ (* a a) (* b b))
      (+ (* a a) (* c c)))
    (if (> a c)
      (+ (* b b) (* a a))
      (+ (* b b) (* c c)))))


