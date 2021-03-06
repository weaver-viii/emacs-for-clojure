;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Store recent files and add recent files menu
(recentf-mode 1)
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file
         (ido-completing-read
          "Recent file: "
          (mapcar 'abbreviate-file-name recentf-list) nil t)))
    (when file
      (find-file file))))

(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; clojure in *scratch* by default
(setq initial-major-mode 'clojure-mode)

;; Misc. vim-like bindings
(global-set-key (kbd "M-j") 'join-line)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-x *") 'highlight-symbol-next)
(global-set-key (kbd "C-*") 'highlight-symbol-prev)

;;; dt emulation
(defadvice zap-to-char (after my-zap-to-char-advice (arg char) activate)
  "Kill up to the ARG'th occurence of CHAR, and leave CHAR.
  The CHAR is replaced and the point is put before CHAR."
  (insert char)
  (forward-char -1))

;;; Disable suspend-frame binding, which annoyingly minimizes emacs
(global-unset-key "\C-z")
