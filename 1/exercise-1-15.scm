; the sine of an angle (specified in radians) can be computed  by making use of the approximation 
; sin x ≈ x if x is sufficiently small, and the trigonometric identity
;               x          x
; sin x = 3 sin ━ - 4 sin³ ━
;               3          3
; to reduce the size of the argument of sin.
;
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle step)
  (display step) (display ": ") (display angle) (newline)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0) (+ step 1)))))

