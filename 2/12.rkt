#lang racket

(require "extra/2.1.4.rkt")

(define (make-center-percent center percent)
    (make-center-width center (/ (* center percent) 100)))

(define (percent interval)
    (* (/ (width interval) (center interval)) 100))
    
(make-center-percent 4 25)

(percent (make-interval 3 5))

(center (make-interval 3 5))
