(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; good-enough? is using an absolute measure of closeness, that won't work for small numbers
; (sqrt 0.000042) → .03169628944687758 
; (instead of 0.00648074069)

; to fix it, stop iterating when the difference between guess and improve guess is smaller than a margin

(define (sqrt-improved-iter guess x)
  (if (< (abs (- (improve guess x) guess)) (/ guess 10000000))
    guess
    (sqrt-improved-iter (improve guess x) x)))

(define (sqrt-improved x)
  (sqrt-improved-iter 1.0 x))

; (sqrt-improved 0.000042) → 6.480740698446239e-3
