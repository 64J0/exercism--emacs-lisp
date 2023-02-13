;;; 05-hamming.el --- Hamming (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun hamming-distance (DNA1 DNA2)
  "Calculate the Hamming Distance between `DNA1' and `DNA2' strands."
  (let ((COUNT 0))
    (if (equal (length DNA1) (length DNA2))
        (dotimes (i (length DNA1) COUNT)
          (and
           (not (equal (aref DNA1 i) (aref DNA2 i)))
           (message "%d" i)
           (setq COUNT (+ COUNT 1))))
      (error "The input strings must have the same size"))))

;; Test:
;; (hamming-distance
;;  "GAGCCTACTAACGGGAT"
;;  "CATCGTAATGACGGCCT")

(provide 'hamming)
;;; 05-hamming.el ends here
