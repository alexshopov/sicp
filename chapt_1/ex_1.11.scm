(load "utils/io.scm")

; n < 3  -> f(n) = n
; n >= 3 -> f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3)

(define (f-recursive n)
    (if (< n 3)
        n
        (+ (f-recursive (- n 1))
           (* 2 (f-recursive (- n 2)))
           (* 3 (f-recursive (- n 3))))))

(println (f-recursive 5))

(define (f-iterative n)
    (define (f-iterable a b c count)
        (if (= count 0)
            a
            (f-iterable b c (+ c (* 2 b) (* 3 a)) (- count 1))))
    (f-iterable 0 1 2 n))

(println (f-iterative 5))