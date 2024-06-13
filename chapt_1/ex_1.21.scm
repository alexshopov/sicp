(load "utils/io.scm")

; find the smallest divisor of the given numbers
(define (smallest-divisor n)
    ; does b divide evenly into a?
    (define (divides? a b)
        (= (remainder b a) 0))

    (define (find-divisor n test-divisor)
        (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (find-divisor n 2))

; prime
(println (smallest-divisor 199))

; prime
(println (smallest-divisor 1999))

; not prime
(println (smallest-divisor 19999))
