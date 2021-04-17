#lang racket

(require "extra/flatmap.rkt")
(require "extra/enumerate.rkt")
(require math/number-theory)

(define (unique-pairs x)
    (flatmap (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 x)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(prime-sum-pairs 5)
(unique-pairs 5)

