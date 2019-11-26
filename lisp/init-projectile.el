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

  (when (maybe-require-package 'persp-mode)
    (with-eval-after-load "persp-mode"
      (setq wg-morph-on nil)
      (setq persp-autokill-buffer-on-remove 'kill-weak)
      ;; NOTE: Redefine `persp-add-new' to address.
      ;; Issue: Unable to create/handle persp-mode
      ;; https://github.com/Bad-ptr/persp-mode.el/issues/96
      ;; https://github.com/Bad-ptr/persp-mode-projectile-bridge.el/issues/4
      ;; https://emacs-china.org/t/topic/6416/7
      (defun* persp-add-new (name &optional (phash *persp-hash*))
        "Create a new perspective with the given `NAME'. Add it to `PHASH'.
  Return the created perspective."
        (interactive "sA name for the new perspective: ")
        (if (and name (not (equal "" name)))
            (destructuring-bind (e . p)
                (persp-by-name-and-exists name phash)
              (if e p
                (setq p (if (equal persp-nil-name name)
                            nil (make-persp :name name)))
                (persp-add p phash)
                (run-hook-with-args 'persp-created-functions p phash)
                p))
          (message "[persp-mode] Error: Can't create a perspective with empty name.")
          nil))
      (add-hook 'after-init-hook #'(lambda () (persp-mode 1))))

    (require 'persp-mode))

  (when (maybe-require-package 'persp-projectile)
    (require 'persp-projectile)))

(provide 'init-projectile)
;;; init-projectile.el ends here
