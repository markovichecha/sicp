#lang racket

(define (square x) (expt x 2))

(define (square-list-first items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items '()))

; Для наглядности возвращения обратного порядка опишем вызовы примера выше:
; (square-list '(2 3 4))
; (iter '(2 3 4) nil)
; (iter '(3 4) '(4))
; (iter '(4) '(9 4))
; (iter '() '(16 9 4))
; '(16 9 4)

(define (square-list-second items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

; (square-list '(2 3 4))
; (iter '(2 3 4) nil)
; (iter '(3 4) '(4))
; (iter '(4) '('(4) 9))
; (iter '() '('('(4) 9) 16)))
; '('('(4) 9) 16))

; Каждый вызов cons создает пару внутри пары, поэтому у нас получится вложенная структура, вместо связного списка
