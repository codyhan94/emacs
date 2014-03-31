
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))
(setq my-packages
      '(color-theme-sanityinc-tomorrow
	base16-theme
	paredit
	undo-tree
	yasnippet
	ido-ubiquitous
	latex-pretty-symbols
	smex
	key-chord
	multiple-cursors
	noctilux-theme
	litable
	powerline
	auto-complete
	org-plus-contrib
	ido-vertical-mode
	evil
	evil-leader
        surround
	auctex
	cdlatex
	scala-mode2))

(dolist (package my-packages)
  (when (not (package-installed-p package))
    (package-install package)))


