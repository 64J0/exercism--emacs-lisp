;;; 04-anagram.el --- Anagram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;; An anagram is a rearrangement of letters to form a new word: for
;; example "owns" is an anagram of "snow".  A word is not its own
;; anagram: for example, "stop" is not an anagram of "stop".

;; Some useful links:
;; https://www.gnu.org/software/emacs/manual/html_node/eintr/Sample-let-Expression.html
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Case-Conversion.html
;; https://www.gnu.org/software/emacs/manual/html_node/eintr/cons.html
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Building-Lists.html

;;; Code:

(defun downcase-list (STRING-LIST)
  "Transform `STRING-LIST' into lowercase string list."
  (let (lowercase-list)
    (dolist (element STRING-LIST lowercase-list)
      (setq lowercase-list (cons (downcase element) lowercase-list)))
    (reverse lowercase-list)))

;; Test:
;; (downcase-list '("tones" "banana" "tons" "notes" "Seton"))

(defun same-size-strings-p (STR1 STR2)
  "Define if both `STR1' and `STR2' have the same size."
  (equal
   (string-width STR1)
   (string-width STR2)))

(defun different-strings-p (STR1 STR2)
  "Define if `STR1' and `STR2' are not the same string."
  (not
   (string-equal STR1 STR2)))

(defun anagrams-for (TARGET CANDIDATES)
  "Given a `TARGET' word and a set of `CANDIDATES' words, this
function return the subset of the candidates that are anagrams of
the target.

The target and candidates are words of one of more ASCII
alphabetic characters.

Lowercase and uppercase characters are equivalent."
  (let ((LOWERCASE-TARGET (downcase TARGET))
        (RESULT))
    (dolist (CANDIDATE CANDIDATES RESULT)
      (and (same-size-strings-p LOWERCASE-TARGET CANDIDATE)
           (different-strings-p LOWERCASE-TARGET (downcase CANDIDATE))
           (equal
            (sort (split-string LOWERCASE-TARGET "" t) 'string-lessp)
            (sort (split-string (downcase CANDIDATE) "" t) 'string-lessp))
           (setq RESULT (cons CANDIDATE RESULT))))
    (reverse RESULT)))

;; Test:
;; (anagrams-for "Orchestra" '("cashregister" "Carthorse" "radishes"))

(provide 'anagram)
;;; 04-anagram.el ends here
