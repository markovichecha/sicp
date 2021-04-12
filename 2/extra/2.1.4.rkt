#lang racket

(provide make-interval ub lb add-interval mul-interval make-center-width center width)

(define (make-interval a b) (cons a b))

(define (lb interval) (car interval))

(define (ub interval) (cdr interval))

(define (add-interval x y)
  (make-interval (+ (lb x) (lb y))
                 (+ (ub x) (ub y))))

(define (mul-interval x y)
  (let ((p1 (* (lb x) (lb y)))
        (p2 (* (lb x) (ub y)))
        (p3 (* (ub x) (lb y)))
        (p4 (* (ub x) (ub y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lb i) (ub i)) 2))

(define (width i)
  (/ (- (ub i) (lb i)) 2))