;;; 12-pangram.el --- Pangram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'seq)

(defconst alphabet-letters
  "abcdefghijklmnopqrstuvwxyz"
  "The letters in the alphabet, in lower case.")

(defun is-pangram (phrase)
  "Determine if `PHRASE' is a pangram.

A pangram is a sentence using every letter of the alphabet at
least once."
  (not
   (seq-difference alphabet-letters
                   (seq-filter
                    (lambda (c) (string-match "[a-zA-Z]" (char-to-string c)))
                    (seq-uniq (downcase phrase))))))

(provide 'pangram)
;;; 12-pangram.el ends here
