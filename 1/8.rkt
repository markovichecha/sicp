#lang racket

(define (square x) (* x x))

(define (improve guess x) (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? previous-guess guess)
  (< (abs (- previous-guess guess)) 0.000000001))

(define (sqrt-iter previous-guess guess x)
  (if (good-enough? previous-guess guess)
          guess
          (sqrt-iter guess (improve guess x) x)))

(sqrt-iter 0.0 1.0 (* 5 5 5))
