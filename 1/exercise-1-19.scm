; There is a clever algorithm for computing the Fibonacci numbers in a logarithmic number of steps. Recall the transformation of the state variables 
; a and b in the fib-iter process of 1.2.2: a ← a + b and b ← a. Call this transformation T , and observe that applying T over and over again n times,
; starting with 1 and 0, produces the pair Fib(n + 1) and Fib(n).
; In other words, the Fibonacci numbers are produced by applying Tⁿ, the nth power of the transformation T, starting with the pair (1, 0).
; Now consider T to be the special case of p = 0 and q = 0 in a family of transformations Tpq,
; where Tpq transforms the pair (a,b) according to a ← b q + a q + a p and b ← b p + a q.
; Show that if we apply such a transformation Tpq twice, the effect is the same as using a single transformation Tp′q′ of the same form,
; and compute p' and q' in terms of p and q.
; This gives us an explicit way to square these transformations, and thus we can compute Tn using successive squaring, as in the fast-expt procedure.
; Put this all together to complete the following procedure, which runs in a logarithmic number of steps

(define (fibo n)
  (fibo-iter 1 0 n))

(define (fibo-iter a b count)
  (cond ((= count 0)
         b)
        (else
          (fibo-iter (+ a b) a (- count 1)))))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter a
                   b
                   ; ⟨??⟩  ;compute p'
                   (+ (* p p) (* q q))
                   ; ⟨??⟩  ;compute q'
                   (+ (* 2 q p) (* q q))
                   (/ count 2)))
        (else
         (fib-iter (+ (* b q)
                      (* a q)
                      (* a p))
                   (+ (* b p)
                      (* a q))
                   p
                   q
                   (- count 1)))))


; T with a=1, b=0   : T → a ← a+b, b ← a
;                     T → a ← 1, b ← 1
; T with a=1, b=1   : T → a ← a+b, b ← a
;                     T → a ← 2, b ← 1
; T with a=2, b=1   : T → a ← a+b, b ← a
;                     T → a ← 3, b ← 2
; T with a=3, b=2   : T → a ← a+b, b ← a
;                     T → a ← 5, b ← 3
; T with a=5, b=3   : T → a ← a+b, b ← a
;                     T → a ← 8, b ← 5

; Tpq when p=0 and q=0 : Tpq(a,b) → a ← bq+aq+ap , b ← bp+aq
;
; Tpq(a,b) = (bq + aq + ap, bp + aq)
; Tpq(Tpq(a,b)) = Tpq(bq + aq + ap, bp + aq) = ((bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p, (bp + aq)p + (bq + aq + ap)q)
;                                            = (bpq + aq² + bq² + aq² + apq + bqp + aqp + ap², bp² + aqp + bq² + aq² + apq)
;                                            = (bpq + bq² + bqp + aq² + aq² + apq + apq + ap², bp² + bq² + aq² +aqp + apq)
;                                            = (b(2pq + q²) + a(q² + p²) + a(2pq + q²), b(p² + q²) + a(2qp + q²)) = Tp'q'
;                                            → p' = p² + q²
;                                            → q' = 2qp + q²

