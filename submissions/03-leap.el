;;; 03-leap.el --- Leap exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun divisible-by-four-p (NUM)
  "Check whether the `NUM' is divisible by 4."
  (= (mod NUM 4) 0))

(defun divisible-by-hundred-p (NUM)
  "Check whether the `NUM' is divisible by 100."
  (= (mod NUM 100) 0))

(defun divisible-by-four-hundred-p (NUM)
  "Check whether the `NUM' is divisible by 400."
  (= (mod NUM 400) 0))

(defun leap-year-p (YEAR)
  "Check whether the `YEAR' is a leap year.

The rationale is that we have a leap year in the Gregorian
calendar when:

1) The year is evenly divisible by 4.

2) Except if the year is evenly divisible by 100, unless it is
also evenly divisible by 400."
  (and (divisible-by-four-p YEAR)
       (or
        (divisible-by-four-hundred-p YEAR)
        (not (divisible-by-hundred-p YEAR)))))

(provide 'leap-year-p)
;;; 03-leap.el ends here
