;;; 06-rna-transcription.el -- RNA Transcription (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Association-Lists.html
;; https://github.com/bbatsov/emacs-lisp-style-guide#naming
;; https://github.com/bbatsov/emacs-lisp-style-guide#docstrings

;; For functions that are defined in the C code no packages needs to be
;; required.

;; This is not really an improvement, just a variation: You can use `mapconcat'
;; to map a sequence and create a String as result.  `mapconcat' expects a
;; separator though, so you wouldn't even save a line of code.

;; Since `mapconcat' is defined in the C code it might be faster than the
;; combination of `string-join' and `seq-map', might also only iterate the
;; sequence once.  I wouldn't think about this stuff though unless you're
;; running into performance problems and benchmarks point into that direction.

;; About the comments in the program structure:

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Simple-Packages.html
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Library-Headers.html

;;; Code:

(require 'subr-x)
(require 'seq)

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
;; (to-rna "GCTA")

(provide 'rna-transcription)
;;; 06-rna-transcription.el ends here
