#lang racket

(define (runtime) 
  (current-milliseconds))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100000) (print-prime n start-time) #f))

(define (print-prime n start-time)
    (display n)
    (display " *** ")
    (display (- (runtime) start-time))
    (newline)
)

(define (square a) (* a a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(timed-prime-test 1009) 
(timed-prime-test 1013) 
(timed-prime-test 1019) 
(timed-prime-test 10007) 
(timed-prime-test 10009) 
(timed-prime-test 10037) 
(timed-prime-test 100003) 
(timed-prime-test 100019) 
(timed-prime-test 100043) 
(timed-prime-test 1000003) 
(timed-prime-test 1000033) 
(timed-prime-test 1000037)

; 1009 *** 19
; 1013 *** 20
; 1019 *** 21
; 10007 *** 24
; 10009 *** 24
; 10037 *** 25
; 100003 *** 28
; 100019 *** 30
; 100043 *** 29
; 1000003 *** 35
; 1000033 *** 34
; 1000037 *** 36
;
; log 1000000 = log 10 + log 100000 = 2 log 10 + log 10000 = 3 log 10 + log 1000
; Время увеличивается на константную величину, что означает логарифмическую зависимость.
;