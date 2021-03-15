#lang racket

(define (square a) (* a a))

(define (sum-of-squares a b) (+ (square a) (square b)))

(define (sum-of-squares-two-larger a b c)
    (if (>= a b) (if (>= b c) (sum-of-squares a b) (sum-of-squares a c)) (if (>= a c) (sum-of-squares a b) (sum-of-squares b c)))
)

(sum-of-squares-two-larger 3 5 2) ; 3^2 + 5^2 = 34
