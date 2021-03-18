#lang racket

(define (pascal a n)
    (cond ((= a 0) 1)
          ((= a n) 1)
          ((> a n) 0)
          (else (+ (pascal (- a 1) (- n 1)) (pascal a (- n 1))))
    )
)

(pascal 3 5)
