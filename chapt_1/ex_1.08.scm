(load "utils/io.scm")

; exercise 1.8
; Newton's method for cube roots using the approximation formula
(define (cbrt x)
    (define tolerance .00001)

    (define (cube-approximation y)
        (/ (+ (/ x (* y y)) (* 2 y)) 3))
    
    (define (improve y)
        (cube-approximation y))

    (define (good-enough? y)
        (< (abs (- (* y y y) x)) tolerance))

    (define (try y)
        (if (good-enough? y)
                y
                (try (improve y))))

    (try 1)
)

; expect ~1.0000...
(println (cbrt 1.0))

; expect ~1.2599...
(println (cbrt 2.0))

; expect ~1.4422...
(println (cbrt 3.0))

; expect ~1.5874...
(println (cbrt 4.0))

; expect ~2.0000...
(println (cbrt 8.0))


