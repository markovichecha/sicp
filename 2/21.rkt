#lang racket

(define (square-list items)
    (if (null? items)
        '()
        (cons (expt (car items) 2) (square-list (cdr items)))))

(define (square-list-map items)
    (map (lambda (item) (expt item 2)) items))

(square-list (list 1 2 3 4))
(square-list-map (list 1 2 3 4))
