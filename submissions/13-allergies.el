;;; 13-allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

;; First, thanks `zkry' for mentoring me in this exercise.  My solution is now
;; way more clean.
;;
;; Emacs built in advanced calculator:
;;
;; C-x *
;; https://www.gnu.org/software/emacs/manual/html_node/calc/Radix-Modes.html
;; Necessary to import `calc-bin'.

;; So the #' is used for quoting functions.  Using ' works just the same.  The
;; difference is that #' signals to the byte compiler that the symbol will be
;; used as a function.  #' is shorthand for function and ' is shorthand for
;; quote.  identity is just a function that returns the argument it was passed
;; in.  Using this with seq-filter it lets us filter out any element that is
;; nil.

;;; Code:

(require 'seq)
(require 'calc-bin)

(defun int-to-binary-string (i)
  "Convert integer `I' into it's binary representation as string.

Thanks to `zkry' for showing it to me in Exercism!"
  (let ((calc-number-radix 2))
    (math-format-radix i)))

(defconst allergies-vector
  ["eggs" "peanuts" "shellfish" "strawberries"
   "tomatoes" "chocolate" "pollen" "cats"]
  "The array of allergies according to the exercise.")

(defun allergen-list (score)
  "Given a person's allergy `SCORE', determine whether or not they're allergic to a given item, and their full list of allergies."
  (seq-filter
   #'identity
   (seq-map-indexed
    (lambda (digit idx)
      (when (= digit ?1)
        (aref allergies-vector idx)))
    (substring (reverse (concat "00000000" (int-to-binary-string score))) 0 8))))

(defun allergic-to-p (score allergen)
  "Check if Allergic to allergen based on `SCORE' and `ALLERGEN'."
  (member allergen (allergen-list score)))

(provide 'allergies)
;;; 13-allergies.el ends here
