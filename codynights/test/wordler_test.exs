defmodule WordlerTest do
  use ExUnit.Case
  alias Wordler

  test "multiply from string" do
    assert Wordler.multi("mul(1,2)asdgagdmul(2,2)") == 6
    assert Wordler.multi("mul(2,2)") == 4
    assert Wordler.multi("mul(5 , 2)") == 0
    assert Wordler.multi("bla") == 0
    assert Wordler.multi("mul(1235,123)") == 0

    assert Wordler.multi(
             "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
           ) == 161
  end
end
