;; Improve org mode looks
(setq org-startup-indented t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width nil)


;; Nice bullets
(use-package org-superstar
  :config
  (setq org-superstar-leading-bullet " ")
  (setq org-superstar-special-todo-items t) ;; Makes TODO header bullets into boxes
  (setq org-superstar-todo-bullet-alist '(("TODO" . 9744)
                                          ("HW" . 9744)
                                          ("STUDY" . 9744)
                                          ("SOMEDAY" . 9744)
                                          ("READ" . 9744)
                                          ("PROJ" . 9744)
                                          ("CONTACT" . 9744)
                                          ("DONE" . 9745)))
  :hook (org-mode . org-superstar-mode))


(add-hook 'org-mode-hook 'visual-line-mode)

;; for org-reveal
(use-package ox-reveal)

;; for org-tree-slide
(when (require 'org-tree-slide nil t)
  (global-set-key (kbd "<f8>") 'org-tree-slide-mode)
  (global-set-key (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)
  (define-key org-tree-slide-mode-map (kbd "<f9>")
    'org-tree-slide-move-previous-tree)
  (define-key org-tree-slide-mode-map (kbd "<f10>")
    'org-tree-slide-move-next-tree)
  (define-key org-tree-slide-mode-map (kbd "<f11>")
    'org-tree-slide-content)
  (setq org-tree-slide-skip-outline-level 4)
  (org-tree-slide-presentation-profile)
  (setq org-tree-slide-skip-done nil))

(with-eval-after-load "org-tree-slide"
  (defvar my-hide-org-meta-line-p nil)
  (defun my-hide-org-meta-line ()
    (interactive)
    (setq my-hide-org-meta-line-p t)
    (set-face-attribute 'org-meta-line nil
			                  :foreground (face-attribute 'default :background)))
  (defun my-show-org-meta-line ()
    (interactive)
    (setq my-hide-org-meta-line-p nil)
    (set-face-attribute 'org-meta-line nil :foreground nil))

  (defun my-toggle-org-meta-line ()
    (interactive)
    (if my-hide-org-meta-line-p
	      (my-show-org-meta-line) (my-hide-org-meta-line)))

  (add-hook 'org-tree-slide-play-hook #'my-hide-org-meta-line)
  (add-hook 'org-tree-slide-stop-hook #'my-show-org-meta-line))

(provide 'fororg)
