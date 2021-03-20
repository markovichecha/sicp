#lang racket

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))
    )
)

; Аппликативный порядок
; (gcd 206 40)
; (remainder 206 40)
; (gcd 40 6)
; (remainder 40 6)
; (gcd 6 4)
; (remainder 6 4)
; (gcd 4 2)
; (remainder 4 2)
; (gcd 2 0)
; 2
;
; Всего 4 вызова remainder
;
;
; Нормальный порядок
;
; (if (= 40 0)
;     206
;     (gcd 40 (remainder 206 40))
;  
; (if (= (remainder 206 40) 0) 
;     40
;     (gcd ...)
;
; (if (= 6 0)
;     40
;     (gcd ...)
;
; > 1
;     
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;
; (if (= (remainder 40 (remainder 206 40)) 0)
;     (remainder 206 40)
;     (gcd ...)
;
; (if (= 4 0)
;     (remainder 206 40)
;     (gcd ...)
;
; > 3
;     
; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;
; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;     (remainder 40 (remainder 206 40))
;     (gcd ...)
;
; (if (= 2 0)
;     (remainder 40 (remainder 206 40))
;     (gcd ...)
;
; > 7
;
; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;
; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;        (gcd ...)
;
; (if (= 0 0)
;        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;        (gcd ...)
;
; > 14
;
; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 
; 
; 2
;
; > 18
; 
; Всего 18 вызовов remainder.
