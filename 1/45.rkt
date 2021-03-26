#lang racket

(define (square x) (* x x))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n) 
  (if (> n 1) 
      (lambda (x) ((compose (repeated f (- n 1)) f) x)) 
      f))

(define (average a b)
  (/ (+ a b) 2))

(define (average-damp f)
    (lambda (x) (average x (f x))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (n-root x n)
    (define (f y) (/ x (fast-expt y (- n 1))))
    (fixed-point ((repeated average-damp (/ n 4)) f) 1.0))

(n-root 128 7)
