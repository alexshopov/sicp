#lang sicp

; tree-recursive implementation
(define (fib-tree n)
  (cond
    [(= n 0) 0]
    [(= n 1) 1]
    [else (+ (fib-tree (- n 1)) (fib-tree (- n 2)))]))

; expect 55
(display (fib-tree 10)) (newline)

; iterative implementation
; use the parameter list of the fib-iter function as a means for changing state
(define (fib-iter a b n)
  (if (= n 0)
    b
    (fib-iter (+ a b) a (- n 1))))

; expect 55
(display (fib-iter 1 0 10)) (newline)
