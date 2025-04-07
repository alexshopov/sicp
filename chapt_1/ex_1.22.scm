#lang sicp

(define (square x) (* x x))

; Testing for primality by checking divisors
(define (prime? n)
    ; find the smallest integral divisor by testing successive integers
    (define (smallest-divisor n)
        ; does b divide evenly into a?
        (define (divides? a b)
            (= (remainder b a) 0))

        (define (find-divisor n test-divisor)
            ; next method from ex 1.23
            (define (next n)
                (if (= n 2)
                    3
                    (+ n 2)))
            (cond ((> (square test-divisor) n) n)
                ((divides? test-divisor n) test-divisor)
                (else (find-divisor n (next test-divisor)))))
        (find-divisor n 2))

    (= n (smallest-divisor n)))

; Fermat's Little Theorem
(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
              (remainder (square (expmod base (/ exp 2) m))
                          m))
          (else
              (remainder (* base (expmod base (- exp 1) m))
                          m))))
                    
(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))

; timed test of prime search
(define (timed-prime-test n)
    (define (report-prime prime elapsed-time)
        (newline)
        (display "Prime: ")
        (display prime)
        (display ", elapsed time: ")
        (display elapsed-time))

    (define (start-prime-test n start-time)
        (cond ((prime? n)
                  (report-prime n (- (runtime) start-time))
                   true)
              (else false)))

    (start-prime-test n (runtime)))


; test the primes starting from a given number until n primes have been found
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
; When the book was published circa 1996 the time required to test primes >1M
; was probably significant. Running this example in 2024 on a 2.3 GHz MacBook Pro
; the time to process primes was effectively < .01 seconds. I had to run the
; test routine against primes >1B to see any actual duration reported.
(find-consecutive-primes 1000000000 3 0)
