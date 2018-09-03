;;; init-dash.el --- Integrate with the Mac app "Dash" -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Support for the http://kapeli.com/dash documentation browser

(when *is-a-mac*
  (require-package 'dash-at-point)
  (global-set-key (kbd "C-c D") 'dash-at-point))

(when (not *is-a-mac*)
  (require-package 'helm-dash)
  (global-set-key (kbd "C-c D") 'helm-dash-at-point)
  (setq helm-dash-browser-func 'eww))

(provide 'init-dash)
;;; init-dash.el ends here
