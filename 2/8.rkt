#lang racket

(require "extra/2.1.4.rkt")

(define (sub-interval x y)
    (make-interval (- (lower-bound x) (lower-bound y)) (- (upper-bound x) (upper-bound y))))

(sub-interval (make-interval 1 2) (make-interval 0 1))
