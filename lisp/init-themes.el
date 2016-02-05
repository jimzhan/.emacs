(when (< emacs-major-version 24)
  (require-package 'color-theme))

(require-package 'color-theme-solarized)

(setq solarized-default-background-mode 'dark)
(load-theme 'solarized t)

(defun set-background-mode (frame mode)
  (set-frame-parameter frame 'background-mode mode)
  (when (not (display-graphic-p frame))
    (set-terminal-parameter (frame-terminal frame) 'background-mode mode))
  (enable-theme 'solarized))


(add-hook 'after-make-frame-functions
          (lambda (frame) (set-background-mode frame solarized-default-background-mode)))

(set-background-mode nil solarized-default-background-mode)

(global-set-key (kbd "C-c t") 'switch-theme)

; custom variables, see
; https://github.com/sellout/emacs-color-theme-solarized
(custom-set-variables '(solarized-termcolors 256))
(custom-set-variables '(solarized-contrast 'high))
(custom-set-variables '(solarized-visibility 'high))

(provide 'init-themes)
