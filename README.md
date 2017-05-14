ceylon-mode
===========

A major [Emacs] mode for editing [Ceylon] code.

Current status
--------------

A first version has been released and is good enough for general use in my opinion.
Development from my side will continue on an on-and-off basis as I find the time to work on it;
pull requests are always welcome!

Features
--------

- Syntax highlighting
- Rudimentary indentation
- Code formatting using [ceylon.formatter] (`C-c C-f`)

Installation
------------

Clone the repository somewhere.
Open Emacs, and run `M-x package-install-file`.
Enter the path to `ceylon-mode.el` and hit Enter.

We plan to make ceylon-mode available on MELPA soon.

The code formatting functions require the `ceylon format` plugin,
which is usually bundled with the Ceylon distribution.

Usage
-----

The package automatically sets itself up to become the default mode for `*.ceylon` files;
you can also explicitly trigger Ceylon mode with `M-x ceylon-mode`.

You can view the full mode documentation with `C-h f ceylon-mode`.

Related projects
----------------

[bck39/ceylon-mode] is another Ceylon mode for Emacs.

License
-------

The content of this repository is released under the GPL v3 or later, as provided in the LICENSE file that accompanied this code.

By submitting a "pull request" or otherwise contributing to this repository, you agree to license your contribution under the license mentioned above.

[Emacs]: https://www.gnu.org/software/emacs/
[Ceylon]: https://ceylon-lang.org/
[bck39/ceylon-mode]: https://github.com/bkc39/ceylon-mode
[ceylon.formatter]: https://github.com/ceylon/ceylon.formatter/
