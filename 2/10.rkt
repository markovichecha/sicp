#lang racket

(require "extra/2.1.4.rkt")

(define (div-interval x y)
    (if (< (lb y) 0) (error "Interval y spans zero") (mul-interval x 
                (make-interval (/ 1.0 (ub y))
                               (/ 1.0 (lb y))))))

(div-interval (make-interval 1 2) (make-interval -1 2))
