#lang racket

(define (cons x y)
    (define dispatch
        (if (and (> x -1) (> y -1)) 
            (* (expt 2 x) (expt 3 y))
            (error "X or Y < -1 -- CONS")))
    dispatch)

(define (car pair)
    (factor 2 pair))

(define (cdr pair)
    (factor 3 pair))

(define (factor x pair)
    (define (factor-iter power pair-value)
        (if (= (remainder pair-value x) 0)
            (factor-iter (+ power 1) (/ pair-value x))
            power))
    (factor-iter 0 pair))

(cons 1 2)
(car (cons 1 2))
(cdr (cons 1 2))

(cons 3 2)
(car (cons 3 2))
(cdr (cons 3 2))
