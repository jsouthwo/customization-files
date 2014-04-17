
(setq org-todo-keywords
  '((sequence "TODO(t)" "IN_PROGRESS(p@/!)" "DONE(d!)")))


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
(setq default-directory "~/Documents/software_studio/websurv/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
