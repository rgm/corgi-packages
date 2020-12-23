(defvar corgi-all-packages
  '((corgi
     :type git
     :repo "/home/arne/github/lambdaisland/corgi")

    (corkey
     :type git
     :host github
     :branch "main"
     :files ("corkey/corkey.el")
     :repo "lambdaisland/corgi-packages")

    (corgi-defaults
     :type git
     :host github
     :branch "main"
     :files ("corgi-defaults/corgi-defaults.el")
     :repo "lambdaisland/corgi-packages")

    (corgi-editor
     :type git
     :host github
     :branch "main"
     :files ("corgi-editor/corgi-editor.el")
     :repo "lambdaisland/corgi-packages")

    (clj-ns-name
     :type git
     :host github
     :files ("clj-ns-name/clj-ns-name.el")
     :repo "plexus/plexmacs")

    (walkclj
     :type git
     :host github
     :files ("walkclj.el")
     :repo "plexus/walkclj")

    (pprint-to-buffer
     :type git
     :host github
     :files ("pprint-to-buffer/pprint-to-buffer.el")
     :repo "plexus/plexmacs")))

(defun straight-recipes-corgi-packages-list ()
  (mapcar #'symbol-name (mapcar #'car corgi-all-packages)))

(defun straight-recipes-corgi-packages-retrieve (package)
  (assoc package corgi-all-packages))

(defun straight-recipes-corgi-packages-version ()
  1)

(add-to-list #'straight-recipe-repositories 'corgi-packages)

;; Check if straight/versions/corgi.el exists in the user's emacs directory. If not, then
;; we copy it over from Corgi.
(let* ((version-file-source (expand-file-name "straight/repos/corgi-packages/corgi-versions.el" straight-base-dir))
       (straight-version-dir (expand-file-name "straight/versions" straight-base-dir))
       (version-file-target (expand-file-name "corgi.el" straight-version-dir)))
  (unless (file-exists-p straight-version-dir)
    (make-directory straight-version-dir t))
  (unless (file-exists-p version-file-target)
    (copy-file version-file-source version-file-target))
  (list straight-version-dir version-file-target))

(add-to-list #'straight-profiles '(corgi . "corgi.el"))

(provide 'corgi-packages)