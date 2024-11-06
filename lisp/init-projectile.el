;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  ;; Shorter modeline
  (setq-default projectile-mode-line-prefix " Pj")

  (when (executable-find "rg")
    (setq-default projectile-generic-command "rg --files --hidden -0"))

  (maybe-require-package 'ibuffer-projectile)

  (with-eval-after-load 'projectile
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

    (when (maybe-require-package 'persp-projectile)

      (customize-set-variable 'persp-mode-prefix-key (kbd "C-x x"))
      (persp-mode)
      (require 'persp-projectile)

      (define-key projectile-mode-map
        (kbd "C-c p p")
        'projectile-persp-switch-project)
      )

    ;; )
    ;; (after-load 'projectile
    ;;   (when (maybe-require-package 'persp-mode)
    ;;     ;; (define-key persp-key-map (kbd "C-x x") ...)
    ;;     (persp-mode)
    ;;     (with-eval-after-load "persp-mode"
    ;;       (setq wg-morph-on nil)
    ;;       (setq persp-autokill-buffer-on-remove 'kill-weak)
    ;;       (add-hook 'window-setup-hook #'(lambda () (persp-mode 1))))
    ;;     (require 'persp-mode)
    ;;     ))
    )
  )

(maybe-require-package 'project)

(provide 'init-projectile)
;;; init-projectile.el ends here
