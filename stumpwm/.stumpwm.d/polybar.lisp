(in-package :stumpwm)

(defun icon-by-group (name)
  (cond
    ((string-equal name "Emacs")
     "")
    ((string-equal name "Web")
     "")
    ((string-equal name "Terminal")
     "")
    ((string-equal name "Top")
     "")
    ((string-equal name "Logs")
     "")
    (t (concat ""))))

(defun polybar-groups ()
  "Return string representation for polybar stumpgroups module"
  (apply #'concatenate 'string
         (mapcar
          (lambda (g)
            (let* ((name (group-name g))
                   (number (write-to-string (group-number g)))
                   (n-win (write-to-string (length (group-windows g))))
                   (icon (icon-by-group name))
                   (text (concat " %{F#54728E}" icon "%{F-} " number ":" name " ")))
              (cond
                ((eq g (current-group)) (concat "%{F#FFFFFF B#000000 u#54728E +u}" text "[" n-win "] " "%{F- B- u- -u}"))
                ((string-equal n-win "0") "")
                (t (concat "%{F#FFFFFF}" text "[" n-win "] " "%{F-}")))))
          (sort (screen-groups (current-screen)) #'< :key #'group-number))))

(defun polybar-update-groups ()
  (run-shell-command "polybar-msg hook stumpwmgroups 1"))

(add-hook *new-window-hook* (lambda (win) (polybar-update-groups)))
(add-hook *destroy-window-hook* (lambda (win) (polybar-update-groups)))
(add-hook *focus-window-hook* (lambda (win lastw) (polybar-update-groups)))
(add-hook *focus-group-hook* (lambda (grp lastg) (polybar-update-groups)))
