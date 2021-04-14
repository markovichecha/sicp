#lang racket

(define x '((1 2) (3 4) (5 6)))

(define (reverse items) 
  (define (reverse-iter source result) 
    (if (null? source) 
        result 
        (reverse-iter (cdr source) (cons (car source) result)))) 
  (reverse-iter items '()))

(define (deep-reverse items)
    (define (deep-reverse-iter source result)
        (cond ((null? source) result)
              ((pair? (car source)) (deep-reverse-iter (cdr source) (cons (deep-reverse-iter (car source) '()) result)))
              (else (deep-reverse-iter (cdr source) (cons (car source) result)))))
    (deep-reverse-iter items '()))

(reverse x)
(deep-reverse x)