#lang racket 

(define (runtime) 
  (current-milliseconds))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n) (print-prime n start-time) #f))

(define (print-prime n start-time)
    (display n)
    (display " *** ")
    (display (- (runtime) start-time))
    (newline)
    #t
)

(define (square a) (* a a))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes n count) 
    (when (> count 0)
        (if (timed-prime-test (+ n 2)) (search-for-primes (+ n 2) (- count 1)) (search-for-primes (+ n 2) count))))

(search-for-primes 100000000001 3)
(search-for-primes 1000000000001 3)
(search-for-primes 10000000000001 3)
(search-for-primes 100000000000001 3)

; 100000000003 *** 2
; 100000000019 *** 2
; 100000000057 *** 2
; 1000000000039 *** 6
; 1000000000061 *** 5
; 1000000000063 *** 6
; 10000000000037 *** 18
; 10000000000051 *** 19
; 10000000000099 *** 18
; 100000000000031 *** 59
; 100000000000067 *** 59
; 100000000000097 *** 59

; sqrt(10) = 3.16
; 2 * 3.16 = 6.3 ~ 5-6
; 6 * 3.16 = 18.9 ~ 18-19
; 19 * 3.16 = 60.08 ~ 59
