;; -*- lexical-binding: nil; -*- 
;;; init.el --- Personal Emacs configuration

;;; Packages

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)
(setq use-package-always-ensure t)

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(add-to-list 'load-path "~/.emacs.d/el-easydraw")
(with-eval-after-load 'org
  (require 'edraw-org)
  (edraw-org-setup-default))
;; When using the org-export-in-background option (when using the
;; asynchronous export function), the following settings are
;; required. This is because Emacs started in a separate process does
;; not load org.el but only ox.el.
(with-eval-after-load "ox"
  (require 'edraw-org)
  (edraw-org-setup-exporter))

;;; Appearance and editing

(setq inhibit-startup-screen t backup-directory-alist
      '(("." . "~/.emacs.d/backups/")))

(load-theme 'modus-operandi t)
(global-visual-line-mode 1)
(fido-vertical-mode 1)

;;; Quelpa

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)

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
  (setq org-display-inline-images nil)
  (setq org-image-actual-width 300)
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
  (org-mode . org-download-enable))

(use-package org-journal
  :ensure t
  :defer t
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/Documents/org/journal/"
        org-journal-date-format "%A, %d %B %Y.org"))

(require 'ox-publish)
(setq org-publish-project-alist
      '(("ee2120-org"
         :base-directory "~/Documents/org/school/ee2120/lecture_notes"               ;; Where your .org files live
         :base-extension "org"
         :publishing-directory "~/Documents/org/html/school/ee2120/" ;; Where the HTML should go
         :publishing-function org-html-publish-to-html
         :recursive t
	 :auto-preamble t
         )
	("ee2120-images"
	 :base-directory "~/Documents/org/school/ee2120/lecture_notes/figures"
	 :base-extension "png\\|jpg"
	 :publishing-directory "~/Documents/org/html/school/ee2120/figures"
	 :publishing-function org-publish-attachment)
	("ee2120-notes" :components("ee2120-org" "ee2120-images"))))

(use-package org-krita
  :ensure t
  :quelpa (org-krita :fetcher github :repo "lepisma/org-krita" :files ("*.el" "resources"))
  :config
  :hook (org-mode .org-krita-mode))

(use-package org-draw
  :ensure t
  :commands (org-draw org-draw-edit org-draw-setup))

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
