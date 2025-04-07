#lang sicp

; accumulator recursive
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner
      (term a)
      (accumulate combiner null-value term (next a) next b))))


; accumulator recursive
(define (accumulate-iterative combiner null-value term a next b)
  (define (accum a result)
    (if (> a b)
      result
      (accum (next a) (combiner (term a) result))))
    (accum a null-value))


(define (inc n) (+ n 1))

(define (identity a) a)

(define (sum a b)
    (accumulate + 0 identity a inc b))

(define (sum-iter a b)
    (accumulate-iterative + 0 identity a inc b))

; expect 55
(display (sum 1 10))
(display (sum-iter 1 10))

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (accumulate + 0 cube a inc b))

(define (sum-cubes-iter a b)
  (accumulate-iterative + 0 cube a inc b))

; expect 3025
(display (sum-cubes 1 10))
(display (sum-cubes-iter 1 10))
