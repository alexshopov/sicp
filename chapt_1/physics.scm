#lang sicp

; kinematic position function
(define position (lambda (a v u t)
  (+ u (* v t) (* .5 a (* t t)))))

(display (position 0 0 0 0))
(display (position 0 0 20 0))
(display (position 0 5 10 10))
(display (position 5 5 5 5))