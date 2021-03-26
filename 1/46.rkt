#lang racket

(define (square x) (* x x))

(define (average x y)
      (/ (+ x y) 2))

(define tolerance 0.00001)

(define (iterative-improve good-enough? improve)
  (define (try x)
      (let ((next (improve x)))
        (if (good-enough? x next)
            next
            (try next))))
  try)

(define (sqrt-iter x)
  (define (good-enough? guess next)
    (< (abs (- (square guess) x)) tolerance)) 
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) x))

(sqrt-iter 9.0)

(define (fixed-point f x)
  (define (close-enough? guess next)
    (< (abs (- guess next)) tolerance))
  ((iterative-improve close-enough? f) x))

(define (cube-root x)
  (define (average-damp f)
    (lambda (x) (average x (f x))))
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(cube-root 27)
