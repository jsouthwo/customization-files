;;;; << That's how to comment. (Just one is all that's needed)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Clock stuff
;(setq org-clock-persist 'history)
;(org-clock-persistence-insinuate)
(setq org-todo-keywords
   '((sequence "TODO(t)" "IN_PROGRESS(p)" "DONE(d@!)"))) ; ! (timestamp), @ (note with timestamp)
;  '((sequence "TODO(t)" "IN_PROGRESS(p@/!)" "DONE(d!)")))


;; Puts line numbers
(global-linum-mode t)
(global-column-number-mode t)

;; Stop splash screen and message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Other people's stuff
;;; Found at http://qdot.github.io/conf_emacs/

(defun reload-file ()
  "Reload a file, resetting the cursor to the current position"
  (interactive)
  (let ((curr-scroll (window-vscroll)))
    (find-file (buffer-name))
    (set-window-vscroll nil curr-scroll)))

(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (>= (recursion-depth) 1)
    (abort-recursive-edit)))
;; Whenever a mouse click has happened, clear the minibuffer
(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)
(setq mouse-wheel-progressive-speed nil)

(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Set org babel backgrounds so we get nice blocks
;(setq org-indent-indentation-per-level 4)
;(set-face-background 'org-block-begin-line "#333")
;(set-face-background 'org-block-end-line "#333")
;(set-face-background 'org-block-background "#222")

;; Set defaults we expect
(setq-default py-indent-offset 4)

;; Set default directory
;; TODO: Change for OS and machine.
;(setq default-directory "~/Documents/software_studio/websurv/")

;; Shows matching parenthesis
(show-paren-mode 1)
;; And shows them immediately
(setq show-paren-delay 0)

;; Turns accelerated scrolling off
(setq mouse-wheel-progressive-speed nil)

;; Stop popups... They freeze emacs on Mac.
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
