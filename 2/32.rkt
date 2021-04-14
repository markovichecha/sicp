#lang racket

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (ss) (cons (car s) ss)) rest)))))

(subsets '(1 2 3))
