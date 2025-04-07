#lang sicp

; common template used for these procedures
; (define (<name> a b)
;   (if (> a b)
;       0
;       (+ (<term> a) 
;          (<name> (<next> a) b))))
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (identity a) a)

(define (sum-integers a b)
  (sum identity a inc b))

; expect 55
(display (sum-integers 1 10)) (newline)

(define (sum-cubes a b)
  (sum (lambda (x) (* x x x)) a inc b))

; expect 3025
(display (sum-cubes 1 10))
