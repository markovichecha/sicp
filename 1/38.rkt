#lang racket

(define (cont-frac n d k)
    (define (cont-frac-rec i)
        (if (= k i) 
            0
            (/ (n i) (+ (d i) (cont-frac-rec (+ i 1))))))
    (cont-frac-rec 0))

(define (e k)
    (+ (cont-frac 
        (lambda (i) 1) 
        (lambda (i)
            (cond ((= i 0) 1.0)
                  ((= i 1) 2.0)
                  ((= (remainder (- i 1) 3) 0) (- i (- (/ i 3) 1.0)))
                  (else 1.0))) 
        k) 
    2))

(e 100) ; 2.7185592866547665
