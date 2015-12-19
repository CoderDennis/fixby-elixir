defmodule FIXBY do
  defmacro fixby(fixby_version, message, opts \\ :default_opts) do
    {opts, _} = Code.eval_quoted(opts)

    # Injectable current version for tests.
    current_version = case opts do
                        :default_opts -> System.version
                        [version: version] -> version
                      end

    case Version.compare(current_version, fixby_version) do
      :lt -> nil
      _ -> raise "Fix by #{fixby_version}: #{message}"
    end
  end
end
