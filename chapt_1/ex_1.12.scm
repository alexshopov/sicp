; Pascal's triangle
(define (pascals-triangle n)
    ; return the entry for a given row and column
    (define (pascal-entry row col)
        (cond ((or (= row 1) (= col 1) (= row col)) 1)
              (else (+ (pascal-entry (-1+ row) (-1+ col))
                       (pascal-entry (-1+ row) col)))))

    ; print a row of entries
    (define (print-row row)
        (define (pascal-column col)
            (display (pascal-entry row col)) (display " ")
            (if (= col row)
                (newline)
                (pascal-column (1+ col))))
        (pascal-column 1))

    (define (build-triangle row)
        (print-row row)
        (if (= row n)
            (newline)
            (build-triangle (1+ row))))

    (build-triangle 1)
)

(pascals-triangle 5)
