;;; 16-bob.el --- Bob exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'subr-x)

(defun yellp (phrase)
  "Check if the PHRASE is a yell."
  (and (string-match "[a-zA-Z]" phrase)
       (string= (upcase phrase) phrase)))

(defun questionp (phrase)
  "Check if the PHRASE is a question."
  (string-suffix-p "?" phrase))

(defun response-for (phrase)
  "Return Bob's reponse based on the PHRASE."
  (let ((trim-phrase (string-trim phrase)))
    (cond ((and (yellp trim-phrase)
                (questionp trim-phrase)) "Calm down, I know what I'm doing!")
          ((questionp trim-phrase) "Sure.")
          ((string-blank-p trim-phrase) "Fine. Be that way!")
          ((yellp trim-phrase) "Whoa, chill out!")
          (t "Whatever."))))

(provide 'bob)
;;; 16-bob.el ends here
