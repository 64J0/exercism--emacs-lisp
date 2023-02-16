;;; 08-trinary.el --- Trinary (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Character-Type.html

;;; Code:

(require 'seq)
(require 'subr-x)

(defun trinary-to-decimal (trinary-number-string)
  "Convert a trinary `TRINARY-NUMBER-STRING', represented as a string, to its decimal equivalent."
  (let ((power-base 3)
        (place -1)
        (initial-value 0))
    (if (string-match "^[0-2]+$" trinary-number-string)
        (seq-reduce
         (lambda (acc x)
           (and
            (setq place (+ place 1))
            (+ acc
               (* (- x ?0)
                  (expt power-base place)))))
         (reverse trinary-number-string)
         initial-value)
      0)))

;; Test
;; (trinary-to-decimal "102012")

(provide 'trinary)
;;; 08-trinary.el ends here
