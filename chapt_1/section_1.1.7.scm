(load "utils/io.scm")

; calculate square roots using the sqrt method developed by Heron of Alexandria
; circa first century ACE

(define (heron-sqrt x)
    (define tolerance .00001)

    (define (average x y)
        (/ (+ x y) 2))

    (define (improve y)
        (average y (/ x y)))

    (define (good-enough? y)
        (< (abs (- (* y y) x)) tolerance))

    (define (try y)
        (if (good-enough? y)
                y
                (try (improve y))))

    (try 1)
)

; expect ~1.414...
(println (heron-sqrt 2.0))

; expect ~1.732...
(println (heron-sqrt 3.0))

; expect ~2.000...
(println (heron-sqrt 4.0))
