#lang racket

(define (reverse items) 
  (define (reverse-iter source result) 
    (if (null? source) 
        result 
        (reverse-iter (cdr source) (cons (car source) result)))) 
  (reverse-iter items (list)))

(reverse (list 1 4 9 16 25))
    