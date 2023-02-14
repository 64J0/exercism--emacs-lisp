;;; 06-rna-transcription.el -- RNA Transcription (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Association-Lists.html
;; https://github.com/bbatsov/emacs-lisp-style-guide#naming
;; https://github.com/bbatsov/emacs-lisp-style-guide#docstrings

;;; Code:

(require 'subr-x)

(defconst nucleotide-complement
  '((?G . "C")
    (?C . "G")
    (?T . "A")
    (?A . "U"))
  "The DNA nucleotide complement.")

(defun to-rna (dna-strand)
  "Given a `DNA-STRAND', return its RNA complement (per RNA transcription)."
  (string-join
   (seq-map
    (lambda (c)
      (or (alist-get c nucleotide-complement nil nil 'equal)
          (error "Wrong DNA strand")))
    dna-strand)))

;; Test
;; (to-rna "GCTAX")

(provide 'rna-transcription)
;;; 06-rna-transcription.el ends here
