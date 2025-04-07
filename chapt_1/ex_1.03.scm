#lang sicp

; exercise 1.3
; define a procedure that takes three numbers and returns the
; sum of squares of the two larger numbers
(define (f a b c)
    (define (sum-squares x y)
        (+ (* x x) (* y y)))

    (cond ((and (<= a b) (<= a c)) (sum-squares b c))
          ((and (<= b a) (<= b c)) (sum-squares a c))
          (else (sum-squares a b))))

; should return 2
(display (f 1 1 1))

; should return 5
(display (f 1 1 2))

; should return 8
(display (f 2 1 2))

; should return 13
(display (f 1 2 3))
(display (f 1 3 2))
(display (f 3 1 2))
