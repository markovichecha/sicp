#lang racket

(define (cont-frac n d k)
    (define (cont-frac-rec i)
        (if (= k i) 
            0
            (/ (n i) (+ (d i) (cont-frac-rec(+ i 1))))))
    (cont-frac-rec 0))

(+ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)) ; 1.6180

(define (cont-frac-iter n d k)
    (define (iter result i)
        (if (= k i)
            result
            (iter (/ (n i) (+ (d i) result))(+ i 1))))
    (iter 1 0))

(+ 1 (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 10)) ; 1.6180
