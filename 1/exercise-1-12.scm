
; the following pattern of numbers is called Pascal's triangle
;
;      1
;     1 1
;    1 2 1
;   1 3 3 1
;  1 4 6 4 1

; the numbers at the edge of the triangle are all 1, and each number
; inside the triangle is the sum of the tow numbers above it. 
; write a procedure that computes elements of Pascal's triangle by
; means of a recursive process

; 1
; 1 1
; 1 2 1
; 1 3 3 1
; 1 4 6 4 1

(define (triangle col row)
  (cond ((= row 1) 1)
        ((or (= col 1) (= col row)) 1)
        (else (+
                (triangle (- col 1) (- row 1))
                (triangle col (- row 1))))))
