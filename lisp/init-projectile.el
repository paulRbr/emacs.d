;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  ;; Shorter modeline
  (setq-default projectile-mode-line-prefix " Pj")

  (when (executable-find "rg")
    (setq-default projectile-generic-command "rg --files --hidden -0"))

  (with-eval-after-load 'projectile
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

  (maybe-require-package 'ibuffer-projectile)

  (after-load 'projectile
    (when (maybe-require-package 'persp-projectile)
      (persp-mode)
      (require 'persp-projectile)
      ;;   (define-key projectile-mode-map
      ;;     (kbd "C-c p p")
      ;;     'projectile-persp-switch-project))
      )))

(provide 'init-projectile)
;;; init-projectile.el ends here
