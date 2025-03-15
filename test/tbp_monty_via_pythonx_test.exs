defmodule TbpMontyViaPythonxTest do
  use ExUnit.Case
  doctest TbpMontyViaPythonx

  test "greets the world" do
    assert TbpMontyViaPythonx.hello() == :world
  end
end
