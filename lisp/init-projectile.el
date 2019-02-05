;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  ;; Shorter modeline
  (setq-default projectile-mode-line-prefix " Proj")

  (when (executable-find "rg")
    (setq-default projectile-generic-command "rg --files --hidden -0"))

  (with-eval-after-load 'projectile
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

  (maybe-require-package 'ibuffer-projectile)

  ;; Enable perspective mode with persp-projectile minor mode
  (when (maybe-require-package 'persp-projectile)
    (require 'perspective)
    (persp-mode)
    (require 'persp-projectile)))

(provide 'init-projectile)
;;; init-projectile.el ends here
