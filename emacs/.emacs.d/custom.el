;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/Documents/org/habits.org"
     "~/Documents/org/project_notes/synth/tasks.org"
     "~/Documents/org/todo.org" "~/Documents/org/journal/"))
 '(package-selected-packages
   '(auctex dash f org-autolist org-download org-draw org-krita
	    org-modern quelpa quelpa-use-package s solarized-theme
	    yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; update equation numberings
(defun update-tag ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((count 1))
      (while (re-search-forward "\\tag{\\([0-9]+\\)}" nil t)
        (replace-match (format "%d" count) nil nil nil 1)
        (setq count (1+ count)))))
  )
