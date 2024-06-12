(load "utils/io.scm")

(define (countdown x y)
    (println x)
    (if (> x y)
        (countdown (-1+ x) y)))

(define (count x y)
    (println x)
    (if (< x y)
        (count (1+ x) y)))

(count 0 10)
(newline)
(countdown 10 5)
