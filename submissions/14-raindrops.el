;;; 14-raindrops.el --- Raindrops (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'subr-x)

(defun factor-3 (n)
  "If N is a factor of 3, return 'Pling', otherwise nil."
  (when (= 0 (mod n 3)) "Pling"))

(defun factor-5 (n)
  "If N is a factor of 5, return 'Plang', otherwise nil."
  (when (= 0 (mod n 5)) "Plang"))

(defun factor-7 (n)
  "If N is a factor of 7, return 'Plong', otherwise nil."
  (when (= 0 (mod n 7)) "Plong"))

(defun convert (n)
  "Convert a number N into a string that contain raindrop sounds.

The rules of raindrops are that if a given number:

- has 3 as a factor, add 'Pling' to the result;
- has 5 as a factor, add 'Plang' to the result;
- has 7 as a factor, add 'Plong' to the result;
- does not have any of 3, 5, or 7 as a factor, the result should be the digits of the number."
  (let ((song (concat (factor-3 n) (factor-5 n) (factor-7 n))))
    (if (string-empty-p song)
        (number-to-string n)
      (identity song))))

(provide 'raindrops)
;;; 14-raindrops.el ends here
