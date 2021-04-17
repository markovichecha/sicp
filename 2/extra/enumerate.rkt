#lang racket

(require "accumulate.rkt")

(provide enumerate-interval)

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))
