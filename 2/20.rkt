#lang racket

(define (same-parity first . numbers)
    (define (same-parity? number)
        (= (remainder (- first number) 2) 0))
    (define (reduce numbers)
        (if (null? numbers) '() 
                            (if (same-parity? (car numbers)) (cons (car numbers) (reduce (cdr numbers))) 
                                                             (reduce (cdr numbers)))))
    (cons first (reduce numbers)))
    

(same-parity 1 2 3 4 5 6 7)    
(same-parity 2 3 4 5 6 7)    
