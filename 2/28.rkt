#lang racket

(define x '((1 2) (3 4)))

(define (fringe items)
    (cond ((null? items) '())
          ((pair? (car items)) (append (fringe (car items)) (fringe (cdr items))))
          (else (cons (car items) (fringe (cdr items))))))

(fringe (list x x))
