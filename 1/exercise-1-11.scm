; a function f is defined by the rule that f(n) = n if n < 3 and f(n) = f(n-1)-2f(n-2)-3f(n-3) if n ≥ 3.
; write a procedure that computes f by means of a recursive process.
; write a procedure that computes f by means of an iterative process.

(define (f-rec n)
  (cond ((< n 3) n)
        (else (- (- (f-rec (- n 1)) (* 2 (f-rec (- n 2)))) (* 3 (f-rec (- n 3)))))))

; (f-rec 3)
; → (cond ((< 3 3) n) (else (- (- (f-rec (- 1 n)) (* 2 (f-rec (- n 2)))) (* 3 (f-rec (- n 3))))))
; → (- (- (f-rec (- 1 n)) (* 2 (f-rec (- n 2)))) (* 3 (f-rec (- n 3))))
; → (- (- (f-rec 2) (* 2 (f-rec 1))) (f-rec 0))
; → (- (- 2 (* 2 1)) 0)
; → (- (- 2 2) 0)
; → (- (


; (map f-rec (list 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22))
; → (0 -7 -13 1 48 85 -14 -328 -555 143 2237 3616 -1287 -15230 -23504 10817 103515 152393 -87088 -702419)
;          A-2B-3C       A            B           C
; n        f(n)       f(n-1)       f(n-2)      f(n-3)
; 0          0           0            0           1
; 1          1           1            1           1
; 2          2           2            2           2
; 3          0           2            1           0
; 4         -7           0            2           1
; 5        -13          -7            0           2


(define (f n)
  (if (< n 3)
    n
    (f-iter n 2 1 0)))

(define (f-iter n a b c)
  (if (< n 3)
    a
    (f-iter (- n 1) (- (- a (* 2 b)) (* 3 c)) a b)))

; (map f (list 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22))
; →  (0 -7 -13 1 48 85 -14 -328 -555 143 2237 3616 -1287 -15230 -23504 10817 103515 152393 -87088 -702419)

