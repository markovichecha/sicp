#lang racket

(define (square x) (* x x))

(define (even? n) (= (remainder n 2) 0))

(define (lisa-expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


(expmod 2 2 3)
(remainder (square (expmod 2 1 3)) 3)
(remainder (square (remainder (* 2 (expmod 2 0 3)) 3)) 3)
(remainder (square (remainder (* 2 1) 3)) 3)
(remainder (square (remainder 2 3)) 3)
(remainder (square 2) 3)
(remainder 4 3)
1

(lisa-expmod 2 2 3)
(remainder (fast-expt 2 2) 3)
(remainder (square (fast-expt 2 1)) 3)
(remainder (square (* 2 (fast-expt 2 0))) 3)
(remainder (square (* 2 1)) 3)
(remainder (square 2) 3)
(remainder 4 3)
1

; Оригинальный вариант расчета не создает с большими числами, а работает над частью числа. Работа с маленькими числами выполняется быстрее.
; Вариант Лизы сначала полностью высчитывает число целиком, что замедляет работу программы при работе с большими числами.
; На маленьких числах время выполнения программы отличаться не будет.
;