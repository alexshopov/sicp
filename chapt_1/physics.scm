(load "utils/io.scm")

; kinematic position function
(define position
    (lambda (a v u t)
    (+ u
       (* v t)
       (* .5 a (* t t)))))

(println (position 0 0 0 0))
(println (position 0 0 20 0))
(println (position 0 5 10 10))
(println (position 5 5 5 5))