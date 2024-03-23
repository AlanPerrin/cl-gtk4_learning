;;;; gtk4-demos.lisp

(in-package #:gtk4-demos)


(defvar *gio* (gir:ffi "Gio"))
(defvar *gtk* (gir:ffi "Gtk" "4.0"))



;==========C example
;static void
;activate (GtkApplication* app,
;          gpointer        user_data)
;{
;  GtkWidget *window;
;  window = gtk_application_window_new (app);
;  gtk_window_set_title (GTK_WINDOW (window), "Window");
;  gtk_window_set_default_size (GTK_WINDOW (window), 200, 200);
;  gtk_window_present (GTK_WINDOW (window));
;}

(defun activate (app)
  (let ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app)))
    (setf(window-title window)"mytest")
    (gir:invoke (window 'show))))

(defun main ()
  (let ((app (gir:invoke (*gtk* "Application" 'new)
                         "com.example.helloworld"
                         (gir:nget *gio* "ApplicationFlags" :default-flags))))
    (gir:connect app :activate #'activate)
    (gir:invoke (app 'run) nil)))

