(package-initialize)
;; or, instead of using `package-initialize`, use the following:
;; (add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0/")

(require 'yasnippet)
(require 'yasnippet-snippets)

;; This is the default location as of September 18, 2015.  Add more as needed.
(setq yas-snippet-dirs '("~/.emacs.d/personal/snippets"))

(yas-reload-all)
