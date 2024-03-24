(in-package #:gtk4-demos)


(defun my-main (win)
  (let ((app (gir:invoke (*gtk* "Application" 'new)
                         "My.GTK4.Tests"
                         (gir:nget *gio* "ApplicationFlags" :default-flags))))
    (gir:connect app :activate win)
    (gir:invoke (app 'run) nil)))
