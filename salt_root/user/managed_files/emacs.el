;;; package --- Summary
;;;
;;; Commemtary:
;;; Jiwen "Steve" Cai's emacs config file

;; loading constants
(setq HOSTNAME (system-name))
(setq VERSION (emacs-version))
(message HOSTNAME)
(message VERSION)

(message "=================")
(message " Emacs Apperance ")
(message "=================")

;; display time
(display-time)

;; hiding the menu bar
(menu-bar-mode 0)

;; enable margin line number
(global-linum-mode 1)
(setq linum-format "%3d ")

;; highlight white spaces
(require 'whitespace)
(global-whitespace-mode 1)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face trailing tabs newline tab-mark newline-mark
                              lines-tail))
(setq-default indent-tabs-mode nil)

;; default indentation rules
(setq js-indent-level 2)
(setq css-indent-offset 2)

;; highlight trailing whitespaces
(setq-default show-trailing-whitespace t)

;; show WS as _
(setq whitespace-space 'underline)

;; turning on text mode and auto-fill mode automatically
(setq default-major-mode 'text-mode)

;; use option for meta
(setq mac-option-key-is-meta 1)
(setq mac-option-modifier 'meta)

;; highlight the currnet line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#bada55")

;; show matching pairs of parentheses
(show-paren-mode 1)

;; show current file's full path in mini buffer
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(require 'ido)
(ido-mode 'buffers)

(message "=================")
(message " Emacs Behaviour ")
(message "=================")

;; stop creating backup~ files
(setq make-backup-files nil)

;; stop creating those #autosave# files
(setq auto-save-default nil)

;; ignore shit during grep-find
(setq grep-find-ignored-directories
 (quote (".svn" ".git" "ENV" "oneoffs")))
(setq grep-find-ignored-files
 (quote ("core" "*.o" "*.pyc" "*.min.js" "*.min.css")))

(message "================")
(message " Util Functions ")
(message "================")

;; Smart Indent
(defun indent-all()
  "indent all" (interactive) (indent-region 1 (point-max) nil))

;; XML Format
(defun xml-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)
  )
)

(message "====================")
(message " Custom Key Binding ")
(message "====================")

;; C-z             => undo
(define-key global-map (kbd "C-z") 'undo)

;; C-x C-g         => find-name-dired
(define-key global-map (kbd "C-x C-t") 'find-name-dired)
(setq find-name-arg "-iname")

;; C-x C-r         => grep find
(define-key global-map (kbd "C-x C-r") 'rgrep)

;; Grep extension map
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" default)))
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "-")
 '(git-gutter:modified-sign "X")
 '(global-magit-wip-save-mode nil)
 '(grep-files-aliases
   (quote
    (("all" . "* .*")
     ("el" . "*.el")
     ("c" . "*.cc *.CC *.[Cc] *.hh *.HH *.[Hh] *.[ch]xx *.[ch]pp *.[ch]++")
     ("cc" . "*.cc *.CC *.[Cc] *.hh *.HH *.[Hh] *.[ch]xx *.[ch]pp *.[ch]++")
     ("cpp" . "*.cc *.CC *.[Cc] *.hh *.HH *.[Hh] *.[ch]xx *.[ch]pp *.[ch]++")
     ("h" . "*.cc *.CC *.[Cc] *.hh *.HH *.[Hh] *.[ch]xx *.[ch]pp *.[ch]++")
     ("l" . "[Cc]hange[Ll]og*")
     ("m" . "[Mm]akefile*")
     ("tex" . "*.tex")
     ("texi" . "*.texi")
     ("asm" . "*.[sS]"))))
 '(indent-tabs-mode nil)
 '(magit-log-arguments (quote ("--graph" "--decorate" "--no-merges" "-n256")))
 '(package-selected-packages
   (quote
    (neotree magit git-gutter find-file-in-project airline-themes))))

;; eBrowse
(add-hook 'c-mode-common-hook
          (lambda() (local-set-key (kbd "C-c I") 'ebrowse-tags-find-declaration-other-window)))
(add-hook 'c-mode-common-hook
          (lambda() (local-set-key (kbd "C-c i") 'ebrowse-tags-find-definition-other-window)))

;; C-c o           => quick switch between .h and .c files
(add-hook 'c-mode-common-hook
          (lambda() (local-set-key (kbd "C-c o") 'ff-find-other-file)))
(setq cc-other-file-alist
      '(("\\.c$"   (".h"))
        ("\\.cpp$" (".h"))
        ("\\.h$"   (".c" ".cc" ".C" ".CC" ".cxx" ".cpp"))))

;; Golang
(add-hook 'go-mode-hook
          (lambda()
            (setq tab-width 2)
            (setq indent-tabs-mode 1)))

(message "======================")
(message " Third Party Packages ")
(message "======================")

;; MELPA
(require 'package)
(setq melpa-package-list '(airline-themes
                           find-file-in-project
                           git-gutter
                           magit
                           neotree
                           powerline))

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(package-initialize)

(unless package-archive-contents (package-refresh-contents))
(dolist (package melpa-package-list)
  (unless (package-installed-p package) (package-install package)))

;; FFIP
(define-key global-map (kbd "C-c p") 'find-file-in-project)
(define-key global-map (kbd "C-c C-p") 'find-file-in-project)
(add-hook 'c-mode-common-hook
          (lambda() (local-unset-key (kbd "C-c p"))))
(add-hook 'c-mode-common-hook
          (lambda() (local-unset-key (kbd "C-c C-p"))))

;; Git Gutter
(global-git-gutter-mode 1)

;; Magit
;; C-c C-g C-g     => magit-status
(define-key global-map (kbd "C-x C-g C-g") 'magit-status)
;; C-c C-g C-b     => magit-blame
(define-key global-map (kbd "C-x C-g C-b") 'magit-blame)
;; C-c C-g C-f     => magit-log-buffer-file
(define-key global-map (kbd "C-x C-g C-f") 'magit-log-buffer-file)
(require 'magit)
(magit-define-popup-switch 'magit-log-popup
                           ?m "Omit merge commits" "--no-merges")
;; NeoTree
(require 'neotree)
(define-key global-map (kbd "C-c j") 'neotree-toggle)
(define-key global-map (kbd "C-c C-j") 'neotree-toggle)
(setq neo-smart-open t)

;; Modeline and Powerline
(require 'powerline)
(require 'airline-themes)
(load-theme 'airline-light)
(setq-default mode-line-format '((:eval
  (let* ((active (powerline-selected-window-active))
    (separator-left (intern (format "powerline-%s-%s"
                     (powerline-current-separator)
                     (car powerline-default-separator-dir))))
    (separator-right (intern (format "powerline-%s-%s"
                      (powerline-current-separator)
                      (cdr powerline-default-separator-dir))))
    (face-outer (if active 'airline-normal-outer 'powerline-inactive1))
    (face-inner (if active 'airline-normal-inner 'airline-normal-inner))
    (face-trans (if active 'airline-visual-center 'powerline-inactive1))
    (face-center (if active 'airline-normal-center 'powerline-inactive2))
    (lhs (list
          (powerline-raw "%* " face-outer 'l)
          (funcall separator-left face-outer 'airline-visual-inner)
          (powerline-raw (list global-mode-string " ") 'airline-visual-inner 'l)
          (funcall separator-left 'airline-visual-inner face-trans)
          (powerline-raw "%I L%l:C%c:" face-trans 'l)
          (powerline-raw (replace-regexp-in-string
                          "%" "%%" (format-mode-line '(-3 "%p"))) face-trans 'r)
          (funcall separator-left face-trans face-center)
          (powerline-raw "%b " face-center 'l)))
    (rhs (list
          (funcall separator-right face-center face-inner)
          (powerline-raw (list mode-name " ") face-inner 'l)
          (funcall separator-right face-inner face-outer)
          (powerline-raw '(vc-mode vc-mode) face-outer 'r))))
 (concat
  (powerline-render lhs)
  (powerline-fill face-center (powerline-width rhs))
  (powerline-render rhs)))
)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-added ((t (:inherit nil :foreground "#149914" :weight bold))))
 '(magit-diff-removed ((t (:inherit nil :foreground "#991414" :weight bold))))
 '(whitespace-line ((t (:inherit nil :background "#bada55"))))
 '(whitespace-tab ((t (:foreground "lightgray")))))

(message "======")
(message " Done ")
(message "======")
;;; .emacs ends here
