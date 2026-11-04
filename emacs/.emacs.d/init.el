;; -*- lexical-binding: nil; -*- 
;;; init.el --- Personal Emacs configuration

;;; Packages

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)
(setq use-package-always-ensure t)

;;; Appearance and editing

(setq inhibit-startup-screen t backup-directory-alist
      '(("." . "~/.emacs.d/backups/")))

(load-theme 'modus-operandi t)
(global-visual-line-mode 1)
(fido-vertical-mode 1)

;;; Org mode

(use-package org
  :ensure nil
  :init (setq org-hide-emphasis-markers t
	      org-agenda-files
	      '("~/Documents/org/habits.org"
		"~/Documents/org/project_notes/synth/tasks.org"
		"~/Documents/org/todo.org"))
  :config
  (setq org-format-latex-options
	(plist-put (copy-sequence org-format-latex-options)
		   :scale 1.2))
  (require 'org-habit))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;;; Org extensions

(use-package org-modern
  :hook
  (org-mode . org-modern-mode))

(use-package org-autolist
  :hook
  (org-mode . org-autolist-mode))

(use-package org-download
  :hook
  (dired-mode . org-download-enable)
  :custom (org-download-screenshot-method "gnome-screenshot -a -f %s"))

(use-package org-journal
  :ensure t
  :defer t
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/Documents/org/journal/"
        org-journal-date-format "%A, %d %B %Y.org"))

;;; Snippets

(use-package yasnippet
  :ensure t
  :hook ((text-mode . yas-minor-mode)
	 (prog-mode . yas-minor-mode)
	 (conf-mode . yas-minor-mode)
	 (snippet-mode . yas-minor-mode)
	 (org-mode . yas-minor-mode))
  :custom
  (yas-snippet-dir '("~/.emacs.d/snippets"))
  (yas-triggers-in-field t)
  :config
  (yas-reload-all)
  (yas-global-mode 1))

;;; LaTeX snippet conditions

(defun yas-texmathp ()
  "Return non-nil when point is inside a LaTeX math environment."
  (require 'texmathp) (texmathp))

;;; Custom settings

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;;; init.el ends here
