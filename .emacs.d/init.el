(require 'package)

(defconst my-org-agenda-files "~/Dropbox/org/*.org" "Path to my org agenda files.")

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(package-initialize)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Set completion time on DONE items.
(setq org-log-done 'time)

;; custom org todo states
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "INAC(i)" "|" "DONE(d)")))

;; custom org todo state colors
(setq org-todo-keyword-faces
      '(("TODO" . "red")
	("NEXT" . "orange")
	("WAIT" . "orchid")
	("INAC" . "orchid")
	("DONE" . "lime green")))

;; custom org-mode marker for additional subheadings
;; (setq org-ellipsis " +")

(global-set-key (kbd "M-M t m") 'toggle-frame-maximized)

(setq org-agenda-files
      (file-expand-wildcards my-org-agenda-files))

(global-set-key (kbd "C-c a a") 'org-agenda-list)

;; configure dashboard package
(use-package dashboard
  :ensure t
  :config (dashboard-setup-startup-hook))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/work.org" "~/Dropbox/org/nbt-notes.org" "~/Dropbox/org/personal.org"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
