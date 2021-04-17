#lang racket

(require "extra/accumulate.rkt")

(define (count-leaves t) 
    (accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves x) 1)) t)))

(count-leaves '((1 2) (3 (4 5))))
