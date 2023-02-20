;;; 09-armstrong-number.el --- armstrong-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'seq)

(defun armstrong-p (num)
  "Define if `NUM' is an Armstrong number.

An Armstrong number is a number that is the sum of its own digits
each to the power of the number of digits.

Exercise page:

- https://exercism.org/tracks/emacs-lisp/exercises/armstrong-numbers"
  (let* ((string-num (number-to-string num))
         (num-size (length string-num))
         (calc-result (seq-reduce
                       (lambda (acc x) (+ acc (expt (- x ?0) num-size)))
                       string-num
                       0)))
    (= num calc-result)))

;; Test
;; (armstrong-p 9)
;; (armstrong-p 10)
;; (armstrong-p 153)
;; (armstrong-p 154)

(provide 'armstrong-numbers)
;;; 09-armstrong-number.el ends here
