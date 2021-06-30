   (:h3 "Application mode")
   (:p "The command " (:code "application-mode") " forwards all keys to the
renderer. For instance, using the default configuration of Nyxt (" (:code "web-cua-map") ") the
key-binding " (:code "C-i") " executes a command called " (:code "autofill") ". Suppose
a user is using their email client which has a keyboard shortcut for
the italic command where the keybinding is also " (:code "C-i") ". Thus, after
executing " (:code "application-mode") " the " (:code "C-i") " binding is associated
with the webpage's italic command instead of " (:code "autofill") ". Finally, the
user can return to their configuration just executing " (:code "application-mode") " again.")
