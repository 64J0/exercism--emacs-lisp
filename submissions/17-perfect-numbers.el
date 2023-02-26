;;; 17-perfect-numbers.el --- perfect-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun get-proper-divisors (n)
  "Return a list of the proper divisors of the number N."
  (let* ((proper-divisors '(1))
         (max-div (floor (/ n 2)))
         (i 3))
    (when (< n 1)
      (error "Classification is only possible for natural numbers"))
    (when (= 0 (mod n 2))
      (setq proper-divisors (cons 2 proper-divisors)))
    (while (<= i max-div)
      (and (= 0 (mod n i))
           (setq proper-divisors (cons i proper-divisors)))
      (setq i (1+ i)))
    proper-divisors))

(defun classify (n)
  "Return whether the number N is perfect, abundant, or deficient.

Based on Nicomachus classification scheme for positive integers."
  (let* ((proper-divisors (get-proper-divisors n))
         (aliquot-sum (apply '+ proper-divisors)))
    (cond ((or (> n aliquot-sum)
                (>= 2 (length proper-divisors))) 'deficient)
          ((= n aliquot-sum) 'perfect)
          (t 'abundant))))

(provide 'perfect-numbers)
;;; 17-perfect-numbers.el ends here
