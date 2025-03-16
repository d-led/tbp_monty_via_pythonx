defmodule TbpMontyViaPythonxTest do
  use ExUnit.Case
  doctest TbpMontyViaPythonx

  test "greets the world" do
    assert TbpMontyViaPythonx.hello() == %{"num_nodes" => 3}
  end
end
