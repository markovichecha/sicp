#lang racket

(define (double x) (* x x))

(define (make-segment start-point end-point) (cons start-point end-point))
(define (start-point segment) (car segment))
(define (end-point segment) (cdr segment))

(define (segment-length segment) 
    (sqrt (+ 
        (double (- (x-point (end-point segment)) 
                   (x-point (start-point segment))))
        (double (- (y-point (end-point segment)) 
                   (y-point (start-point segment)))))))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-rectangle first-point second-point) (cons first-point second-point))
(define (first-point rectangle) (car rectangle))
(define (second-point rectangle) (car rectangle))
(define (first-segment rectangle) (make-segment (x-point (first-point rectangle)) (y-point (second-point rectangle))))
(define (second-segment rectangle) (make-segment (y-point (second-point rectangle)) (x-point (second-point rectangle))))

(define (rectangle-height rectangle) (segment-length (first-segment rectangle)))
(define (rectangle-width rectangle) (segment-length (second-segment rectangle)))

(define (perimeter rectangle)
    (+ (* (rectangle-height rectangle) 2)
       (* (rectangle-width rectangle) 2)))

(define (square rectangle)
    (* (rectangle-height rectangle)
       (rectangle-width rectangle)))

(square (make-rectangle (make-segment (make-point 0 0) (make-point 10 0)) 
                        (make-segment (make-point 0 0) (make-point 0 10))))

(perimeter (make-rectangle (make-segment (make-point 0 0) (make-point 10 0)) 
                           (make-segment (make-point 0 0) (make-point 0 10))))