;;; init-dash.el --- Integrate with the Mac app "Dash" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Support for the http://kapeli.com/dash documentation browser

(when *is-a-mac*
  (require-package 'dash-at-point)
  (global-set-key (kbd "C-c D") 'dash-at-point))

(when (and (not *is-a-mac*) (not (package-installed-p 'helm-dash)))
  (require-package 'helm-dash))

(when (package-installed-p 'helm-dash)
  (global-set-key (kbd "C-c D") 'helm-dash-at-point))

(provide 'init-dash)
;;; init-dash.el ends here
