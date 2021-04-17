#lang racket

(require "extra/accumulate.rkt")

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(map (lambda (x) (* x 2)) (list 1 2 3))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2) (list 3 4))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(length (list 1 2 3 4 5))
