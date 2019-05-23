(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-offsets-alist
	 (quote
		((access-label . -)
		 (innamespace . -)
		 (substatement-open . 0))))
 '(package-selected-packages (quote (pyim color-moccur magit)))
 '(show-paren-mode t)
 '(transient-mark-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-safe-themes (quote ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(package-selected-packages (quote (paredit evil auto-complete ag exec-path-from-shell typescript-mode magit)))
 '(region ((t (:background "green" :distant-foreground "gtk_selection_fg_color"))))
 '(show-paren-mode t))

(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'unicad)
(require 'basic-set)
(require 'my-evil-mode)
(require 'input-set)
