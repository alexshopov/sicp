(load "chapt_1/section_1.26.scm")

; timed test of prime search
(define (timed-prime-test n)
    (define (report-prime prime elapsed-time)
        (newline)
        (display prime)
        (display " *** ")
        (display elapsed-time))

    (define (start-prime-test n start-time)
        (cond ((prime? n)
                  (report-prime n (- (runtime) start-time))
                   #t)
              (else #f)))

    (start-prime-test n (runtime)))


; test the primes starting from a until a number of matches have been found
(define (find-consecutive-primes start matches count)
    (if (= matches count)
        0       
        (find-consecutive-primes
            (+ start 1)
            matches
            (if (timed-prime-test start)
                (+ count 1)
                count))))

(find-consecutive-primes 1000 3 0)
(newline)
(find-consecutive-primes 10000 3 0)
(newline)
(find-consecutive-primes 100000 3 0)
(newline)
(find-consecutive-primes 1000000 3 0)
(newline)


; note: SICP 2nd Edition requests that the time to process each prime be noted.
; When the book was published circa 1996 the time required to test primes < 1M
; was probably significant. Running this example in 2024 on a 2.3 GHz MacBook Pro
; the time to process primes was effectively < .01 seconds, and I had to run the
; test routine against primes > 1B to see any actual duration reported.
(find-consecutive-primes 1000000000 3 0)
