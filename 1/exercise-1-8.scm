; Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x,
; then a better approximation is given by the value
;
;  x/y² + 2y
;  ---------
;      3
;
; use this formula to implement a cube root procedure

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) (/ guess 1000000)))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
    guess
    (cube-root-iter (improve guess x) x)))

(define (cube-root x)
  (cube-root-iter 1.0 x))

; (cube-root 0.000042) → .03476026645152336

; (* .03476026645152336 .03476026645152336 .03476026645152336) → 4.200000000963792e-5
