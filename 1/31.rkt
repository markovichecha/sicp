#lang racket

(define (product term a next b)
    (if (> a b)
        1
        (* (term a)
            (product term (next a) next b))))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (factorial n)
    (product identity 1 inc n)
)

(factorial 5)

(define (pi)
    (define (pi-term k)
        (if (even? k) (/ (+ k 2) (+ k 1)) (/ (+ k 1) (+ k 2))))
    (* 4 (product pi-term 1 inc 6))
)

(pi)

(define (product-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

(define (factorial-iter n)
    (product-iter identity 1 inc n)
)

(factorial-iter 5)
