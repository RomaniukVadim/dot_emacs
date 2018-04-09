(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "dv")
(ergoemacs-mode 1)
;; Emacs Erlang-mode

(require 'erlang-start)

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

(setq erlang-root-dir "/usr/lib64/erlang")
(add-to-list 'exec-path "/usr/lib64/erlang/bin")
(setq erlang-man-root-dir "/usr/lib64/erlang/man")

(defun my-erlang-mode-hook ()
        ;; when starting an Erlang shell in Emacs, default in the node name
        (setq inferior-erlang-machine-options '("-sname" "emacs"))
        ;; add Erlang functions to an imenu menu
        (imenu-add-to-menubar "imenu")
        ;; customize keys
        (local-set-key [return] 'newline-and-indent)
        )
;; Enable ctrl+c,v,x

(cua-mode t)

;; Python elpy

(defvar myPackages
  '(better-defaults
    elpy ;; add the elpy package
    material-theme))
(elpy-enable)

;; Some Erlang customizations
(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

;; Emacs Powerline

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(require 'cl)

;; Emacs powerline customization

(setq powerline-arrow-shape 'arrow)   ;; the default
(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
(setq powerline-arrow-shape 'arrow14) ;; best for small font


;;(load-theme 'doom-vibrant t) ;theme from MELPA
(load-theme 'abyss t)
(menu-bar-mode -1) ;remove menubar
(tool-bar-mode -1) ;remove toolbar
(setq make-backup-files nil) ;no backups
(setq auto-save-list-file-name nil) ;no .saves files
(setq auto-save-defaults nil) ;no auto-safe
					;projectile
(projectile-global-mode)

(add-to-list 'load-path "~/.emacs.d/packages")
 
(require 'smex)
(smex-initialize)

;Linum+ line number

(require 'linum)
(setq linum-format "%d ")
(global-linum-mode 1)

;;Smart-mode-line
;;(sml/setup)
;;(setq sml/theme 'dark)

;;Company-mode
(add-hook 'after-init-hook 'global-company-mode)
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
(setq sr-speedbar-right-side nil) ; put on left side
(setq speedbar-show-unknown-files t) ; show all files
(setq speedbar-use-images nil) ; use text for buttons
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)
					;YASnipet
(require 'yasnippet)
(yas-global-mode 1)

(scroll-bar-mode -1)

;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
(require 'ox-md)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Terminus (TTF)" :foundry "PfEd" :slant normal :weight normal :height 83 :width normal)))))
 (org-babel-do-load-languages
  'org-babel-do-load-languages
  '(
    (sh . t)
    (python . t)
    ))
(setq load-home-init-file t) ; don't load init file from ~/.xemacs/init.el
;;;;LaTeX
1 	

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;;(set-default-font "Fira Code Retina 8")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   [("#0d0d0d" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#c9b4cf" "#8abeb7" "#ffffff")])
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "3d5720f488f2ed54dd4e40e9252da2912110948366a16aef503f3e9e7dfe4915" "0a3a41085c19d8121ed0ad3eb658a475ccb948a70a83604641ee7d4c3575a4d5" "554b7f0439155d6eb648d4837ef03902f51124cacee021217e76f39e9dd314c2" "3481e594ae6866d72c40ad77d86a1ffa338d01daa9eb0977e324f365cef4f47c" "77bddca0879cb3b0ecdf071d9635c818827c57d69164291cb27268ae324efa84" "73e35ffa5ca98b57a9923954f296c3854ce6d8736b31fdbdda3d27502d4b4d69" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "551596f9165514c617c99ad6ce13196d6e7caa7035cea92a0e143dbe7b28be0e" "6f11ad991da959fa8de046f7f8271b22d3a97ee7b6eca62c81d5a917790a45d9" default)))
 '(display-time-mode t)
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
			 (:color "#808080"))
     (implicitParams :underline
		     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6"))))
 '(fci-rule-color "#5c5e5e")
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#41728e"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(org-ellipsis "  ")
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(package-selected-packages
   (quote
    (smart-mode-line elpy auto-complete-distel distel-completion-lib abyss-theme org-mime org-notebook org-page org-parser org-pdfview org-present git-gutter git-gutter+ sublimity sr-speedbar smex psvn projectile org-bullets org-beautify-theme org-babel-eval-in-repl noctilux-theme magit idea-darkula-theme ergoemacs-status ergoemacs-mode emmet-mode dracula-theme doom-themes darcula-theme color-theme-sanityinc-tomorrow base16-theme babel ac-php)))
 '(tool-bar-mode nil)
 '(vc-annotate-background "#0d0d0d")
 '(vc-annotate-color-map
   (list
    (cons 20 "#b5bd68")
    (cons 40 "#c8c06c")
    (cons 60 "#dcc370")
    (cons 80 "#f0c674")
    (cons 100 "#eab56d")
    (cons 120 "#e3a366")
    (cons 140 "#de935f")
    (cons 160 "#d79e84")
    (cons 180 "#d0a9a9")
    (cons 200 "#c9b4cf")
    (cons 220 "#ca9aac")
    (cons 240 "#cb8089")
    (cons 260 "#cc6666")
    (cons 280 "#af6363")
    (cons 300 "#936060")
    (cons 320 "#765d5d")
    (cons 340 "#5c5e5e")
    (cons 360 "#5c5e5e")))
 '(vc-annotate-very-old-color nil))

(require 'git-gutter)

;; If you enable global minor mode
(global-git-gutter-mode t)

;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)
