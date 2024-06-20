(load "utils/io.scm")

; iterative version of sum
(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ (term a) result))))
    (iter a 0))

(define (inc n)
    (+ n 1))

(define (identity a) a)

(define (sum-integers a b)
    (sum identity a inc b))

; expect 55
(println (sum-integers 1 10))
