;;; init.el --- -*- coding: utf-8 ; lexical-binding: t -*-

;;; Commentary:

;;; Code:
;; initial window size
 (setq initial-frame-alist
          '((top . 1) (left . 1) (width . 120) (height . 55)))

;;; Variables:
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(electric-pair-mode 1)
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq delete-auto-save-files t)
(setq use-dialog-box nil)
(setq select-enable-clipboard t)
;;(setq require-final-newline t)
(setq-default show-trailing-whitespace t)
(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default gc-cons-percentage 0.5)

(setq recentf-max-saved-items 2000) ;; 2000ファイルまで履歴保存する
(setq recentf-auto-cleanup 'never)  ;; 存在しないファイルは消さない
(setq recentf-exclude '("/recentf" "COMMIT_EDITMSG" "/.?TAGS" "^/sudo:" "/\\.emacs\\.d/games/*-scores" "/\\.emacs\\.d/\\.cask/"))
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))

(recentf-mode 1)

(if window-system
    (tool-bar-mode -1)
    (menu-bar-mode -1))

(fset 'yes-or-no-p 'y-or-n-p)

;;; Appearance:
;; frame alpha
(set-frame-parameter (selected-frame) 'alpha '(0.90))

;; title bar
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; C-Ret で矩形選択
;; 詳しいキーバインド操作：http://dev.ariel-networks.com/articles/emacs/part5/
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'mixed)

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "bsd")                            ;;; (a)
            (setq c-basic-offset 4)                        ;;; (b)
            ;; 演算式が複数行にまたがるときのオフセット
            (c-set-offset 'statement-cont 'c-lineup-math)  ;;; (c)
            ;; 行末のスペースやタブに色づけして警告する。
            (setq show-trailing-whitespace t)))            ;;; (d)

(add-hook 'python-mode-hook
                   '(lambda ()
                        (setq indent-tabs-mode nil)
                        (setq indent-level 4)
                        (setq python-indent 4)
                        (setq tab-width 4)))

;; Key binding
(keyboard-translate ?\C-h ?\C-?)

