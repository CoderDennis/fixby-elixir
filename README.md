# Fixby-Elixir

FIXBY comments that raise after a given version of Elixir.

This started as a copy of https://github.com/henrik/fixme-elixir, which raises after a certain date.

    defmodule MyCode do
      import FIXBY

      def my_function do
        fixby "1.2.0", "Stop nesting case statements and use with."
        # ...
      end
    end

This is useful when you know that something is coming in the next version of the language and want to remember to come back and re-evaluate how it can be improved with the new language feature.

Starting with Elixir version `1.2.0`, the "fixby" line in the example will raise a compile time exception with the message "Fix by Elixir 1.2.0: Stop nesting case statements and use with."

They raise at compile time because runtime errors in production are not desirable. Compile time also means that the above example will raise when my_function is compiled, even if it's never called.

Another consequence of running at compile time is that if you upgrade Elixir and the file is not recompiled, there will be no exception. You can either accept that (maybe untouched code can remain that way until the next time), or you can `mix compile --force`.

Note that you need to explicitly import FIXBY because fixby is a macro.

Protip: make sure it's clear from the exception or from a separate comment just what should be done –- sometimes not even the person who wrote the code will remember what you're meant to change.

## Installation

Add fixby to your list of dependencies in `mix.exs` (when available in hex):

    def deps do
      [{:fixby, "~> 0.0.1"}]
    end

Then fetch it:

    mix deps.get

## Tests

    mix test

## Desired fetures

It would be nice to have the ability to specify a version of the current application or one of its dependencies in addition to the version of Elixir.
