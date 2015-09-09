# erl-indent package

A package that allows you to run an Erlang Indenter script inside Atom.

# Setup

## emacs
You will need a copy of Emacs installed. How you install Emacs is up to you but
you'll want to have an emacs server running in the background otherwise the
indent script will take forever to run.

    # Start an emacs server in the background
    emacs --daemon

# Usage

Once the plugin is installed and your emacs server is running, you should be able to
open your Command Palette and run **Erlang: Indent**. Please note that the file must
first be saved in order for it to work properly.
