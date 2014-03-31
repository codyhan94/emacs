(use-package ido
  :init
  (progn
    (ido-mode t)
    (ido-ubiquitous-mode t)
    (ido-vertical-mode 1))
  :config
  (progn
    (set 'ido-enable-flex-matching t)
    (set 'ido-everywhere t)
    (set 'ido-use-virtual-buffers t))
)
;; Latex configure

;; (load "auctex.el" nil t t)
(setq TeX-PDF-mode t)
(setq TeX-output-view-program
      (quote
       (("^pdf$" "." "zathura -f %o")
	("^html?$" "." "google-chrome %o"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list (quote (("Zathura" "zathura %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Zathura") (output-html "xdg-open")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ;; Turn on asm86-mode for .asm files
;; (setq auto-mode-alist
;;      (append '(("\\.asm\\'" . asm86-mode) ("\\.inc\\'" . asm86-mode))
;; 	     auto-mode-alist))

;; ;; Enable syntax highlighting for Asm86 Mode:
;; (add-hook 'asm86-mode-hook 'turn-on-font-lock)

;; ;; Customize syntax colors. This is the "recommended" 
;; ;; color scheme. 
;; (cond ((fboundp 'global-font-lock-mode)
;;        ;; Customize face attributes
;;        (setq font-lock-face-attributes
;;              ;; Symbol-for-Face Foreground Background Bold Italic Underline
;;              '((font-lock-comment-face       "DarkGreen")
;;                (font-lock-string-face        "Sienna")
;;                (font-lock-keyword-face       "RoyalBlue")
;;                (font-lock-function-name-face "Red")
;;                (font-lock-variable-name-face "Black")
;;                (font-lock-type-face          "Blue")
;;                (font-lock-constant-face      "Purple")
;;                ))
;;        ;; Load the font-lock package.
;;        (require 'font-lock)))


;; ;;; CUSTOMIZE ASM86 MODE BEHAVIOR ;;;

;; (setq asm86-extended-style-headers t); use more complete function headers

;; ; The function setq-default sets the global (not buffer local)
;; ; value of the variable. 
;; ;; (setq-default comment-column 50)     ; column where inline comments start


;; ;; Set behavior of some specific features:
;; (setq asm86-electric-colon-on t)     ; disable electric colon
;; (setq asm86-electric-semicolon-on t) ; disable semielectric colon

;; (setq asm86-electric-gap-size 8)     ; wider than default (6)

;; ;; Define indentation behavior (wider than default).
;; ;; Most of the code is either a comment, instruction,
;; ;; or a blank line, so these are the only lines where
;; ;; the default is overridden. 
;; (setq asm86-blank-base-offset 5)
;; (setq asm86-header-comment-base-offset 5)
;; (setq asm86-code-comment-base-offset 5)
;; (setq asm86-inline-comment-base-offset 5)
;; (setq asm86-inst-base-offset 5)

;; ; Within a function, indent an additional 5
;; ; spaces (instead of the default 3):
;; (setq asm86-blank-func-offset 5)
;; (setq asm86-label-func-offset 5)
;; (setq asm86-header-comment-func-offset 5)
;; (setq asm86-code-comment-func-offset 5)
;; (setq asm86-inline-comment-func-offset 5)
;; (setq asm86-inst-func-offset 5)
;; ;; END ASM-86 MODE CUSTOMIZATION

;; (use-package auctex) 
;; (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

;; (use-package yasnippet
;;   :init
;;   (yas-global-mode t)
;;   :config
;;   (progn 
;;     (defun yas/advise-indent-function (function-symbol)
;;       (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
;; 	       ,(format
;; 		 "Try to expand a snippet before point, then call `%s' as usual"
;; 		 function-symbol)
;; 	       (let ((yas/fallback-behavior nil))
;; 		 (unless (and (interactive-p)
;; 			      (yas/expand))
;; 		   ad-do-it)))))
    
;;     (yas/advise-indent-function 'cdlatex-tab)
;;     (yas/advise-indent-function 'org-cycle)
;;     (yas/advise-indent-function 'org-try-cdlatex-tab)
;;     )
;; )

(use-package smex
  :init
  (smex-initialize)
  :bind 
    (("M-x" . smex)
     ("C-x C-m" . smex)
     ("C-x m" . smex))
)

;; (use-package switch-window)
(use-package latex-pretty-symbols)
(use-package auto-complete
  :init
  (progn
    (global-auto-complete-mode)
    ;; (add-hook 'org-mode-hook (lambda () (auto-complete-mode -1))))
))

(use-package multiple-cursors
  :bind
  ("C-S-c C-S-c" . mc/edit-lines))

;; (use-package org-mode
;;   :init
;;   (progn
;;     (global-org-mode))
;; )

(use-package cdlatex
  :init
  (progn 
     (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
     (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
     (add-hook 'LaTeX-mode-hook (lambda () (auto-complete-mode -1)))))

(setq cdlatex-command-alist
      '(
	("bi" "Insert \\binom{}{}" "\\binom{?}{}" cdlatex-position-cursor nil nil t)
	))
(setq cdlatex-math-modify-alist
      '(
	(?t "\\text" nil t nil nil)
	(?b "\\mathbb" nil t nil nil)
	))

(setq preview-scale-function 1.7)                 ;; enlarge equation preview
(setq preview-auto-cache-preamble t)              ;; auto cache preamble

(use-package evil
  :init
    (evil-mode 1)
  :config
  (setq evil-default-cursor t)
  (surround-mode 1)
)
 
;; (use-package evil-tabs
;;   :init
;;   (global-evil-tabs-mode t)
;; )
 
(use-package surround
  :init 
  (global-surround-mode 1)
)
 
(use-package evil-leader
  :init
  (global-evil-leader-mode)
  :config
  (progn
    (evil-leader/set-leader "SPC")
    (evil-leader/set-key
     "w" 'save-buffer
     "e" 'find-file
     "b" 'switch-to-buffer
     "t" 'switch-to-buffer
     "c" 'TeX-command-master
     "k" 'kill-buffer
     "x" 'smex
     "j" 'smex
     )
    )
)
 
;(evilnc-default-hotkeys)
 
 
(use-package key-chord
  :init
  (key-chord-mode t)
  :config
 (progn 
    (defun comment-or-uncomment-region-or-line ()
      "Comments or uncomments the region or the current line if there's no active region."
      (interactive)
      (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
	  (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
 
 
    (defun duplicate-line()
      (interactive)
      (move-beginning-of-line 1)
      (kill-line)
      (yank)
      (open-line 1)
      (next-line 1)
      (yank)
      )
 
    (defun copy-line()
      (interactive)
      (move-beginning-of-line 1)
      (kill-line)
      (yank)
      )
 
    ;; (key-chord-define-global "mx" 'smex)
    ;; (key-chord-define-global "jk" 'smex)
    (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
    ;; (key-chord-define-global "zx" 'eval-buffer)
    ;; (key-chord-define-global "fj" 'ido-switch-buffer)
    ;; (key-chord-define-global "jf" 'ido-switch-buffer)
    ;; (key-chord-define-global "FF" 'ido-find-file)
    ;; (key-chord-define-global "yy" 'copy-line)
    ;; (key-chord-define-global "YY" 'duplicate-line)
    ;; (key-chord-define-global ";;" 'comment-or-uncomment-region-or-line)
))
