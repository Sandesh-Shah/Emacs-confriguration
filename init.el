;; elisp files
(add-to-list 'load-path (concat user-emacs-directory "elisp"))

;; Base configuration
(require 'base)

;; Theme
(require 'theme)

;; Completion
(require 'completion)

;; Org-mode
(require 'fororg)

;; LaTex
(require 'forlatex)
