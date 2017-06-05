(if (not (file-exists-p "ceylon-mode-tests.el"))
    (throw 'ceylon-mode-tests-wrong-directory
           "These tests must be run with the current directory set to the directory containing them."))

(load-file "../ceylon-mode.el")

(defun path-equal (expected actual)
  "Return t if two paths are equal."
  (string-equal (expand-file-name expected)
                (expand-file-name actual)))
(defun path-equal-explainer (expected actual)
  "Explains why ‘path-equal’ failed."
  (concat
   "Paths are not equal.\n"
   "Expected: ‘" expected "’\n"
   "       -> ‘" (expand-file-name expected) "’\n"
   "Actual:   ‘" actual "’\n"
   "     ->   ‘" (expand-file-name actual) "’"))
(put 'path-equal 'ert-explainer 'path-equal-explainer)

(ert-deftest ceylon-module-descriptor-regexp-test ()
  "Test ‘ceylon-module-descriptor-regexp’ with a simple match-all regexp."
  (should (equal (with-temp-buffer
                   (insert-file-contents "trees/simple-without-config/source/simple/module.ceylon")
                   (replace-regexp-in-string "\n" "" (buffer-string)))
                 (ceylon-module-descriptor-regexp "^\\(.*\\)$" "trees/simple-without-config/source/simple/run.ceylon"))))

(ert-deftest ceylon-source-directory-simple-test ()
  "Test ‘ceylon-source-directory’ on a module with a single name component."
  (should (path-equal "trees/simple-without-config/source/"
                      (ceylon-source-directory "trees/simple-without-config/source/simple/run.ceylon"))))
(ert-deftest ceylon-source-directory-example-mod-test ()
  "Test ‘ceylon-source-directory’ on a module with two name components."
  (should (path-equal "trees/example.mod-without-config/source/"
                      (ceylon-source-directory "trees/example.mod-without-config/source/example/mod/run.ceylon"))))
(ert-deftest ceylon-source-directory-example-mod-subpack-test ()
  "Test ‘ceylon-source-directory’ on a subpackage of a module with two name components."
  (should (path-equal "trees/example.mod-without-config/source/"
                      (ceylon-source-directory "trees/example.mod-without-config/source/example/mod/subpack/run.ceylon"))))

(ert-deftest ceylon-project-directory-simple-with-config-test ()
  "Test ‘ceylon-project-directory’ on a simple project with a ‘.ceylon/config’ file."
  (should (path-equal "trees/simple-with-config/"
                      (ceylon-project-directory "trees/simple-with-config/source/simple/run.ceylon"))))
(ert-deftest ceylon-project-directory-simple-without-config-test ()
  "Test ‘ceylon-project-directory’ on a simple project without a ‘.ceylon/config’ file."
  (should (path-equal "trees/simple-without-config/"
                      (ceylon-project-directory "trees/simple-without-config/source/simple/run.ceylon"))))
(ert-deftest ceylon-project-directory-example-mod-without-config-test ()
  "Test ‘ceylon-project-directory’ on a complex project without a ‘.ceylon/config’ file."
  (should (path-equal "trees/example.mod-without-config/"
                      (ceylon-project-directory "trees/example.mod-without-config/source/example/mod/subpack/run.ceylon"))))
(ert-deftest ceylon-project-directory-default-test ()
  "Test ‘ceylon-project-directory’ on a single Ceylon file with no associated project."
  (should (eq nil (ceylon-project-directory "trees/default/run.ceylon"))))
(ert-deftest ceylon-project-directory-maven-mod-with-config-test ()
  "Test ‘ceylon-project-directory’ on a project with a Maven-like layout and a ‘.ceylon/config’ file."
  (should (path-equal "trees/example.mvn.mod-with-config/"
                      (ceylon-project-directory "trees/example.mvn.mod-with-config/src/main/ceylon/example/mvn/mod/run.ceylon"))))
