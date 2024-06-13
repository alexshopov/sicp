(load "utils/io.scm")

; Testing for primality by checking divisors
(define (prime? n)
    ; find the smallest integral divisor by testing successive integers
    (define (smallest-divisor n)
        ; does b divide evenly into a?
        (define (divides? a b)
            (= (remainder b a) 0))

        (define (find-divisor n test-divisor)
            (cond ((> (square test-divisor) n) n)
                ((divides? test-divisor n) test-divisor)
                (else (find-divisor n (+ test-divisor 1)))))
        (find-divisor n 2))

    (= n (smallest-divisor n)))
