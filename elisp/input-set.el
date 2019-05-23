
;;(require 'pyim)
;;(require 'pyim-basedict)
;;
;;(pyim-basedict-enable)
;;(setq default-input-method "pyim")
;;(pyim-basedict-enable)
;;
;;(setq pyim-default-scheme 'quanpin)
;;(global-set-key (kbd "C-\\") 'toggle-input-method)
;;(setq pyim-page-tooltip 'popup)

(setq my-input-methods
      '("japanese"
        "japanese-katakana"
        "chinese-py")
      my-current-input-methods my-input-methods)

(defun my-cycle-input-method ()
  "Cycle `my-input-method-alist'."
  (interactive)
  (if (null (cdr my-current-input-methods))
      (setq my-current-input-methods my-input-methods)
    (setq my-current-input-methods (cdr my-current-input-methods)))
  (set-input-method (car my-current-input-methods)))

(global-set-key (kbd "C-\\") 'toggle-input-method)
(global-set-key (kbd "M-C-\\") 'my-cycle-input-method)

(provide 'input-set)
