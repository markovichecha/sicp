#lang racket

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(define (fast-multiply a b)
    (fast-multiply-iter a b 0)
)

(define (fast-multiply-iter a counter product)
    (cond ((= counter 0) product)
          ((even? counter) (fast-multiply-iter (double a) (halve counter) product))
          (else (fast-multiply-iter a (- counter 1) (+ product a))))
)

(fast-multiply 11 123)
(fast-multiply 0 123)
(fast-multiply 123 0)
