#lang sicp 

; experimenting with recursive counters

(define (++ x) (+ x 1))
(define (-- x) (- x 1))

(define (countdown x y)
  (display x) (newline)
  (if (> x y)
    (countdown (-- x) y)))
        

(define (count x y)
  (display x) (newline)
  (if (< x y)
    (count (++ x) y)))

(count 0 5)
(newline)
(countdown 10 5)
