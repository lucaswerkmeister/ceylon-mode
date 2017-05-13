ceylon-mode
===========

A major [Emacs] mode for editing [Ceylon] code.

Current status
--------------

It doesn’t do much, but it works well enough for me.
I don’t have much time to improve it, but pull requests are always welcome.

Features
--------

- Syntax highlighting
- Rudimentary indentation
- Code formatting using [ceylon.formatter] (`C-c C-f`)

Usage
-----

Drop the `ceylon-mode.el` somewhere and include it from your `~/.emacs`, e. g. like this:

```elisp
(load-file "~/git/ceylon/ceylon-mode/ceylon-mode.el")
```

`ceylon-mode.el` automatically sets itself up to become the default mode for `*.ceylon` files;
you can also explicitly activate it with `M-x ceylon-mode`.

The code formatting functions require the `ceylon format` plugin,
which is usually bundled with the Ceylon distribution.

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
