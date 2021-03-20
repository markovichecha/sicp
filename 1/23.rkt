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
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next n)
    (if (= n 2) 3 (+ n 2))
)

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes n count) 
    (when (> count 0)
        (if (timed-prime-test (+ n 2)) (search-for-primes (+ n 2) (- count 1)) (search-for-primes (+ n 2) count))))

(search-for-primes 100000000001 3)
(search-for-primes 1000000000001 3)
(search-for-primes 10000000000001 3)
(search-for-primes 100000000000001 3)

; 100000000003 *** 1 -> 2/1 = 2
; 100000000019 *** 1 -> 2/1 = 2
; 100000000057 *** 1 -> 2/1 = 2
; 1000000000039 *** 3 -> 6/3 = 2
; 1000000000061 *** 2 -> 5/2 = 2.5
; 1000000000063 *** 3 -> 6/3 = 2
; 10000000000037 *** 9 -> 18/9 = 2
; 10000000000051 *** 9 -> 19/9 = 2.1
; 10000000000099 *** 8 -> 18/8 = 2.25
; 100000000000031 *** 29 -> 59/29 = 2.03
; 100000000000067 *** 29 -> 59/29 = 2.03
; 100000000000097 *** 29 -> 59/29 = 2.03
;  
; Двукратное ускорение проверки на больших числах, на маленьких ветвление будет тратить меньше времени в соотношении.
;