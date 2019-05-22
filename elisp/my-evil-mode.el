;; my evil mode
;; forbiden single key change

(defun dummy-bind ()
	(interactive)
	(message "dummy key"))

(defvar my-evil-mode-hook nil)

(defvar my-evil-mode-map
	(make-keymap))


(define-key my-evil-mode-map (kbd "1") 'dummy-bind)
(define-key my-evil-mode-map (kbd "2") 'dummy-bind)
(define-key my-evil-mode-map (kbd "3") 'dummy-bind)
(define-key my-evil-mode-map (kbd "4") 'dummy-bind)
(define-key my-evil-mode-map (kbd "5") 'dummy-bind)
(define-key my-evil-mode-map (kbd "6") 'dummy-bind)
(define-key my-evil-mode-map (kbd "7") 'dummy-bind)
(define-key my-evil-mode-map (kbd "8") 'dummy-bind)
(define-key my-evil-mode-map (kbd "9") 'dummy-bind)
(define-key my-evil-mode-map (kbd "a") 'dummy-bind)
(define-key my-evil-mode-map (kbd "A") 'dummy-bind)
(define-key my-evil-mode-map (kbd "b") 'dummy-bind)
(define-key my-evil-mode-map (kbd "B") 'dummy-bind)
(define-key my-evil-mode-map (kbd "c") 'dummy-bind)
(define-key my-evil-mode-map (kbd "C") 'dummy-bind)
(define-key my-evil-mode-map (kbd "d") 'dummy-bind)
(define-key my-evil-mode-map (kbd "D") 'dummy-bind)
(define-key my-evil-mode-map (kbd "e") 'dummy-bind)
(define-key my-evil-mode-map (kbd "E") 'dummy-bind)
(define-key my-evil-mode-map (kbd "f") 'dummy-bind)
(define-key my-evil-mode-map (kbd "F") 'dummy-bind)
(define-key my-evil-mode-map (kbd "g") 'dummy-bind)
(define-key my-evil-mode-map (kbd "G") 'dummy-bind)
(define-key my-evil-mode-map (kbd "h") 'backward-char)
(define-key my-evil-mode-map (kbd "H") 'backward-char)
(define-key my-evil-mode-map (kbd "i") 'my-evil-mode)
(define-key my-evil-mode-map (kbd "I") 'my-evil-mode)
(define-key my-evil-mode-map (kbd "j") 'next-line)
(define-key my-evil-mode-map (kbd "J") 'next-line)
(define-key my-evil-mode-map (kbd "k") 'previous-line)
(define-key my-evil-mode-map (kbd "K") 'previous-line)
(define-key my-evil-mode-map (kbd "l") 'forward-char)
(define-key my-evil-mode-map (kbd "L") 'forward-char)
(define-key my-evil-mode-map (kbd "m") 'dummy-bind)
(define-key my-evil-mode-map (kbd "M") 'dummy-bind)
(define-key my-evil-mode-map (kbd "n") 'next-line)
(define-key my-evil-mode-map (kbd "N") 'next-line)
(define-key my-evil-mode-map (kbd "o") 'dummy-bind)
(define-key my-evil-mode-map (kbd "O") 'dummy-bind)
(define-key my-evil-mode-map (kbd "p") 'previous-line)
(define-key my-evil-mode-map (kbd "P") 'previous-line)
(define-key my-evil-mode-map (kbd "q") 'dummy-bind)
(define-key my-evil-mode-map (kbd "Q") 'dummy-bind)
(define-key my-evil-mode-map (kbd "r") 'dummy-bind)
(define-key my-evil-mode-map (kbd "R") 'dummy-bind)
(define-key my-evil-mode-map (kbd "s") 'dummy-bind)
(define-key my-evil-mode-map (kbd "S") 'dummy-bind)
(define-key my-evil-mode-map (kbd "t") 'dummy-bind)
(define-key my-evil-mode-map (kbd "T") 'dummy-bind)
(define-key my-evil-mode-map (kbd "u") 'dummy-bind)
(define-key my-evil-mode-map (kbd "U") 'dummy-bind)
(define-key my-evil-mode-map (kbd "v") 'dummy-bind)
(define-key my-evil-mode-map (kbd "V") 'dummy-bind)
(define-key my-evil-mode-map (kbd "w") 'dummy-bind)
(define-key my-evil-mode-map (kbd "W") 'dummy-bind)
(define-key my-evil-mode-map (kbd "x") 'dummy-bind)
(define-key my-evil-mode-map (kbd "X") 'dummy-bind)
(define-key my-evil-mode-map (kbd "y") 'dummy-bind)
(define-key my-evil-mode-map (kbd "Y") 'dummy-bind)
(define-key my-evil-mode-map (kbd "z") 'dummy-bind)
(define-key my-evil-mode-map (kbd "Z") 'dummy-bind)


(define-minor-mode my-evil-mode
	"read only except prefix keystrokes"
	nil
	" my-evil"
	my-evil-mode-map)

(defun my-evil-mode-disable ()
	"Disable my evil mode on special occation"
	(my-evil-mode -1))

(global-set-key (kbd "M-i") 'my-evil-mode)

(add-hook 'minibuffer-setup-hook 'my-evil-mode-disable)

(provide 'my-evil-mode)
