#lang racket

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? previous-guess guess)
  (< (abs (- previous-guess guess)) 0.000000001))

(define (sqrt-iter previous-guess guess x)
  (if (good-enough? previous-guess guess)
          guess
          (sqrt-iter guess (improve guess x) x)))

(sqrt-iter 0.0 1.0 100)
