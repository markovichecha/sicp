#lang racket

(define (cons x y)
    (lambda (m) (m x y)))

(define (car z)
    (z (lambda (p q) p)))

(define (cdr z)
    (z (lambda (p q) q)))

(car (cons 2 1))
; (car (lambda (m) (m 2 1)))
; (lambda (2 1) 2))
; 2

(cdr (cons 2 1))
; (cdr (lambda (m) (m 2 1)))
; (lambda (2 1) 2))
; 2
