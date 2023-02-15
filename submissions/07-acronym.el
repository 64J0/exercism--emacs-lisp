;;; 07-acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'subr-x)
(require 'seq)

(defun acronym (phrase)
  "Convert a `PHRASE' to its acronym."
  (string-join
   (seq-map
    (lambda (word) (upcase (substring word 0 1)))
    (split-string phrase "[\s-]"))))

;; (acronym "As Soon As Possible")
;; (acronym "Liquid-crystal display")

(provide 'acronym)
;;; 07-acronym.el ends here
