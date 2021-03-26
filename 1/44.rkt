#lang racket

(define dx 0.000001)

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n) 
  (if (> n 1) 
      (lambda (x) ((compose (repeated f (- n 1)) f) x)) 
      f))

(define (smooth f)
    (lambda (x) (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3)))

((repeated (smooth square) 0.5) 1.0)
