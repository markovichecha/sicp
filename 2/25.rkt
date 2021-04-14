#lang racket

(define first '(1 3 (5 7) 9))

(car (cdr (car (cdr (cdr first)))))

(define second '((7)))

(car (car second))

(define third '(1 (2 (3 (4 (5 (6 7)))))))

(cadadr (cadadr (cadadr third)))
