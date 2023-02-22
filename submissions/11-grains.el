;;; 11-grains.el --- Grains exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;; This is my second submission.  I decided to use a similar solution that
;; `wsgac' provided.  Link for his solution:
;;
;; - https://exercism.org/tracks/emacs-lisp/exercises/grains/solutions/wsgac

;;; Code:

(defun square (num)
  "Return how many grains were on a given square (`NUM')."
  (ash 1 (1- num)))

(defun total ()
  "Return the total number of grains on the chessboard 64 places."
  (1- (square 65)))

;; (total)

(provide 'grains)
;;; 11-grains.el ends here
