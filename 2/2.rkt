#lang racket

(define (make-segment start-point end-point)
    (cons start-point end-point))

(define (start-point segment) (car segment))

(define (end-point segment) (cdr segment))

(define (make-point x y)
    (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (average a b) 
    (/ (+ a b) 2.0))

(define (midpoint-segment segment)
    (make-point (average (x-point (start-point segment)) 
                         (x-point (end-point segment)))
                (average (y-point (start-point segment)) 
                         (y-point (end-point segment)))))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(print-point (midpoint-segment (make-segment (make-point 1 0) (make-point 5 3))))
