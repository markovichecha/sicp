#lang racket

(define (r-cc amount kind-of-coins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kind-of-coins 0)) 0)
          (else (+ (r-cc amount (- kind-of-coins 1))
                   (r-cc (- amount (coins kind-of-coins)) kind-of-coins)))
))

(define (coins kind-of-coins) 
  (cond ((= kind-of-coins 1) 1)
    ((= kind-of-coins 2) 5)
    ((= kind-of-coins 3) 10)
    ((= kind-of-coins 4) 25)
    ((= kind-of-coins 5) 50)))

(r-cc 11 5)

; (r-cc 100 5)
; (+ (r-cc 100 4) (r-cc 50 5))
; (+ (+ (r-cc 100 3) (r-cc 75 4)) (+ (r-cc 50 4) (r-cc 0 5)))
; (+ (+ (r-cc 100 3) (r-cc 75 4)) (+ (+ (r-cc 50 3) (r-cc 25 4)) 1))

; x < 5 -> 1
; x = 5 -> x/5 + 1
; x > 5 && x < 10 -> x/5 + 1 
; x = 10 -> 4
; x > 10 && x < 25 -> 9
; x = 25 -> 13
; x > 50