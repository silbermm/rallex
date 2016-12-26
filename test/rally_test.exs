defmodule RallyTest do
  use ExUnit.Case
  doctest Rallex.RallyUtilities

  test "return rally headers" do
    headers = Rallex.RallyUtilities.headers("some_api_key")
    assert headers == %{"ZSESSIONID" => "some_api_key"}
  end

  test "return rally cookie" do
    cookies = Rallex.RallyUtilities.cookie("some_api_key")
    assert cookies == [cookie: ["ZSESSIONID=some_api_key"]]
  end
end
