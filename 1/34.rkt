#lang racket

(define (square x) (* x x))

(define (f g)
    (g 2))

(f square) ; 4

(f (lambda (z) (* z (+ z 1)))) ; 6

(f f) ; При вызове мы получим ошибку, потому что попытаемся вызвать 2 как процедуру, коей 2 не является.
