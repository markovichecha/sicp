#lang racket

(define (last-pair pair) 
    (if (null? (cdr pair)) (car pair) (last-pair (cdr pair))))

(last-pair (list 23 72 149 34))
