(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(load-theme 'darcula t) ;theme from MELPA
(menu-bar-mode -1) ;remove menubar
(tool-bar-mode -1) ;remove toolbar
(setq make-backup-files nil) ;no backups
(setq auto-save-list-file-name nil) ;no .saves files
(setq auto-save-defaults nil) ;no auto-safe
					;projectile
(projectile-global-mode)

(add-to-list 'load-path "~/.emacs.d/")

;Linum+ line number

(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)


					;auto-complete
(require 'auto-complete-config)
(ac-config-default)

					;built-in

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

					;built-in
(require 'bs)
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))
(global-set-key (kbd "<f2>") 'bs-show)

					; Sr speedbar
(require 'sr-speedbar)
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)
					;YASnipet
(require 'yasnippet)
(yas-global-mode 1)

					;default font
(add-to-list 'default-frame-alist '(font . "Ubuntu-11"))
(set-default-font "Ubuntu-12")
