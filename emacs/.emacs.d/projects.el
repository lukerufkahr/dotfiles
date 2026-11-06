;; -*- lexical-binding: t; -*-
(require 'ox-publish)
(setq org-publish-project-alist
      '(
	("ee2120-org"
         :base-directory "~/Documents/org/school/ee2120/lecture_notes"               ;; Where your .org files live
         :base-extension "org"
         :publishing-directory "~/Documents/org/html/school/ee2120/" ;; Where the HTML should go
         :publishing-function org-html-publish-to-html
         :recursive t
	 :auto-preamble t
	 :no-menu t
         )
	("ee2120-images"
	 :base-directory "~/Documents/org/school/ee2120/lecture_notes/figures"
	 :base-extension "png\\|jpg"
	 :publishing-directory "~/Documents/org/html/school/ee2120/figures"
	 :publishing-function org-publish-attachment
	 :no-menu t
	 )
	("ee2120-notes" :components("ee2120-org" "ee2120-images"))

        ("ee2410-org"
         :base-directory "~/Documents/org/school/ee2410/lecture_notes"               ;; Where your .org files live
         :base-extension "org"
         :publishing-directory "~/Documents/org/html/school/ee2410/" ;; Where the HTML should go
         :publishing-function org-html-publish-to-html
         :recursive t
	 :auto-preamble t
	 :no-menu t
         )
	("ee2410-images"
	 :base-directory "~/Documents/org/school/ee2410/lecture_notes/figures"
	 :base-extension "png\\|jpg"
	 :publishing-directory "~/Documents/org/html/school/ee2120/figures"
	 :publishing-function org-publish-attachment
	 :no-menu t
	 )
	("ee2410-notes" :components("ee2410-org" "ee2410-images"))

        ("phys2305-org"
         :base-directory "~/Documents/org/school/phys2305/lecture_notes"               ;; Where your .org files live
         :base-extension "org"
         :publishing-directory "~/Documents/org/html/school/phys2305/" ;; Where the HTML should go
         :publishing-function org-html-publish-to-html
         :recursive t
	 :auto-preamble t
	 :no-menu t
         )
	("phys2305-images"
	 :base-directory "~/Documents/org/school/phys2305/lecture_notes/figures"
	 :base-extension "png\\|jpg"
	 :publishing-directory "~/Documents/org/html/school/phys2305/figures"
	 :publishing-function org-publish-attachment
	 :no-menu t
	 )
	("phys2305-notes" :components("phys2305-org" "phys2305-images"))

        ("stat5643-org"
         :base-directory "~/Documents/org/school/stat5643/lecture_notes"               ;; Where your .org files live
         :base-extension "org"
         :publishing-directory "~/Documents/org/html/school/stat5643/" ;; Where the HTML should go
         :publishing-function org-html-publish-to-html
         :recursive t
	 :auto-preamble t
	 :no-menu t
         )
	("stat5643-images"
	 :base-directory "~/Documents/org/school/stat5643/lecture_notes/figures"
	 :base-extension "png\\|jpg"
	 :publishing-directory "~/Documents/org/html/school/stat5643/figures"
	 :publishing-function org-publish-attachment
	 :no-menu t
	 )
	("stat5643-notes" :components("stat5643-org" "stat5643-images"))))
