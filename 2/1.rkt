#lang racket

(define (sign x) 
  (cond ((> x 0) 1) 
        ((< x 0) -1) 
        (else 0)))

(define (make-rat n d) 
  (let ((g (* (gcd (abs n) (abs d)) (sign d)))) 
    (cons (/ n g) (/ d g))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(print-rat (make-rat 1 3)) ; 1/3
(print-rat (make-rat -1 3)) ; -1/3
(print-rat (make-rat 1 -3)) ; -1/3
(print-rat (make-rat -1 -3)) ; 1/3
