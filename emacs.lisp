;;This is poponion's emacs init file
;;Some contents comes from internet
;;
;;Email: huangcm85@gmail.com
;;Blog:  www.poponion.info
;;Twitter: pop_onion
;;sina microblog: poponion

;;set emacs config home
(setq self-emacs-home "~/.emacs.d/")
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;    Basic config     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-font-lock-mode t)

;打开图片显示功能
(auto-image-file-mode t)

;以 y/n代表 yes/no，可能你觉得不需要，呵呵。
(fset 'yes-or-no-p 'y-or-n-p)

;显示列号
(column-number-mode t)

;显示括号匹配
(show-paren-mode t)


;显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;去掉toolbar
(tool-bar-mode nil)

;去掉滚动条，因为可以使用鼠标滚轮了 ^_^
(scroll-bar-mode nil)

;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。很好玩阿，这个功能
(mouse-avoidance-mode 'animate)

;支持中键粘贴
(setq mouse-yank-at-point t)

;支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;在标题栏提示你目前在什么位置
(setq frame-title-format "huangcm@%b")

;默认显示 80列就换行
(setq default-fill-column 80)

;Default compile command: make -j
(setq compile-command "make -j")

;;;;Org-mode config
(add-to-list 'auto-mode-alist '("\.\(org\|org_archive\|txt\)$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
 
(setq org-todo-keywords
      (list "TODO(t)" "STARTED(s!)" "WAITING(w@)" "|" "CANCELED(c)" "DONE(d)"))
(setq org-agenda-files
      (list "~/workspace/mydocument/org/TODO.org"))
;;(defun todo ()
;;  (interactive)
;;  (find-file "~/workspace/resources/org/todo.org"))
;;
;;;;chm view
;;(require 'chm-view)


;;;Global keybind
;(global-set-key "\C-cd" 'switch-to-eshell)
;(global-set-key "\C-c\C-d" 'eshell-current-dir)
;(global-set-key "\C-cc" 'exchange-buffer)
;(global-set-key "\C-cm" 'man)
;(global-set-key [(control ?\.)] 'ska-point-to-register)
;(global-set-key [(control ?\,)] 'ska-jump-to-register)
;(define-key global-map (kbd "C-c a") 'wy-go-to-char)
;(define-key global-map (kbd "C-c i") 'go-to-include-file)
(setq skeleton-pair t)
(setq skeleton-pair-alist '((?{ > \n _ \n ?} >)))
(global-set-key (kbd "\C-c[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\C-c(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\C-c{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\C-c<") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\C-c\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\C-c\'") 'skeleton-pair-insert-maybe)
(global-set-key [?\C-h] 'help-command)
(global-set-key [(f7)] 'compile)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;              Emacs plugins               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;plugin root dir
(add-to-list 'load-path "~/.emacs.d")

;;;;ido
(require 'ido)
(ido-mode t)

;; enable fuzzy matching
(setq ido-enable-flex-matching t)


;;;;line number
(require 'linum)
(add-hook 'find-file-hooks (lambda () (linum-mode 1)))


;;;; stardict least is best
;;;; sudo apt-get install stardict first in debian system
;;(require 'sdcv)
;;(setq sdcv-dictionary-simple-list
;;      '("朗道汉英字典5.0";;"牛津简明英汉袖珍辞典"
;;  	))
;;(setq sdcv-dictionary-complete-list
;;      '("朗道汉英字典5.0"
;;  	))
;;(global-set-key [(?\s-a)] 'sdcv-search-pointer+)
;;(global-set-key [(?\s-A)] 'sdcv-search-input)
(global-set-key "\C-cf" 'sdcv-search-pointer+)
(global-set-key "\C-cd" 'sdcv-search-input)


;; python-mode settings
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist(cons '("python" . python-mode)
                             interpreter-mode-alist))
;; path to the python interpreter
(setq py-python-command "python")
(autoload 'python-mode "python-mode" "Python editing mode." t)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

(require 'pycomplete)

;;;;Org2blog wirte blog in emacs with org-mode
(add-to-list 'load-path "~/.emacs.d/org-7.7/lisp")
(require 'org-install)
(add-to-list 'load-path "~/.emacs.d/org2blog")
(require 'org2blog)
(setq org2blog/wp-blog-alist
      '(("myblog"
         :url "http://www.poponion.info/xmlrpc.php"
         :username "poponion")))



;;;;subversion
(require 'psvn)

;;;;color theme
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-lethe)

;;;;cedet
(add-to-list 'load-path "~/.emacs.d/cedet-1.0pre7/common")
(require 'cedet)
;(semantic-load-enable-minimum-features)
;(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)

;;;;doxymacs
(add-to-list 'load-path "~/.emacs.d/doxymacs-1.8.0/lisp")
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)

(setq doxymacs-doxygen-style "C++")
(defconst doxymacs-C++-function-comment-template
 '((let ((next-func (doxymacs-find-next-func)))
     (if next-func
	 (list
	  'l
	  "/** " '> 'n
	  " * " 'p '> 'n
	  " * " '> 'n
	  (doxymacs-parm-tempo-element (cdr (assoc 'args next-func)))
	  (unless (string-match
                   (regexp-quote (cdr (assoc 'return next-func)))
                   doxymacs-void-types)
	    '(l " * " > n " * " (doxymacs-doxygen-command-char)
		"return " (p "Returns: ") > n))
	  " */" '>)
       (progn
	 (error "Can't find next function declaration.")
	 nil))))
 "Default c++-style template for function documentation.")


(defconst doxymacs-C++-file-comment-template
 '(
   "/*" > n
   "*" > n
   "*"" This program is free software; you can redistribute it and/or modify "> n
   "*"" it under the terms of the GNU General Public License version 2 as "> n
   "*"" published by the Free Software Foundation." > n
   "*" > n
   "*" " " (if (buffer-file-name)
      (file-name-nondirectory (buffer-file-name))
    "") " is for what ..."> n
  "*" > n
  "*"" Version: ***: "(if (buffer-file-name)
       (file-name-nondirectory (buffer-file-name))
     "") "  " (current-time-string)  " poponion Exp $" > n
   "*" > n
   "*"" Infos:" > n
   "*""   Author: poponion" > n
   "*""   Email : huangcm85@gmail.com" > n
   "*""   Blog  : www.poponion.info" > n
   "*""     -some work detail if you want " > n
   "*"> n
   "*""/"> n)
 "Default C++-style template for file documentation.")


;;;;auto complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

;;----set include dir--------
(setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(defconst cedet-win32-include-dirs
  (list "C:/MinGW/include"
        "C:/MinGW/include/c++/3.4.5"
        "C:/MinGW/include/c++/3.4.5/mingw32"
        "C:/MinGW/include/c++/3.4.5/backward"
        "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
        "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
(require 'semantic-c nil'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;;------------cscope-------------------
(require 'xcscope)

;;----------jump------------------
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first)
                    (ring-remove ring 0))))
(define-key c-mode-base-map [M-S-f12] 'semantic-analyze-proto-impl-toggle)
;;-------------code complete---------------
(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)
;;------------EDE--------------------------
(global-ede-mode t)

;;-----------------visual bookmarks------------
(enable-visual-studio-bookmarks)

;;----------------h/cpp------------------------
(require 'eassist nil'noerror)
(define-key c-mode-base-map [f11] 'eassist-switch-h-cpp)
(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
       ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))

;;-------------code fold------------------------
;(require 'semantic-tag-folding nil'noerror)
;(global-semantic-tag-folding-mode 1)
;(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
;(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
;(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
;(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)

;;----------------c++ style---------------------
;;(require 'oceanbase)
;;set k&r c mode
(add-hook 'c-mode-hook
	  '(lambda()
;             (c-set-style "oceanbase-c-style")))
	     (c-set-style "k&r")
	     (setq c-basic-offset 2)
	     (setq tab-width 2)
	     (setq indent-tabs-mode nil)))

;;set c++ style
(add-hook 'c++-mode-hook
	  '(lambda()
;             (c-set-style "oceanbase-c-style")))
	     (c-set-style "stroustrup")
	     (setq c-basic-offset 2)
	     (setq tab-width 2)
	     (setq indent-tabs-mode nil)))

;;set python style
(add-hook 'python-mode-hook
	  '(lambda()
	     (setq c-basic-offset 2)
	     (setq tab-width 2)
	     (setq indent-tabs-mode nil)))
;;--------------------eshell----------------------
;; eshell
;(setq eshell-directory-name (concat self-emacs-home "/.eshell"))
;(setq eshell-history-file-name (concat eshell-directory-name "/history"))
;(setq eshell-history-size 1000)
;(setq eshell-last-dir-ring-size 100)
;(defun m-eshell-hook ()
  ;; (tabbar-local-mode 1)
;  (define-key eshell-mode-map [(control d)] (lambda()(interactive)(kill-buffer (current-buffer))))
  ;; (define-key eshell-mode-map "\C-x\C-n" 'tabbar-forward-tab)
  ;; (define-key eshell-mode-map "\C-x\C-j" 'tabbar-backward-tab)
;  (define-key eshell-mode-map [(control u)] 'eshell-kill-input)
;  (define-key eshell-mode-map [up] 'eshell-previous-matching-input-from-input)
;  (define-key eshell-mode-map [down] 'eshell-next-matching-input-from-input)
;  )
;(add-hook 'eshell-mode-hook 'm-eshell-hook)

;(defun my-shell-hook ()
;  (define-key shell-mode-map [(control u)] 'comint-kill-input))
;(add-hook  'shell-mode-hook 'my-shell-hook)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(kill-ring-max 100)
 '(org-agenda-files (quote ("~/workspace/mydocument/org/TODO.org")))
 '(semantic-c-dependency-system-include-path (quote ("/usr/include/c++/4.4" "/usr/include")))
 '(semanticdb-project-roots (quote ("~/code")))
 '(show-paren-mode t)
 '(weblogger-config-alist (quote (("default" ("user" . "poponion") ("server-url" . "http://www.poponion.info/xmlrpc.php") ("weblog" . "1")) ("myblog" ("user" . "poponion") ("server-url" . "http://www.poponion.info/xmlrpc.php") ("weblog" . "1"))))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#537182" :foreground "AntiqueWhite2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "microsoft" :family "Comic Sans MS")))))

;;load misc

(add-to-list 'load-path "~/.emacs.d/my-lisps")
(require 'poponion-misc)