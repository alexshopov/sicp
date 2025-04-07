#lang sicp

; perform integer multiplication by means of repeated addition
(define (* a b)
  (if (= b 0)
    0
    (+ a (* a (- b 1)))))

(display (* 2 3))