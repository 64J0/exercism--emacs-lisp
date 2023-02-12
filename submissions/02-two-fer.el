;;; 02-two-fer.el --- Two-fer Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;; Check if an optional parameter was input:
;; https://emacs.stackexchange.com/questions/52348/how-to-check-whether-an-optional-param-was-input

;;; Code:
(defun two-fer (&optional NAME)
  "If `NAME' is defined, return the string 'One for NAME, one for me.'.
If it's not, return the string 'One for you, one for me.'"
  (format "One for %s, one for me." (or NAME "you")))

;; My tests:
;; (two-fer "Vinícius")
;; "One for Vinícius, one for me."
;; (two-fer)
;; "One for you, one for me."

(provide 'two-fer)
;;; 02-two-fer.el ends here