;;; Theme:
(load-theme 'wombat)

(defun my-lisp-load (filename)
  "Load lisp from FILENAME"
  (let ((fullname (expand-file-name (concat "spec/" filename) user-emacs-directory))
        lisp)
    (when (file-readable-p fullname)
      (with-temp-buffer
        (progn
          (insert-file-contents fullname)
          (setq lisp
                (condition-case nil
                    (read (current-buffer))
                  (error ()))))))
    lisp))

;;; Packages:
(when (or (require 'cask "~/.cask/cask.el" t)
	  (require 'cask nil t))
  (cask-initialize))
(package-initialize)

(require 'pallet)
(pallet-mode t)

(require 'use-package)


;;; popwin
(use-package popwin
  :config
  (popwin-mode 1))

;; all-the-icons-dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; codic
(use-package codic
  :config
  (setq codic-api-token (my-lisp-load "codic-api-token"))
  (push '("*Codic Result*") popwin:special-display-config))

;; cmake-ide
(cmake-ide-setup)

;; duplicate-thing
(use-package duplicate-thing
  :bind
  ("M-c" . duplicate-thing))

;; quickrun
;;(require 'quickrun)
(push '("*quickrun*") popwin:special-display-config)

;; Add C++ command for C11 and set it default in C++ file.
(quickrun-add-command "c++/clang++"
                      '((:command . "clang++")
                        (:exec . ("%c -std=c++11 -lstdc++ %o -o %e %s"
                                     "%e %a"))
                        (:remove . ("%e")))
                      :default "c++")

(quickrun-set-default "c++" "c++/clang++")

;;; path:
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; anzu
(use-package anzu
  :bind (("C-c r" . anzu-query-replace)
         ("C-c R" . anzu-query-replace-regexp))
  :config
  (global-anzu-mode +1)
  (setq anzu-use-migemo t)
  (setq anzu-search-threshold 1000)
  (setq anzu-minimum-input-length 3)
)

;; company
(when (locate-library "company")
  (global-company-mode 1)
  (global-set-key (kbd "C-M-i") 'company-complete)
  ;; (setq company-idle-delay nil) ; 自動補完をしない
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection))

(require 'jedi-core)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-to-list 'company-backends 'company-jedi)

;; migemo
(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
  )

;; expand-region
(use-package expand-region
  :bind (("C-=" . er/expand-region)
         ("C-M-=" . er/contract-region)))

;; powerline
(use-package powerline
  :config
  (powerline-default-theme))

;; linum
;(use-package linum
 ; :config
;  (global-linum-mode 1)
 ; (setq linum-format "%4d ")
;  (global-hl-line-mode))


(set-face-background 'region "#aa0") ;; region color

;; markdown-mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))

;; ace-jump-mode
(use-package ace-jump-mode
  :bind (("C-:" . ace-jump-char-mode)
         ("C-;" . ace-jump-word-mode)
         ("C-M-;" . ace-jump-line-mode))
  :init
         (setq ace-jump-word-mode-use-query-char nil)
;;         (append "asdfghjkl;:]qwertyuiop@zxcvbnm,." nil)
         (append "aoeuidhtns',.pyfgcrl;qjkxbmwvz" nil)
;; ace-jump-word-modeのとき文字を尋ねないようにする
         (setq ace-jump-word-mode-use-query-char nil))

;; undo-tree
(use-package undo-tree
  :diminish undo-tree-mode
  :bind (("M-/" . undo-tree-redo))
  :init
  (global-undo-tree-mode t))

;; multiple-cursors
;;(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;(require 'flycheck)
;;(require 'flycheck-pos-tip)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(eval-after-load "flycheck"
  '(progn
     (when (locate-library "flycheck-irony")
       (flycheck-irony-setup))))

;; magit
;;(require 'magit)

;; right-click-context
(use-package right-click-context
  :diminish right-click-context-mode
  :config
  (right-click-context-mode 1))

;; volatile-highlights
(use-package volatile-highlights
  :diminish volatile-highlights-mode
  :config
  (volatile-highlights-mode t))

;; helm
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(global-set-key (kbd "C-c h g") 'helm-google-suggest)
;;(bind-key "C-c っ" 'helm-recentf)
(global-set-key (kbd "C-c t") 'helm-recentf)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 40)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)

;; irony
(eval-after-load "irony"
  '(progn
     (custom-set-variables '(irony-additional-clang-options '("-std=c++11")))
     (add-to-list 'company-backends 'company-irony)
     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
     (add-hook 'c-mode-common-hook 'irony-mode)))

;; yasnippet
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :bind (:map yas-minor-mode-map
              ("C-x i i" . yas-insert-snippet)
              ("C-x i n" . yas-new-snippet)
              ("C-x i v" . yas-visit-snippet-file)
              ("C-x i l" . yas-describe-tables)
              ("C-x i g" . yas-reload-all))
  :config
  (define-key yas-keymap (kbd "<tab>") nil)
  (yas-global-mode 1)
  (setq yas-prompt-functions '(yas-ido-prompt)))

;; diminish
(defmacro safe-diminish (file mode &optional new-name)
  "https://github.com/larstvei/dot-emacs/blob/master/init.org"
  `(with-eval-after-load ,file
     (diminish ,mode ,new-name)))

(safe-diminish "helm-mode" 'helm-mode)
(safe-diminish "company" 'company-mode)
(safe-diminish "irony" 'irony-mode)
;;(safe-diminish "undo-tree" 'undo-tree-mode)
;;(safe-diminish "volatile-highlights" 'volatile-highlights-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(irony-additional-clang-options (quote ("-std=c++11")))
 '(mac-option-modifier (quote meta))
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
    (all-the-icons codic ace-jump-mode flycheck-popup-tip ac-helm yasnippet web-mode use-package smex smartparens projectile prodigy popwin pallet nyan-mode multiple-cursors magit idle-highlight-mode htmlize flycheck-cask expand-region exec-path-from-shell drag-stuff)))
 '(recentf-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; init.el ends here
