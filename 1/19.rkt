#lang racket

(define (fib n)
  (define (even? x)
    (= (remainder x 2) 0))
  (define (fib-iter p-acc q-acc p q n)
    (cond ((= n 0) q-acc)
          ((even? n) (fib-iter
                      p-acc
                      q-acc
                      (+ (* p p) (* q q))
                      (+ (* 2 p q) (* q q))
                      (/ n 2)))
          (else (fib-iter
                 (+ (* p p-acc) (* q q-acc))
                 (+ (* p q-acc) (* q p-acc) (* q q-acc))
                 p
                 q
                 (- n 1)))))
  (fib-iter 1 0 0 1 n))


(fib 0)
(fib 1)
(fib 2)
(fib 5)
(fib 6)
(fib 19)
(fib 20)
