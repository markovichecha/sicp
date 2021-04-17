#lang racket

(require "extra/accumulate.rkt")
(require "extra/flatmap.rkt")
(require "extra/enumerate.rkt")

(define (sum-thirds n s)
    (filter (lambda (x) (= (accumulate + 0 x) s)) (unique-triples n)))

(define (unique-triples n) 
    (flatmap (lambda (i) 
          (flatmap (lambda (j) 
                (map (lambda (k) (list i j k)) 
                     (enumerate-interval 1 (- j 1)))) 
                   (enumerate-interval 1 (- i 1)))) 
             (enumerate-interval 1 n)))

(sum-thirds 5 10)
