;;; 13-allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun int-to-binary-string (i)
  "Convert integer `I' into it's binary representation as string.

Found this function at:

+ https://stackoverflow.com/a/20577329"
  (let ((res ""))
    (while (not (= i 0))
      (setq res (concat (if (= 1 (logand i 1)) "1" "0") res))
      (setq i (lsh i -1)))
    (if (string= res "")
        (setq res "0"))
    res))

(defconst allergies-vector
  ["eggs" "peanuts" "shellfish" "strawberries"
   "tomatoes" "chocolate" "pollen" "cats"]
  "The array of allergies according to the exercise.")

(defun allergen-list (score)
  "Given a person's allergy `SCORE', determine whether or not they're allergic to a given item, and their full list of allergies."
  (let ((pos -1)
        (allergies ()))
    (seq-reduce
     (lambda (acc x)
       (and
        (setq pos (+ pos 1))
        (if (= x ?1)
            (push (aref allergies-vector pos) allergies)
          allergies)))
     (substring (reverse (concat "00000000" (int-to-binary-string score))) 0 8)
     allergies)
    (reverse allergies)))

(defun allergic-to-p (score allergen)
  "Check if Allergic to allergen based on `SCORE' and `ALLERGEN'."
  (let ((allergies (allergen-list score))
        (present nil))
    (while (not (equal allergies nil))
      (and
       (equal allergen (car allergies))
       (setq present t))
      (setq allergies (cdr allergies)))
    (or present)))

(provide 'allergies)
;;; 13-allergies.el ends here
