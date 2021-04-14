#lang racket

(define (make-mobile left right)
    (list left right))

(define (make-branch length structure)
    (list length structure))

(define mobile (make-mobile (make-branch 1 2) (make-branch 1 (make-mobile (make-branch 3 4) (make-branch 2 2)))))

(define (left-branch mobile)
    (car mobile))

(define (right-branch mobile)
    (cadr mobile))

(define (branch-length branch) 
    (car branch))

(define (branch-structure branch) 
    (cadr branch))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

(define (torque branch) 
    (* (branch-length branch) (total-weight (branch-structure branch)))) 

(define (balanced? mobile) 
    (if (not (pair? mobile)) 
        true 
        (and (= (torque (left-branch mobile)) (torque (right-branch mobile))) 
            (balanced? (branch-structure (left-branch mobile))) 
            (balanced? (branch-structure (right-branch mobile)))))) 

(balanced? (make-mobile (make-branch 2 3) (make-branch 2 3)))
