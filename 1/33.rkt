#lang racket

(define (filtered-accumulate combiner null-value filter-term term a next b)
    (define (filtered a)
        (if (filter-term a) a null-value))
    (if (> a b)
        null-value
        (combiner (term (filtered a))
            (filtered-accumulate combiner null-value filter-term term (next a) next b))))

(define (square a) (* a a))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next n)
    (if (= n 2) 3 (+ n 2))
)

(define (prime? n)
  (= n (smallest-divisor n)))

(define (inc n) (+ n 1))

(define (sum-of-squares a b) 
    (filtered-accumulate + 0 prime? square a inc b)
)

(sum-of-squares 1 10); 1 + 4 + 9 + 25 + 49 = 88

(define (identity x) x)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (positive-prime-product n)
    (define (simple-gcd a)
        (= (gcd a n) 1)
    )
    (filtered-accumulate * 1 simple-gcd identity 1 inc n)
)

(positive-prime-product 10) ; 1 * 3 * 7 * 9 = 189
