(load "utils/io.scm")

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
(println (f 1 1 1))

; should return 5
(println (f 1 1 2))

; should return 8
(println (f 2 1 2))

; should return 13
(println (f 1 2 3))
(println (f 1 3 2))
(println (f 3 1 2))
