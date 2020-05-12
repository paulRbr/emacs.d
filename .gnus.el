;;; .gnus.el --- Emacs Gnus configuration file

;;; Commentary:
;; Configuration of Gnus mail and news client

;;; Code:

;; No confirmation for events such as quitting Gnus, exiting a group without an
;; update, catching up with a group, deleting expired articles, and replying by
;; mail to a news message...

(setq gnus-expert-user t)
(setq gnus-novice-user nil)

;; Remove nntp news from emacs
(setq gnus-select-method '(nnnil ""))
(setq gnus-nntp-server nil)

;; Configure identity
(setq user-mail-address "paul.bonaud@fretlink.com"
      user-full-name "Paul Bonaud")

(setq gnus-select-method
      '(nnimap "gmail"
	       (nnimap-address "imap.gmail.com")  ; it could also be imap.googlemail.com if that's your server.
	       (nnimap-server-port "imaps")
	       (nnimap-stream ssl)))

(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")


;; Thread email ('gnus-gather-threads-by-subject)
(setq gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references)

;; Sort by date
(setq gnus-thread-sort-functions '((not gnus-thread-sort-by-date) (not gnus-thread-sort-by-number)))

;; Ignore the subject and look at 'In-Reply-To:' and 'References:' headers.
(setq gnus-thread-ignore-subject t)

;; Load some read messages for the threaded view
(setq gnus-fetch-old-headers 100)

;; ;; Show and update the summary buffer as it’s being built
;; (setq gnus-summary-display-while-building t)

;; Cache mail
(setq gnus-use-cache t)

;; Fetch only part of the article if we can.
(setq gnus-read-active-file 'some)

;; Topic mode in server selection
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; Gnus desktop notifications
(setq gnus-notifications-minimum-level 10)
(add-hook 'gnus-after-getting-new-news-hook 'gnus-notifications)

;; Fetch mail every X minutes when idle for Y minutes
(gnus-demon-add-handler 'gnus-demon-scan-news 5 t)

;; Archive mail in the Sent folder
(setq gnus-message-archive-group "nnimap:Sent")

;; Encrypt for myself
(setq mml2015-encrypt-to-self t)

;; Kill the mail buffer when sending a new message
(setq message-kill-buffer-on-exit t)

;; Avoid fancy mail like the plague
(setq mm-discouraged-alternatives
      '("text/html" "image/.*" "text/richtext" "text/enriched" "multipart/related")
      gnus-buttonized-mime-types
      '("text/html" "image/.*" "text/richtext" "text/enriched" "multipart/related"
        "multipart/signed" "multipart/encrypted"))

;; Forward inline
(setq message-forward-as-mime nil)

;; Wash html from mail
(setq mm-text-html-renderer 'html2text)

;; Verify signed messages
(setq mm-verify-option 'known
      mm-decrypt-option 'known
      mm-sign-option nil ;; Auto select key for signing
      mm-encrypt-option nil
      gnus-article-emulate-mime t)

;; Make gnus threading more stylish
(defun gnus-user-format-function-@ (header)
  (let ((case-fold-search t)
        (ctype (or (cdr (assq 'Content-Type (mail-header-extra header))) "text/plain")) indicator)
    (when (string-match "^multipart/mixed" ctype)
      (setq indicator "@"))
    (if indicator indicator " ")))
(setq gnus-summary-line-format "%10{%4k│%}%0{%U%R%z%u&@;%}%10{│%}%*%-20,20f%10{│%}%&user-date;%10{║%} %10{%B%} %(%s%)\n"
      gnus-user-date-format-alist '((t . "%d %b %Y %H:%M"))
      gnus-summary-dummy-line-format " %8{│%} %(%8{│%} %10{║%}%) %10{┏○%} %S\n"
      gnus-sum-thread-tree-indent          ""
      gnus-sum-thread-tree-false-root      ""    ; ○
      gnus-sum-thread-tree-single-indent   "◎"   ; ●
      gnus-sum-thread-tree-root            "┌"   ; ┏●
      gnus-sum-thread-tree-vertical        "│"   ; ┃
      gnus-sum-thread-tree-leaf-with-other "├─>" ; ┣━━❯
      gnus-sum-thread-tree-single-leaf     "└─>" ; ┗━━❯
      )
(copy-face 'font-lock-constant-face 'gnus-face-8)
(set-face-foreground 'gnus-face-8 "gray50")
(setq gnus-face-8 'gnus-face-8)
(setq gnus-face-9 'font-lock-warning-face)
(setq gnus-face-10 'shadow)

(setq send-mail-function (quote smtpmail-send-it))
