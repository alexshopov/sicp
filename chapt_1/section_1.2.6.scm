#lang sicp

(define (square x) (* x x))

; Testing for primality by checking divisors
(define (prime? n)
    ; find the smallest integral divisor by testing successive integers
    (define (smallest-divisor n)
        ; does b divide evenly into a?
        (define (divides? a b)
            (= (remainder b a) 0))

        (define (find-divisor n test-divisor)
            (define (next n)
                (if (= n 2)
                    3
                    (+ n 2)))
            (cond ((> (square test-divisor) n) n)
                ((divides? test-divisor n) test-divisor)
                (else (find-divisor n (next test-divisor)))))
        (find-divisor n 2))

    (= n (smallest-divisor n)))

; Fermat's Little Theorem
(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
              (remainder (square (expmod base (/ exp 2) m))
                          m))
          (else
              (remainder (* base (expmod base (- exp 1) m))
                          m))))
                    
(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))

(display (fast-prime? 23 5))
