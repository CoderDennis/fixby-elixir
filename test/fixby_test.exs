defmodule FixbyTest do
  use ExUnit.Case
  import CompileTimeAssertions

  test "does not raise before version" do
    import FIXBY
    fixby "9999.0.0", "José and co. have been busy!"
  end

  test "raises after version" do
    assert_compile_time_raise RuntimeError, "Fix by 1.0.0: come out of beta", fn ->
      import FIXBY
      fixby "1.0.0", "come out of beta"
    end
  end

  test "raises at version" do
    assert_compile_time_raise RuntimeError, "Fix by 9999.0.0: José and co. have been busy!", fn ->
      import FIXBY
      fixby "9999.0.0", "José and co. have been busy!", version: "9999.0.0"
    end
  end
end
