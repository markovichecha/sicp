#lang racket

(define (for-each proc items)
    (proc (car items))
    (if (null? (cdr items))
        #t
        (for-each proc (cdr items))))

(for-each (lambda (x) (display x) (newline)) (list 57 321 88))
