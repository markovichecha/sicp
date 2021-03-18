#lang racket

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

; Сколько раз вызывается P при sine 12.15?
; 
; (sine 12.15)
; (p (sine 4.166))
; (p (p (sine 1.388)))
; (p (p (p (sine 0.462))))
; (p (p (p (p (sine 0.154)))))
; (p (p (p (p (p (sine 0.051))))))
;
; 0.1 <= 12.15/3^x
; 3^x >= 121.5
; 3^4 < 121.5 < 3^5
; x = 5
;
;
; Ответ: 5
;
; Каковы порядки роста количества шагов и памяти?
; a / 3^x <= 0.1
; x >= log3(10a)
; Θ(log n) - шаги
; Θ(log n) - память
