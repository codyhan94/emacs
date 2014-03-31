(tool-bar-mode 0)
(menu-bar-mode 0)

(require 'cl)

;; (general) configuration starts here.

(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)
(set 'inhibit-startup-screen t)

;;make backups more sane ...
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(add-to-list 'load-path' "~/.emacs.d/elpa")
;; packages.
(load "~/.emacs.d/my-install-packages.el")
(load "~/.emacs.d/bind-key.el")
(load "~/.emacs.d/use-package.el")
(load "~/.emacs.d/my-configure-packages.el")

(load-theme 'sanityinc-tomorrow-night t)

;; Get rid of bell
(setq ring-bell-function 'ignore)

;; Global linum and global visual lines
;; (global-linum-mode t)
(column-number-mode t)
;; (global-visual-line-mode t)

;; Global undo tree
(global-undo-tree-mode t)

;; Change font
(if window-system 
    (set-face-attribute 'default nil :font "PragmataPro-10"))

;; Make mouse visible
(set-mouse-color "white")

;; Set browser?
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

;; Sentences end with one space.
(setq sentence-end-double-space nil)

;; Hard limits lines to 76 characters.
(add-hook 'text-mode-hook
	  (lambda ()
	    (auto-fill-mode t)
	    (auto-complete-mode t))
	  t)

;; Org mode cdlatex and indent mode
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-indent-mode t)
	    (org-cdlatex-mode t)
	    (auto-complete-mode -1)
	    t))

;; No tabs!
(setq-default indent-tabs-mode nil)

(setq-default fill-column 76)
;; Do it for programming modes too.
(add-hook 'prog-mode-hook
	  (lambda ()
	    (auto-fill-mode t))
	  t)

;; (evil-mode t)
;; (key-chord-mode t)
;; (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; Remap org-mode meta keys for convenience
;; Needs debugging
;; (mapcar (lambda (state)
;;     (evil-declare-key evil-insert-state org-mode-map
;;       (kbd "M-l") 'org-metaright
;;       (kbd "M-h") 'org-metaleft
;;       (kbd "M-k") 'org-metaup
;;       (kbd "M-j") 'org-metadown
;;       (kbd "M-L") 'org-shiftmetaright
;;       (kbd "M-H") 'org-shiftmetaleft
;;       (kbd "M-K") 'org-shiftmetaup
;;       (kbd "M-J") 'org-shiftmetadown))
;;   '(normal insert))

(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
(define-key evil-insert-state-map "\C-d" 'evil-delete-char)
(define-key evil-visual-state-map "\C-d" 'evil-delete-char)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-visual-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-w" 'evil-delete-backward-word)
(define-key evil-visual-state-map "\C-w" 'evil-delete)
(define-key evil-normal-state-map "\C-u" 'evil-scroll-up)
(define-key evil-visual-state-map "\C-u" 'evil-scroll-up)
(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)
(define-key evil-normal-state-map "0" 'evil-beginning-of-line)
;; Custom move commands, like in vim. Visual and normal modes
(define-key evil-normal-state-map "H" 'evil-first-non-blank)
(define-key evil-normal-state-map "L" 'evil-end-of-line)
(define-key evil-normal-state-map "0" 'evil-beginning-of-line)
(define-key evil-visual-state-map "H" 'evil-first-non-blank)
(define-key evil-visual-state-map "L" 'evil-end-of-line)
(define-key evil-visual-state-map "k" 'evil-previous-visual-line)
(define-key evil-normal-state-map "j" 'evil-next-visual-line)
(define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
(define-key evil-visual-state-map "Q" 'call-last-kbd-macro)
;; (define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)

; This needs debugging... don't want evil mode in undo tree visualizer mode
(add-hook 'undo-tree-visualizer-mode-hook
	  (lambda ()
	    (evil-emacs-state 1))
	  t)
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list (quote (("Zathura" "zathura %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Zathura") (output-html "xdg-open"))))
 '(c-basic-offset 4)
 '(c-default-style (quote ((c-mode . "linux") (c++-mode . "linux") (java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
 '(cdlatex-command-alist (quote (("bi" "Insert \\binom{}{}" "\\binom{?}{}" cdlatex-position-cursor nil nil t) ("st" "Insert \\stirling{}{}" "\\stirling{?}{}" cdlatex-position-cursor nil nil t))))
 '(cdlatex-math-modify-alist (quote ((116 "\\text" nil t nil nil) (98 "\\mathbb" "\\textbf" t nil nil))))
 '(cdlatex-math-symbol-alist (quote ((62 ("\\geq" "\\longrightarrow" "\\max")) (60 ("\\leq" "\\longleftarrow" "\\min")) (61 ("&=" "\\equiv" "\\Longleftrightarrow")) (126 ("\\approx" "\\simeq" "\\sim")))))
 '(org-agenda-files (quote ("/tmp/orgfun.org")))
 '(org-html-with-latex (\` imagemagick)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
