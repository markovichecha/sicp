#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(sqrt-iter 1.0 25)

; При вычислении sqrt с использованием if как процедуры sqrt-iter будет вызываться бесконечно.
; Потому что мы передаем рекурсивную процедуру, в процедуру, которая вызывает эту процедуру, а вычисляться
; она будет всегда из-за апликкативного порядка вычислений.

(define (rec a b)
    (if (= a b) a (rec (- a 1) b)))
