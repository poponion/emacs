


;;;;Custom function
;;;;move them to another file in the feature
(defun isearch-del-word (&optional arg)
  "Delete word from end of search string and search again.                                                         If search string is empty, just beep."
  (interactive "p")
  (if (= 0 (length isearch-string))
      (ding)
    (let* ((len (length isearch-string))
           (orig-pos (point))
           (now-pos (progn (backward-word (or arg 1)) (point)))
           (minus-len (- orig-pos now-pos)))
           (setq isearch-string (substring isearch-string 0
                                           (- (if (> minus-len len) len minus-len)))
                 isearch-message (mapconcat 'isearch-text-char-description
                                            isearch-string ""))))
  ;; Use the isearch-other-end as new starting point to be able
  ;; to find the remaining part of the search string again.
  (if isearch-other-end (goto-char isearch-other-end))
  (isearch-search)
  (isearch-push-state)
  (isearch-update))

(add-hook 'isearch-mode-hook
          (lambda()
            (define-key isearch-mode-map "\C-j" 'isearch-del-word)))
(defun copy-line ()
  "Copy current line into kill-ring"
  (interactive)
  (message "copy one line into kill-ring succ")
  (save-excursion
    (copy-region-as-kill
     (progn
       (move-beginning-of-line 1)
       (point))
     (progn
       (move-end-of-line 1)
       (point)))))

;;;;Global key binding
(global-set-key "\C-j" (lambda() (interactive) (move-end-of-line 1) (newline-and-indent)))
(global-set-key (kbd "\C-cj") 'copy-line)
(provide 'poponion-misc)