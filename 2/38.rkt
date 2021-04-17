#lang racket

(require "extra/accumulate.rkt")

(fold-right / 1.0 (list 1 2 3)) ; 1.5
(fold-left / 1.0 (list 1 2 3)) ; 0.16
(fold-right list '() (list 1 2 3)) ; '(1 (2 (3 ())))
(fold-left list '() (list 1 2 3)) ; '(((() 1) 2) 3)

; процесс op должен быть таким, чтобы (op Xn Xn-1) == (op Xn-1 Xn) 
; и начинаться с единицы группы (0 для сложения, 1 для умножения) 

