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
    (setf(window-title window)"Window")
    (setf (widget-size-request window ) '(500 500))
    (gir:invoke (window 'show))))




;========== C example
;int
;main (int    argc,
;      char **argv)
;{
;  GtkApplication *app;
;  int status;
;  app = gtk_application_new ("org.gtk.example", G_APPLICATION_DEFAULT_FLAGS);
;  g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
;  status = g_application_run (G_APPLICATION (app), argc, argv);
;  g_object_unref (app);
;  return status;
;}

(defun main ()
  (let ((app (gir:invoke (*gtk* "Application" 'new)
                         "My.GTK4.Tests"
                         (gir:nget *gio* "ApplicationFlags" :default-flags))))
    (gir:connect app :activate #'buttons)
    (gir:invoke (app 'run) nil)))





(defun buttons (app)
  (defparameter box nil)
  (let ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	(button (gir:invoke (*gtk* "Button" 'new-with-label) "close      "))
	)
    (setf(window-title window)"buttons")
    (setf (widget-size-request window ) '(200 200))

  ; (setf (gir:property button 'margin-top) 40
       ;  (gir:property button 'margin-bottom) 40
        ; (gir:property button 'margin-start) 20
        ; (gir:property button 'margin-end) 20)
    (gir:connect button :clicked
                 (lambda (button)
		   (declare (ignore button))
                   (window-destroy window)))

    (gir:invoke (window 'set-child) button)
    
    (gir:invoke (window 'show))))


(defun print-hello ()
  (format t "Hello World! ~%"))
