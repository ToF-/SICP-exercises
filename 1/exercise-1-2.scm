
; translate the following expression in prefix form

; 5+4+(2-(3-(6+4/5)))
; -------------------
;  3(6-2)(2-7)

(define s (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7))))
(display s)
(newline)

; -37/150
