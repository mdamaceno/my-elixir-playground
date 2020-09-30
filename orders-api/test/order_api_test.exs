defmodule OrderApiTest do
  use ExUnit.Case
  doctest OrderApi

  test "greets the world" do
    assert OrderApi.hello() == :world
  end
end
