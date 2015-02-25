; general settings
(tool-bar-mode nil)
(setq vc-follow-symlinks t)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

; packagey stuff
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(setq my-package-list '(ack
			anaconda-mode
			cider
			company
			git-gutter+
			ido
			magit
			rainbow-delimiters
			))

(mapc 'package-install my-package-list)

(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'ack)
  (require 'cider)
  (require 'ido)
  ; package specific configuration
  (ido-mode t)
  (global-git-gutter+-mode t)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'after-init-hook 'global-company-mode)
  )
