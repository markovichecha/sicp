#lang racket

(define (square a) (* a a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (fast-prime? n times)
  (cond ((= times n) true)
        ((fermat-test n times) (fast-prime? n (+ times 1)))
        (else false)))

(fast-prime? 561 1)
(fast-prime? 1105 1)
(fast-prime? 1729 1)
(fast-prime? 2465 1)
(fast-prime? 2821 1)
(fast-prime? 6601 1)
