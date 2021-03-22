#lang racket

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; ф^2 = ф + 1
; ф = ф/ф + 1/ф
; ф = 1 + 1/ф

(define (golden-ratio) 
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
)

(golden-ratio) ; 1.6180327868852458
