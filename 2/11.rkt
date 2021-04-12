#lang racket

(require "extra/2.1.4.rkt")

(define (mul-interval x y)
  (let ((lx (lb x)) 
        (ux (ub x)) 
        (ly (lb y)) 
        (uy (ub y)))
  (cond ((> lx 0) (cond ((> ly 0) (make-interval (* ux uy) (* lx ly)))
                        ((> uy 0) (make-interval (* lx ly) (* ux uy)))
                        (else (make-interval (* ux ly) (* ux uy))))
         (> ux 0) (cond ((> ly 0) (make-interval (* lx ly) (* ux uy)))
                        ((> uy 0) (make-interval (min (* lx uy) (* ux ly)) (max (* lx ly) (* ux uy))))
                        (else (make-interval (* lx uy) (* lx ly)))))
         (else (cond ((> ly 0) (make-interval (* lx uy) (* lx ly)))
                     ((> uy 0) (make-interval (* lx uy) (* lx ly)))
                     (else (make-interval (* ux uy) (* lx ly))))))))

(mul-interval (make-interval 1 2) (make-interval 3 4))
