;;;; gtk4-demos.asd

(asdf:defsystem #:gtk4-demos
  :description "Describe gtk4-demos here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-gtk4)
  :components ((:file "package")
	       (:file "buttons")
	       (:file "my-main")
	       (:file "widgets")
               (:file "gtk4-demos")))
