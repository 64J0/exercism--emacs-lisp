;;; 10-difference-of-squares.el --- Difference of Squares (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;; Find the difference between the square of the sum and the sum of the square
;; of the first `N' natural numbers.

;; Based on:

;; - https://exercism.org/tracks/emacs-lisp/exercises/difference-of-squares

;;; Code:

(defun sum-of-squares (n)
  "Sum of the square of natural numbers from 0 to `N'."
  (let ((i 0)
        (sum-of-sqr 0))
    (while (<= i n)
      (setq sum-of-sqr (+ (expt i 2) sum-of-sqr))
      (setq i (1+ i)))
    (- sum-of-sqr 0)))

(defun square-of-sum (n)
  "Square of the sum of natural numbers from 0 to `N'."
  (let ((i 0)
        (sqr-of-sum 0))
    (while (<= i n)
      (setq sqr-of-sum (+ i sqr-of-sum))
      (setq i (1+ i)))
    (expt sqr-of-sum 2)))

(defun difference (n)
  "Difference between the square of the sum and the sum of the
square of the first `N' natural numbers."
  (- (square-of-sum n) (sum-of-squares n)))

;; Test
;; (sum-of-squares 10)
;; (square-of-sum 10)
;; (difference 10)

(provide 'difference-of-squares)
;;; 10-difference-of-squares.el ends here
