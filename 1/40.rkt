#lang racket

(define (square x) (* x x))

(define (cube x) (* x x x))

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

(define (newtons-method g guess)
  (define dx 0.000001)
  
  (define (deriv g)
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

  (define (newton-transform g)
    (lambda (x) (- x (/ (g x) ((deriv g) x)))))

  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
    (lambda (x) (+ (* (square x) (+ x a)) (* x b) c)))

(newtons-method (cubic 0 0 -8) 1) ; 2.0
