;;; 15-nucleotide.el --- nucleotide-count Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;; http://xahlee.info/emacs/emacs/elisp_hash_table.html

;;; Code:

(require 'seq)

(defvar-local nucleotide-alist
  '((?A . 0)
    (?C . 0)
    (?G . 0)
    (?T . 0))
  "Elisp alist with the DNA bases.")

(defun error-in-dna-p (dna)
  "Very if `DNA' make sense."
  (seq-some
   (lambda (c)
     (not (alist-get c nucleotide-alist)))
   dna))

;; (error-in-dna-p "GATTACA")
;; (error-in-dna-p "INVALID")

(defun nucleotide-count (dna)
  "Return the quantity of each nucleotide in the `DNA' sequence."
  (if (error-in-dna-p dna)
      (error "DNA sequence is invalid")
    (seq-reduce
     (lambda (acc c)
       (setf (alist-get c acc) (1+ (alist-get c acc)))
       (identity acc))
     dna
     (copy-alist nucleotide-alist))))

;; (nucleotide-count "GATTACA")
;; (nucleotide-count "GGGGGGGG")
;; (nucleotide-count "")

(provide 'nucleotide-count)
;;; 15-nucleotide.el ends here
