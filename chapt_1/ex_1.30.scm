#lang sicp

; iterative version of sum
(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ (term a) result))))
    (iter a 0))

; use lambdas to create an identity and incrementer function
(define (sum-integers a b)
    (sum (lambda (x) x)
         a
         (lambda (x) (+ x 1))
         b))

; expect 55
(display (sum-integers 1 10))
