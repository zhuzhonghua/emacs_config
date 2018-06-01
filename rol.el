(defun dummy-bind ()
	""
	(interactive)
	(message "no bind for the key"))

(defun dummy-insert-n (n)
	(self-insert-command n))

(defun rol-minibuffer-unbind ()
	(message "ivy"))

(defun rol-bind-minibuffer-keys ()
	(define-key ivy-minibuffer-map (kbd "0") '(lambda () (dummy-insert-n "0")))
	(define-key ivy-minibuffer-map (kbd "1") nil)
	(define-key ivy-minibuffer-map (kbd "2") nil)
	(define-key ivy-minibuffer-map (kbd "3") nil)
	(define-key ivy-minibuffer-map (kbd "4") nil)
	(define-key ivy-minibuffer-map (kbd "5") nil)
	(define-key ivy-minibuffer-map (kbd "6") nil)
	(define-key ivy-minibuffer-map (kbd "7") nil)
	(define-key ivy-minibuffer-map (kbd "8") nil)
	(define-key ivy-minibuffer-map (kbd "9") nil)
	(define-key ivy-minibuffer-map (kbd "a") nil)
	(define-key ivy-minibuffer-map (kbd "A") nil)
	(define-key ivy-minibuffer-map (kbd "b") nil)
	(define-key ivy-minibuffer-map (kbd "B") nil)
	(define-key ivy-minibuffer-map (kbd "c") nil)
	(define-key ivy-minibuffer-map (kbd "C") nil)
	(define-key ivy-minibuffer-map (kbd "d") nil)
	(define-key ivy-minibuffer-map (kbd "D") nil)
	(define-key ivy-minibuffer-map (kbd "e") nil)
	(define-key ivy-minibuffer-map (kbd "E") nil)
	(define-key ivy-minibuffer-map (kbd "f") nil)
	(define-key ivy-minibuffer-map (kbd "F") nil)
	(define-key ivy-minibuffer-map (kbd "g") nil)
	(define-key ivy-minibuffer-map (kbd "G") nil)
	(define-key ivy-minibuffer-map (kbd "h") nil)
	(define-key ivy-minibuffer-map (kbd "H") nil)
	(define-key ivy-minibuffer-map (kbd "i") nil)
	(define-key ivy-minibuffer-map (kbd "I") nil)
	(define-key ivy-minibuffer-map (kbd "j") nil)
	(define-key ivy-minibuffer-map (kbd "J") nil)
	(define-key ivy-minibuffer-map (kbd "k") nil)
	(define-key ivy-minibuffer-map (kbd "K") nil)
	(define-key ivy-minibuffer-map (kbd "l") nil)
	(define-key ivy-minibuffer-map (kbd "L") nil)
	(define-key ivy-minibuffer-map (kbd "m") nil)
	(define-key ivy-minibuffer-map (kbd "M") nil)
	(define-key ivy-minibuffer-map (kbd "n") nil)
	(define-key ivy-minibuffer-map (kbd "N") nil)
	(define-key ivy-minibuffer-map (kbd "o") nil)
	(define-key ivy-minibuffer-map (kbd "O") nil)
	(define-key ivy-minibuffer-map (kbd "p") nil)
	(define-key ivy-minibuffer-map (kbd "P") nil)
	(define-key ivy-minibuffer-map (kbd "q") nil)
	(define-key ivy-minibuffer-map (kbd "Q") nil)
	(define-key ivy-minibuffer-map (kbd "r") nil)
	(define-key ivy-minibuffer-map (kbd "R") nil)
	(define-key ivy-minibuffer-map (kbd "s") nil)
	(define-key ivy-minibuffer-map (kbd "S") nil)
	(define-key ivy-minibuffer-map (kbd "t") nil)
	(define-key ivy-minibuffer-map (kbd "T") nil)
	(define-key ivy-minibuffer-map (kbd "u") nil)
	(define-key ivy-minibuffer-map (kbd "U") nil)
	(define-key ivy-minibuffer-map (kbd "v") nil)
	(define-key ivy-minibuffer-map (kbd "V") nil)
	(define-key ivy-minibuffer-map (kbd "w") nil)
	(define-key ivy-minibuffer-map (kbd "W") nil)
	(define-key ivy-minibuffer-map (kbd "x") nil)
	(define-key ivy-minibuffer-map (kbd "X") nil)
	(define-key ivy-minibuffer-map (kbd "y") nil)
	(define-key ivy-minibuffer-map (kbd "Y") nil)
	(define-key ivy-minibuffer-map (kbd "z") nil)
	(define-key ivy-minibuffer-map (kbd "Z") nil)
	(define-key ivy-minibuffer-map (kbd " ") nil))

(defun rol-bind-keys (map)
	(define-key map (kbd "h") 'backward-char)
	(define-key map (kbd "j") 'next-line)
	(define-key map (kbd "k") 'previous-line)
	(define-key map (kbd "l") 'forward-char)
	(define-key map (kbd "n") 'next-line)
	(define-key map (kbd "p") 'previous-line)
	(define-key map (kbd "0") 'dummy-bind)
	(define-key map (kbd "1") 'dummy-bind)
	(define-key map (kbd "2") 'dummy-bind)
	(define-key map (kbd "3") 'dummy-bind)
	(define-key map (kbd "4") 'dummy-bind)
	(define-key map (kbd "5") 'dummy-bind)
	(define-key map (kbd "6") 'dummy-bind)
	(define-key map (kbd "7") 'dummy-bind)
	(define-key map (kbd "8") 'dummy-bind)
	(define-key map (kbd "9") 'dummy-bind)
	(define-key map (kbd "a") 'dummy-bind)
	(define-key map (kbd "A") 'dummy-bind)
	(define-key map (kbd "b") 'dummy-bind)
	(define-key map (kbd "B") 'dummy-bind)
	(define-key map (kbd "c") 'dummy-bind)
	(define-key map (kbd "C") 'dummy-bind)
	(define-key map (kbd "d") 'dummy-bind)
	(define-key map (kbd "D") 'dummy-bind)
	(define-key map (kbd "e") 'dummy-bind)
	(define-key map (kbd "E") 'dummy-bind)
	(define-key map (kbd "f") 'dummy-bind)
	(define-key map (kbd "F") 'dummy-bind)
	(define-key map (kbd "g") 'dummy-bind)
	(define-key map (kbd "G") 'dummy-bind)
	(define-key map (kbd "i") 'dummy-bind)
	(define-key map (kbd "I") 'dummy-bind)
	(define-key map (kbd "m") 'dummy-bind)
	(define-key map (kbd "M") 'dummy-bind)
	(define-key map (kbd "o") 'dummy-bind)
	(define-key map (kbd "O") 'dummy-bind)
	(define-key map (kbd "q") 'dummy-bind)
	(define-key map (kbd "Q") 'dummy-bind)
	(define-key map (kbd "r") 'dummy-bind)
	(define-key map (kbd "R") 'dummy-bind)
	(define-key map (kbd "s") 'dummy-bind)
	(define-key map (kbd "S") 'dummy-bind)
	(define-key map (kbd "t") 'dummy-bind)
	(define-key map (kbd "T") 'dummy-bind)
	(define-key map (kbd "u") 'dummy-bind)
	(define-key map (kbd "U") 'dummy-bind)
	(define-key map (kbd "v") 'dummy-bind)
	(define-key map (kbd "V") 'dummy-bind)
	(define-key map (kbd "w") 'dummy-bind)
	(define-key map (kbd "W") 'dummy-bind)
	(define-key map (kbd "x") 'dummy-bind)
	(define-key map (kbd "X") 'dummy-bind)
	(define-key map (kbd "y") 'dummy-bind)
	(define-key map (kbd "Y") 'dummy-bind)
	(define-key map (kbd "z") 'dummy-bind)
	(define-key map (kbd "Z") 'dummy-bind)
	(define-key map (kbd " ") 'dummy-bind))

;;define-minor-mode rol-mode
;;	"Read Only Layer read only mode using emacs keystorks other than evil mode"
;;	:global t
;;	:lighter " rol"
;;	:keymap (let ((map (make-sparse-keymap)))
;;           (define-key map (kbd "h") 'backward-char)
;;           (define-key map (kbd "j") 'next-line)
;;           (define-key map (kbd "k") 'previous-line)
;;           (define-key map (kbd "l") 'forward-char)
;;           (define-key map (kbd "n") 'next-line)
;;           (define-key map (kbd "p") 'previous-line)
;;						(rol-bind-keys map)
;;						(rol-minibuffer-unbind)
;;           map))
