;; -*- Emacs-Lisp -*-

(setq initial-buffer-choice t)

;; swap BS and DEL
(keyboard-translate ?\C-h ?\C-?)

;; X11 specific
(when (eq window-system 'x)
  (scroll-bar-mode -1)
  (set-default-font "terminus-12")
  ;; face
  (dolist (elem '((bold "LightGoldenrod")
		  (underline "PaleGreen")
		  (mode-line "black" "PaleGreen3" bold)
		  (mode-line-inactive "PaleGreen" "black")
		  (link "PaleGreen")
		  (link-visited "salmon")
		  (font-lock-builtin-face "aquamarine1")
		  (font-lock-keyword-face "aquamarine1" nil bold)
		  (font-lock-function-name-face "aquamarine1" nil bold)

		  (font-lock-constant-face "aquamarine2")
		  (font-lock-variable-name-face "aquamarine2")
		  (font-lock-type-face "LightCyan" nil bold)
		  (font-lock-preprocessor-face "LightCyan")

		  (font-lock-warning-face "orange")
		  (font-lock-negation-char-face "orange")
		  (font-lock-regexp-grouping-backslash "orange")
		  (font-lock-regexp-grouping-construct "orange")

		  (font-lock-comment-face "orange")
		  (font-lock-comment-delimiter-face "orange")
		  (font-lock-string-face "orange")
		  (font-lock-doc-face "orange")))
    (set-face-attribute (car elem) nil
			:foreground (nth 1 elem)
			:background (nth 2 elem)
			:weight (or (nth 3 elem) 'normal))))
