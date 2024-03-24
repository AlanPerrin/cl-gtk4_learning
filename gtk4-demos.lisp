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
    (gir:connect app :activate #'buttons2)
    (gir:invoke (app 'run) nil)))





(defun buttons (app)
 ; (defparameter box nil)
  (let ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
	(button (gir:invoke (*gtk* "Button" 'new-with-label) "close"))
	(label (gir:invoke (*gtk* "Label"  'new) "My Test"))
;	(radio (gir:invoke (*gtk* "radio-button" 'new) "radio test"))
	(box (gir:invoke (*gtk* "Box" 'new) 1 6 ))
	)
;window
    (setf(window-title window)"buttons")
    (setf (widget-size-request window ) '(200 200))
;buttons
    (setf (gir:property button 'margin-top) 40
         (gir:property button 'margin-bottom) 40
         (gir:property button 'margin-start) 20
         (gir:property button 'margin-end) 20)
    (gir:connect button :clicked
                 (lambda (button)
		   (declare (ignore button))
                   (window-destroy window)))

;radio buttons


    
;label
    (setf (gir:property label 'margin-top)50)
;packing 
    (box-append box label)
    (box-append box button)
   ; (box-append box radio)
    (gir:invoke (window 'set-child) box)
    
    (gir:invoke (window 'show))))


(defun print-hello ()
  (format t "Hello World! ~%"))


(defun create-radio-button (group label)
  "Create a GtkRadioButton with a text label."
  (let ((group-pointer (if group (gir::this-of group) nil)))
    (gir:invoke (*gtk* "RadioButton" 'new-with-label) group-pointer label)))


(defvar *group* nil) ; Assume *group* is a variable representing an existing radio button group



(defun buttons2 (app)
  (let* ((window (gir:invoke (*gtk* "ApplicationWindow" 'new) app))
         (button (gir:invoke (*gtk* "Button" 'new-with-label) "Close"))
         (label (gir:invoke (*gtk* "Label" 'new) "My Test"))
         (box (gir:invoke (*gtk* "Box" 'new) 1 6))
	 (toggle (gir:invoke (*gtk* "ToggleButton" 'new-with-label) "option 1")))
    ;; Set window properties
    (setf (window-title window) "Buttons")
    (setf (widget-size-request window) '(200 200))
    
    ;; Connect the "clicked" signal of the button to a callback function
    (gir:connect button :clicked
                 (lambda (button)
                   (declare (ignore button))
                   (format t "Hello~%")
                   ))
    
    ;; Set properties for the button, label, and radio buttons
    (setf (gir:property button 'margin-top) 40
          (gir:property button 'margin-bottom) 40
          (gir:property button 'margin-start) 20
          (gir:property button 'margin-end) 20)
    
    (setf (gir:property label 'margin-top) 50)
    
    ;; Pack the label, radio buttons, and button into the box
    (box-append box label)
    (box-append box toggle)
    (box-append box button)
    
    ;; Add the box to the window
    (gir:invoke (window 'set-child) box)
    
    ;; Show the window
    (gir:invoke (window 'show))))



