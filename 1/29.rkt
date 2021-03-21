#lang racket

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))
    )
)

(define (round-to-next-even x) 
    (+ x (remainder x 2))) 

(define (cube a) (* a a a))

(define (inc n) (+ n 1))

(define (simpson f a b n)
    (define fixed-n (round-to-next-even n)) 
    (define h (/ (- b a) fixed-n))
    (define (simpson-term k)
        (define y (f (+ a (* k h))))
        (cond ((or (= k 0) (= k fixed-n)) y)
              ((even? k) (* 2 y))
              (else (* 4 y))))
    (* (/ h 3) (sum simpson-term 0 inc fixed-n)))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)
