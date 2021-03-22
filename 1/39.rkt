#lang racket

(define (cont-frac n d k)
    (define (cont-frac-rec i)
        (if (= k i) 
            0
            (/ (n i) (+ (d i) (cont-frac-rec(+ i 1))))))
    (cont-frac-rec 0))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 0) x (- (* x x))))
             (lambda (i) (- (* 2 (+ i 1)) 1))
             k))

(tan-cf 10.0 100) ; 0.6483608274590866
