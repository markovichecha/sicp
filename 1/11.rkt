#lang racket

(define (f-rec n) 
    (cond ((< n 3) n)
          (else (+ (f-rec (- n 1)) (f-rec (- n 2)) (f-rec (- n 3))))
))

(f-rec 5)

(define (f-it a b c n) 
    (cond ((= n 0) c)
          (else (f-it (+ a b c) a b (- n 1)))))

(f-it 2 1 0 5)
