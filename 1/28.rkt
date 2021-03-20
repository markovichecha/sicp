#lang racket

(define (square a) (* a a))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
            (remainder-or-trivial (expmod base (/ exp 2) m) m))
          (else
            (remainder (* base (expmod base (- exp 1) m)) m))))

(define (remainder-or-trivial k m)
    (define (is-trivial? k m r)
        (if (and (not (= k 1)) 
           (not (= k (- m 1))) 
           (= r 1)) 
            0 
        r))
    (is-trivial? k m (remainder (square k) m))
)

(define (miller-rabin-test n)
    (define (miller-rabin-iteration a t n) 
        (define (try-it a) 
            (= (expmod a (- n 1) n) 1)) 
        (if (= a n) 
            (> t (/ n 2)) 
            (if (try-it a) 
            (miller-rabin-iteration (+ a 1) (+ t 1) n) 
            (miller-rabin-iteration (+ a 1) t n)))) 
    (miller-rabin-iteration 1 0 n))


(miller-rabin-test 97)
(newline)
(miller-rabin-test 100)
(miller-rabin-test 561)
(miller-rabin-test 1105)
(miller-rabin-test 1729)
(miller-rabin-test 2465)
(miller-rabin-test 2821)
(miller-rabin-test 6601)
