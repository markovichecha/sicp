#lang racket

(require "extra/accumulate.rkt")

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(reverse '(1 2 3 4))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))

(reverse-left '(1 2 3 4))
