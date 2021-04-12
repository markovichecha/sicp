#lang racket

(require "extra/2.1.4.rkt")

(define (sub-interval x y)
    (make-interval (- (lb x) (lb y)) (- (ub x) (ub y))))

(sub-interval (make-interval 1 2) (make-interval 0 1))
