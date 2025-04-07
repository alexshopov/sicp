#lang sicp 

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
(display (cbrt 1.0))

; expect ~1.2599...
(display (cbrt 2.0))

; expect ~1.4422...
(display (cbrt 3.0))

; expect ~1.5874...
(display (cbrt 4.0))

; expect ~2.0000...
(display (cbrt 8.0))


