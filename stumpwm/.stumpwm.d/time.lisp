(in-package :stumpwm)

(local-time:reread-timezone-repository)

(defvar modeline-fg-grey
  "^(:fg \"#aaaaaa\")")

(defvar modeline-fg-white
  "^(:fg \"#ffffff\")")

(defun current-date ()
  "Returns the current date."
  (local-time:format-timestring nil (local-time:now) :format '(:short-weekday ", " :day " " :short-month)))

(defun current-time-in-zone (time-zone-name)
  "Returns the current time in `time-zone-name`."
  (let ((local-time:*default-timezone* (local-time:find-timezone-by-location-name time-zone-name)))
    (local-time:format-timestring nil (local-time:now) :format '((:hour 2) ":" (:min 2) ":" (:sec 2)))))

(defun current-time-utc ()
  "Returns the current time in UTC."
  (concatenate 'string modeline-fg-grey "UTC: " (current-time-in-zone "UTC") modeline-fg-white))

(defun current-time-berlin ()
  "Returns the current time in Berlin."
  (concatenate 'string "BERLIN: " (current-time-in-zone "Europe/Berlin")))

(defun current-time-sao-paulo ()
  "Returns the current time in Sao Paulo."
  (concatenate 'string modeline-fg-grey "SÃO PAULO: " (current-time-in-zone "Brazil/East") modeline-fg-white))
