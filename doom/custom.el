(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641" "6e33d3dd48bc8ed38fd501e84067d3c74dfabbfc6d345a92e24f39473096da3f" "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "6f1f6a1a3cff62cc860ad6e787151b9b8599f4471d40ed746ea2819fcd184e1a" "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "571661a9d205cb32dfed5566019ad54f5bb3415d2d88f7ea1d00c7c794e70a36" "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec" "b754d3a03c34cfba9ad7991380d26984ebd0761925773530e24d8dd8b6894738" "81f53ee9ddd3f8559f94c127c9327d578e264c574cda7c6d9daddaec226f87bb" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "a6920ee8b55c441ada9a19a44e9048be3bfb1338d06fc41bce3819ac22e4b5a1" default))
 '(doom-one-brighter-comments nil)
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(warning-suppress-types
   '((doom-first-input-hook)
     (doom-first-input-hook)
     (defvaralias))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(with-eval-after-load 'lsp-mode
  (define-key lsp-mode-map (kbd "C-<down-mouse-1>") nil))

(setq confirm-kill-emacs nil)

(defun md-html-filter (buffer)
  (princ (with-current-buffer buffer
  (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://ndossougbe.github.io/strapdown/dist/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
  (current-buffer)))

(defun md-liveview ()
  "Live markdown view: localhost:8080/imp"
  (interactive)
  (unless (process-status "httpd")
    (httpd-start))
  (impatient-mode)
  (imp-set-user-filter 'md-html-filter)
  (imp-visit-buffer))
