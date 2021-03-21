#lang racket

(define (recursive-sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (recursive-sum term (next a) next b))
    )
)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (inc a) (+ a 1))

(define (identity x) x)

(define (sum-integers-recursive a b)
    (recursive-sum identity a inc b)
)

(define (sum-integers a b)
    (sum identity a inc b)
)

(sum-integers 1 10)
(sum-integers-recursive 1 10)
