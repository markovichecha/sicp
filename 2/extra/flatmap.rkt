#lang racket

(require "accumulate.rkt")

(provide flatmap)

(define (flatmap proc seq)
    (accumulate append '() (map proc seq)))
